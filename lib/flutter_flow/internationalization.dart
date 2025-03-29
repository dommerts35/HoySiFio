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
      'en': 'Hoy',
    },
    '6f5bm89m': {
      'es': 'Sí',
      'en': 'Si',
    },
    'cnqotfvl': {
      'es': 'Fio',
      'en': 'Fio',
    },
    'nxeswyq7': {
      'es': 'Tendero',
      'en': 'Shopkeeper',
    },
    'fr5mniu6': {
      'es': 'Bienvenido',
      'en': 'Welcome',
    },
    'w4y47z9b': {
      'es': 'Llena el formulario para iniciar sesión como tendero',
      'en': 'Fill out the form to log in as a shopkeeper',
    },
    'u8b9lppk': {
      'es': 'Email',
      'en': 'E-mail',
    },
    '7di16zo1': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'i4951keh': {
      'es': 'Iniciar Sesión',
      'en': 'Login',
    },
    '2xkp6jrl': {
      'es': 'O inicia sesión como cliente',
      'en': 'Or log in as a customer',
    },
    'm7axutse': {
      'es': 'Términos de servicio',
      'en': 'Terms of Service',
    },
    '4k7ldlkt': {
      'es': 'Cliente',
      'en': 'Customer',
    },
    'e0amswgi': {
      'es': 'Bienvenido',
      'en': 'Welcome',
    },
    '4ig0fbfu': {
      'es': 'Llene el formulario para iniciar sesión como cliente',
      'en': 'Fill out the form to log in as a customer',
    },
    'ugqry3j4': {
      'es': 'Nombre Completo',
      'en': 'Full Name',
    },
    '0te276nf': {
      'es': 'Iniciar Sesión',
      'en': 'Login',
    },
    'hjbn5352': {
      'es': 'O inicia sesión como tendero',
      'en': 'Or log in as a shopkeeper',
    },
    'mpvcc2oa': {
      'es': 'Términos de Servicio',
      'en': 'Terms of Service',
    },
    'p0uanyfj': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // listaProdClien
  {
    'nu28y6p5': {
      'es': 'Todos',
      'en': 'All',
    },
    '8z0trr3q': {
      'es': 'Fiando',
      'en': 'Due',
    },
    'tdonvu0o': {
      'es': 'Sin Fiar',
      'en': 'Not Due',
    },
    'z73flnfh': {
      'es': 'Clientes Fiados',
      'en': 'Customers',
    },
    'gsnr0n9a': {
      'es': '•',
      'en': '•',
    },
  },
  // clienteMakeInfo
  {
    'lhhwa7uq': {
      'es': 'Nombres',
      'en': 'Names',
    },
    'n12i00nx': {
      'es': 'Apellidos',
      'en': 'Last names',
    },
    '8jwr8ism': {
      'es': 'Número de cédula',
      'en': 'ID number',
    },
    'wzb88ms0': {
      'es': 'Número de teléfono',
      'en': 'Phone number',
    },
    '6zpzou76': {
      'es': 'Dirección domiciliaria',
      'en': 'Home address',
    },
    '8kma8106': {
      'es': 'Email',
      'en': '',
    },
    'hs9qn08g': {
      'es': 'Vivienda Propia',
      'en': 'Own Home',
    },
    '98x3xwe0': {
      'es': 'Vivienda Alquilada',
      'en': 'Rented Housing',
    },
    '25j9hjhr': {
      'es': 'Enviar',
      'en': 'Send',
    },
    '21mzdkhm': {
      'es': 'Ingrese los nombres completos del cliente.',
      'en': 'Enter the customer\'s full names.',
    },
    'wqcqgli1': {
      'es':
          'Ingrese los nombres completos de su cliente con más de 5 carácteres.',
      'en': 'Enter your customer\'s full name with more than 5 characters.',
    },
    '9oabz20m': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'r3mdo8kj': {
      'es': 'Ingrese los apellidos completos de su cliente',
      'en': 'Enter your client\'s full last name',
    },
    'w9iip6zv': {
      'es': 'Ingrese los apellidos completos del cliente',
      'en': 'Enter the customer\'s full last name',
    },
    '5978a4zx': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'u3ijjh2x': {
      'es': 'Ingrese el número de cédula de su cliente',
      'en': 'Enter your client\'s ID number',
    },
    'eco3r01j': {
      'es': 'El número de cédula es de 10 dígitos.',
      'en': 'The ID number is 10 digits long.',
    },
    'h54r93ga': {
      'es': 'El número de cédula es de 10 dígitos.',
      'en': 'The ID number is 10 digits long.',
    },
    '1n0ho14l': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'inhoc3i3': {
      'es': 'Ingrese el número de teléfono de su cliente',
      'en': 'Enter your customer\'s phone number',
    },
    'ombehtbq': {
      'es': 'El número de teléfono es de 10 dígitos.',
      'en': 'The phone number is 10 digits.',
    },
    'gik78wpo': {
      'es': 'El número de teléfono es de 10 dígitos.',
      'en': 'The phone number is 10 digits.',
    },
    'h08spwwn': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'pepfwjpo': {
      'es': 'Ingrese la Dirección domiciliaria de su cliente.',
      'en': 'Enter your client\'s home address.',
    },
    '6uo8vsbd': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'mm05figr': {
      'es': 'Ingrese el email de su cliente',
      'en': 'Enter your client\'s email',
    },
    'mae9m98y': {
      'es': 'Email no encontrado.',
      'en': 'Email not found.',
    },
    '3bohds8d': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '2ob7wk2n': {
      'es': 'Registrar Nuevo Cliente',
      'en': 'Register New Customer',
    },
    '6231x968': {
      'es': 'Llene la información del cliente nuevo',
      'en': 'Fill out the new customer information',
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
      'en': 'ID',
    },
    '4w9khhr6': {
      'es': 'Número de teléfono',
      'en': '',
    },
    '4556idh7': {
      'es': 'Dirección Domiciliaria',
      'en': 'Home Address',
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
      'en': 'Enter the client names.',
    },
    'tjc9gmti': {
      'es': 'Ingrese el nombre con más de 5 carácteres',
      'en': 'Enter the name with more than 5 characters',
    },
    'yohm0ihr': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '9twb8r6b': {
      'es': 'Ingrese los apellidos del cliente.',
      'en': 'Enter the customer\'s last name.',
    },
    '6zmyr1xm': {
      'es': 'Ingrese el apellido con más de 5 carácteres',
      'en': 'Enter the last name with more than 5 characters',
    },
    'n9z935ki': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ddf4buvg': {
      'es': 'Ingrese la cédula del cliente',
      'en': 'Enter the customer\'s ID',
    },
    'e2zea2kz': {
      'es': 'Ingrese la cédula completa.',
      'en': 'Enter the complete ID.',
    },
    '727xllyz': {
      'es': 'Ingrese la cédula.',
      'en': 'Enter the ID.',
    },
    'iuts9qso': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0uzrchf6': {
      'es': 'Ingrese el número de teléfono del cliente.',
      'en': 'Enter the customer\'s phone number.',
    },
    'rna1wy0y': {
      'es': 'Ingrese el número de teléfono completo',
      'en': 'Enter the full phone number',
    },
    '0pmpwrys': {
      'es': 'Ingrese el número de teléfono.',
      'en': 'Enter the phone number.',
    },
    '2zg2yei5': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'np5cp5ap': {
      'es': 'Ingrese la dirección del cliente',
      'en': 'Enter the customer\'s address',
    },
    '3mwve3m1': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'bakwnf7j': {
      'es': 'Ingrese el email del cliente',
      'en': 'Enter the customer\'s email',
    },
    'fw5j8mgr': {
      'es': 'Ese Email no existe',
      'en': 'That email does not exist',
    },
    'xe3dzgy4': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '7ebe3393': {
      'es': 'Editar Cliente',
      'en': 'Edit Client',
    },
    'i6ycinm2': {
      'es': 'Llene la información del cliente',
      'en': 'Fill in the customer information',
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
      'en': 'Products on Due',
    },
    '83pjv5dz': {
      'es': 'Producto',
      'en': 'Product',
    },
    'x7hrnybu': {
      'es': 'Ingrese el producto',
      'en': 'Enter the product',
    },
    'minmxdls': {
      'es': 'Valor',
      'en': 'Worth',
    },
    '8qnas4ho': {
      'es': '#.##',
      'en': '#.##',
    },
    '28ox95x7': {
      'es': 'Añadir Producto',
      'en': 'Add Product',
    },
    'uwlfqv5j': {
      'es': 'Fecha de Pago del Producto',
      'en': 'Product Payment Date',
    },
    'cs2ofbsh': {
      'es': 'Pagar',
      'en': 'Pay',
    },
    '3upxvyh0': {
      'es': 'Historial',
      'en': 'Record',
    },
    'ioedc5d2': {
      'es': 'Enviar',
      'en': '',
    },
    '1606cen3': {
      'es': 'Ingrese el nombre del cliente.',
      'en': 'Enter the customer\'s name.',
    },
    'xntn4x0x': {
      'es': 'Ingrese un nombre con más de 2 carácteres',
      'en': 'Enter a name with more than 2 characters',
    },
    '3ak9lel0': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'q42ej5pi': {
      'es': 'Número de teléfono is required',
      'en': 'Phone number is required',
    },
    '02561r9e': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'vls6sgrc': {
      'es': 'Ingrese los productos',
      'en': 'Enter the products',
    },
    '9uujfmz5': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '43anmc4n': {
      'es': 'Ingrese el pago',
      'en': 'Enter the payment',
    },
    'ypgzyf2y': {
      'es': 'El número de teléfono debe de tener 10 dígitos',
      'en': 'The phone number must have 10 digits',
    },
    'a7nrkj6m': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8bowq0tq': {
      'es': 'Editar cliente',
      'en': 'Edit client',
    },
    'ktufeslb': {
      'es': 'Edición de datos del cliente',
      'en': 'Editing customer data',
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
      'en': 'Record',
    },
    'rhc1o40z': {
      'es': 'Aquí se mostrarán los productos fiados.',
      'en': 'Here the products on credit will be displayed.',
    },
    'ey3dqpm8': {
      'es': 'prod1',
      'en': 'prod1',
    },
    'w3h5xdjx': {
      'es': 'Mon. July 3rd',
      'en': 'Mon. July 3rd',
    },
    '7zx8y5mc': {
      'es': 'Falta pagar:',
      'en': 'Payment pending:',
    },
    'b4tb641b': {
      'es': 'Pagado',
      'en': 'Paid',
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
      'en': 'Names',
    },
    '9khzxccs': {
      'es': 'Apellidos',
      'en': 'Last names',
    },
    '3rzn6i2b': {
      'es': 'Cédula',
      'en': 'ID',
    },
    'uwtxa5n1': {
      'es': 'Número de teléfono',
      'en': 'Phone number',
    },
    '4x9cjlg0': {
      'es': 'Dirección Domiciliaria',
      'en': 'Home Address',
    },
    'm4kcodd7': {
      'es': 'Email',
      'en': 'E-mail',
    },
    '4nd7ks31': {
      'es': 'Vivienda Propia',
      'en': 'Own Home',
    },
    'd3hgsx7p': {
      'es': 'Vivienda Alquilada',
      'en': 'Rented Housing',
    },
    '687r2v4n': {
      'es': 'Ingrese los nombres del cliente.',
      'en': 'Enter the client names.',
    },
    '8v4is5pg': {
      'es': 'Ingrese el nombre con más de 5 carácteres',
      'en': 'Enter the name with more than 5 characters',
    },
    'vfd4tg4r': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '8xyeg780': {
      'es': 'Ingrese los apellidos del cliente.',
      'en': 'Enter the customer\'s last name.',
    },
    '3efsdt5q': {
      'es': 'Ingrese el apellido con más de 5 carácteres',
      'en': 'Enter the last name with more than 5 characters',
    },
    'ntj3q5ef': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'jgt2mo47': {
      'es': 'Ingrese la cédula del cliente',
      'en': 'Enter the customer\'s ID',
    },
    'e2cxain9': {
      'es': 'Ingrese la cédula completa.',
      'en': 'Enter the complete ID.',
    },
    'qa6nupq8': {
      'es': 'Ingrese la cédula.',
      'en': 'Enter the ID.',
    },
    'ri7dx20g': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'fkdxt2wn': {
      'es': 'Ingrese el número de teléfono del cliente.',
      'en': 'Enter the customer\'s phone number.',
    },
    'bbwwn6in': {
      'es': 'Ingrese el número de teléfono completo',
      'en': 'Enter the full phone number',
    },
    '5o7yk9ps': {
      'es': 'Ingrese el número de teléfono.',
      'en': 'Enter the phone number.',
    },
    'fh1qyotx': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '31ex3eos': {
      'es': 'Ingrese la dirección del cliente',
      'en': 'Enter the customer\'s address',
    },
    'j1963p91': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'dc4mgfzk': {
      'es': 'Ingrese el email del cliente',
      'en': 'Enter the customer\'s email',
    },
    'pvjylei9': {
      'es': 'Ese Email no existe',
      'en': 'That email does not exist',
    },
    'tdd0xl30': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'dda6o5kw': {
      'es': 'Cliente',
      'en': 'Customer',
    },
    '5meoqm1p': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // clienteProd-ValorPago
  {
    'kzamg66u': {
      'es': 'Valor a Pagar',
      'en': 'Amount to Pay',
    },
    'vifxjq73': {
      'es': '#.##',
      'en': '#.##',
    },
    'n2orvs3t': {
      'es': 'Transferencia',
      'en': 'Transfer',
    },
    '3wg5skqm': {
      'es': 'Efectivo',
      'en': 'Cash',
    },
    'nvdugge5': {
      'es': 'Fecha de Pago: ',
      'en': 'Payment Date:',
    },
    'h1hzgltz': {
      'es': 'Pagar',
      'en': 'Pay',
    },
    'byyhpred': {
      'es': 'Ingrese el nombre del cliente.',
      'en': 'Enter the customer\'s name.',
    },
    'l4xd2gip': {
      'es': 'Ingrese un nombre con más de 2 carácteres',
      'en': 'Enter a name with more than 2 characters',
    },
    '5s3l2b78': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '20k7dzrx': {
      'es': 'Número de teléfono is required',
      'en': 'Phone number is required',
    },
    '8if1inlw': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ydcr6sym': {
      'es': 'Ingrese los productos',
      'en': 'Enter the products',
    },
    '2l84htcc': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'h1sb94hm': {
      'es': 'Ingrese el pago',
      'en': 'Enter the payment',
    },
    'z6c09ibb': {
      'es': 'El número de teléfono debe de tener 10 dígitos',
      'en': 'The phone number must have 10 digits',
    },
    'mxk2qofv': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '8dwfvz75': {
      'es': 'Home',
      'en': 'Home',
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
