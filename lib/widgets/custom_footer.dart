import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/apps_data.dart';
import '../theme/app_typography.dart';
import '../utils/url_helper.dart';

class CustomFooter extends StatelessWidget {
  final VoidCallback onDataDeletionTap;
  final VoidCallback? onPrivacyTap;

  const CustomFooter({
    super.key,
    required this.onDataDeletionTap,
    this.onPrivacyTap,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_self');
    }
  }


  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
      width: double.infinity,
      color: const Color(0xFF090D16),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48.0 : 20.0,
        vertical: 28.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Column(
            children: [
              // Top row
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildBrandInfo(),
                        _buildQuickLinks(),
                        _buildContactInfo(),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrandInfo(),
                        const SizedBox(height: 20),
                        _buildQuickLinks(),
                        const SizedBox(height: 20),
                        _buildContactInfo(),
                      ],
                    ),

              const SizedBox(height: 20),
              const Divider(color: Color(0xFF1E293B)),
              const SizedBox(height: 16),

              // Bottom note
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '© 2026 LuCho Dev. Todos los derechos reservados. Android y Google Play son marcas comerciales de Google LLC. Apple, iOS y App Store son marcas registradas de Apple Inc.',
                      style: AppTypography.inter(
                        fontSize: 12,
                        color: const Color(0xFF64748B),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandInfo() {
    return SizedBox(
      width: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF0284C7).withValues(alpha: 0.5),
                    width: 1.2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.asset(
                    'assets/icons/developer_logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'LuCho Dev',
                style: AppTypography.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Portal oficial de desarrollo de aplicaciones móviles multiplataforma (iOS & Android). Enfoque en soluciones educativas para Bolivia y herramientas digitales de alto impacto.',
            style: AppTypography.inter(
              fontSize: 13,
              color: const Color(0xFF94A3B8),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enlaces Legales & Tiendas Móviles',
          style: AppTypography.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        _FooterLink(
          label: 'Políticas de Privacidad',
          onTap: onPrivacyTap ?? () {},
        ),
        const SizedBox(height: 8),
        _FooterLink(
          label: 'Solicitud de Eliminación de Datos',
          onTap: onDataDeletionTap,
        ),
        const SizedBox(height: 8),
        _FooterLink(
          label: 'Aplicaciones desarrolladas por Lucho Dev',
          onTap: () => _launchUrl(AppsData.playDeveloperUrl),
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contacto Directo',
          style: AppTypography.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.email_outlined, color: Color(0xFF0284C7), size: 16),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => UrlHelper.openContactEmail(
                email: AppsData.contactEmail,
                subject: 'Soporte LuCho Dev',
              ),
              child: Text(
                AppsData.contactEmail,
                style: AppTypography.inter(
                  fontSize: 13,
                  color: const Color(0xFFCBD5E1),
                  decoration: TextDecoration.underline,
                  decorationColor: const Color(0xFF0284C7),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, color: Color(0xFF64748B), size: 16),
            const SizedBox(width: 8),
            Text(
              'Bolivia (Desarrollo Global iOS & Android)',
              style: AppTypography.inter(
                fontSize: 13,
                color: const Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterLink({required this.label, required this.onTap});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          style: AppTypography.inter(
            fontSize: 13,
            color: _isHovered ? const Color(0xFF38BDF8) : const Color(0xFF94A3B8),
            decoration: _isHovered ? TextDecoration.underline : TextDecoration.none,
            decorationColor: const Color(0xFF38BDF8),
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
