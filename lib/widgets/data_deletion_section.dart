import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data/apps_data.dart';
import '../theme/app_typography.dart';
import '../utils/url_helper.dart';

class DataDeletionSection extends StatelessWidget {
  const DataDeletionSection({super.key});

  Future<void> _sendDeletionEmail() async {
    await UrlHelper.openContactEmail(
      email: AppsData.contactEmail,
      subject: 'Solicitud de Eliminacion de Datos',
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = MediaQuery.of(context).size.width > 768;

    final containerBg = isDark ? const Color(0xFF131C31) : Colors.white;
    // Contrasting borders based on the color palette
    final borderColor = isDark
        ? const Color(0xFF38BDF8).withValues(alpha: 0.75)
        : const Color(0xFF0284C7);

    final titleColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subtitleColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
    final bodyColor = isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48.0 : 20.0,
        vertical: 24.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Container(
            padding: EdgeInsets.all(isDesktop ? 36.0 : 22.0),
            decoration: BoxDecoration(
              color: containerBg,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: borderColor,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: (isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7))
                      .withValues(alpha: isDark ? 0.2 : 0.12),
                  blurRadius: 28,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Title & Badge
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0284C7).withValues(alpha: isDark ? 0.2 : 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.delete_sweep_rounded,
                        color: Color(0xFF0284C7),
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Solicitud de Eliminación de Datos (User Data Deletion)',
                            style: AppTypography.outfit(
                              fontSize: isDesktop ? 22 : 18,
                              fontWeight: FontWeight.w700,
                              color: titleColor,
                            ),
                          ),
                          Text(
                            'Conformidad con las Políticas de Privacidad Móvil (Google Play & Apple App Store)',
                            style: AppTypography.inter(
                              fontSize: 12,
                              color: subtitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                // Explanation
                Text(
                  'En LuCho Dev respetamos su privacidad y soberanía de datos digitales. Nuestras aplicaciones móviles (Android e iOS) están concebidas bajo el principio de minimización de datos: no requieren creación forzosa de perfiles personales ni recolectan credenciales confidenciales en servidores externos. No obstante, ponemos a su disposición los siguientes mecanismos formales para la supresión de registros:',
                  style: AppTypography.inter(
                    fontSize: 14,
                    color: bodyColor,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 24),

                // Steps Grid
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 720;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        _StepCard(
                          width: isWide
                              ? (constraints.maxWidth - 32) / 3
                              : constraints.maxWidth,
                          number: '1',
                          title: 'Eliminación Local Inmediata',
                          description:
                              'En su dispositivo móvil (Android: Ajustes > Aplicaciones > [App] > Almacenamiento > "Borrar datos". iOS: Ajustes > General > Espacio en iPhone > Desinstalar o borrar datos). Esto suprimirá de inmediato todo progreso y caché.',
                          isDark: isDark,
                        ),
                        _StepCard(
                          width: isWide
                              ? (constraints.maxWidth - 32) / 3
                              : constraints.maxWidth,
                          number: '2',
                          title: 'Restablecer ID Publicitario',
                          description:
                              'Para desvincular identificadores analíticos o publicitarios de AdMob: En Android (Ajustes de Google > Anuncios > "Restablecer ID"). En iOS (Ajustes > Privacidad y seguridad > Seguimiento > Desactivar permisos).',
                          isDark: isDark,
                        ),
                        _StepCard(
                          width: isWide
                              ? (constraints.maxWidth - 32) / 3
                              : constraints.maxWidth,
                          number: '3',
                          title: 'Solicitud Directa por Correo',
                          description:
                              'Envíenos un mensaje solicitando asistencia técnica o confirmación de supresión de datos. Procesamos y respondemos cada petición en un plazo no mayor a 48 a 72 horas hábiles.',
                          isDark: isDark,
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 28),

                // Action Callout
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark
                          ? const Color(0xFF0284C7).withValues(alpha: 0.6)
                          : const Color(0xFF0284C7),
                      width: 1.5,
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isCalloutWide = constraints.maxWidth > 580;
                      return isCalloutWide
                          ? Row(
                              children: [
                                const Icon(
                                  Icons.mark_email_read_outlined,
                                  color: Color(0xFF0284C7),
                                  size: 24,
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    'Canal oficial de privacidad: ${AppsData.contactEmail}',
                                    style: AppTypography.inter(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: titleColor,
                                    ),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: _sendDeletionEmail,
                                  icon: const Icon(Icons.send_rounded, size: 16),
                                  label: const Text('Enviar Solicitud'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0284C7),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    textStyle: AppTypography.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                                    .animate(onPlay: (controller) => controller.repeat(reverse: true))
                                    .shimmer(
                                      duration: 1600.ms,
                                      color: Colors.white.withValues(alpha: 0.35),
                                    ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.mark_email_read_outlined,
                                      color: Color(0xFF0284C7),
                                      size: 22,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        AppsData.contactEmail,
                                        style: AppTypography.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: titleColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton.icon(
                                  onPressed: _sendDeletionEmail,
                                  icon: const Icon(Icons.send_rounded, size: 16),
                                  label: const Text('Enviar Solicitud de Eliminación'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0284C7),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                )
                                    .animate(onPlay: (controller) => controller.repeat(reverse: true))
                                    .shimmer(
                                      duration: 1600.ms,
                                      color: Colors.white.withValues(alpha: 0.35),
                                    ),
                              ],
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  final double width;
  final String number;
  final String title;
  final String description;
  final bool isDark;

  const _StepCard({
    required this.width,
    required this.number,
    required this.title,
    required this.description,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? const Color(0xFF0284C7).withValues(alpha: 0.45)
              : const Color(0xFF0284C7).withValues(alpha: 0.35),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFF0284C7).withValues(alpha: isDark ? 0.25 : 0.15),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: AppTypography.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0284C7),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTypography.outfit(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTypography.inter(
              fontSize: 12.5,
              color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
