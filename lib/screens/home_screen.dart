import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_typography.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/apps_data.dart';
import '../models/app_info.dart';
import '../widgets/app_card.dart';
import '../widgets/custom_footer.dart';
import '../widgets/data_deletion_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart';
import '../widgets/privacy_policy_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _appsKey = GlobalKey();
  final GlobalKey _deletionKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: 0.06, // Offsets for sticky navbar
      );
    }
  }

  void _handleKeyScroll(LogicalKeyboardKey key) {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final current = _scrollController.offset;
    double offsetDelta = 0;

    if (key == LogicalKeyboardKey.arrowDown) {
      offsetDelta = 120;
    } else if (key == LogicalKeyboardKey.arrowUp) {
      offsetDelta = -120;
    } else if (key == LogicalKeyboardKey.pageDown || key == LogicalKeyboardKey.space) {
      offsetDelta = 450;
    } else if (key == LogicalKeyboardKey.pageUp) {
      offsetDelta = -450;
    } else if (key == LogicalKeyboardKey.home) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
      return;
    } else if (key == LogicalKeyboardKey.end) {
      _scrollController.animateTo(
        maxScroll,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
      return;
    }

    if (offsetDelta != 0) {
      final target = (current + offsetDelta).clamp(0.0, maxScroll);
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutQuad,
      );
    }
  }

  Future<void> _openPrivacyPolicy(AppInfo app) async {
    final uri = Uri.base.resolve(app.privacyHtmlUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_self');
    } else {
      final fallbackUri = Uri.parse(app.privacyHtmlUrl);
      if (await canLaunchUrl(fallbackUri)) {
        await launchUrl(fallbackUri, webOnlyWindowName: '_self');
      } else if (mounted) {
        PrivacyPolicyModal.show(context, app);
      }
    }
  }

  Future<void> _openPlayDeveloper() async {
    final uri = Uri.parse(AppsData.playDeveloperUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_self');
    }
  }

  Future<void> _openDataDeletionPage() async {
    final uri = Uri.base.resolve('data-deletion.html');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_self');
    } else {
      final fallbackUri = Uri.parse('data-deletion.html');
      if (await canLaunchUrl(fallbackUri)) {
        await launchUrl(fallbackUri, webOnlyWindowName: '_self');
      }
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: Navbar(
        onAppsTap: () => _scrollToKey(_appsKey),
        onDeletionTap: () => _scrollToKey(_deletionKey),
        onContactTap: () => _scrollToKey(_footerKey),
      ),
      body: Stack(
        children: [
          // Ambient Glow Background (Adaptive to theme)
          Positioned(
            top: -150,
            left: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF0284C7).withValues(alpha: isDark ? 0.15 : 0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            right: -150,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF6366F1).withValues(alpha: isDark ? 0.12 : 0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Main Scrollable Area with Keyboard Navigation Support
          Focus(
            focusNode: _focusNode,
            autofocus: true,
            onKeyEvent: (node, event) {
              if (event is KeyDownEvent || event is KeyRepeatEvent) {
                final key = event.logicalKey;
                if (key == LogicalKeyboardKey.arrowDown ||
                    key == LogicalKeyboardKey.arrowUp ||
                    key == LogicalKeyboardKey.pageDown ||
                    key == LogicalKeyboardKey.pageUp ||
                    key == LogicalKeyboardKey.space ||
                    key == LogicalKeyboardKey.home ||
                    key == LogicalKeyboardKey.end) {
                  _handleKeyScroll(key);
                  return KeyEventResult.handled;
                }
              }
              return KeyEventResult.ignored;
            },
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (!_focusNode.hasFocus) {
                  _focusNode.requestFocus();
                }
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    // Top spacing to account for sticky navbar
                    const SizedBox(height: 80),

                // Hero Section
                HeroSection(
                  onExploreApps: () => _scrollToKey(_appsKey),
                  onContact: () => _scrollToKey(_deletionKey),
                ),

                // Apps Showcase Section
                Container(
                  key: _appsKey,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 40.0,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1400),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Section Header with Responsive Wrap (Fixes the 71px Overflow)
                          Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runSpacing: 16,
                            spacing: 16,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0284C7).withValues(
                                        alpha: isDark ? 0.2 : 0.1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'PORTAFOLIO MULTIPLATAFORMA',
                                      style: AppTypography.inter(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: isDark
                                            ? const Color(0xFF38BDF8)
                                            : const Color(0xFF0284C7),
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Nuestras Aplicaciones',
                                    style: AppTypography.outfit(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w800,
                                      color: isDark
                                          ? Colors.white
                                          : const Color(0xFF0F172A),
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                ],
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width - 48,
                                ),
                                child: OutlinedButton.icon(
                                  onPressed: _openPlayDeveloper,
                                  icon: const Icon(
                                    Icons.open_in_new_rounded,
                                    size: 16,
                                  ),
                                  label: const Text(
                                    'Aplicaciones desarrolladas por Lucho Dev',
                                    textAlign: TextAlign.center,
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: isDark
                                        ? const Color(0xFF38BDF8)
                                        : const Color(0xFF0284C7),
                                    side: BorderSide(
                                      color: isDark
                                          ? const Color(0xFF0284C7)
                                          : const Color(0xFF0284C7),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          Text(
                            'Explora nuestras herramientas para dispositivos móviles (Android & iOS). Consulta la política de privacidad de cada software haciendo clic en el icono correspondiente.',
                            style: AppTypography.inter(
                              fontSize: 14,
                              color: isDark
                                  ? const Color(0xFF94A3B8)
                                  : const Color(0xFF64748B),
                            ),
                          ),

                          const SizedBox(height: 36),

                          // Responsive Grid of Apps (Mobile to Google TV / 4K)
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final width = constraints.maxWidth;
                              // Determine cross axis count adaptively
                              final int crossAxisCount = width > 1200
                                  ? 3
                                  : (width > 720 ? 2 : 1);

                              final double itemWidth =
                                  (width - ((crossAxisCount - 1) * 24)) /
                                      crossAxisCount;

                              return Wrap(
                                spacing: 24,
                                runSpacing: 24,
                                children: AppsData.apps.asMap().entries.map(
                                  (entry) {
                                    final index = entry.key;
                                    final app = entry.value;

                                    return SizedBox(
                                      width: itemWidth,
                                      child: AppCard(
                                        app: app,
                                        onPrivacyTap: () =>
                                            _openPrivacyPolicy(app),
                                      )
                                          .animate()
                                          .fadeIn(
                                            delay: Duration(
                                              milliseconds: 120 * index,
                                            ),
                                            duration: 450.ms,
                                          )
                                          .slideY(
                                            begin: 0.1,
                                            end: 0,
                                            curve: Curves.easeOutCubic,
                                          ),
                                    );
                                  },
                                ).toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Data Deletion Section
                Container(
                  key: _deletionKey,
                  child: const DataDeletionSection(),
                ),

                // Footer
                Container(
                  key: _footerKey,
                  child: CustomFooter(
                    onDataDeletionTap: _openDataDeletionPage,
                    onPrivacyTap: () => _scrollToKey(_appsKey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  ),
);
  }
}
