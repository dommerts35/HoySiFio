import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // authSigningIn
  {
    '4dzq3gdq': {
      'es': 'Hoy',
      'en': '',
    },
    '6f5bm89m': {
      'es': 'Sí',
      'en': '',
    },
    'cnqotfvl': {
      'es': 'Fio',
      'en': '',
    },
    'nxeswyq7': {
      'es': 'Tendero',
      'en': '',
    },
    'fr5mniu6': {
      'es': 'Bienvenido',
      'en': '',
    },
    'w4y47z9b': {
      'es': 'Llena el formulario para iniciar sesión como tendero',
      'en': '',
    },
    'u8b9lppk': {
      'es': 'Email',
      'en': '',
    },
    '7di16zo1': {
      'es': 'Contraseña',
      'en': '',
    },
    'i4951keh': {
      'es': 'Iniciar Sesión',
      'en': '',
    },
    '2xkp6jrl': {
      'es': 'O inicia sesión como cliente',
      'en': '',
    },
    'm7axutse': {
      'es': 'Términos de servicio',
      'en': '',
    },
    '4k7ldlkt': {
      'es': 'Cliente',
      'en': '',
    },
    'e0amswgi': {
      'es': 'Bienvenido',
      'en': '',
    },
    '4ig0fbfu': {
      'es': 'Llene el formulario para iniciar sesión como cliente',
      'en': '',
    },
    'ugqry3j4': {
      'es': 'Nombre Completo',
      'en': '',
    },
    '0te276nf': {
      'es': 'Iniciar Sesión',
      'en': '',
    },
    'hjbn5352': {
      'es': 'O inicia sesión como tendero',
      'en': '',
    },
    'mpvcc2oa': {
      'es': 'Términos de Servicio',
      'en': '',
    },
    'p0uanyfj': {
      'es': 'Home',
      'en': '',
    },
  },
  // listaProdClien
  {
    'nu28y6p5': {
      'es': 'Todos',
      'en': '',
    },
    '8z0trr3q': {
      'es': 'Fiando',
      'en': '',
    },
    'tdonvu0o': {
      'es': 'Sin Fiar',
      'en': '',
    },
    'z73flnfh': {
      'es': 'Clientes Fiados',
      'en': '',
    },
    'gsnr0n9a': {
      'es': '•',
      'en': '',
    },
  },
  // clienteMakeInfo
  {
    'lhhwa7uq': {
      'es': 'Nombres',
      'en': '',
    },
    'n12i00nx': {
      'es': 'Apellidos',
      'en': '',
    },
    '8jwr8ism': {
      'es': 'Número de cédula',
      'en': '',
    },
    'wzb88ms0': {
      'es': 'Número de teléfono',
      'en': '',
    },
    '6zpzou76': {
      'es': 'Dirección domiciliaria',
      'en': '',
    },
    '8kma8106': {
      'es': 'Email',
      'en': '',
    },
    'hs9qn08g': {
      'es': 'Vivienda Propia',
      'en': '',
    },
    '98x3xwe0': {
      'es': 'Vivienda Alquilada',
      'en': '',
    },
    '25j9hjhr': {
      'es': 'Enviar',
      'en': '',
    },
    '21mzdkhm': {
      'es': 'Ingrese los nombres completos del cliente.',
      'en': '',
    },
    'wqcqgli1': {
      'es':
          'Ingrese los nombres completos de su cliente con más de 5 carácteres.',
      'en': '',
    },
    '9oabz20m': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'r3mdo8kj': {
      'es': 'Ingrese los apellidos completos de su cliente',
      'en': '',
    },
    'w9iip6zv': {
      'es': 'Ingrese los apellidos completos del cliente',
      'en': '',
    },
    '5978a4zx': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'u3ijjh2x': {
      'es': 'Ingrese el número de cédula de su cliente',
      'en': '',
    },
    'eco3r01j': {
      'es': 'El número de cédula es de 10 dígitos.',
      'en': '',
    },
    'h54r93ga': {
      'es': 'El número de cédula es de 10 dígitos.',
      'en': '',
    },
    '1n0ho14l': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'inhoc3i3': {
      'es': 'Ingrese el número de teléfono de su cliente',
      'en': '',
    },
    'ombehtbq': {
      'es': 'El número de teléfono es de 10 dígitos.',
      'en': '',
    },
    'gik78wpo': {
      'es': 'El número de teléfono es de 10 dígitos.',
      'en': '',
    },
    'h08spwwn': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'pepfwjpo': {
      'es': 'Ingrese la Dirección domiciliaria de su cliente.',
      'en': '',
    },
    '6uo8vsbd': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'mm05figr': {
      'es': 'Ingrese el email de su cliente',
      'en': '',
    },
    'mae9m98y': {
      'es': 'Email no encontrado.',
      'en': '',
    },
    '3bohds8d': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '2ob7wk2n': {
      'es': 'Registrar Nuevo Cliente',
      'en': '',
    },
    '6231x968': {
      'es': 'Llene la información del cliente nuevo',
      'en': '',
    },
    'irgbmncn': {
      'es': 'Home',
      'en': '',
    },
  },
  // pagoFinal
  {
    'q0qbkmww': {
      'es': 'Tarjeta de Crédito',
      'en': '',
    },
    'jjkdodes': {
      'es': 'Nombre',
      'en': '',
    },
    'a10gdgfw': {
      'es': 'Paypal',
      'en': '',
    },
    '59ym2gmf': {
      'es': 'Tarjeta',
      'en': '',
    },
    '52nefpoz': {
      'es': 'Pagar ahora',
      'en': '',
    },
    'z7i5v0i2': {
      'es': 'Pay w/Paypal',
      'en': '',
    },
    '6dit1ema': {
      'es': 'Home',
      'en': '',
    },
  },
  // resumenFiadoClien
  {
    'ipjnm8pc': {
      'es': 'Resúmen de fiado',
      'en': '',
    },
    '9odu2x6k': {
      'es': 'Precio a Pagar Por:',
      'en': '',
    },
    'hz1jng79': {
      'es': 'Pagar Ahora',
      'en': '',
    },
    'aystjwea': {
      'es': 'Home',
      'en': '',
    },
  },
  // clienteEditInfo
  {
    'nejq1ybj': {
      'es': 'Nombres',
      'en': '',
    },
    'xgmb2b5l': {
      'es': 'Apellidos',
      'en': '',
    },
    's1yfhujq': {
      'es': 'Cédula',
      'en': '',
    },
    '4w9khhr6': {
      'es': 'Número de teléfono',
      'en': '',
    },
    '4556idh7': {
      'es': 'Dirección Domiciliaria',
      'en': '',
    },
    '7mqbakvu': {
      'es': 'Email',
      'en': '',
    },
    'q0hkfg4q': {
      'es': 'Vivienda Propia',
      'en': '',
    },
    '7e28i2uq': {
      'es': 'Vivienda Alquilada',
      'en': '',
    },
    'od5eqvd7': {
      'es': 'Enviar',
      'en': '',
    },
    'r1hnrg1v': {
      'es': 'Ingrese los nombres del cliente.',
      'en': '',
    },
    'tjc9gmti': {
      'es': 'Ingrese el nombre con más de 5 carácteres',
      'en': '',
    },
    'yohm0ihr': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '9twb8r6b': {
      'es': 'Ingrese los apellidos del cliente.',
      'en': '',
    },
    '6zmyr1xm': {
      'es': 'Ingrese el apellido con más de 5 carácteres',
      'en': '',
    },
    'n9z935ki': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ddf4buvg': {
      'es': 'Ingrese la cédula del cliente',
      'en': '',
    },
    'e2zea2kz': {
      'es': 'Ingrese la cédula completa.',
      'en': '',
    },
    '727xllyz': {
      'es': 'Ingrese la cédula.',
      'en': '',
    },
    'iuts9qso': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0uzrchf6': {
      'es': 'Ingrese el número de teléfono del cliente.',
      'en': '',
    },
    'rna1wy0y': {
      'es': 'Ingrese el número de teléfono completo',
      'en': '',
    },
    '0pmpwrys': {
      'es': 'Ingrese el número de teléfono.',
      'en': '',
    },
    '2zg2yei5': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'np5cp5ap': {
      'es': 'Ingrese la dirección del cliente',
      'en': '',
    },
    '3mwve3m1': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'bakwnf7j': {
      'es': 'Ingrese el email del cliente',
      'en': '',
    },
    'fw5j8mgr': {
      'es': 'Ese Email no existe',
      'en': '',
    },
    'xe3dzgy4': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '7ebe3393': {
      'es': 'Editar Cliente',
      'en': '',
    },
    'i6ycinm2': {
      'es': 'Llene la información del cliente',
      'en': '',
    },
    'si90ux16': {
      'es': 'Home',
      'en': '',
    },
  },
  // clienteProd-InfoEdit
  {
    'qkzdh8m8': {
      'es': 'Fiar Productos',
      'en': '',
    },
    '83pjv5dz': {
      'es': 'Producto',
      'en': '',
    },
    'x7hrnybu': {
      'es': 'Ingrese el producto',
      'en': '',
    },
    'minmxdls': {
      'es': 'Valor',
      'en': '',
    },
    '8qnas4ho': {
      'es': '#.##',
      'en': '',
    },
    '28ox95x7': {
      'es': 'Añadir Producto',
      'en': '',
    },
    'uwlfqv5j': {
      'es': 'Fecha de Pago del Producto',
      'en': '',
    },
    'cs2ofbsh': {
      'es': 'Pagar',
      'en': '',
    },
    '3upxvyh0': {
      'es': 'Historial',
      'en': '',
    },
    'ioedc5d2': {
      'es': 'Enviar',
      'en': '',
    },
    '1606cen3': {
      'es': 'Ingrese el nombre del cliente.',
      'en': '',
    },
    'xntn4x0x': {
      'es': 'Ingrese un nombre con más de 2 carácteres',
      'en': '',
    },
    '3ak9lel0': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'q42ej5pi': {
      'es': 'Número de teléfono is required',
      'en': '',
    },
    '02561r9e': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'vls6sgrc': {
      'es': 'Ingrese los productos',
      'en': '',
    },
    '9uujfmz5': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '43anmc4n': {
      'es': 'Ingrese el pago',
      'en': '',
    },
    'ypgzyf2y': {
      'es': 'El número de teléfono debe de tener 10 dígitos',
      'en': '',
    },
    'a7nrkj6m': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8bowq0tq': {
      'es': 'Editar cliente',
      'en': '',
    },
    'ktufeslb': {
      'es': 'Edición de datos del cliente',
      'en': '',
    },
    'cp1evi8d': {
      'es': 'Home',
      'en': '',
    },
  },
  // historialPagos
  {
    'gxg9u041': {
      'es': 'Historial',
      'en': '',
    },
    'rhc1o40z': {
      'es': 'Aquí se mostrarán los productos fiados.',
      'en': '',
    },
    'ey3dqpm8': {
      'es': 'prod1',
      'en': '',
    },
    'w3h5xdjx': {
      'es': 'Mon. July 3rd',
      'en': '',
    },
    '7zx8y5mc': {
      'es': 'Falta pagar:',
      'en': '',
    },
    'b4tb641b': {
      'es': 'Pagado',
      'en': '',
    },
    '0dcg5fwl': {
      'es': 'Home',
      'en': '',
    },
  },
  // clienteReadInfo
  {
    'sikgq85p': {
      'es': 'Nombres',
      'en': '',
    },
    '9khzxccs': {
      'es': 'Apellidos',
      'en': '',
    },
    '3rzn6i2b': {
      'es': 'Cédula',
      'en': '',
    },
    'uwtxa5n1': {
      'es': 'Número de teléfono',
      'en': '',
    },
    '4x9cjlg0': {
      'es': 'Dirección Domiciliaria',
      'en': '',
    },
    'm4kcodd7': {
      'es': 'Email',
      'en': '',
    },
    '4nd7ks31': {
      'es': 'Vivienda Propia',
      'en': '',
    },
    'd3hgsx7p': {
      'es': 'Vivienda Alquilada',
      'en': '',
    },
    '687r2v4n': {
      'es': 'Ingrese los nombres del cliente.',
      'en': '',
    },
    '8v4is5pg': {
      'es': 'Ingrese el nombre con más de 5 carácteres',
      'en': '',
    },
    'vfd4tg4r': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8xyeg780': {
      'es': 'Ingrese los apellidos del cliente.',
      'en': '',
    },
    '3efsdt5q': {
      'es': 'Ingrese el apellido con más de 5 carácteres',
      'en': '',
    },
    'ntj3q5ef': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jgt2mo47': {
      'es': 'Ingrese la cédula del cliente',
      'en': '',
    },
    'e2cxain9': {
      'es': 'Ingrese la cédula completa.',
      'en': '',
    },
    'qa6nupq8': {
      'es': 'Ingrese la cédula.',
      'en': '',
    },
    'ri7dx20g': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fkdxt2wn': {
      'es': 'Ingrese el número de teléfono del cliente.',
      'en': '',
    },
    'bbwwn6in': {
      'es': 'Ingrese el número de teléfono completo',
      'en': '',
    },
    '5o7yk9ps': {
      'es': 'Ingrese el número de teléfono.',
      'en': '',
    },
    'fh1qyotx': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '31ex3eos': {
      'es': 'Ingrese la dirección del cliente',
      'en': '',
    },
    'j1963p91': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'dc4mgfzk': {
      'es': 'Ingrese el email del cliente',
      'en': '',
    },
    'pvjylei9': {
      'es': 'Ese Email no existe',
      'en': '',
    },
    'tdd0xl30': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'dda6o5kw': {
      'es': 'Cliente',
      'en': '',
    },
    '5meoqm1p': {
      'es': 'Home',
      'en': '',
    },
  },
  // clienteProd-ValorPago
  {
    'kzamg66u': {
      'es': 'Valor a Pagar',
      'en': '',
    },
    'vifxjq73': {
      'es': '#.##',
      'en': '',
    },
    'n2orvs3t': {
      'es': 'Transferencia',
      'en': '',
    },
    '3wg5skqm': {
      'es': 'Efectivo',
      'en': '',
    },
    'nvdugge5': {
      'es': 'Fecha de Pago: ',
      'en': '',
    },
    '1bjtat58': {
      'es': '28/03/2025',
      'en': '',
    },
    'h1hzgltz': {
      'es': 'Pagar',
      'en': '',
    },
    'byyhpred': {
      'es': 'Ingrese el nombre del cliente.',
      'en': '',
    },
    'l4xd2gip': {
      'es': 'Ingrese un nombre con más de 2 carácteres',
      'en': '',
    },
    '5s3l2b78': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '20k7dzrx': {
      'es': 'Número de teléfono is required',
      'en': '',
    },
    '8if1inlw': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ydcr6sym': {
      'es': 'Ingrese los productos',
      'en': '',
    },
    '2l84htcc': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'h1sb94hm': {
      'es': 'Ingrese el pago',
      'en': '',
    },
    'z6c09ibb': {
      'es': 'El número de teléfono debe de tener 10 dígitos',
      'en': '',
    },
    'mxk2qofv': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8dwfvz75': {
      'es': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'hc60n6rp': {
      'es': '',
      'en': '',
    },
    'n5qqfb3n': {
      'es': '',
      'en': '',
    },
    '859kq2sx': {
      'es': '',
      'en': '',
    },
    '9sy3y42d': {
      'es': '',
      'en': '',
    },
    '5xs8u9fk': {
      'es': '',
      'en': '',
    },
    'h1th891d': {
      'es': '',
      'en': '',
    },
    'r415yh0a': {
      'es': '',
      'en': '',
    },
    '45s4k8z4': {
      'es': '',
      'en': '',
    },
    'c5v0j8xn': {
      'es': '',
      'en': '',
    },
    'urktdv8m': {
      'es': '',
      'en': '',
    },
    'r9v3macs': {
      'es': '',
      'en': '',
    },
    '2z2fu7c7': {
      'es': '',
      'en': '',
    },
    's1kdxxko': {
      'es': '',
      'en': '',
    },
    'yf7s5z6q': {
      'es': '',
      'en': '',
    },
    'xna8udvs': {
      'es': '',
      'en': '',
    },
    'u34go7vm': {
      'es': '',
      'en': '',
    },
    'ohhlnlro': {
      'es': '',
      'en': '',
    },
    'b9g7mu2e': {
      'es': '',
      'en': '',
    },
    '1xx3a30w': {
      'es': '',
      'en': '',
    },
    'gwdmmqdx': {
      'es': '',
      'en': '',
    },
    'av7qet08': {
      'es': '',
      'en': '',
    },
    '611ueolf': {
      'es': '',
      'en': '',
    },
    '5gaoyp2j': {
      'es': '',
      'en': '',
    },
    'bftunihx': {
      'es': '',
      'en': '',
    },
    'boku5brg': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
