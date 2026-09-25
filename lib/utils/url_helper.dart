import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  /// Opens an email composer.
  /// On Flutter Web: Opens Gmail Web with parameters encoded directly in the SAME tab (_self)
  /// so that no blank window (about:blank) or extra tabs are opened.
  /// On Mobile / Native platforms: Uses LaunchMode.externalApplication with mailto:.
  static Future<void> openContactEmail({
    required String email,
    required String subject,
    String body = '',
  }) async {
    final encodedSubject = Uri.encodeComponent(subject);
    final encodedBody =
        body.isNotEmpty ? '&body=${Uri.encodeComponent(body)}' : '';

    if (kIsWeb) {
      final gmailUrl =
          'https://mail.google.com/mail/?view=cm&fs=1&to=$email&su=$encodedSubject$encodedBody';
      final uri = Uri.parse(gmailUrl);
      await launchUrl(uri, webOnlyWindowName: '_self');
    } else {
      final mailtoUri =
          Uri.parse('mailto:$email?subject=$encodedSubject$encodedBody');
      if (await canLaunchUrl(mailtoUri)) {
        await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
      }
    }
  }

  /// Opens any generic URL in the same tab on Web
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_self');
    }
  }
}
