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
POLÍTICAS DE PRIVACIDAD Y CONTENIDO
Última actualización: Septiembre 2026

1. Propósito Educativo
Quizz ESFM es una aplicación pedagógica e interactiva desarrollada con el objetivo de brindar apoyo, preparación y práctica a los postulantes para el examen de admisión a las Escuelas Superiores de Formación de Maestros (ESFM) y Unidades Académicas (UA) del Estado Plurinacional de Bolivia.

2. Ausencia de Recolección de Datos Personales
Valoramos y respetamos plenamente su privacidad. Quizz ESFM NO recopila, no almacena ni solicita ningún dato de carácter personal. No es necesario registrarse, crear una cuenta, ni ingresar nombres, correos electrónicos, números telefónicos, contraseñas o datos de pago para utilizar las funciones de la aplicación.

3. Almacenamiento Local del Progreso
Todo su historial de estudio, estadísticas de aciertos, respuestas seleccionadas y configuración de la app se guardan única y exclusivamente en el almacenamiento local de su propio dispositivo (mediante SQLite / SharedPreferences). Esta información nunca es transmitida, vendida ni sincronizada con servidores externos propios.

4. Publicidad y Servicios de Google AdMob
Para permitir que esta herramienta educativa continúe siendo completamente gratuita para todos los aspirantes, la aplicación integra los servicios publicitarios de Google AdMob.

Google AdMob puede recopilar y procesar identificadores técnicos de publicidad (como el Advertising ID de Android) e información general del dispositivo para mostrar anuncios relevantes (banners, intersticiales, bonificados y nativos) conforme a las Políticas de Privacidad de Google (policies.google.com/privacy). El usuario puede restablecer o limitar el seguimiento de anuncios desde los ajustes de su dispositivo.

5. Seguridad y Menores de Edad
El contenido de la aplicación está enfocado exclusivamente en materias académicas (comprensión lectora, razonamiento lógico, conocimientos generales y habilidades socioemocionales) y es seguro para personas de todas las edades. No contiene material explícito ni perjudicial.

6. Cambios y Contacto
Cualquier actualización en estas políticas de privacidad será notificada y actualizada dentro de la aplicación. Para dudas o consultas, puede contactarnos a través de los canales oficiales disponibles en la tienda Google Play Store.
''',
    ),
  ];
}
