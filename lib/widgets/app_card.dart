import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/app_info.dart';
import '../theme/app_typography.dart';

class AppCard extends StatefulWidget {
  final AppInfo app;
  final VoidCallback onPrivacyTap;

  const AppCard({
    super.key,
    required this.app,
    required this.onPrivacyTap,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> with SingleTickerProviderStateMixin {
  late final AnimationController _borderAnimController;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _borderAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _borderAnimController.dispose();
    super.dispose();
  }

  Future<void> _openPlayStore() async {
    if (!widget.app.isReleased || widget.app.playStoreUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${widget.app.name}: Próximamente disponible en Google Play Store.',
            style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          backgroundColor: const Color(0xFF0284C7),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }
    final uri = Uri.parse(widget.app.playStoreUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_self');
    }
  }

  @override
  Widget build(BuildContext context) {
    final app = widget.app;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? const Color(0xFF1E293B) : Colors.white;

    final titleColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final categoryColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
    final descColor = isDark ? const Color(0xFFCBD5E1) : const Color(0xFF475569);
    final dividerColor = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0.0, _isHovered ? -6.0 : 0.0, 0.0),
        child: AnimatedBuilder(
          animation: _borderAnimController,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: SweepGradient(
                  transform: GradientRotation(_borderAnimController.value * 2 * math.pi),
                  colors: const [
                    Color(0xFF0284C7),
                    Color(0xFF6366F1),
                    Color(0xFF38BDF8),
                    Color(0xFF0284C7),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: (isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7))
                        .withValues(alpha: _isHovered ? 0.35 : 0.16),
                    blurRadius: _isHovered ? 24 : 12,
                    offset: Offset(0, _isHovered ? 8 : 4),
                  ),
                ],
              ),
              padding: EdgeInsets.all(_isHovered ? 2.5 : 2.0),
              child: child,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(22),
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Visually Large App Icon (144x144) & Status Badge + Name
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App Icon (144x144, prominent with glow shadow)
                    Container(
                      width: 144,
                      height: 144,
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF0F172A) : Colors.white,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                          color: isDark
                              ? const Color(0xFF38BDF8).withValues(alpha: 0.7)
                              : const Color(0xFF0284C7).withValues(alpha: 0.5),
                          width: 2.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: (isDark
                                    ? const Color(0xFF38BDF8)
                                    : const Color(0xFF0284C7))
                                .withValues(alpha: _isHovered ? 0.40 : 0.20),
                            blurRadius: _isHovered ? 20 : 12,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          app.iconPath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF0284C7), Color(0xFF6366F1)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.smartphone_rounded,
                                  color: Colors.white,
                                  size: 68,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Name and Status
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: app.isReleased
                                  ? (isDark ? const Color(0xFF065F46) : const Color(0xFFD1FAE5))
                                  : (isDark ? const Color(0xFF78350F) : const Color(0xFFFEF3C7)),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: app.isReleased
                                    ? (isDark ? const Color(0xFF059669) : const Color(0xFFA7F3D0))
                                    : (isDark ? const Color(0xFFD97706) : const Color(0xFFFDE68A)),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  app.isReleased
                                      ? Icons.check_circle_outline_rounded
                                      : Icons.hourglass_top_rounded,
                                  size: 13,
                                  color: app.isReleased
                                      ? (isDark ? const Color(0xFF34D399) : const Color(0xFF059669))
                                      : (isDark ? const Color(0xFFFBBF24) : const Color(0xFFD97706)),
                                ),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    app.isReleased
                                        ? 'Disponible'
                                        : 'Próximamente',
                                    style: AppTypography.inter(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: app.isReleased
                                          ? (isDark ? const Color(0xFF34D399) : const Color(0xFF065F46))
                                          : (isDark ? const Color(0xFFFBBF24) : const Color(0xFF92400E)),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ).animate(
                            onPlay: (controller) => controller.repeat(reverse: true),
                          ).shimmer(
                            duration: 2500.ms,
                            color: Colors.white.withValues(alpha: isDark ? 0.15 : 0.4),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            app.name,
                            style: AppTypography.outfit(
                              fontSize: 18.5,
                              fontWeight: FontWeight.w700,
                              color: titleColor,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            app.category,
                            style: AppTypography.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: categoryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // Description (spacious 3 lines to fit full text)
                SizedBox(
                  height: 54,
                  child: Text(
                    app.description,
                    style: AppTypography.inter(
                      fontSize: 13,
                      color: descColor,
                      height: 1.45,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                const SizedBox(height: 12),

                // Divider
                Divider(color: dividerColor, height: 1),

                const SizedBox(height: 12),

                // Action Buttons
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _openPlayStore,
                        icon: Icon(
                          app.isReleased
                              ? Icons.install_mobile_rounded
                              : Icons.hourglass_top_rounded,
                          size: 20,
                        ),
                        label: Text(
                          app.isReleased ? 'Descarga la aplicación' : 'Próximamente',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: app.isReleased
                              ? const Color(0xFF0284C7)
                              : (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
                          foregroundColor: app.isReleased
                              ? Colors.white
                              : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          textStyle: AppTypography.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat(reverse: true))
                          .shimmer(
                            duration: 1600.ms,
                            color: Colors.white.withValues(alpha: 0.35),
                          ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: widget.onPrivacyTap,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: isDark
                              ? const Color(0xFF0F172A)
                              : const Color(0xFFF1F5F9),
                          foregroundColor: const Color(0xFF0284C7),
                          side: BorderSide(
                            color: isDark
                                ? const Color(0xFF334155)
                                : const Color(0xFFCBD5E1),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          textStyle: AppTypography.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Políticas de privacidad'),
                            SizedBox(width: 8),
                            Icon(Icons.privacy_tip_outlined, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
