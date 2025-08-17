import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';
import 'package:animated_text_library_sk2998/index.dart'
    as $animated_text_library_sk2998;

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) {
  $animated_text_library_sk2998.initializeRoutes(
    animatedTextExamplesWidgetName:
        'animated_text_library_sk2998.AnimatedTextExamples',
    animatedTextExamplesWidgetPath: '/animatedTextExamples',
  );

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: appStateNotifier,
    navigatorKey: appNavigatorKey,
    errorBuilder: (context, state) =>
        appStateNotifier.loggedIn ? PageLoaderWidget() : PageLoaderWidget(),
    routes: [
      FFRoute(
        name: '_initialize',
        path: '/',
        builder: (context, _) =>
            appStateNotifier.loggedIn ? PageLoaderWidget() : PageLoaderWidget(),
      ),
      FFRoute(
        name: AuthSigningInWidget.routeName,
        path: AuthSigningInWidget.routePath,
        builder: (context, params) => AuthSigningInWidget(),
      ),
      FFRoute(
        name: ListaClientesWidget.routeName,
        path: ListaClientesWidget.routePath,
        builder: (context, params) => ListaClientesWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: ClienteMakeInfoWidget.routeName,
        path: ClienteMakeInfoWidget.routePath,
        builder: (context, params) => ClienteMakeInfoWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: ClienteEditInfoWidget.routeName,
        path: ClienteEditInfoWidget.routePath,
        builder: (context, params) => ClienteEditInfoWidget(
          nombre: params.getParam(
            'nombre',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          viviendaProp: params.getParam(
            'viviendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          customLimit: params.getParam(
            'customLimit',
            ParamType.int,
          ),
        ),
      ),
      FFRoute(
        name: ClienteInfoEditWidget.routeName,
        path: ClienteInfoEditWidget.routePath,
        builder: (context, params) => ClienteInfoEditWidget(
          nombre: params.getParam(
            'nombre',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          viviendaProp: params.getParam(
            'viviendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: HistorialPagosWidget.routeName,
        path: HistorialPagosWidget.routePath,
        builder: (context, params) => HistorialPagosWidget(
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          idTendero: params.getParam(
            'idTendero',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombre: params.getParam(
            'nombre',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          viviendaProp: params.getParam(
            'viviendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: ClienteReadInfoWidget.routeName,
        path: ClienteReadInfoWidget.routePath,
        builder: (context, params) => ClienteReadInfoWidget(
          nombre: params.getParam(
            'nombre',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          viviendaProp: params.getParam(
            'viviendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          codigoInicioSesion: params.getParam(
            'codigoInicioSesion',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: ClienteProdValorPagoWidget.routeName,
        path: ClienteProdValorPagoWidget.routePath,
        builder: (context, params) => ClienteProdValorPagoWidget(
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          indexFromHistorial: params.getParam(
            'indexFromHistorial',
            ParamType.int,
          ),
          totalPagadoFromHistorial: params.getParam(
            'totalPagadoFromHistorial',
            ParamType.double,
          ),
          transferFromHistorial: params.getParam(
            'transferFromHistorial',
            ParamType.bool,
          ),
          efectivoFromHistorial: params.getParam(
            'efectivoFromHistorial',
            ParamType.bool,
          ),
          dtHistorial: params.getParam(
            'dtHistorial',
            ParamType.DataStruct,
            isList: false,
            structBuilder: DataTypeHistorialPagoStruct.fromSerializableMap,
          ),
          totalPorPagarFromHistorial: params.getParam(
            'totalPorPagarFromHistorial',
            ParamType.double,
          ),
          totalGeneralFromHistorial: params.getParam(
            'totalGeneralFromHistorial',
            ParamType.double,
          ),
          idTransaccionPassed: params.getParam(
            'idTransaccionPassed',
            ParamType.String,
          ),
          nombre: params.getParam(
            'nombre',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          vivendaProp: params.getParam(
            'vivendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
          totalPassed: params.getParam(
            'totalPassed',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: HistorialPorCobrarWidget.routeName,
        path: HistorialPorCobrarWidget.routePath,
        builder: (context, params) => HistorialPorCobrarWidget(
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          idTendero: params.getParam(
            'idTendero',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombre: params.getParam(
            'nombre',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          viviendaProp: params.getParam(
            'viviendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
          totalPassed: params.getParam(
            'totalPassed',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: TenderoRegisterWidget.routeName,
        path: TenderoRegisterWidget.routePath,
        builder: (context, params) => TenderoRegisterWidget(),
      ),
      FFRoute(
        name: HistorialVouchersWidget.routeName,
        path: HistorialVouchersWidget.routePath,
        builder: (context, params) => HistorialVouchersWidget(
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          idTendero: params.getParam(
            'idTendero',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombre: params.getParam(
            'nombre',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          viviendaProp: params.getParam(
            'viviendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: ClienteProdFullPagoWidget.routeName,
        path: ClienteProdFullPagoWidget.routePath,
        builder: (context, params) => ClienteProdFullPagoWidget(
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          nombre: params.getParam(
            'nombre',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          vivendaProp: params.getParam(
            'vivendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
          totalPassed: params.getParam(
            'totalPassed',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: ClienteProdSelectPagoWidget.routeName,
        path: ClienteProdSelectPagoWidget.routePath,
        builder: (context, params) => ClienteProdSelectPagoWidget(
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          nombre: params.getParam(
            'nombre',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          vivendaProp: params.getParam(
            'vivendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
          calcForTotalPorPagar: params.getParam(
            'calcForTotalPorPagar',
            ParamType.double,
          ),
          totalPassed: params.getParam(
            'totalPassed',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: HistorialSingleVoucherPagoWidget.routeName,
        path: HistorialSingleVoucherPagoWidget.routePath,
        asyncParams: {
          'doc': getDocList(['clientes'], ClientesRecord.fromSnapshot),
        },
        builder: (context, params) => HistorialSingleVoucherPagoWidget(
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          indexFromHistorial: params.getParam(
            'indexFromHistorial',
            ParamType.int,
          ),
          totalPagadoFromHistorial: params.getParam(
            'totalPagadoFromHistorial',
            ParamType.double,
          ),
          transferFromHistorial: params.getParam(
            'transferFromHistorial',
            ParamType.bool,
          ),
          efectivoFromHistorial: params.getParam(
            'efectivoFromHistorial',
            ParamType.bool,
          ),
          dtHistorial: params.getParam(
            'dtHistorial',
            ParamType.DataStruct,
            isList: false,
            structBuilder: DataTypeHistorialPagoStruct.fromSerializableMap,
          ),
          totalPorPagarFromHistorial: params.getParam(
            'totalPorPagarFromHistorial',
            ParamType.double,
          ),
          totalGeneralFromHistorial: params.getParam(
            'totalGeneralFromHistorial',
            ParamType.double,
          ),
          idTransaccionPassed: params.getParam(
            'idTransaccionPassed',
            ParamType.String,
          ),
          nombre: params.getParam(
            'nombre',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          vivendaProp: params.getParam(
            'vivendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
          historialPorPagarDT: params.getParam<DataTypeHistorialPagoStruct>(
            'historialPorPagarDT',
            ParamType.DataStruct,
            isList: true,
            structBuilder: DataTypeHistorialPagoStruct.fromSerializableMap,
          ),
          doc: params.getParam<ClientesRecord>(
            'doc',
            ParamType.Document,
            isList: true,
          ),
          idTenderoList: params.getParam<DocumentReference>(
            'idTenderoList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
        ),
      ),
      FFRoute(
        name: ResumenFiadoClienProdsNewWidget.routeName,
        path: ResumenFiadoClienProdsNewWidget.routePath,
        asyncParams: {
          'doc': getDocList(['clientes'], ClientesRecord.fromSnapshot),
        },
        builder: (context, params) => ResumenFiadoClienProdsNewWidget(
          historialPorPagarDTList: params.getParam<DataTypeHistorialPagoStruct>(
            'historialPorPagarDTList',
            ParamType.DataStruct,
            isList: true,
            structBuilder: DataTypeHistorialPagoStruct.fromSerializableMap,
          ),
          nombreCliente: params.getParam(
            'nombreCliente',
            ParamType.String,
          ),
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          idTendero: params.getParam(
            'idTendero',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          doc: params.getParam<ClientesRecord>(
            'doc',
            ParamType.Document,
            isList: true,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          idTenderoList: params.getParam<DocumentReference>(
            'idTenderoList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
        ),
      ),
      FFRoute(
        name: HistorialFullVoucherPagoWidget.routeName,
        path: HistorialFullVoucherPagoWidget.routePath,
        asyncParams: {
          'doc': getDocList(['clientes'], ClientesRecord.fromSnapshot),
        },
        builder: (context, params) => HistorialFullVoucherPagoWidget(
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          nombre: params.getParam(
            'nombre',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          vivendaProp: params.getParam(
            'vivendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
          historialPorPagarDT: params.getParam<DataTypeHistorialPagoStruct>(
            'historialPorPagarDT',
            ParamType.DataStruct,
            isList: true,
            structBuilder: DataTypeHistorialPagoStruct.fromSerializableMap,
          ),
          doc: params.getParam<ClientesRecord>(
            'doc',
            ParamType.Document,
            isList: true,
          ),
          idTenderoList: params.getParam<DocumentReference>(
            'idTenderoList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
        ),
      ),
      FFRoute(
        name: PoliticaPrivSubPageToAcceptWidget.routeName,
        path: PoliticaPrivSubPageToAcceptWidget.routePath,
        builder: (context, params) => PoliticaPrivSubPageToAcceptWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          emailTendero: params.getParam(
            'emailTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: TenderoEditInfoWidget.routeName,
        path: TenderoEditInfoWidget.routePath,
        builder: (context, params) => TenderoEditInfoWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          pwPassed: params.getParam(
            'pwPassed',
            ParamType.String,
          ),
          tenderoEmailPassed: params.getParam(
            'tenderoEmailPassed',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: HistorialVouchersClienteWidget.routeName,
        path: HistorialVouchersClienteWidget.routePath,
        asyncParams: {
          'doc': getDocList(['clientes'], ClientesRecord.fromSnapshot),
        },
        builder: (context, params) => HistorialVouchersClienteWidget(
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          idTendero: params.getParam(
            'idTendero',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          historialPorPagarDTList: params.getParam<DataTypeHistorialPagoStruct>(
            'historialPorPagarDTList',
            ParamType.DataStruct,
            isList: true,
            structBuilder: DataTypeHistorialPagoStruct.fromSerializableMap,
          ),
          nombreCliente: params.getParam(
            'nombreCliente',
            ParamType.String,
          ),
          doc: params.getParam<ClientesRecord>(
            'doc',
            ParamType.Document,
            isList: true,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          idTenderoList: params.getParam<DocumentReference>(
            'idTenderoList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
        ),
      ),
      FFRoute(
        name: ClienteVincWidget.routeName,
        path: ClienteVincWidget.routePath,
        builder: (context, params) => ClienteVincWidget(
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
          cedulaPassed: params.getParam(
            'cedulaPassed',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: ClienteFirstLoginWidget.routeName,
        path: ClienteFirstLoginWidget.routePath,
        builder: (context, params) => ClienteFirstLoginWidget(
          idClienteWithNoPsswrd: params.getParam(
            'idClienteWithNoPsswrd',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
        ),
      ),
      FFRoute(
        name: ForgotMyPasswordWidget.routeName,
        path: ForgotMyPasswordWidget.routePath,
        builder: (context, params) => ForgotMyPasswordWidget(),
      ),
      FFRoute(
        name: TenderoFirstLoginWidget.routeName,
        path: TenderoFirstLoginWidget.routePath,
        builder: (context, params) => TenderoFirstLoginWidget(
          idTenderoNoAuth: params.getParam(
            'idTenderoNoAuth',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
        ),
      ),
      FFRoute(
        name: TenderoAyudaWidget.routeName,
        path: TenderoAyudaWidget.routePath,
        builder: (context, params) => TenderoAyudaWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: PageTutorialForClienteFTWidget.routeName,
        path: PageTutorialForClienteFTWidget.routePath,
        builder: (context, params) => PageTutorialForClienteFTWidget(
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          idTenderoList: params.getParam<DocumentReference>(
            'idTenderoList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
          nombreCliente: params.getParam(
            'nombreCliente',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: PageTutorialinfoProdFTWidget.routeName,
        path: PageTutorialinfoProdFTWidget.routePath,
        builder: (context, params) => PageTutorialinfoProdFTWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreCliente: params.getParam(
            'nombreCliente',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          viviendaProp: params.getParam(
            'viviendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: PageTutorialListaClientesFTWidget.routeName,
        path: PageTutorialListaClientesFTWidget.routePath,
        builder: (context, params) => PageTutorialListaClientesFTWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: PageTutorialListaClientesHelpWidget.routeName,
        path: PageTutorialListaClientesHelpWidget.routePath,
        builder: (context, params) => PageTutorialListaClientesHelpWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: PageTutorialinfoProdHelpWidget.routeName,
        path: PageTutorialinfoProdHelpWidget.routePath,
        builder: (context, params) => PageTutorialinfoProdHelpWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: TenderoBankSecWidget.routeName,
        path: TenderoBankSecWidget.routePath,
        builder: (context, params) => TenderoBankSecWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          pwPassed: params.getParam(
            'pwPassed',
            ParamType.String,
          ),
          tenderoEmailPassed: params.getParam(
            'tenderoEmailPassed',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: HistorialPagosClienteWidget.routeName,
        path: HistorialPagosClienteWidget.routePath,
        asyncParams: {
          'doc': getDocList(['clientes'], ClientesRecord.fromSnapshot),
        },
        builder: (context, params) => HistorialPagosClienteWidget(
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          idTendero: params.getParam(
            'idTendero',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          historialPagosDTList: params.getParam<DataTypeHistorialPagoStruct>(
            'historialPagosDTList',
            ParamType.DataStruct,
            isList: true,
            structBuilder: DataTypeHistorialPagoStruct.fromSerializableMap,
          ),
          nombreCliente: params.getParam(
            'nombreCliente',
            ParamType.String,
          ),
          doc: params.getParam<ClientesRecord>(
            'doc',
            ParamType.Document,
            isList: true,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          idTenderoList: params.getParam<DocumentReference>(
            'idTenderoList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
        ),
      ),
      FFRoute(
        name: PageTutorialHistorialCPPFTWidget.routeName,
        path: PageTutorialHistorialCPPFTWidget.routePath,
        builder: (context, params) => PageTutorialHistorialCPPFTWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreCliente: params.getParam(
            'nombreCliente',
            ParamType.String,
          ),
          telf: params.getParam(
            'telf',
            ParamType.String,
          ),
          isFiando: params.getParam(
            'isFiando',
            ParamType.bool,
          ),
          idCliente: params.getParam(
            'idCliente',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          apellido: params.getParam(
            'apellido',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          direccionDomicilio: params.getParam(
            'direccionDomicilio',
            ParamType.String,
          ),
          viviendaAlq: params.getParam(
            'viviendaAlq',
            ParamType.bool,
          ),
          viviendaProp: params.getParam(
            'viviendaProp',
            ParamType.bool,
          ),
          emailCliente: params.getParam(
            'emailCliente',
            ParamType.String,
          ),
          totalPassed: params.getParam(
            'totalPassed',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: PageTutorialHistorialCPPHelpWidget.routeName,
        path: PageTutorialHistorialCPPHelpWidget.routePath,
        builder: (context, params) => PageTutorialHistorialCPPHelpWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: TermsOfServiceOfTenderoHelpWidget.routeName,
        path: TermsOfServiceOfTenderoHelpWidget.routePath,
        builder: (context, params) => TermsOfServiceOfTenderoHelpWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: PoliticasPrivFromMakeClienteWidget.routeName,
        path: PoliticasPrivFromMakeClienteWidget.routePath,
        builder: (context, params) => PoliticasPrivFromMakeClienteWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          emailTendero: params.getParam(
            'emailTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: TermsOfServiceOfClienteMakeWidget.routeName,
        path: TermsOfServiceOfClienteMakeWidget.routePath,
        builder: (context, params) => TermsOfServiceOfClienteMakeWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: TermsOfServiceFromAcceptWidget.routeName,
        path: TermsOfServiceFromAcceptWidget.routePath,
        builder: (context, params) => TermsOfServiceFromAcceptWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: TermsOfServiceLoginWidget.routeName,
        path: TermsOfServiceLoginWidget.routePath,
        builder: (context, params) => TermsOfServiceLoginWidget(
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          nombreCLiente: params.getParam(
            'nombreCLiente',
            ParamType.String,
          ),
          idTenderosList: params.getParam<DocumentReference>(
            'idTenderosList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
        ),
      ),
      FFRoute(
        name: PoliticaPrivSubPageToViewWidget.routeName,
        path: PoliticaPrivSubPageToViewWidget.routePath,
        builder: (context, params) => PoliticaPrivSubPageToViewWidget(
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          nombreCliente: params.getParam(
            'nombreCliente',
            ParamType.String,
          ),
          idTenderosList: params.getParam<DocumentReference>(
            'idTenderosList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
        ),
      ),
      FFRoute(
        name: PoliticaPrivOfTenderoHelpWidget.routeName,
        path: PoliticaPrivOfTenderoHelpWidget.routePath,
        builder: (context, params) => PoliticaPrivOfTenderoHelpWidget(
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          tenderoEmail: params.getParam(
            'tenderoEmail',
            ParamType.String,
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: StartWidget.routeName,
        path: StartWidget.routePath,
        builder: (context, params) => StartWidget(),
      ),
      FFRoute(
        name: AyudaWidget.routeName,
        path: AyudaWidget.routePath,
        builder: (context, params) => AyudaWidget(
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          emailTendero: params.getParam(
            'emailTendero',
            ParamType.String,
          ),
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          nombreTendero: params.getParam(
            'nombreTendero',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: PageLoaderWidget.routeName,
        path: PageLoaderWidget.routePath,
        builder: (context, params) => PageLoaderWidget(),
      ),
      FFRoute(
        name: LoginMsgWidget.routeName,
        path: LoginMsgWidget.routePath,
        builder: (context, params) => LoginMsgWidget(
          nombreIfTendero: params.getParam(
            'nombreIfTendero',
            ParamType.String,
          ),
          nombreIfCliente: params.getParam(
            'nombreIfCliente',
            ParamType.String,
          ),
          tenderoRef: params.getParam(
            'tenderoRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['tenderos'],
          ),
          clienteRef: params.getParam(
            'clienteRef',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['clientes'],
          ),
          nombreTienda: params.getParam(
            'nombreTienda',
            ParamType.String,
          ),
          emailTendero: params.getParam(
            'emailTendero',
            ParamType.String,
          ),
          cedulaCliente: params.getParam(
            'cedulaCliente',
            ParamType.String,
          ),
          idsTenderosList: params.getParam<DocumentReference>(
            'idsTenderosList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
        ),
      ),
      FFRoute(
        name: InicioClienteWidget.routeName,
        path: InicioClienteWidget.routePath,
        builder: (context, params) => InicioClienteWidget(
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          idTenderoList: params.getParam<DocumentReference>(
            'idTenderoList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
          nombreCliente: params.getParam(
            'nombreCliente',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: TiendaBetterWidget.routeName,
        path: TiendaBetterWidget.routePath,
        builder: (context, params) => TiendaBetterWidget(
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          idTenderoList: params.getParam<DocumentReference>(
            'idTenderoList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
          nombreCliente: params.getParam(
            'nombreCliente',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: AjustesClienteWidget.routeName,
        path: AjustesClienteWidget.routePath,
        builder: (context, params) => AjustesClienteWidget(
          nombreCliente: params.getParam(
            'nombreCliente',
            ParamType.String,
          ),
          cedula: params.getParam(
            'cedula',
            ParamType.String,
          ),
          idTenderoList: params.getParam<DocumentReference>(
            'idTenderoList',
            ParamType.DocumentReference,
            isList: true,
            collectionNamePath: ['tenderos'],
          ),
        ),
      ),
      FFRoute(
        name:
            $animated_text_library_sk2998.AnimatedTextExamplesWidget.routeName,
        path:
            $animated_text_library_sk2998.AnimatedTextExamplesWidget.routePath,
        builder: (context, params) =>
            $animated_text_library_sk2998.AnimatedTextExamplesWidget(),
      )
    ].map((r) => r.toRoute(appStateNotifier)).toList(),
  );
}

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/pageLoader';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitWanderingCubes(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
