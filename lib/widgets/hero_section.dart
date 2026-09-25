import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_typography.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onExploreApps;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onExploreApps,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48.0 : 20.0,
        vertical: isDesktop ? 64.0 : 36.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Badge: iOS & Android Mobile Developer
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE0F2FE),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isDark
                        ? const Color(0xFF38BDF8).withValues(alpha: 0.3)
                        : const Color(0xFF7DD3FC),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? const Color(0xFF38BDF8).withValues(alpha: 0.1)
                          : const Color(0xFF0284C7).withValues(alpha: 0.08),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_rounded,
                      color: isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7),
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Desarrollador Oficial de Apps Móviles • iOS & Android',
                      style: AppTypography.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF0369A1),
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: -0.2, end: 0, curve: Curves.easeOutQuad),

              const SizedBox(height: 24),

              // Title with Gradient Accent
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Innovando en Educación &\nTecnología Móvil con ',
                      style: AppTypography.outfit(
                        fontSize: isDesktop ? 48 : 30,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                        height: 1.15,
                        letterSpacing: -1,
                      ),
                    ),
                    WidgetSpan(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xFF0284C7), Color(0xFF6366F1), Color(0xFF38BDF8)],
                          ).createShader(bounds),
                          child: Text(
                            'LuCho Dev',
                            style: AppTypography.outfit(
                              fontSize: isDesktop ? 48 : 30,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              height: 1.15,
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat(reverse: true))
                          .scale(
                            begin: const Offset(1.0, 1.0),
                            end: const Offset(1.035, 1.035),
                            duration: 2400.ms,
                            curve: Curves.easeInOut,
                          )
                          .animate(onPlay: (controller) => controller.repeat(reverse: true))
                          .shimmer(
                            duration: 1800.ms,
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 600.ms)
                  .scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1)),

              const SizedBox(height: 20),

              // Subtitle / Bio
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Text(
                  'Desarrollo de aplicaciones móviles seguras (iOS & Android), pedagógicas y de alto impacto para estudiantes, docentes y la comunidad global. Transparencia absoluta en el tratamiento de datos y pleno cumplimiento de los estándares de privacidad internacionales.',
                  textAlign: TextAlign.center,
                  style: AppTypography.inter(
                    fontSize: isDesktop ? 16 : 14,
                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
                    height: 1.6,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(delay: 350.ms, duration: 600.ms)
                  .slideY(begin: 0.1, end: 0),

              const SizedBox(height: 36),

              // Action Buttons
              Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: onExploreApps,
                    icon: const Icon(Icons.apps_rounded, size: 20),
                    label: const Text('Explorar Aplicaciones'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0284C7),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 4,
                      shadowColor: const Color(0xFF0284C7).withValues(alpha: 0.45),
                      textStyle: AppTypography.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                      .animate(onPlay: (controller) => controller.repeat(reverse: true))
                      .shimmer(
                        duration: 1600.ms,
                        color: Colors.white.withValues(alpha: 0.35),
                      )
                      .animate(onPlay: (controller) => controller.repeat(reverse: true))
                      .scale(
                        begin: const Offset(1, 1),
                        end: const Offset(1.025, 1.025),
                        duration: 2000.ms,
                        curve: Curves.easeInOut,
                      ),
                  OutlinedButton.icon(
                    onPressed: onContact,
                    icon: const Icon(Icons.verified_user_outlined, size: 20),
                    label: const Text('Políticas & Contacto'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF0F172A),
                      side: BorderSide(
                        color: isDark ? const Color(0xFF0284C7) : const Color(0xFF0284C7),
                        width: 1.8,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: AppTypography.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
                  .animate()
                  .fadeIn(delay: 500.ms, duration: 600.ms)
                  .slideY(begin: 0.15, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}
