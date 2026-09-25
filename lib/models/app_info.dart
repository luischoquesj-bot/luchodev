class AppInfo {
  final String id;
  final String name;
  final String description;
  final String iconPath;
  final String playStoreUrl;
  final bool isReleased;
  final String privacyPolicyText;
  final String category;
  final String lastUpdated;
  final String privacyHtmlPath;

  const AppInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.iconPath,
    required this.playStoreUrl,
    required this.isReleased,
    required this.privacyPolicyText,
    this.category = 'Educación',
    this.lastUpdated = 'Septiembre 2026',
    this.privacyHtmlPath = '',
  });

  String get privacyHtmlUrl {
    if (privacyHtmlPath.isNotEmpty) return privacyHtmlPath;
    if (id == 'traductor_guarani') return 'privacy-traductor-guarani.html';
    if (id == 'preguntas_esfm') return 'privacy-preguntas-esfm.html';
    if (id == 'quizz_esfm') return 'privacy-quizz-esfm.html';
    return 'privacy-$id.html';
  }
}
