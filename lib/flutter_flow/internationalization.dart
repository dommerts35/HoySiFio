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
      'es': 'Bienvenido, tendero',
      'en': 'Welcome',
    },
    'w4y47z9b': {
      'es': 'Inicie sesión como tendero.',
      'en': 'Fill out the form to log in as a shopkeeper',
    },
    'u8b9lppk': {
      'es': 'E-mail',
      'en': 'E-mail',
    },
    'uyfz3omf': {
      'es': 'E-mail',
      'en': 'E-mail',
    },
    '7di16zo1': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'sjmbwl2o': {
      'es': 'PIN',
      'en': 'Password',
    },
    'i4951keh': {
      'es': 'Iniciar Sesión',
      'en': 'Login',
    },
    'kd9wdef8': {
      'es': 'Registrarse como tendero',
      'en': '',
    },
    '0wsprywf': {
      'es': '¿Olvidó su contraseña?',
      'en': 'Terms of Service',
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
      'es': 'Bienvenido, vecino',
      'en': 'Welcome',
    },
    '4ig0fbfu': {
      'es': 'Ingrese su número de cédula para iniciar sesión.',
      'en': 'Fill out the form to log in as a customer',
    },
    'ugqry3j4': {
      'es': 'Cédula de Identidad',
      'en': 'Full Name',
    },
    'cuupucc0': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'hatytthd': {
      'es': 'PIN',
      'en': 'Password',
    },
    '0te276nf': {
      'es': 'Iniciar Sesión',
      'en': 'Login',
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
  // listaClientes
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
    'z8foive5': {
      'es': 'Tienda',
      'en': '',
    },
    'gsnr0n9a': {
      'es': '•',
      'en': '•',
    },
  },
  // clienteMakeInfo
  {
    'pyxull98': {
      'es': 'Datos personales',
      'en': 'Register New Customer',
    },
    'lhhwa7uq': {
      'es': 'Nombres',
      'en': 'Names',
    },
    'n12i00nx': {
      'es': 'Apellidos',
      'en': 'Last names',
    },
    '8jwr8ism': {
      'es': 'Número de cédula/Usuario',
      'en': 'ID number',
    },
    'xndhbb3x': {
      'es': '10 dígitos',
      'en': '',
    },
    'wzb88ms0': {
      'es': 'Número de teléfono',
      'en': 'Phone number',
    },
    'v5g8l1zm': {
      'es': '10 dígitos',
      'en': '',
    },
    '8kma8106': {
      'es': 'Email',
      'en': '',
    },
    'uay5m0ay': {
      'es': 'Datos de domicilio',
      'en': 'Register New Customer',
    },
    '6zpzou76': {
      'es': 'Dirección domiciliaria',
      'en': 'Home address',
    },
    'r9hfk6jw': {
      'es': '100 carácteres',
      'en': '',
    },
    'muld53qm': {
      'es': 'Seleccione la vivienda del cliente es propia o\nalquilada',
      'en': '',
    },
    'slqan309': {
      'es': 'Vivienda Propia',
      'en': '',
    },
    'jsohxwys': {
      'es': 'Vivienda Alqu.',
      'en': '',
    },
    'v77bvb5c': {
      'es': 'Al registrarse, el cliente acepta los',
      'en': '',
    },
    '7kyhdq3c': {
      'es': 'términos de servicio',
      'en': 'Terms of Service',
    },
    'xe8600ud': {
      'es': 'Suscribirse al',
      'en': '',
    },
    'an9t36g2': {
      'es': 'envío de emails promocionales',
      'en': 'Terms of Service',
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
      'es': 'Ingrese el email de su cliente',
      'en': 'Email not found.',
    },
    '3bohds8d': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '0i6l7rxz': {
      'es': 'Ingrese la contraseña para su cliente',
      'en': '',
    },
    '2uh6wpea': {
      'es': 'Mínimo 8 caracteres, mayúscula, \nnúmero y carácter especial',
      'en': '',
    },
    '0hmvcm9i': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'zw3l1s80': {
      'es': 'Ingrese el PIN para su cliente',
      'en': '',
    },
    '9s0szsfv': {
      'es': 'Ingrese su PIN',
      'en': '',
    },
    'knsx9vh9': {
      'es': 'Ingrese su PIN',
      'en': '',
    },
    'gygappxq': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '2ob7wk2n': {
      'es': 'Registrar Cliente',
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
  // clienteEditInfo
  {
    'p19en3zt': {
      'es': 'Datos Personales',
      'en': 'Edit Client',
    },
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
    'egg74h4w': {
      'es': 'Seleccione el tipo de vivienda del cliente',
      'en': 'Edit Client',
    },
    '81wtki5i': {
      'es': 'Vivienda Propia',
      'en': '',
    },
    'wejcayxz': {
      'es': 'Vivienda Alqu.',
      'en': '',
    },
    'i5fig3y6': {
      'es': 'Suscribirse al',
      'en': '',
    },
    'gzdssmll': {
      'es': 'envío de emails de HoySíFio',
      'en': 'Terms of Service',
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
      'es': 'Edite la información del cliente',
      'en': 'Fill in the customer information',
    },
    'si90ux16': {
      'es': 'Home',
      'en': '',
    },
  },
  // clienteInfoEdit
  {
    'ueww57yk': {
      'es': 'Datos ',
      'en': 'Edit client',
    },
    'mkwhly44': {
      'es': 'Edición y visualización',
      'en': '',
    },
    'zsfx0k4u': {
      'es': 'Cuentas y Pagos',
      'en': 'Products on Due',
    },
    '0knn29rs': {
      'es': 'Historiales de cobranza',
      'en': '',
    },
    '3upxvyh0': {
      'es': 'Productos pagados',
      'en': 'Record',
    },
    'cynop57y': {
      'es': 'Productos por cobrar',
      'en': 'Record',
    },
    '6guodlw7': {
      'es': 'Comprobantes',
      'en': '',
    },
    'qkzdh8m8': {
      'es': 'Fiar Productos',
      'en': 'Products on Due',
    },
    '83pjv5dz': {
      'es': 'Cantidad',
      'en': 'Product',
    },
    'x7hrnybu': {
      'es': '0',
      'en': 'Enter the product',
    },
    'uiip5pgs': {
      'es': 'Producto',
      'en': 'Product',
    },
    '5ghpqato': {
      'es': 'Nombre',
      'en': 'Enter the product',
    },
    'minmxdls': {
      'es': 'Valor unitario',
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
    '21qsx8ot': {
      'es': 'Canti.',
      'en': '',
    },
    'c9gcltak': {
      'es': '| Producto',
      'en': '',
    },
    'pfuj7yc5': {
      'es': '| Valor U.',
      'en': '',
    },
    'pp0mfneo': {
      'es': '| Valor',
      'en': '',
    },
    '4d0jxjaw': {
      'es': 'Productos pagados',
      'en': 'Record',
    },
    'o13lrbou': {
      'es': 'Productos por cobrar',
      'en': 'Record',
    },
    '5bfvmyfh': {
      'es': 'Guardar',
      'en': 'Send',
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
      'es': 'Información del cliente',
      'en': 'Edit client',
    },
    'cp1evi8d': {
      'es': 'Home',
      'en': '',
    },
  },
  // historialPagos
  {
    'gxg9u041': {
      'es': 'Cuentas pagadas',
      'en': 'Record',
    },
    'rhc1o40z': {
      'es': 'Aquí se mostrarán los productos pagados ',
      'en': 'Here the products on credit will be displayed.',
    },
    'elangz8q': {
      'es': 'Cantidad',
      'en': '',
    },
    '5azzte22': {
      'es': 'Producto',
      'en': '',
    },
    '0qsfqe7k': {
      'es': 'Valor Unitario',
      'en': '',
    },
    'hy0nw511': {
      'es': 'Valor',
      'en': '',
    },
    'b4tb641b': {
      'es': 'Pagado',
      'en': 'Paid',
    },
    '9qn9zcwa': {
      'es': 'Faltó Pago',
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
    'hkcjeory': {
      'es': 'Vivienda',
      'en': 'E-mail',
    },
    'q6t8rtd3': {
      'es': 'Código de Inicio de Sesión',
      'en': 'E-mail',
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
    '5meoqm1p': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // clienteProd-ValorPago
  {
    'd59gff11': {
      'es': 'Valor a Pagar',
      'en': 'Amount to Pay',
    },
    '0luvnqx5': {
      'es': '#.##',
      'en': '#.##',
    },
    '9xivha2p': {
      'es': 'Transferencia',
      'en': 'Transfer',
    },
    'pff5beon': {
      'es': 'N#. Comprobante',
      'en': '',
    },
    'yl0zre28': {
      'es': 'Efectivo',
      'en': 'Cash',
    },
    'iisu0mpl': {
      'es': 'Fecha de Fiado: ',
      'en': 'Payment Date:',
    },
    'mztmsqm7': {
      'es': 'Pagar',
      'en': 'Pay',
    },
    '5jqvtbm0': {
      'es': 'Ingrese el nombre del cliente.',
      'en': 'Enter the customer\'s name.',
    },
    'num0cj6j': {
      'es': 'Ingrese un nombre con más de 2 carácteres',
      'en': 'Enter a name with more than 2 characters',
    },
    'ugfhzv1u': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'saoomw3q': {
      'es': 'Número de teléfono is required',
      'en': 'Phone number is required',
    },
    'e9b3puqr': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'zu9nykog': {
      'es': 'Ingrese los productos',
      'en': 'Enter the products',
    },
    '7xudlu54': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '7xf6cwel': {
      'es': 'Ingrese el pago',
      'en': 'Enter the payment',
    },
    'vt7xeqiq': {
      'es': 'El número de teléfono debe de tener 10 dígitos',
      'en': 'The phone number must have 10 digits',
    },
    'tjwkv1qn': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'pui50i3u': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // historialPorCobrar
  {
    'ayphq84c': {
      'es': 'Cuentas por cobrar',
      'en': 'Record',
    },
    'whsw90kw': {
      'es': 'Aquí se mostrarán los productos por cobrar',
      'en': 'Here the products on credit will be displayed.',
    },
    'ryaqh50n': {
      'es': 'Cantidad',
      'en': '',
    },
    'kzbxnd35': {
      'es': 'Producto',
      'en': '',
    },
    'topgjp12': {
      'es': 'Valor Unitario',
      'en': '',
    },
    '0kr5qigy': {
      'es': 'Valor',
      'en': '',
    },
    'mj4m89fg': {
      'es': 'Click para cobrar',
      'en': 'Payment pending:',
    },
    's6fwapco': {
      'es': 'Añadir Más Productos',
      'en': '',
    },
    '5fs0byh5': {
      'es': 'Cobrar productos seleccionados',
      'en': '',
    },
    '318e7au3': {
      'es': 'Cobrar todos los productos',
      'en': '',
    },
    'xdk9lh0i': {
      'es': 'Home',
      'en': '',
    },
  },
  // tenderoRegister
  {
    '41mtj38q': {
      'es': 'Hoy',
      'en': 'Hoy',
    },
    'eipxlct2': {
      'es': 'Sí',
      'en': 'Si',
    },
    'g16vbvcr': {
      'es': 'Fio',
      'en': 'Fio',
    },
    '6i1n6p4q': {
      'es': 'Bienvenido',
      'en': 'Welcome',
    },
    'lrruah8w': {
      'es': 'Llene el formulario para registrarse como tendero',
      'en': 'Fill out the form to log in as a shopkeeper',
    },
    'lmfqce75': {
      'es': 'Datos Personales',
      'en': 'Welcome',
    },
    '6on9n7sb': {
      'es': 'Nombre de la tienda',
      'en': 'E-mail',
    },
    '2frd909t': {
      'es': 'Nombre del dueño de la tienda',
      'en': 'E-mail',
    },
    'sh2p8sks': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'ti1o60e4': {
      'es': ' Número de teléfono celular',
      'en': 'E-mail',
    },
    '37ho1aqu': {
      'es': 'Datos Bancarios',
      'en': 'Welcome',
    },
    '9ld5lhde': {
      'es': 'Num. Cuenta Bancaria',
      'en': 'E-mail',
    },
    'c0oyv9mv': {
      'es': '10 carácteres',
      'en': '',
    },
    'q5w6qmde': {
      'es': 'Banco',
      'en': 'E-mail',
    },
    'hztgjc94': {
      'es': 'Nombre del banco',
      'en': '',
    },
    'jgdo2bed': {
      'es': 'Propietario de la cuenta bancaria',
      'en': 'E-mail',
    },
    'woow9lb7': {
      'es': 'Nombre del propietario',
      'en': '',
    },
    'k1v65egy': {
      'es': 'Seleccione el tipo de cuenta bancaria',
      'en': '',
    },
    'u6g90ra7': {
      'es': 'Cuenta Corriente',
      'en': '',
    },
    'lubf3qj5': {
      'es': 'Cuenta de Ahorros',
      'en': '',
    },
    '4anwojju': {
      'es': 'Contraseña',
      'en': 'Welcome',
    },
    '18ylqfjm': {
      'es':
          'Ingrese una contraseña que contenga al menos 8 carácteres, una mayúscula, una minúscula y un carácter especial (*.#\$¿)',
      'en': '',
    },
    'edm47hkw': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'acn0ws5f': {
      'es': 'Contraseña1*',
      'en': '',
    },
    's6s89p8t': {
      'es': 'Confirme la contraseña',
      'en': 'Password',
    },
    're3hmuqz': {
      'es': 'Ingrese un PIN con 4 números',
      'en': '',
    },
    'k459atkr': {
      'es': 'PIN',
      'en': 'Password',
    },
    'qbi00mto': {
      'es': '0000',
      'en': '',
    },
    'jf3na20v': {
      'es': 'Registrarse',
      'en': 'Login',
    },
    '98xfzc9y': {
      'es': 'Ingrese el nombre de su tienda',
      'en': '',
    },
    'a11ob23i': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'asho3i6g': {
      'es': 'Ingrese su email',
      'en': '',
    },
    'vnehz31w': {
      'es': 'Ingrese un email válido',
      'en': '',
    },
    '4a9fji9e': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'yebflwm8': {
      'es': 'Ingrese su número de teléfono',
      'en': '',
    },
    '3we2gwdd': {
      'es': 'Ingrese un número de teléfono válido',
      'en': '',
    },
    'utyhptr0': {
      'es': 'Ingrese un número de teléfono válido',
      'en': '',
    },
    'iip56gbt': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '1q8l6fy2': {
      'es': 'Ingrese su número de cuenta',
      'en': '',
    },
    'fjuvgp1c': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'deqbuw7o': {
      'es': 'Ingrese su banco',
      'en': '',
    },
    'm5ced2oo': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'odn6zglg': {
      'es': 'Ingrese su contraseña',
      'en': '',
    },
    'foyre2vx': {
      'es': 'Mínimo 8 carácteres',
      'en': '',
    },
    '22bm8pl8': {
      'es': 'Máximo 16 carácteres',
      'en': '',
    },
    '8uq4rz19': {
      'es': 'La contraseña no cumple los requisitos.',
      'en': '',
    },
    'ct43eelg': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'pced09g6': {
      'es': 'Confirme su contraseña',
      'en': '',
    },
    '33uq53he': {
      'es': 'Mínimo 8 carácteres',
      'en': '',
    },
    'adbhtuno': {
      'es': 'Máximo 16 carácteres',
      'en': '',
    },
    'sdtv1fgs': {
      'es': 'La contraseña no cumple los requisitos.',
      'en': '',
    },
    '060daqkd': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'o8n6z504': {
      'es': 'Ingrese su PIN',
      'en': '',
    },
    'a6oqzg9o': {
      'es': 'Ingrese su PIN',
      'en': '',
    },
    '1c9jtff3': {
      'es': 'Ingrese su PIN',
      'en': '',
    },
    'fxeqbpob': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'cb2l8qhd': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // historialVouchers
  {
    'ftl0vypt': {
      'es': 'Historial de \ncomprobantes',
      'en': 'Record',
    },
    'vcw3n8er': {
      'es': 'Comprobantes enviados del cliente: ',
      'en': 'Here the products on credit will be displayed.',
    },
    '2hcmbmsi': {
      'es': 'Comprobante Negado',
      'en': '',
    },
    'be9xje1k': {
      'es': 'Home',
      'en': '',
    },
  },
  // clienteProd-FullPago
  {
    'g5adag4h': {
      'es': 'Transferencia',
      'en': 'Transfer',
    },
    'eoq05zkm': {
      'es': 'N# comprobante',
      'en': '',
    },
    'z4ldi171': {
      'es': 'Efectivo',
      'en': 'Cash',
    },
    'm7vv3ngz': {
      'es': 'Fecha de Pago: ',
      'en': 'Payment Date:',
    },
    '05un7mkd': {
      'es': 'Pagar',
      'en': 'Pay',
    },
    '29yw1wf6': {
      'es': 'Ingrese el nombre del cliente.',
      'en': 'Enter the customer\'s name.',
    },
    '33la6lmw': {
      'es': 'Ingrese un nombre con más de 2 carácteres',
      'en': 'Enter a name with more than 2 characters',
    },
    'okxuk82d': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '00wbbqa4': {
      'es': 'Número de teléfono is required',
      'en': 'Phone number is required',
    },
    'v3xsjmm3': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'm4vg7ypw': {
      'es': 'Ingrese los productos',
      'en': 'Enter the products',
    },
    'gu9x7x3i': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'zz7eibjf': {
      'es': 'Ingrese el pago',
      'en': 'Enter the payment',
    },
    'fngnk4bw': {
      'es': 'El número de teléfono debe de tener 10 dígitos',
      'en': 'The phone number must have 10 digits',
    },
    'kl19smx7': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'j7a5ehpp': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // clienteProd-SelectPago
  {
    'ytzpnp3y': {
      'es': 'Transferencia',
      'en': 'Transfer',
    },
    'tgnvbj7s': {
      'es': 'N# Comprobante',
      'en': '',
    },
    'drmj1elp': {
      'es': 'Efectivo',
      'en': 'Cash',
    },
    'l0zl3c9n': {
      'es': 'Fecha de Pago: ',
      'en': 'Payment Date:',
    },
    'h2bpiwpv': {
      'es': 'Pagar',
      'en': 'Pay',
    },
    '3g1sjtxl': {
      'es': 'Ingrese el nombre del cliente.',
      'en': 'Enter the customer\'s name.',
    },
    '82odjhre': {
      'es': 'Ingrese un nombre con más de 2 carácteres',
      'en': 'Enter a name with more than 2 characters',
    },
    'nq037ope': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '8pkwg7ym': {
      'es': 'Número de teléfono is required',
      'en': 'Phone number is required',
    },
    'x7t48vgd': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'j4du5fbh': {
      'es': 'Ingrese los productos',
      'en': 'Enter the products',
    },
    'cwark3t7': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'cr6irruu': {
      'es': 'Ingrese el pago',
      'en': 'Enter the payment',
    },
    'ya7ucarp': {
      'es': 'El número de teléfono debe de tener 10 dígitos',
      'en': 'The phone number must have 10 digits',
    },
    'wfbzd6bu': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '7akq4g8p': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // historialSingleVoucherPago
  {
    'rd415gpe': {
      'es': 'Monto A Pagar',
      'en': 'Amount to Pay',
    },
    'd75is44y': {
      'es': '#.##',
      'en': '#.##',
    },
    's3lslju1': {
      'es': 'Núm. De Comprobante',
      'en': 'Amount to Pay',
    },
    '9rtw9btt': {
      'es': 'Nombre del banco',
      'en': 'Amount to Pay',
    },
    'myz8mr51': {
      'es': 'Tipo de \nTransferencia:',
      'en': '',
    },
    'k4rwgplm': {
      'es': 'Electrónico',
      'en': '',
    },
    '21912box': {
      'es': 'Banca Web',
      'en': '',
    },
    'wt70ujmq': {
      'es': 'Ventanilla',
      'en': '',
    },
    '90xqpdqy': {
      'es': 'Guardar',
      'en': 'Pay',
    },
    '1rc1odtw': {
      'es': 'Ingrese el nombre del cliente.',
      'en': 'Enter the customer\'s name.',
    },
    'rzgjti9k': {
      'es': 'Ingrese un nombre con más de 2 carácteres',
      'en': 'Enter a name with more than 2 characters',
    },
    '8zmmtinl': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'vsqlhopk': {
      'es': 'Número de teléfono is required',
      'en': 'Phone number is required',
    },
    'ul9v8wns': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '3okjdlwi': {
      'es': 'Ingrese los productos',
      'en': 'Enter the products',
    },
    'i7br0ob1': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'n77y6wn2': {
      'es': 'Ingrese el pago',
      'en': 'Enter the payment',
    },
    'tj63prvd': {
      'es': 'El número de teléfono debe de tener 10 dígitos',
      'en': 'The phone number must have 10 digits',
    },
    'hywmk2ag': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ce79facv': {
      'es': 'Información de pago',
      'en': '',
    },
    'm5nbgig5': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // resumenFiadoClienProdsNew
  {
    'e8uaqkai': {
      'es': 'Resúmen de fiados',
      'en': '',
    },
    't4i9hhlp': {
      'es': 'Producto',
      'en': '',
    },
    '6s8rrb8b': {
      'es': 'Cantidad',
      'en': '',
    },
    'nhsausxh': {
      'es': 'Valor U.',
      'en': '',
    },
    'rgj8hn61': {
      'es': 'Valor',
      'en': '',
    },
    '54lhpazv': {
      'es': 'Pagar Todo Por Transferencia',
      'en': '',
    },
    'z5pzxl4x': {
      'es': 'Historial de Comprobantes',
      'en': '',
    },
    's6l5es79': {
      'es': 'Home',
      'en': '',
    },
  },
  // resumenFiadoClienTiendaNew
  {
    '29h3bv5a': {
      'es': 'Resúmen de fiados',
      'en': '',
    },
    '7vtcumfa': {
      'es': 'Home',
      'en': '',
    },
  },
  // historialFullVoucherPago
  {
    '3y6umwuf': {
      'es': 'Núm. De Comprobante',
      'en': 'Amount to Pay',
    },
    'xo6h7y9a': {
      'es': 'Nombre del banco',
      'en': 'Amount to Pay',
    },
    'esuydnzi': {
      'es': 'Tipo de \nTransferencia:',
      'en': '',
    },
    'n3t1qih3': {
      'es': 'Electrónico',
      'en': '',
    },
    'pc5q2lmy': {
      'es': 'Banca Web',
      'en': '',
    },
    'omj6f784': {
      'es': 'Ventanilla',
      'en': '',
    },
    '6osna9yq': {
      'es': 'Guardar',
      'en': 'Pay',
    },
    'flt6w5oj': {
      'es': 'Ingrese el nombre del cliente.',
      'en': 'Enter the customer\'s name.',
    },
    '3f3vopcp': {
      'es': 'Ingrese un nombre con más de 2 carácteres',
      'en': 'Enter a name with more than 2 characters',
    },
    'b4t7wvcf': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '4cxotudh': {
      'es': 'Número de teléfono is required',
      'en': 'Phone number is required',
    },
    'a68jtxqu': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '8fb5lqgx': {
      'es': 'Ingrese los productos',
      'en': 'Enter the products',
    },
    'nw72hri3': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'bl8dnpj1': {
      'es': 'Ingrese el pago',
      'en': 'Enter the payment',
    },
    '0x2r5std': {
      'es': 'El número de teléfono debe de tener 10 dígitos',
      'en': 'The phone number must have 10 digits',
    },
    'qil0nunn': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '53m4ov7r': {
      'es': 'Información de pago',
      'en': '',
    },
    'jbn9u0ch': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // termsOfServiceSubPageToAccept
  {
    'zlee6hzb': {
      'es': 'HoySíFio',
      'en': '',
    },
    'xc15e5jc': {
      'es': 'TÉRMINOS Y CONDICIONES DE USO',
      'en': '',
    },
    'yhoelzj3': {
      'es':
          'Política de Privacidad\nÚltima actualización: 05 de junio de 2025\n\nEsta Política de Privacidad describe nuestras políticas y procedimientos sobre la recopilación, uso y divulgación de su información cuando utiliza el servicio, y le informa sobre sus derechos de privacidad y cómo la ley lo protege.',
      'en': '',
    },
    '4mrdkh9e': {
      'es': '\n1. Interpretación y Definiciones',
      'en': '',
    },
    'dnkimw1r': {
      'es': '\n\n  1.1. Interpretación',
      'en': '',
    },
    'ocllj04h': {
      'es':
          '\n      Las palabras cuya letra inicial está en mayúscula tienen significados definidos bajo las siguientes condiciones. Las siguientes definiciones tendrán el mismo significado independientemente de si aparecen en singular o en plural.',
      'en': '',
    },
    't17wf3jq': {
      'es': '\n\n  1.2. Definiciones',
      'en': '',
    },
    '78dre1hn': {
      'es': '\n       Para los fines de esta Política de Privacidad:\n',
      'en': '',
    },
    '70c4cdbn': {
      'es': '\n      1.2.1. Cuenta: \n',
      'en': '',
    },
    'ohojrcg6': {
      'es':
          '\n      Significa una cuenta única creada para que Usted acceda a Nuestro Servicio o partes de Nuestro Servicio.',
      'en': '',
    },
    '7vkotv8k': {
      'es': '\n\n      1.2.2. Afiliado: ',
      'en': '',
    },
    '97rmkbms': {
      'es':
          '\n\n     Significa una entidad que controla, es controlada por o está bajo control común con una parte, donde \"control\" significa la propiedad del 50% o más de las acciones, participación en el capital u otros valores con derecho a voto para la elección de directivos u otra autoridad administrativa.',
      'en': '',
    },
    'xnpuh3as': {
      'es': '\n\n     1.2.3. Aplicación: ',
      'en': '',
    },
    'vcgdmooh': {
      'es':
          '\n\nSe refiere a HoySíFio, el programa de software proporcionado por la Compañía.',
      'en': '',
    },
    'jdsfbzh6': {
      'es': '\n\n    1.2.4. Compañía',
      'en': '',
    },
    'f3giz3qu': {
      'es': ': Se refiere a HoySíFio Org.',
      'en': '',
    },
    'rbbjeyws': {
      'es': '\n\n\n    1.2.5. País:',
      'en': '',
    },
    'f14rvjgv': {
      'es': ' Ecuador.',
      'en': '',
    },
    'wwgv3auu': {
      'es': '\n\n    1.2.6. Dispositivo:',
      'en': '',
    },
    'zwyjjcnj': {
      'es':
          '\n\nCualquier dispositivo que pueda acceder al Servicio, como una computadora, un teléfono móvil o una tableta digital.',
      'en': '',
    },
    'hyctrrrg': {
      'es': '\n\n     1.2.7. Datos Personales:',
      'en': '',
    },
    '66llic2g': {
      'es':
          '\n\nCualquier información relacionada con un individuo identificado o identificable.',
      'en': '',
    },
    '8oc5xvic': {
      'es': '\n\n     1.2.8. Servicio',
      'en': '',
    },
    'vxytmwl9': {
      'es': ': se refiere a la Aplicación.',
      'en': '',
    },
    'x9t4b9kl': {
      'es': '\n\n     1.2.9. Proveedor de Servicios:',
      'en': '',
    },
    'if1rlapx': {
      'es':
          '\n\nCualquier persona natural o jurídica que procesa los datos en nombre de la Compañía. Se refiere a empresas o individuos terceros empleados por la Compañía para facilitar el Servicio, proporcionarlo en nombre de la Compañía, realizar servicios relacionados con el Servicio o ayudar a la Compañía a analizar cómo se utiliza el Servicio.',
      'en': '',
    },
    '83omk0ns': {
      'es': '\n\n      1.2.10. Datos de Uso: ',
      'en': '',
    },
    'n2n1qc5q': {
      'es':
          '\n\nDatos recopilados automáticamente, generados por el uso del Servicio o por la infraestructura del Servicio mismo (por ejemplo, la duración de una visita a una página).',
      'en': '',
    },
    'ykaikxsj': {
      'es': '\n\n      1.2.11. Usted:',
      'en': '',
    },
    'jnjnepmn': {
      'es':
          '\n\nEl individuo que accede o utiliza el Servicio, o la empresa u otra entidad legal en nombre de la cual dicho individuo accede o utiliza el Servicio, según corresponda.',
      'en': '',
    },
    'yqowy0ze': {
      'es': '\n\n2. Recopilación y Uso de Sus Datos Personales',
      'en': '',
    },
    '8xa9vxlm': {
      'es': '\n\n   2.1. Tipos de Datos Recopilados',
      'en': '',
    },
    'ab5dwi1n': {
      'es': '\n\n       2.1.1. Datos Personales:',
      'en': '',
    },
    'zgoe9my9': {
      'es':
          '\n\nMientras utiliza Nuestro Servicio, podemos pedirle que nos proporcione cierta información personalmente identificable que puede ser utilizada para contactarlo o identificarlo. Esta información puede incluir, pero no limitarse a:',
      'en': '',
    },
    'djnno6au': {
      'es':
          '\n\n- Dirección de correo electrónico\n- Nombre y apellido\n- Número de teléfono\n- Dirección, Estado, Provincia, Código Postal, Ciudad',
      'en': '',
    },
    '2gpmu6u8': {
      'es': '\n\n      2.1.2. Datos de Uso',
      'en': '',
    },
    'lj14mlcb': {
      'es':
          '\n\nLos Datos de Uso se recopilan automáticamente al utilizar el Servicio e incluyen:',
      'en': '',
    },
    'd86d5r9z': {
      'es':
          '\n\n- Dirección IP de Su Dispositivo\n- Tipo y versión del navegador\n- Páginas visitadas dentro del Servicio\n- Fecha y hora de la visita\n- Tiempo dedicado a esas páginas\n- Identificadores únicos de dispositivo y otros datos de diagnóstico. \n\nSi accede al Servicio a través de un dispositivo móvil, también podemos recopilar información como:',
      'en': '',
    },
    'uagcjuhy': {
      'es':
          '\n\n- Tipo de dispositivo móvil\n- ID único del dispositivo móvil\n- Sistema operativo del dispositivo\n- Tipo de navegador móvil utilizado ',
      'en': '',
    },
    'ipufsyq6': {
      'es': '\n\n       2.1.3. Uso de Sus Datos Personales',
      'en': '',
    },
    '69km6spt': {
      'es':
          '\n\nLa Compañía puede utilizar los Datos Personales para:\n\n- Proporcionar y mantener el Servicio.\n- Gestionar Su Cuenta.\n- Cumplir con contratos.\n- Contactarlo con actualizaciones o comunicaciones informativas.\n- Ofrecer noticias, ofertas especiales o información sobre otros bienes/servicios similares.\n- Gestionar Sus solicitudes.\n- Otros fines como análisis de datos, mejora del Servicio o marketing.',
      'en': '',
    },
    '84451uvg': {
      'es': '\n\n       2.1.4. Divulgación de Sus Datos Personales ',
      'en': '',
    },
    'stuzn7l7': {
      'es':
          '\n\nPodemos compartir Su información en las siguientes situaciones:\n\n- Con Proveedores de Servicios para monitorear y analizar el uso del Servicio.\n\n- En transferencias comerciales (venta de activos, fusiones, etc.).\n\n- Con Afiliados, socios comerciales u otros usuarios (si interactúa en áreas públicas).\n\n- Con Su consentimiento o por requisitos legales.',
      'en': '',
    },
    'tu5an4n4': {
      'es': '\n\n       2.1.5. Seguridad de Sus Datos ',
      'en': '',
    },
    'g8lsyfzw': {
      'es':
          '\n\nMientras implementamos medidas comerciales aceptables para proteger Sus Datos Personales, ningún método de transmisión o almacenamiento electrónico es 100% seguro. ',
      'en': '',
    },
    '8ro1gktv': {
      'es': '\n\n       2.1.6. Privacidad de los Niños',
      'en': '',
    },
    '56e4an2z': {
      'es':
          '\n\nNuestro Servicio no está dirigido a menores de 13 años. Si descubre que un menor nos ha proporcionado Datos Personales sin consentimiento parental, contáctenos para eliminarlos. ',
      'en': '',
    },
    '82gms51k': {
      'es': '\n\n     2.1.7. Cambios en esta Política',
      'en': '',
    },
    'xj1e24br': {
      'es':
          '\n\nNotificaremos actualizaciones publicando la nueva Política en esta página y actualizando la fecha de \"Última actualización\". Se recomienda revisarla periódicamente. ',
      'en': '',
    },
    '2j86w237': {
      'es': '\n\n3. Contáctenos',
      'en': '',
    },
    '0i16hq9c': {
      'es':
          '\n\nSi tiene preguntas sobre esta Política, puede contactarnos:\n\nPor correo electrónico: hoysifioapp@outlook.com',
      'en': '',
    },
    'xqrxan8c': {
      'es':
          '1. Interpretación y Definiciones\n\n 1.1. Interpretación\nLas palabras cuya letra inicial está en mayúscula tienen significados definidos bajo las siguientes condiciones. Las siguientes definiciones tendrán el mismo significado independientemente de si aparecen en singular o en plural.\n\n 1.2. Definiciones\nPara los fines de esta Política de Privacidad:\n\n   1.2.1. Cuenta: significa una cuenta única creada para que Usted acceda a Nuestro Servicio o partes de Nuestro Servicio.\n\n    1.2.2. Afiliado: significa una entidad que controla, es controlada por o está bajo control común con una parte, donde \"control\" significa la propiedad del 50% o más de las acciones, participación en el capital u otros valores con derecho a voto para la elección de directivos u otra autoridad administrativa.\n\n   1.2.3. Aplicación: se refiere a HoySíFio, el programa de software proporcionado por la Compañía.\n\n   1.2.4. Compañía (referida como \"la Compañía\", \"Nosotros\", \"Nos\" o \"Nuestro\" en este Acuerdo): se refiere a HoySíFio Org.\n\n   1.2.5. País: Ecuador.\n\n   1.2.6. Dispositivo: cualquier dispositivo que pueda acceder al Servicio, como una computadora, un teléfono móvil o una tableta digital.\n\n   1.2.7. Datos Personales: cualquier información relacionada con un individuo identificado o identificable.\n\n   1.2.8. Servicio: se refiere a la Aplicación.\n\n   1.2.9. Proveedor de Servicios: cualquier persona natural o jurídica que procesa los datos en nombre de la Compañía. Se refiere a empresas o individuos terceros empleados por la Compañía para facilitar el Servicio, proporcionarlo en nombre de la Compañía, realizar servicios relacionados con el Servicio o ayudar a la Compañía a analizar cómo se utiliza el Servicio.\n\n   1.2.10. Datos de Uso: datos recopilados automáticamente, generados por el uso del Servicio o por la infraestructura del Servicio mismo (por ejemplo, la duración de una visita a una página).\n\n   1.2.11. Usted: el individuo que accede o utiliza el Servicio, o la empresa u otra entidad legal en nombre de la cual dicho individuo accede o utiliza el Servicio, según corresponda.\n\n2. Recopilación y Uso de Sus Datos Personales\n\n  2.1. Tipos de Datos Recopilados\n\n    2.1.1. Datos Personales\nMientras utiliza Nuestro Servicio, podemos pedirle que nos proporcione cierta información personalmente identificable que puede ser utilizada para contactarlo o identificarlo. Esta información puede incluir, pero no limitarse a:\n\nDirección de correo electrónico\n\nNombre y apellido\n\nNúmero de teléfono\n\nDirección, Estado, Provincia, Código Postal, Ciudad\n\n    2.1.2. Datos de Uso\nLos Datos de Uso se recopilan automáticamente al utilizar el Servicio e incluyen:\n\nDirección IP de Su Dispositivo\n\nTipo y versión del navegador\n\nPáginas visitadas dentro del Servicio\n\nFecha y hora de la visita\n\nTiempo dedicado a esas páginas\n\nIdentificadores únicos de dispositivo y otros datos de diagnóstico.\n\nSi accede al Servicio a través de un dispositivo móvil, también podemos recopilar información como:\n\nTipo de dispositivo móvil\n\nID único del dispositivo móvil\n\nSistema operativo del dispositivo\n\nTipo de navegador móvil utilizado\n\n   2.1.3. Uso de Sus Datos Personales\nLa Compañía puede utilizar los Datos Personales para:\n\nProporcionar y mantener el Servicio.\n\nGestionar Su Cuenta.\n\nCumplir con contratos.\n\nContactarlo con actualizaciones o comunicaciones informativas.\n\nOfrecer noticias, ofertas especiales o información sobre otros bienes/servicios similares.\n\nGestionar Sus solicitudes.\n\nOtros fines como análisis de datos, mejora del Servicio o marketing.\n\n   2.1.4. Divulgación de Sus Datos Personales\nPodemos compartir Su información en las siguientes situaciones:\n\nCon Proveedores de Servicios para monitorear y analizar el uso del Servicio.\n\nEn transferencias comerciales (venta de activos, fusiones, etc.).\n\nCon Afiliados, socios comerciales u otros usuarios (si interactúa en áreas públicas).\n\nCon Su consentimiento o por requisitos legales.\n\n   2.1.5. Seguridad de Sus Datos\nMientras implementamos medidas comerciales aceptables para proteger Sus Datos Personales, ningún método de transmisión o almacenamiento electrónico es 100% seguro.\n\n   2.1.6. Privacidad de los Niños\nNuestro Servicio no está dirigido a menores de 13 años. Si descubre que un menor nos ha proporcionado Datos Personales sin consentimiento parental, contáctenos para eliminarlos.\n\n   2.1.7. Cambios en esta Política\nNotificaremos actualizaciones publicando la nueva Política en esta página y actualizando la fecha de \"Última actualización\". Se recomienda revisarla periódicamente.\n\n 3. Contáctenos\nSi tiene preguntas sobre esta Política, puede contactarnos:\n\nPor correo electrónico: hoysifioapp@outlook.com',
      'en': '',
    },
    'gn3s5v1p': {
      'es': 'Aceptar',
      'en': '',
    },
    'tbnxqtes': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // tenderoEditInfo
  {
    '8dfbjntj': {
      'es': 'Información de la tienda',
      'en': 'Edit Client',
    },
    'z7yka2by': {
      'es': 'Nombre de la Tienda',
      'en': '',
    },
    'pkqswaz8': {
      'es': 'Email',
      'en': '',
    },
    'wwljy5nw': {
      'es': 'Datos Bancarios',
      'en': 'Edit Client',
    },
    'd1dqvnar': {
      'es': 'Núm. De Cuenta Bancaria',
      'en': 'ID',
    },
    'b1mwh2d1': {
      'es': '10 carácteres',
      'en': '',
    },
    '4lnjrhg1': {
      'es': 'Nombre de banco',
      'en': '',
    },
    'nryyrmmj': {
      'es': 'Tipo de Cuenta Bancaria',
      'en': 'Edit Client',
    },
    'szfzzk7s': {
      'es': 'Cuenta Corriente',
      'en': '',
    },
    'dev9lu19': {
      'es': '',
      'en': '',
    },
    'iwdefcyd': {
      'es': 'Cuenta de Ahorros',
      'en': '',
    },
    'rmovvlo9': {
      'es': '',
      'en': '',
    },
    'b4qfhwom': {
      'es': 'Borrar Cuenta',
      'en': '',
    },
    '7aclimuf': {
      'es': 'Enviar',
      'en': '',
    },
    '8ppxca5u': {
      'es': 'Ingrese el nombre de su tienda',
      'en': 'Enter the client names.',
    },
    'uousn3ae': {
      'es': 'Ingrese el nombre de su tienda con al menos 2 carácteres',
      'en': 'Enter the name with more than 5 characters',
    },
    'i1cpzswy': {
      'es': 'Ingrese el nombre de su tienda con  menos de 20 carácteres',
      'en': '',
    },
    'dw99eeub': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'iqrt4e3t': {
      'es': 'Ingrese su email',
      'en': 'Enter the customer\'s last name.',
    },
    'ckvncbbe': {
      'es': 'Ingrese un email válido',
      'en': 'Enter the last name with more than 5 characters',
    },
    '684k8vkd': {
      'es': 'Ingrese un email válido',
      'en': '',
    },
    'v1fwxskd': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '0cekikur': {
      'es': 'Ingrese su número de cuenta',
      'en': 'Enter the customer\'s ID',
    },
    'sj6sny2n': {
      'es': 'Ingrese su número de cuenta.',
      'en': 'Enter the complete ID.',
    },
    'luovb6ts': {
      'es': 'Ingrese la cédula.',
      'en': 'Enter the ID.',
    },
    'gwnxk5gu': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'upnf43na': {
      'es': 'Ingrese el nombre de su banco',
      'en': 'Enter the customer\'s phone number.',
    },
    '06wzu346': {
      'es': 'Ingrese un banco válido',
      'en': '',
    },
    'yxxrvgpq': {
      'es': 'Ingrese el número de teléfono.',
      'en': 'Enter the phone number.',
    },
    'ms1z1c7b': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8qtb4cee': {
      'es': 'Editar Tendero',
      'en': 'Edit Client',
    },
    'j3ztdxxg': {
      'es': 'Edite la información de su tienda',
      'en': 'Fill in the customer information',
    },
    '77jdbw51': {
      'es': 'Home',
      'en': '',
    },
  },
  // signinConfirm
  {
    '7697j1uc': {
      'es': 'Ajustes',
      'en': '',
    },
    'lk4cuksa': {
      'es': 'Ingrese su contraseña para continuar a los ajustes',
      'en': 'Fill out the form to log in as a shopkeeper',
    },
    '7njc4n82': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'r0gkgcyq': {
      'es': 'Olvidé mi contraseña. Quiero restablecerla',
      'en': '',
    },
    'bndkdjiw': {
      'es': 'Confirmar',
      'en': 'Login',
    },
    '1n4n4xv6': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // historialVouchersCliente
  {
    'ie9wbhiz': {
      'es': 'Historial de\n comprobantes',
      'en': 'Record',
    },
    'x0u8z74p': {
      'es': 'Aquí se mostrarán los comprobantes enviados por ti: ',
      'en': 'Here the products on credit will be displayed.',
    },
    'au78gvwy': {
      'es': 'Voucher Negado',
      'en': '',
    },
    '2fyivbzj': {
      'es': 'Comprobante de pago de todos los productos',
      'en': '',
    },
    'rf3somm3': {
      'es': 'Home',
      'en': '',
    },
  },
  // clienteVinc
  {
    'vvpu8emf': {
      'es': 'Usuario/Número de Cédula',
      'en': 'Amount to Pay',
    },
    'nybm5b6n': {
      'es': 'Número de cédula',
      'en': '',
    },
    '6i3bouus': {
      'es': 'El cliente está registrado en: ',
      'en': 'Payment Date:',
    },
    'ztdzjqfo': {
      'es': 'Vincular Cuenta',
      'en': 'Pay',
    },
    'ayg4curc': {
      'es': 'Ingrese el nombre del cliente.',
      'en': 'Enter the customer\'s name.',
    },
    'n1a8ouzz': {
      'es': 'Ingrese un nombre con más de 2 carácteres',
      'en': 'Enter a name with more than 2 characters',
    },
    'jbs4nd5t': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '23fxohbe': {
      'es': 'Número de teléfono is required',
      'en': 'Phone number is required',
    },
    '8nig492a': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'nwi8ygnt': {
      'es': 'Ingrese los productos',
      'en': 'Enter the products',
    },
    '3h86ir0f': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'cnj6eu1o': {
      'es': 'Ingrese el pago',
      'en': 'Enter the payment',
    },
    '2eh1x0qg': {
      'es': 'El número de teléfono debe de tener 10 dígitos',
      'en': 'The phone number must have 10 digits',
    },
    'zrnl7qmg': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'm6no12cg': {
      'es': 'Vincular',
      'en': '',
    },
    'ap4t5pfw': {
      'es': 'Si su cliente ha sido registrado',
      'en': '',
    },
    'z1v6nixe': {
      'es': 'en otras tiendas, vincule sus datos',
      'en': '',
    },
    '8bldc9p8': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // clienteFirstLogin
  {
    'vsqiao4w': {
      'es': 'Hoy',
      'en': 'Hoy',
    },
    '7qe4vujk': {
      'es': 'Sí',
      'en': 'Si',
    },
    't8kuseze': {
      'es': 'Fio',
      'en': 'Fio',
    },
    '3wir9x8c': {
      'es': 'Llene el formulario para autenticar su cuenta de cliente',
      'en': 'Fill out the form to log in as a shopkeeper',
    },
    'x2qpws0m': {
      'es': 'Establezca su contraseña',
      'en': 'Welcome',
    },
    's8w7wo89': {
      'es':
          'Ingrese el código de primer inicio de sesión proveído por su tendero',
      'en': '',
    },
    '4a35zbe9': {
      'es': 'Código de primer inicio de sesión',
      'en': 'Password',
    },
    's1ziy5xb': {
      'es': '0000',
      'en': '',
    },
    '4cthkeev': {
      'es':
          'Ingrese una contraseña que contenga al menos 8 carácteres, una mayúscula, una minúscula y un carácter especial (*.#\$¿)',
      'en': '',
    },
    '954wyj31': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'cpumz09x': {
      'es': 'Contraseña1*',
      'en': '',
    },
    'u2tddc67': {
      'es': 'Confirme su contraseña',
      'en': 'Password',
    },
    '9m4ziyom': {
      'es': 'Ingrese su PIN con 4 números',
      'en': '',
    },
    '4s7pmrjg': {
      'es': 'PIN',
      'en': 'Password',
    },
    'tgqx3x44': {
      'es': '0000',
      'en': '',
    },
    'qnb91mwg': {
      'es': 'Autenticar e iniciar sesión',
      'en': 'Login',
    },
    '2fv5xw97': {
      'es': 'Ingrese el nombre de su tienda',
      'en': '',
    },
    'aydnerpp': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'kcqoehjz': {
      'es': 'Ingrese su email',
      'en': '',
    },
    '4rtik6dq': {
      'es': 'Ingrese un email válido',
      'en': '',
    },
    '7vmeiavf': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'i4wk1v8q': {
      'es': 'Ingrese su número de teléfono',
      'en': '',
    },
    '44w1kwvc': {
      'es': 'Ingrese un número de teléfono válido',
      'en': '',
    },
    'hr44q8se': {
      'es': 'Ingrese un número de teléfono válido',
      'en': '',
    },
    '0zkzr8by': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'tcyu30ue': {
      'es': 'Ingrese su número de cuenta',
      'en': '',
    },
    'k6h56bnq': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '1vu63bdj': {
      'es': 'Ingrese su banco',
      'en': '',
    },
    'dfpcv6bd': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '06rlamw2': {
      'es': 'Ingrese su contraseña',
      'en': '',
    },
    'jl0qoc3w': {
      'es': 'Mínimo 8 carácteres',
      'en': '',
    },
    'uaafkw79': {
      'es': 'Máximo 16 carácteres',
      'en': '',
    },
    'x1veccke': {
      'es': 'Ingrese una mayúscula, un número y \nun carácter especial.',
      'en': '',
    },
    'jvzbgdbj': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'hw3ytojw': {
      'es': 'Confirme su contraseña',
      'en': '',
    },
    '5owoirex': {
      'es': 'Mínimo 8 carácteres',
      'en': '',
    },
    'x0ujj1uc': {
      'es': 'Máximo 16 carácteres',
      'en': '',
    },
    '8g685mox': {
      'es': 'Ingrese una mayúscula, un número y \nun carácter especial.',
      'en': '',
    },
    '6w9tbrdf': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'v83h7x56': {
      'es': 'Ingrese su PIN',
      'en': '',
    },
    'v8ggdksr': {
      'es': 'Ingrese su PIN',
      'en': '',
    },
    'mxedvuzv': {
      'es': 'Ingrese su PIN',
      'en': '',
    },
    '69z7qxd2': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'be1uwwl6': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // forgotMyPassword
  {
    'sj1iw0b0': {
      'es': 'Hoy',
      'en': 'Hoy',
    },
    'dba4xfrx': {
      'es': 'Sí',
      'en': 'Si',
    },
    'xycif7re': {
      'es': 'Fio',
      'en': 'Fio',
    },
    'hbpb6qxp': {
      'es': 'Olvidé mi contraseña',
      'en': 'Welcome',
    },
    '23rgzjnt': {
      'es':
          'Ingrese su correo electrónico para enviarle un email de cambio de contraseña para su cuenta de tendero.',
      'en': 'Fill out the form to log in as a shopkeeper',
    },
    'z741yg0n': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'z62zvqy0': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'u3q4fabm': {
      'es': 'Reestablecer contraseña',
      'en': 'Login',
    },
    '2ttk5em4': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // termsOfServiceSubPageToView
  {
    'zs52rv2i': {
      'es': 'HoySíFio',
      'en': '',
    },
    'mezgcq5s': {
      'es': 'TÉRMINOS Y CONDICIONES DE USO',
      'en': '',
    },
    'wz3j9mfy': {
      'es':
          'Política de Privacidad\nÚltima actualización: 05 de junio de 2025\n\nEsta Política de Privacidad describe nuestras políticas y procedimientos sobre la recopilación, uso y divulgación de su información cuando utiliza el servicio, y le informa sobre sus derechos de privacidad y cómo la ley lo protege.',
      'en': '',
    },
    'f55ww7zw': {
      'es': '\n1. Interpretación y Definiciones',
      'en': '',
    },
    'zu4t561s': {
      'es': '\n\n  1.1. Interpretación',
      'en': '',
    },
    'tp9cg8a5': {
      'es':
          '\n      Las palabras cuya letra inicial está en mayúscula tienen significados definidos bajo las siguientes condiciones. Las siguientes definiciones tendrán el mismo significado independientemente de si aparecen en singular o en plural.',
      'en': '',
    },
    'q4rwiidb': {
      'es': '\n\n  1.2. Definiciones',
      'en': '',
    },
    'ggk8ua1p': {
      'es': '\n       Para los fines de esta Política de Privacidad:\n',
      'en': '',
    },
    'd7mnx9vw': {
      'es': '\n      1.2.1. Cuenta: \n',
      'en': '',
    },
    'bgxf62kf': {
      'es':
          '\n      Significa una cuenta única creada para que Usted acceda a Nuestro Servicio o partes de Nuestro Servicio.',
      'en': '',
    },
    '6lj7385v': {
      'es': '\n\n      1.2.2. Afiliado: ',
      'en': '',
    },
    'ttm73y26': {
      'es':
          '\n\n     Significa una entidad que controla, es controlada por o está bajo control común con una parte, donde \"control\" significa la propiedad del 50% o más de las acciones, participación en el capital u otros valores con derecho a voto para la elección de directivos u otra autoridad administrativa.',
      'en': '',
    },
    '3ctu2t1e': {
      'es': '\n\n     1.2.3. Aplicación: ',
      'en': '',
    },
    'flfm0p5y': {
      'es':
          '\n\nSe refiere a HoySíFio, el programa de software proporcionado por la Compañía.',
      'en': '',
    },
    'zeacsnc5': {
      'es': '\n\n    1.2.4. Compañía',
      'en': '',
    },
    'vyax0lx5': {
      'es': ': Se refiere a HoySíFio Org.',
      'en': '',
    },
    'rk7t90wf': {
      'es': '\n\n\n    1.2.5. País:',
      'en': '',
    },
    '0an0d6g7': {
      'es': ' Ecuador.',
      'en': '',
    },
    'egfx2pt5': {
      'es': '\n\n    1.2.6. Dispositivo:',
      'en': '',
    },
    '66ao0yhy': {
      'es':
          '\n\nCualquier dispositivo que pueda acceder al Servicio, como una computadora, un teléfono móvil o una tableta digital.',
      'en': '',
    },
    'xixazfu1': {
      'es': '\n\n     1.2.7. Datos Personales:',
      'en': '',
    },
    '9g1foavh': {
      'es':
          '\n\nCualquier información relacionada con un individuo identificado o identificable.',
      'en': '',
    },
    '2kqzdmx2': {
      'es': '\n\n     1.2.8. Servicio',
      'en': '',
    },
    'tntsmbez': {
      'es': ': se refiere a la Aplicación.',
      'en': '',
    },
    '1kcte1e8': {
      'es': '\n\n     1.2.9. Proveedor de Servicios:',
      'en': '',
    },
    'iaw1e703': {
      'es':
          '\n\nCualquier persona natural o jurídica que procesa los datos en nombre de la Compañía. Se refiere a empresas o individuos terceros empleados por la Compañía para facilitar el Servicio, proporcionarlo en nombre de la Compañía, realizar servicios relacionados con el Servicio o ayudar a la Compañía a analizar cómo se utiliza el Servicio.',
      'en': '',
    },
    'nljdbsds': {
      'es': '\n\n      1.2.10. Datos de Uso: ',
      'en': '',
    },
    '3mbvwg91': {
      'es':
          '\n\nDatos recopilados automáticamente, generados por el uso del Servicio o por la infraestructura del Servicio mismo (por ejemplo, la duración de una visita a una página).',
      'en': '',
    },
    '6h785yko': {
      'es': '\n\n      1.2.11. Usted:',
      'en': '',
    },
    'vl6klwoh': {
      'es':
          '\n\nEl individuo que accede o utiliza el Servicio, o la empresa u otra entidad legal en nombre de la cual dicho individuo accede o utiliza el Servicio, según corresponda.',
      'en': '',
    },
    'th00i0in': {
      'es': '\n\n2. Recopilación y Uso de Sus Datos Personales',
      'en': '',
    },
    '9c50zuul': {
      'es': '\n\n   2.1. Tipos de Datos Recopilados',
      'en': '',
    },
    'pltyveh1': {
      'es': '\n\n       2.1.1. Datos Personales:',
      'en': '',
    },
    'qkmumao7': {
      'es':
          '\n\nMientras utiliza Nuestro Servicio, podemos pedirle que nos proporcione cierta información personalmente identificable que puede ser utilizada para contactarlo o identificarlo. Esta información puede incluir, pero no limitarse a:',
      'en': '',
    },
    '5c813of0': {
      'es':
          '\n\n- Dirección de correo electrónico\n- Nombre y apellido\n- Número de teléfono\n- Dirección, Estado, Provincia, Código Postal, Ciudad',
      'en': '',
    },
    'jtbgwtw7': {
      'es': '\n\n      2.1.2. Datos de Uso',
      'en': '',
    },
    'a2hsqtou': {
      'es':
          '\n\nLos Datos de Uso se recopilan automáticamente al utilizar el Servicio e incluyen:',
      'en': '',
    },
    'jkaek35c': {
      'es':
          '\n\n- Dirección IP de Su Dispositivo\n- Tipo y versión del navegador\n- Páginas visitadas dentro del Servicio\n- Fecha y hora de la visita\n- Tiempo dedicado a esas páginas\n- Identificadores únicos de dispositivo y otros datos de diagnóstico. \n\nSi accede al Servicio a través de un dispositivo móvil, también podemos recopilar información como:',
      'en': '',
    },
    'bb2e36h9': {
      'es':
          '\n\n- Tipo de dispositivo móvil\n- ID único del dispositivo móvil\n- Sistema operativo del dispositivo\n- Tipo de navegador móvil utilizado ',
      'en': '',
    },
    'ue7erfxq': {
      'es': '\n\n       2.1.3. Uso de Sus Datos Personales',
      'en': '',
    },
    '7pmz3l47': {
      'es':
          '\n\nLa Compañía puede utilizar los Datos Personales para:\n\n- Proporcionar y mantener el Servicio.\n- Gestionar Su Cuenta.\n- Cumplir con contratos.\n- Contactarlo con actualizaciones o comunicaciones informativas.\n- Ofrecer noticias, ofertas especiales o información sobre otros bienes/servicios similares.\n- Gestionar Sus solicitudes.\n- Otros fines como análisis de datos, mejora del Servicio o marketing.',
      'en': '',
    },
    '1zqqyzwk': {
      'es': '\n\n       2.1.4. Divulgación de Sus Datos Personales ',
      'en': '',
    },
    'qiiyde05': {
      'es':
          '\n\nPodemos compartir Su información en las siguientes situaciones:\n\n- Con Proveedores de Servicios para monitorear y analizar el uso del Servicio.\n\n- En transferencias comerciales (venta de activos, fusiones, etc.).\n\n- Con Afiliados, socios comerciales u otros usuarios (si interactúa en áreas públicas).\n\n- Con Su consentimiento o por requisitos legales.',
      'en': '',
    },
    'wdblri6i': {
      'es': '\n\n       2.1.5. Seguridad de Sus Datos ',
      'en': '',
    },
    'm92qs9ff': {
      'es':
          '\n\nMientras implementamos medidas comerciales aceptables para proteger Sus Datos Personales, ningún método de transmisión o almacenamiento electrónico es 100% seguro. ',
      'en': '',
    },
    'cl2e79qs': {
      'es': '\n\n       2.1.6. Privacidad de los Niños',
      'en': '',
    },
    '790qalz1': {
      'es':
          '\n\nNuestro Servicio no está dirigido a menores de 13 años. Si descubre que un menor nos ha proporcionado Datos Personales sin consentimiento parental, contáctenos para eliminarlos. ',
      'en': '',
    },
    'ldpk6t64': {
      'es': '\n\n     2.1.7. Cambios en esta Política',
      'en': '',
    },
    '6x96dcb1': {
      'es':
          '\n\nNotificaremos actualizaciones publicando la nueva Política en esta página y actualizando la fecha de \"Última actualización\". Se recomienda revisarla periódicamente. ',
      'en': '',
    },
    'v7uokde9': {
      'es': '\n\n3. Contáctenos',
      'en': '',
    },
    'eo6om6ei': {
      'es':
          '\n\nSi tiene preguntas sobre esta Política, puede contactarnos:\n\nPor correo electrónico: hoysifioapp@outlook.com',
      'en': '',
    },
    'hk6koe73': {
      'es':
          '1. Interpretación y Definiciones\n\n 1.1. Interpretación\nLas palabras cuya letra inicial está en mayúscula tienen significados definidos bajo las siguientes condiciones. Las siguientes definiciones tendrán el mismo significado independientemente de si aparecen en singular o en plural.\n\n 1.2. Definiciones\nPara los fines de esta Política de Privacidad:\n\n   1.2.1. Cuenta: significa una cuenta única creada para que Usted acceda a Nuestro Servicio o partes de Nuestro Servicio.\n\n    1.2.2. Afiliado: significa una entidad que controla, es controlada por o está bajo control común con una parte, donde \"control\" significa la propiedad del 50% o más de las acciones, participación en el capital u otros valores con derecho a voto para la elección de directivos u otra autoridad administrativa.\n\n   1.2.3. Aplicación: se refiere a HoySíFio, el programa de software proporcionado por la Compañía.\n\n   1.2.4. Compañía (referida como \"la Compañía\", \"Nosotros\", \"Nos\" o \"Nuestro\" en este Acuerdo): se refiere a HoySíFio Org.\n\n   1.2.5. País: Ecuador.\n\n   1.2.6. Dispositivo: cualquier dispositivo que pueda acceder al Servicio, como una computadora, un teléfono móvil o una tableta digital.\n\n   1.2.7. Datos Personales: cualquier información relacionada con un individuo identificado o identificable.\n\n   1.2.8. Servicio: se refiere a la Aplicación.\n\n   1.2.9. Proveedor de Servicios: cualquier persona natural o jurídica que procesa los datos en nombre de la Compañía. Se refiere a empresas o individuos terceros empleados por la Compañía para facilitar el Servicio, proporcionarlo en nombre de la Compañía, realizar servicios relacionados con el Servicio o ayudar a la Compañía a analizar cómo se utiliza el Servicio.\n\n   1.2.10. Datos de Uso: datos recopilados automáticamente, generados por el uso del Servicio o por la infraestructura del Servicio mismo (por ejemplo, la duración de una visita a una página).\n\n   1.2.11. Usted: el individuo que accede o utiliza el Servicio, o la empresa u otra entidad legal en nombre de la cual dicho individuo accede o utiliza el Servicio, según corresponda.\n\n2. Recopilación y Uso de Sus Datos Personales\n\n  2.1. Tipos de Datos Recopilados\n\n    2.1.1. Datos Personales\nMientras utiliza Nuestro Servicio, podemos pedirle que nos proporcione cierta información personalmente identificable que puede ser utilizada para contactarlo o identificarlo. Esta información puede incluir, pero no limitarse a:\n\nDirección de correo electrónico\n\nNombre y apellido\n\nNúmero de teléfono\n\nDirección, Estado, Provincia, Código Postal, Ciudad\n\n    2.1.2. Datos de Uso\nLos Datos de Uso se recopilan automáticamente al utilizar el Servicio e incluyen:\n\nDirección IP de Su Dispositivo\n\nTipo y versión del navegador\n\nPáginas visitadas dentro del Servicio\n\nFecha y hora de la visita\n\nTiempo dedicado a esas páginas\n\nIdentificadores únicos de dispositivo y otros datos de diagnóstico.\n\nSi accede al Servicio a través de un dispositivo móvil, también podemos recopilar información como:\n\nTipo de dispositivo móvil\n\nID único del dispositivo móvil\n\nSistema operativo del dispositivo\n\nTipo de navegador móvil utilizado\n\n   2.1.3. Uso de Sus Datos Personales\nLa Compañía puede utilizar los Datos Personales para:\n\nProporcionar y mantener el Servicio.\n\nGestionar Su Cuenta.\n\nCumplir con contratos.\n\nContactarlo con actualizaciones o comunicaciones informativas.\n\nOfrecer noticias, ofertas especiales o información sobre otros bienes/servicios similares.\n\nGestionar Sus solicitudes.\n\nOtros fines como análisis de datos, mejora del Servicio o marketing.\n\n   2.1.4. Divulgación de Sus Datos Personales\nPodemos compartir Su información en las siguientes situaciones:\n\nCon Proveedores de Servicios para monitorear y analizar el uso del Servicio.\n\nEn transferencias comerciales (venta de activos, fusiones, etc.).\n\nCon Afiliados, socios comerciales u otros usuarios (si interactúa en áreas públicas).\n\nCon Su consentimiento o por requisitos legales.\n\n   2.1.5. Seguridad de Sus Datos\nMientras implementamos medidas comerciales aceptables para proteger Sus Datos Personales, ningún método de transmisión o almacenamiento electrónico es 100% seguro.\n\n   2.1.6. Privacidad de los Niños\nNuestro Servicio no está dirigido a menores de 13 años. Si descubre que un menor nos ha proporcionado Datos Personales sin consentimiento parental, contáctenos para eliminarlos.\n\n   2.1.7. Cambios en esta Política\nNotificaremos actualizaciones publicando la nueva Política en esta página y actualizando la fecha de \"Última actualización\". Se recomienda revisarla periódicamente.\n\n 3. Contáctenos\nSi tiene preguntas sobre esta Política, puede contactarnos:\n\nPor correo electrónico: hoysifioapp@outlook.com',
      'en': '',
    },
    'wz5npo30': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // emptyVoucherComp
  {
    'no53yi3r': {
      'es': 'No hay vouchers enviados',
      'en': '',
    },
  },
  // emptyProductosPagadosComp
  {
    'ddi75fbv': {
      'es': '¡Hurra! No hay cuentas por pagar',
      'en': '',
    },
  },
  // emptyTiendaComp
  {
    'fyzf4r4w': {
      'es': 'No has sido registrado aún.',
      'en': '',
    },
  },
  // emptyClientesList
  {
    'kldi7wrg': {
      'es': 'No hay clientes registrados.',
      'en': '',
    },
  },
  // emptyClientesListFiando
  {
    '4c19uesj': {
      'es': 'No hay clientes adeudando.',
      'en': '',
    },
  },
  // emptyClientesListNoFiando
  {
    'oyz830rq': {
      'es': 'No hay clientes sin adeudar.',
      'en': '',
    },
  },
  // emptyCuentasPagadas
  {
    'u1uadq4e': {
      'es': 'El cliente no tiene cuentas.',
      'en': '',
    },
  },
  // razonNegadoC
  {
    't8v8akrb': {
      'es': 'Razón de Negación',
      'en': '',
    },
    '2429enbi': {
      'es': 'Ingrese la razón de la negación',
      'en': '',
    },
  },
  // wtListaClientesLogOut
  {
    'gwn8ysum': {
      'es': 'Cerrar sesión',
      'en': '',
    },
    'z0gwhv91': {
      'es':
          'Este botón te permite cerrar sesión de forma segura. Tus datos se guardan automáticamente antes de salir.',
      'en': '',
    },
  },
  // wtListaClientesAddClient
  {
    '328engru': {
      'es': 'Añadir Clientes',
      'en': '',
    },
    'n4e9qswy': {
      'es': 'Pulsa aquí para registrar un nuevo cliente en tu tienda.',
      'en': '',
    },
  },
  // wtListaClientesSettings
  {
    '1oh9t0pv': {
      'es': 'Ajustes',
      'en': '',
    },
    'bangfnzw': {
      'es': 'Accede a la configuración de tu cuenta y modifica tus datos.',
      'en': '',
    },
  },
  // wtListaClientesTabListAll
  {
    'uvhxcbwl': {
      'es': 'Todos',
      'en': '',
    },
    'rbr2tguc': {
      'es': 'Seleccionando esta pestaña verá todos sus clientes registrados.',
      'en': '',
    },
  },
  // wtInfoEditData
  {
    'q60frzwr': {
      'es': 'Datos',
      'en': '',
    },
    'o816bot3': {
      'es':
          'Esta es la sección de información del cliente, puede editar, borrar y visualizar los datos del cliente.',
      'en': '',
    },
  },
  // wtInfoEditCuentas
  {
    '1o4fve1y': {
      'es': 'Sección de Cuentas',
      'en': '',
    },
    'voco3jm6': {
      'es': 'En esta es la sección podrá ver el historial del cliente.',
      'en': '',
    },
  },
  // wtInfoEditFiado
  {
    '1gtgr1jo': {
      'es': 'Sección de Fiado',
      'en': '',
    },
    'j32yvxvd': {
      'es': 'Esta es la sección de productos registrados al cliente.',
      'en': '',
    },
  },
  // wtInfoEditProds
  {
    't0dz1qpx': {
      'es': 'Lista de Productos',
      'en': '',
    },
    'p644gald': {
      'es': 'Registra productos a fiar.',
      'en': '',
    },
  },
  // wtListaClientesForTenderoBarraNumClientes
  {
    'ffq7cfip': {
      'es': 'Conteo de clientes',
      'en': '',
    },
    '1cgrguqv': {
      'es': 'En esta sección verá la cantidad de clientes actuales.',
      'en': '',
    },
  },
  // wtListaClientesTabListFiando
  {
    'r1rhslw5': {
      'es': 'Clientes fiando',
      'en': '',
    },
    'jkn46zzn': {
      'es': 'Seleccionando esta pestaña verá todos sus clientes que fien.',
      'en': '',
    },
  },
  // wtListaClientesTabListSinFiar
  {
    '5nx69egj': {
      'es': 'Clientes sin fiar',
      'en': '',
    },
    'ljrjeftt': {
      'es': 'Seleccionando esta pestaña verá todos sus clientes que no fien.',
      'en': '',
    },
  },
  // wtInfoEditButtonEdit
  {
    'g3w30nya': {
      'es': 'Edición',
      'en': '',
    },
    'i47gsxhf': {
      'es': 'Este es el botón para editar los datos del cliente.',
      'en': '',
    },
  },
  // wtInfoEditButtonDelete
  {
    'mh729s2l': {
      'es': 'Borrar',
      'en': '',
    },
    '6mw3td1q': {
      'es': 'Este es el botón para borrar al cliente.',
      'en': '',
    },
  },
  // wtInfoEditButtonRead
  {
    'x634pf4b': {
      'es': 'Datos Completos',
      'en': '',
    },
    'x7fqbwjk': {
      'es': 'Este es el botón para visualizar todos los datos del cliente.',
      'en': '',
    },
  },
  // wtInfoEditCuentasHistorialRow
  {
    'fdhfmc90': {
      'es': 'Historial de Cuentas',
      'en': '',
    },
    'r5weprwa': {
      'es': 'Acceda a las cuentas pagadas y por cobrar del cliente.',
      'en': '',
    },
  },
  // wtInfoEditComprobante
  {
    'fkp990z1': {
      'es': 'Comprobantes',
      'en': '',
    },
    '3yffcmed': {
      'es':
          'Visualice los comprobantes que hayan sido enviados por el cliente.',
      'en': '',
    },
  },
  // wtInfoEditProdsCantidad
  {
    'nb7o3qcp': {
      'es': 'Cantidad',
      'en': '',
    },
    't2hb2qic': {
      'es': 'Registra el número de productos.',
      'en': '',
    },
  },
  // wtInfoEditProdsNombre
  {
    'qhaevea0': {
      'es': 'Producto',
      'en': '',
    },
    'la16kaf7': {
      'es': 'Registra el nombre del producto a fiar.',
      'en': '',
    },
  },
  // wtInfoEditProdsValor
  {
    '41nglai9': {
      'es': 'Valor',
      'en': '',
    },
    'tn5cl4iu': {
      'es': 'Registra el precio del producto.',
      'en': '',
    },
  },
  // wtInfoEditProdsAnadir
  {
    'y43pmfld': {
      'es': 'Añadir',
      'en': '',
    },
    'w3qp5add': {
      'es': 'Tras ingresar los producto, los añade con este botón.',
      'en': '',
    },
  },
  // wtClienteTiendaListData
  {
    'ybs8jzoi': {
      'es': 'Datos personales',
      'en': '',
    },
    'iop3hpvv': {
      'es': 'Aquí se mostrará tus datos ingresados por los tenderos.',
      'en': '',
    },
  },
  // wtClienteTiendaList
  {
    '6neqqmen': {
      'es': 'Lista de tiendas',
      'en': '',
    },
    '4y4ceyjx': {
      'es':
          'Esta es la lista de tiendas en la que has sido registrado, selecciona una para ver detalles.',
      'en': '',
    },
  },
  // wtClienteProdsListTotal
  {
    '92if96ja': {
      'es': 'Sección Total Debido',
      'en': '',
    },
    'pncbfiqa': {
      'es': 'Este es el total de los productos que estás fiando actualmente.',
      'en': '',
    },
  },
  // wtClienteProdsList
  {
    '3d8cwt27': {
      'es': 'Lista de Productos',
      'en': '',
    },
    '4ov1lf4k': {
      'es': 'Esta es la lista de productos que se fian actualmente.',
      'en': '',
    },
  },
  // wtClienteProdsPagoCompleto
  {
    'er4jyqo5': {
      'es': 'Pago completo',
      'en': '',
    },
    'z5dd49e0': {
      'es': 'Haz el pago completo de los fiados con este botón.',
      'en': '',
    },
  },
  // wtClienteProdsComprobante
  {
    '281y2j53': {
      'es': 'Comprobantes',
      'en': '',
    },
    'amru719j': {
      'es': 'Revisa los comprobantes que has enviado con este botón.',
      'en': '',
    },
  },
  // wtListaClientesInicio
  {
    '6glumzuh': {
      'es': '¡Bienvenido!',
      'en': '',
    },
    'cnc4za3r': {
      'es':
          'Este es el tutorial de uso de la App. Para saltarse este tutorial, haga clic en el botón de \"Saltar\" en la parte inferior derecha. Toque la pantalla para continuar',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'lbunarhs': {
      'es': 'La aplicación necesita permiso para el acceso a la cámara',
      'en': '',
    },
    '0z1tckeq': {
      'es':
          'La aplicación necesita permiso para el acceso a la galería de fotos',
      'en': '',
    },
    'zfjzohw4': {
      'es':
          'La aplicación necesita permiso para el acceso a las notificaciones',
      'en': '',
    },
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
