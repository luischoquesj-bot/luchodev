import '../models/app_info.dart';

class AppsData {
  static const String developerName = 'LuCho Dev';
  static const String contactEmail = 'luischoque.sj@gmail.com';
  static const String playDeveloperUrl =
      'https://play.google.com/store/apps/developer?id=LuCho&hl=es_419';

  static final List<AppInfo> apps = [
    const AppInfo(
      id: 'traductor_guarani',
      name: 'Traductor Guaraní Boliviano',
      category: 'Educación & Idiomas',
      description:
          'Traducción precisa entre Castellano y Guaraní boliviano con enfoque didáctico.',
      iconPath: 'assets/icons/traductor_guarani.png',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=diccionario.guarani7',
      isReleased: true,
      lastUpdated: 'Septiembre 2026',
      privacyHtmlPath: 'privacy-traductor-guarani.html',
      privacyPolicyText: '''
POLÍTICA DE PRIVACIDAD Y CONTENIDO

•	La app no recoge ningún dato de carácter personal del usuario como, por ejemplo, nombre, fotografías o localización.

•	En consecuencia la app no comparte ningún dato personal con ninguna otra entidad o terceras personas.

•	Las imágenes y los videos introducidos por el usuario son enviados al servidor de la app con el fin de poder ser recuperados posteriormente por el propio usuario, y con el fin de que la app pueda ofrecer las funcionalidades según su descripción.

•	Permitimos que terceras compañías publiquen anuncios y recopilen cierta información anónima cuando visite nuestra aplicación. Estas empresas pueden utilizar información anónima, como su ID de publicidad de Google, el tipo y la versión de su dispositivo, la actividad de navegación, la ubicación y otros datos técnicos relacionados con su dispositivo, a fin de proporcionar anuncios.
''',
    ),
    const AppInfo(
      id: 'preguntas_esfm',
      name: 'Preguntas ESFM',
      category: 'Preparación Académica',
      description:
          'Simulador de examen de admisión a las ESFM con banco de preguntas actualizado.',
      iconPath: 'assets/icons/preguntas_esfm.png',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=preguntas.esfm4',
      isReleased: true,
      lastUpdated: 'Septiembre 2026',
      privacyHtmlPath: 'privacy-preguntas-esfm.html',
      privacyPolicyText: '''
POLÍTICA DE PRIVACIDAD Y CONTENIDO

•	La app no recoge ningún dato de carácter personal del usuario como, por ejemplo, nombre, fotografías o localización.

•	En consecuencia la app no comparte ningún dato personal con ninguna otra entidad o terceras personas.

•	Las imágenes y los videos introducidos por el usuario son enviados al servidor de la app con el fin de poder ser recuperados posteriormente por el propio usuario, y con el fin de que la app pueda ofrecer las funcionalidades según su descripción.

•	Permitimos que terceras compañías publiquen anuncios y recopilen cierta información anónima cuando visite nuestra aplicación. Estas empresas pueden utilizar información anónima, como su ID de publicidad de Google, el tipo y la versión de su dispositivo, la actividad de navegación, la ubicación y otros datos técnicos relacionados con su dispositivo, a fin de proporcionar anuncios.
''',
    ),
    const AppInfo(
      id: 'quizz_esfm',
      name: 'Quizz ESFM',
      category: 'Evaluación Interactiva',
      description:
          'Simulador Oficial 2025 del Examen de Admisión a las Escuelas Superiores de Formación de Maestros (ESFM).',
      iconPath: 'assets/icons/quizz_esfm.png',
      playStoreUrl: '',
      isReleased: false,
      lastUpdated: 'Septiembre 2026 (Próximamente en Google Play)',
      privacyHtmlPath: 'privacy-quizz-esfm.html',
      privacyPolicyText: '''
POLÍTICA DE PRIVACIDAD - QUIZZ ESFM
Última actualización: Septiembre 2026

Esta Política de Privacidad rige el tratamiento de la información para la aplicación móvil "Quizz ESFM", desarrollada por LuCho Dev.

1. RECOPILACIÓN Y FINALIDAD DE LOS DATOS
"Quizz ESFM" es una plataforma lúdica y evaluativa orientada al aprendizaje dinámico. La aplicación no exige la introducción de datos personales sensibles. Las partidas, puntos obtenidos y configuraciones se resguardan en la memoria local de su dispositivo móvil.

2. REDES DE ANUNCIOS (GOOGLE ADMOB)
La aplicación incorpora anuncios servidos por Google AdMob con el objetivo de mantener la disponibilidad del servicio. Google AdMob puede recopilar identificadores de publicidad del dispositivo (AAID/IDFA) e información de interacción técnica con los anuncios para garantizar su adecuada entrega y evitar fraudes publicitarios. Para detalles sobre cómo gestiona Google esta información, consulte:
https://policies.google.com/technologies/ads

3. PROTECCIÓN DE MENORES Y FAMILIAS
El contenido de "Quizz ESFM" es enteramente educativo y cumple con las directrices de la Política de Familias de Google Play. No recopilamos conscientemente datos de menores de 13 años.

4. ELIMINACIÓN DE DATOS Y DERECHOS DEL USUARIO
Usted puede reiniciar y eliminar cualquier registro de partidas en cualquier instante borrando los datos de la app o desinstalándola de su dispositivo móvil. Si desea remitir una solicitud formal de eliminación de datos técnicos o aclaración de privacidad:
Correo: luischoque.sj@gmail.com

5. CONTACTO Y SOPORTE
Desarrollador: LuCho Dev
Correo oficial de contacto y soporte: luischoque.sj@gmail.com
''',
    ),
  ];
}
