import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';
import '../theme/app_typography.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onAppsTap;
  final VoidCallback onDeletionTap;
  final VoidCallback onContactTap;

  const Navbar({
    super.key,
    required this.onAppsTap,
    required this.onDeletionTap,
    required this.onContactTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  void _toggleTheme() {
    themeModeNotifier.value = themeModeNotifier.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = MediaQuery.of(context).size.width > 768;

    // Palette-aligned contrasting header with glassmorphism
    final bgColor = isDark
        ? const Color(0xFF080D1A).withValues(alpha: 0.90)
        : const Color(0xFF0F172A).withValues(alpha: 0.92);

    final borderColor = const Color(0xFF0284C7); // Sky 600 accent border

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 48.0 : 20.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border(
              bottom: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0284C7).withValues(alpha: 0.15),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1400),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Brand logo & title
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF0284C7).withValues(alpha: 0.5),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF0284C7).withValues(alpha: 0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: Image.asset(
                            'assets/icons/developer_logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat(reverse: true))
                          .scale(
                            begin: const Offset(1, 1),
                            end: const Offset(1.05, 1.05),
                            duration: 2200.ms,
                            curve: Curves.easeInOut,
                          ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'LuCho Dev',
                            style: AppTypography.outfit(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: -0.5,
                              height: 1.15,
                            ),
                          )
                              .animate(onPlay: (controller) => controller.repeat(reverse: true))
                              .shimmer(
                                duration: 1800.ms,
                                color: const Color(0xFF38BDF8).withValues(alpha: 0.8),
                              ),
                          const SizedBox(height: 2),
                          Text(
                            'Mobile Software Developer (iOS & Android)',
                            style: AppTypography.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF94A3B8),
                              height: 1.15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

              // Navigation & Theme Toggle
              Row(
                children: [
                  if (isDesktop) ...[
                    _NavLink(
                      title: 'Aplicaciones',
                      onTap: onAppsTap,
                    ),
                    const SizedBox(width: 24),
                    _NavLink(
                      title: 'Eliminación de Datos',
                      onTap: onDeletionTap,
                    ),
                    const SizedBox(width: 24),
                    _NavLink(
                      title: 'Contacto',
                      onTap: onContactTap,
                    ),
                    const SizedBox(width: 16),
                  ],

                  // Theme Toggle Button
                  Tooltip(
                    message: isDark ? 'Cambiar a modo diurno' : 'Cambiar a modo nocturno',
                    child: InkWell(
                      onTap: _toggleTheme,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF334155),
                          ),
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          transitionBuilder: (child, anim) =>
                              RotationTransition(turns: anim, child: child),
                          child: Icon(
                            isDark
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                            key: ValueKey(isDark),
                            size: 20,
                            color: isDark
                                ? const Color(0xFFF59E0B)
                                : const Color(0xFF38BDF8),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Mobile Menu
                  if (!isDesktop) ...[
                    const SizedBox(width: 8),
                    PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                      ),
                      color: const Color(0xFF1E293B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: const BorderSide(
                          color: Color(0xFF334155),
                        ),
                      ),
                      onSelected: (val) {
                        if (val == 'apps') onAppsTap();
                        if (val == 'deletion') onDeletionTap();
                        if (val == 'contact') onContactTap();
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'apps',
                          child: Text(
                            'Aplicaciones',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'deletion',
                          child: Text(
                            'Eliminación de Datos',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'contact',
                          child: Text(
                            'Contacto',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({
    required this.title,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    const defaultColor = Color(0xFFCBD5E1);
    const hoverColor = Color(0xFF38BDF8);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          style: AppTypography.inter(
            fontSize: 14,
            fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
            color: _isHovered ? hoverColor : defaultColor,
          ),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
