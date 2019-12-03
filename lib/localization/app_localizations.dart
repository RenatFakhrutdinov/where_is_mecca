import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Where is Mecca?',
      'noInternet':
          'Network connection unavailable. Please check that you have a data connection and try again.',
      'noLocation': 'Turn on device location please',
      'horizontal': 'Please put your device in horizontal position',
      'error': 'Something went wrong'
    },
    'es': {
      'title': '¿Dónde está la Meca?',
      'noInternet':
          'Conexión de red no disponible. Compruebe que tiene una conexión de datos e intente nuevamente.',
      'noLocation': 'Encienda la ubicación del dispositivo por favor',
      'horizontal': 'Por favor coloque su dispositivo en posición horizontal',
      'error': 'Ha ocurrido un error'
    },
    'ru': {
      'title': 'Где Мекка?',
      'noInternet':
          'Сетевое подключение недоступно. Проверьте своё подключение к данным и повторите попытку.',
      'noLocation': 'Включите доступ к геоданным, пожалуйста.',
      'horizontal':
          'Пожалуйста, поместите ваше устройство в горизонтальное положение',
      'error': 'Что-то пошло не так'
    }
  };

  String get title => _localizedValues[locale.languageCode]['title'];
  String get noInternet => _localizedValues[locale.languageCode]['noInternet'];
  String get noLocation => _localizedValues[locale.languageCode]['noLocation'];
  String get horizontal => _localizedValues[locale.languageCode]['horizontal'];
  String get error => _localizedValues[locale.languageCode]['error'];
}
