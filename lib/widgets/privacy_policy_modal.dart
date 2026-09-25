import 'package:flutter/material.dart';
import '../data/apps_data.dart';
import '../models/app_info.dart';
import '../theme/app_typography.dart';
import '../utils/url_helper.dart';

class PrivacyPolicyModal extends StatelessWidget {
  final AppInfo app;

  const PrivacyPolicyModal({super.key, required this.app});

  static void show(BuildContext context, AppInfo app) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.75),
      builder: (context) => PrivacyPolicyModal(app: app),
    );
  }

  Future<void> _sendEmail() async {
    await UrlHelper.openContactEmail(
      email: AppsData.contactEmail,
      subject: 'Consulta de Privacidad - ${app.name}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 768;

    final dialogBg = isDark ? const Color(0xFF0F172A) : Colors.white;
    final headerBg = isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC);
    final borderColor = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);
    final titleColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final textColor = isDark ? const Color(0xFFE2E8F0) : const Color(0xFF334155);

    return Dialog(
      backgroundColor: dialogBg,
      elevation: 24,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : 16,
        vertical: 32,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: borderColor, width: 1.5),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 850,
          maxHeight: size.height * 0.85,
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: headerBg,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border(
                  bottom: BorderSide(color: borderColor, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0284C7).withValues(alpha: isDark ? 0.2 : 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.security_rounded,
                      color: Color(0xFF0284C7),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Política de Privacidad',
                          style: AppTypography.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: titleColor,
                          ),
                        ),
                        Text(
                          app.name,
                          style: AppTypography.inter(
                            fontSize: 13,
                            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close_rounded,
                      color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                    ),
                    tooltip: 'Cerrar',
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderColor),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.verified_outlined,
                              color: Color(0xFF10B981),
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Documento oficial conforme a las políticas de datos para aplicaciones móviles (Google Play & Apple App Store).',
                                style: AppTypography.inter(
                                  fontSize: 13,
                                  color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SelectableText(
                        app.privacyPolicyText.trim(),
                        style: AppTypography.inter(
                          fontSize: 14,
                          color: textColor,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom action bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: headerBg,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                border: Border(
                  top: BorderSide(color: borderColor, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: _sendEmail,
                    icon: const Icon(Icons.mail_outline_rounded, size: 18),
                    label: const Text('Contactar por Privacidad'),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF0284C7),
                      textStyle: AppTypography.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? const Color(0xFF334155) : const Color(0xFF0F172A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Entendido'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
