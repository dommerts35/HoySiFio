import 'dart:async';

import 'serialization_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
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
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'authSigningIn': ParameterData.none(),
  'listaClientes': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
        },
      ),
  'clienteMakeInfo': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
        },
      ),
  'clienteEditInfo': (data) async => ParameterData(
        allParams: {
          'nombre': getParameter<String>(data, 'nombre'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'viviendaProp': getParameter<bool>(data, 'viviendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'customLimit': getParameter<int>(data, 'customLimit'),
        },
      ),
  'clienteInfoEdit': (data) async => ParameterData(
        allParams: {
          'nombre': getParameter<String>(data, 'nombre'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'viviendaProp': getParameter<bool>(data, 'viviendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
        },
      ),
  'historialPagos': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'idTendero': getParameter<DocumentReference>(data, 'idTendero'),
          'nombre': getParameter<String>(data, 'nombre'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'viviendaProp': getParameter<bool>(data, 'viviendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
        },
      ),
  'clienteReadInfo': (data) async => ParameterData(
        allParams: {
          'nombre': getParameter<String>(data, 'nombre'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'viviendaProp': getParameter<bool>(data, 'viviendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'codigoInicioSesion':
              getParameter<String>(data, 'codigoInicioSesion'),
        },
      ),
  'clienteProd-ValorPago': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'indexFromHistorial': getParameter<int>(data, 'indexFromHistorial'),
          'totalPagadoFromHistorial':
              getParameter<double>(data, 'totalPagadoFromHistorial'),
          'transferFromHistorial':
              getParameter<bool>(data, 'transferFromHistorial'),
          'efectivoFromHistorial':
              getParameter<bool>(data, 'efectivoFromHistorial'),
          'totalPorPagarFromHistorial':
              getParameter<double>(data, 'totalPorPagarFromHistorial'),
          'totalGeneralFromHistorial':
              getParameter<double>(data, 'totalGeneralFromHistorial'),
          'idTransaccionPassed':
              getParameter<String>(data, 'idTransaccionPassed'),
          'nombre': getParameter<String>(data, 'nombre'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'vivendaProp': getParameter<bool>(data, 'vivendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
          'totalPassed': getParameter<String>(data, 'totalPassed'),
        },
      ),
  'historialPorCobrar': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'idTendero': getParameter<DocumentReference>(data, 'idTendero'),
          'nombre': getParameter<String>(data, 'nombre'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'viviendaProp': getParameter<bool>(data, 'viviendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
          'totalPassed': getParameter<String>(data, 'totalPassed'),
        },
      ),
  'tenderoRegister': ParameterData.none(),
  'historialVouchers': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'idTendero': getParameter<DocumentReference>(data, 'idTendero'),
          'nombre': getParameter<String>(data, 'nombre'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'viviendaProp': getParameter<bool>(data, 'viviendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
        },
      ),
  'clienteProd-FullPago': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'nombre': getParameter<String>(data, 'nombre'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'vivendaProp': getParameter<bool>(data, 'vivendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
          'totalPassed': getParameter<String>(data, 'totalPassed'),
        },
      ),
  'clienteProd-SelectPago': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'nombre': getParameter<String>(data, 'nombre'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'vivendaProp': getParameter<bool>(data, 'vivendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
          'calcForTotalPorPagar':
              getParameter<double>(data, 'calcForTotalPorPagar'),
          'totalPassed': getParameter<String>(data, 'totalPassed'),
        },
      ),
  'historialSingleVoucherPago': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'indexFromHistorial': getParameter<int>(data, 'indexFromHistorial'),
          'totalPagadoFromHistorial':
              getParameter<double>(data, 'totalPagadoFromHistorial'),
          'transferFromHistorial':
              getParameter<bool>(data, 'transferFromHistorial'),
          'efectivoFromHistorial':
              getParameter<bool>(data, 'efectivoFromHistorial'),
          'totalPorPagarFromHistorial':
              getParameter<double>(data, 'totalPorPagarFromHistorial'),
          'totalGeneralFromHistorial':
              getParameter<double>(data, 'totalGeneralFromHistorial'),
          'idTransaccionPassed':
              getParameter<String>(data, 'idTransaccionPassed'),
          'nombre': getParameter<String>(data, 'nombre'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'vivendaProp': getParameter<bool>(data, 'vivendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
        },
      ),
  'resumenFiadoClienProdsNew': (data) async => ParameterData(
        allParams: {
          'nombreCliente': getParameter<String>(data, 'nombreCliente'),
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'idTendero': getParameter<DocumentReference>(data, 'idTendero'),
          'cedula': getParameter<String>(data, 'cedula'),
        },
      ),
  'historialFullVoucherPago': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'nombre': getParameter<String>(data, 'nombre'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'vivendaProp': getParameter<bool>(data, 'vivendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
        },
      ),
  'politicaPrivSubPageToAccept': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'emailTendero': getParameter<String>(data, 'emailTendero'),
        },
      ),
  'tenderoEditInfo': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'pwPassed': getParameter<String>(data, 'pwPassed'),
          'tenderoEmailPassed':
              getParameter<String>(data, 'tenderoEmailPassed'),
        },
      ),
  'historialVouchersCliente': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'idTendero': getParameter<DocumentReference>(data, 'idTendero'),
          'nombreCliente': getParameter<String>(data, 'nombreCliente'),
          'cedula': getParameter<String>(data, 'cedula'),
        },
      ),
  'clienteVinc': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
          'cedulaPassed': getParameter<String>(data, 'cedulaPassed'),
        },
      ),
  'clienteFirstLogin': (data) async => ParameterData(
        allParams: {
          'idClienteWithNoPsswrd':
              getParameter<DocumentReference>(data, 'idClienteWithNoPsswrd'),
        },
      ),
  'forgotMyPassword': ParameterData.none(),
  'tenderoFirstLogin': (data) async => ParameterData(
        allParams: {
          'idTenderoNoAuth':
              getParameter<DocumentReference>(data, 'idTenderoNoAuth'),
        },
      ),
  'tenderoAyuda': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
        },
      ),
  'pageTutorialForClienteFT': (data) async => ParameterData(
        allParams: {
          'cedula': getParameter<String>(data, 'cedula'),
          'nombreCliente': getParameter<String>(data, 'nombreCliente'),
        },
      ),
  'pageTutorialinfoProdFT': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreCliente': getParameter<String>(data, 'nombreCliente'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'viviendaProp': getParameter<bool>(data, 'viviendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
        },
      ),
  'pageTutorialListaClientesFT': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
        },
      ),
  'pageTutorialListaClientesHelp': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
        },
      ),
  'pageTutorialinfoProdHelp': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
        },
      ),
  'tenderoBankSec': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'pwPassed': getParameter<String>(data, 'pwPassed'),
          'tenderoEmailPassed':
              getParameter<String>(data, 'tenderoEmailPassed'),
        },
      ),
  'historialPagosCliente': (data) async => ParameterData(
        allParams: {
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'idTendero': getParameter<DocumentReference>(data, 'idTendero'),
          'nombreCliente': getParameter<String>(data, 'nombreCliente'),
          'cedula': getParameter<String>(data, 'cedula'),
        },
      ),
  'pageTutorialHistorialCPPFT': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreCliente': getParameter<String>(data, 'nombreCliente'),
          'telf': getParameter<String>(data, 'telf'),
          'isFiando': getParameter<bool>(data, 'isFiando'),
          'idCliente': getParameter<DocumentReference>(data, 'idCliente'),
          'apellido': getParameter<String>(data, 'apellido'),
          'cedula': getParameter<String>(data, 'cedula'),
          'direccionDomicilio':
              getParameter<String>(data, 'direccionDomicilio'),
          'viviendaAlq': getParameter<bool>(data, 'viviendaAlq'),
          'viviendaProp': getParameter<bool>(data, 'viviendaProp'),
          'emailCliente': getParameter<String>(data, 'emailCliente'),
          'totalPassed': getParameter<String>(data, 'totalPassed'),
        },
      ),
  'pageTutorialHistorialCPPHelp': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
        },
      ),
  'termsOfServiceOfTenderoHelp': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
        },
      ),
  'politicasPrivFromMakeCliente': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'emailTendero': getParameter<String>(data, 'emailTendero'),
        },
      ),
  'termsOfServiceOfClienteMake': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
        },
      ),
  'termsOfServiceFromAccept': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
        },
      ),
  'termsOfServiceLogin': (data) async => ParameterData(
        allParams: {
          'cedula': getParameter<String>(data, 'cedula'),
          'nombreCLiente': getParameter<String>(data, 'nombreCLiente'),
        },
      ),
  'politicaPrivSubPageToView': (data) async => ParameterData(
        allParams: {
          'cedula': getParameter<String>(data, 'cedula'),
          'nombreCliente': getParameter<String>(data, 'nombreCliente'),
        },
      ),
  'politicaPrivOfTenderoHelp': (data) async => ParameterData(
        allParams: {
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'tenderoEmail': getParameter<String>(data, 'tenderoEmail'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
        },
      ),
  'start': ParameterData.none(),
  'ayuda': (data) async => ParameterData(
        allParams: {
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'emailTendero': getParameter<String>(data, 'emailTendero'),
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'nombreTendero': getParameter<String>(data, 'nombreTendero'),
        },
      ),
  'pageLoader': ParameterData.none(),
  'loginMsg': (data) async => ParameterData(
        allParams: {
          'nombreIfTendero': getParameter<String>(data, 'nombreIfTendero'),
          'nombreIfCliente': getParameter<String>(data, 'nombreIfCliente'),
          'tenderoRef': getParameter<DocumentReference>(data, 'tenderoRef'),
          'clienteRef': getParameter<DocumentReference>(data, 'clienteRef'),
          'nombreTienda': getParameter<String>(data, 'nombreTienda'),
          'emailTendero': getParameter<String>(data, 'emailTendero'),
          'cedulaCliente': getParameter<String>(data, 'cedulaCliente'),
        },
      ),
  'inicioCliente': (data) async => ParameterData(
        allParams: {
          'cedula': getParameter<String>(data, 'cedula'),
          'nombreCliente': getParameter<String>(data, 'nombreCliente'),
        },
      ),
  'tiendaBetter': (data) async => ParameterData(
        allParams: {
          'cedula': getParameter<String>(data, 'cedula'),
          'nombreCliente': getParameter<String>(data, 'nombreCliente'),
        },
      ),
  'ajustesCliente': (data) async => ParameterData(
        allParams: {
          'nombreCliente': getParameter<String>(data, 'nombreCliente'),
          'cedula': getParameter<String>(data, 'cedula'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
