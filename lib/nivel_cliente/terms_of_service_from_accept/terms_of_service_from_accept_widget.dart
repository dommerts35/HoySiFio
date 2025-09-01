import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:marketplace_check_internet_connection_library_vrjzhi/custom_code/actions/index.dart'
    as marketplace_check_internet_connection_library_vrjzhi_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'terms_of_service_from_accept_model.dart';
export 'terms_of_service_from_accept_model.dart';

class TermsOfServiceFromAcceptWidget extends StatefulWidget {
  const TermsOfServiceFromAcceptWidget({
    super.key,
    this.tenderoRef,
    this.nombreTienda,
    this.tenderoEmail,
    this.nombreTendero,
  });

  /// Referencia para saber que tendero es
  final DocumentReference? tenderoRef;

  final String? nombreTienda;
  final String? tenderoEmail;
  final String? nombreTendero;

  static String routeName = 'termsOfServiceFromAccept';
  static String routePath = '/termsOfServiceFromAccept';

  @override
  State<TermsOfServiceFromAcceptWidget> createState() =>
      _TermsOfServiceFromAcceptWidgetState();
}

class _TermsOfServiceFromAcceptWidgetState
    extends State<TermsOfServiceFromAcceptWidget>
    with TickerProviderStateMixin {
  late TermsOfServiceFromAcceptModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsOfServiceFromAcceptModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (true) {
        await Future.delayed(
          Duration(
            milliseconds: 30000,
          ),
        );
        _model.isInternetGood =
            await marketplace_check_internet_connection_library_vrjzhi_actions
                .checkInternetConnection();
        if (_model.isInternetGood == false) {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: DialogBtnWidget(
                    titulo: '¡Alerta!',
                    mensaje:
                        'No se ha podido detectar una conexión a internet. Por favor, verifica tu red y vuelve a ingresar.',
                  ),
                ),
              );
            },
          );

          context.goNamed(AuthSigningInWidget.routeName);

          return;
        }
      }
    });

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-10.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: PopScope(
          canPop: false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 25.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 12.0,
                              borderWidth: 1.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.arrow_back_sharp,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.goNamed(
                                  PoliticaPrivSubPageToAcceptWidget.routeName,
                                  queryParameters: {
                                    'tenderoRef': serializeParam(
                                      widget.tenderoRef,
                                      ParamType.DocumentReference,
                                    ),
                                    'nombreTendero': serializeParam(
                                      widget.nombreTendero,
                                      ParamType.String,
                                    ),
                                    'nombreTienda': serializeParam(
                                      widget.nombreTienda,
                                      ParamType.String,
                                    ),
                                    'emailTendero': serializeParam(
                                      widget.tenderoEmail,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                            ).animateOnPageLoad(animationsMap[
                                'iconButtonOnPageLoadAnimation']!),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Términos de servicio',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  'y condiciones de uso de HoySíFio',
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.asap(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                            Container(
                              width: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 770.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 16.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 620.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  1.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                16.0,
                                                                16.0,
                                                                16.0),
                                                    child: Text(
                                                      'Última actualización de términos y condiciones: 04 de agosto de 2025',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .asap(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 16.0),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                '1. ASPECTOS GENERALES',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n      La aplicación móvil HoySíFio (HOYSIFIO) es una herramienta tecnológica desarrollada para que dueños de tiendas de barrio en Ecuador puedan registrar, gestionar y controlar productos fiados a sus clientes.\nEl presente documento describe los términos y condiciones aplicables al uso de HOYSIFIO de parte de las personas que se hayan descargado y registrado exitosamente a HOYSIFIO. \n\nEn este sentido, EL USUARIO DECLARA HABER LEÍDO Y ENTENDIDO TODAS LAS CONDICIONES ESTABLECIDAS EN ESTE DOCUMENTO Y SUS VERSIONES FUTURAS, POR LO QUE MANIFIESTA SU CONFORMIDAD Y ACEPTACIÓN AL MOMENTO DE REGISTRARSE Y/O HACER USO DE HOYSIFIO. CUALQUIER USUARIO QUE NO ACEPTE ESTOS TÉRMINOS Y CONDICIONES DEBERÁ ABSTENERSE A DE USAR HOYSIFIO.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n2.\tUSO DE LA APP HOYSIFIO',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n   2.1. Registro',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n      Para utilizar la aplicación, el USUARIO \n      debe:',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n      2.1.1.\tSer una persona natural mayor de edad (mayor de 18 años) legalmente capaz para contratar y obligarse.\n\n      2.1.2.\tProporcionar información veraz, completa y actualizada.\n\n      2.1.3.\tCrear una cuenta de usuario con una contraseña segura.\n\n      2.1.4.\tAceptar las políticas de privacidad de la aplicación.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nEl USUARIO es responsable de mantener la confidencialidad de su cuenta y contraseña, así como de todas las actividades realizadas bajo su cuenta.',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n3.\tRESPONSABILIDADES DEL USUARIO',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nSin perjuicio de las demás obligaciones contenidas en el documento, el USUARIO debe:',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n       3.1.\tLeer estos Términos y Condiciones; así como, las actualizaciones y modificaciones del mismo.\n\n       3.2.\tMantener actualizados los datos personales y datos de contacto proporcionados en la aplicación e informarle al tendero/cliente de cualquier cambio, especialmente los relativos a dirección de domicilio, trabajo, correo electrónico y/o números telefónicos.\n       \n       3.3.\tNotificar, a través de los canales que se pongan a disposición, cualquier pérdida de su teléfono móvil, hecho o sospecha de un acceso no autorizado a HOYSIFIO o cualquier actividad inusual que pueda constituir una vulneración de seguridad a su dispositivo o a HOYSIFIO.\n',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n4.\tAUTORIZACIONES DE PARTE DEL USUARIO',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nEl USUARIO acepta y autoriza de forma expresa e inequívoca a HOYSIFIO:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n       4.1.\tA realizar procesos de identificación o autenticación a través de reconocimientos biométricos propios de su dispositivo móvil o con otros mecanismos que pudieren identificar al USUARIO, inclusive a través de consultas de información a fuentes legales y/o públicas.\n\n      4.2.\tTodas las medidas de seguridad establecidas y cualquier sistema de seguridad adicional que  HOYSIFIO ponga a disposición a futuro con el objetivo de optimizar o incrementar la seguridad de HOYSIFIO.\n\n      4.3.\tEnviar información, incluyendo publicidad, consultas, transacciones, operaciones, transferencias, compras en establecimientos, retiros y demás servicios a su correo electrónico o número celular registrados en HOYSIFIO.\n\n      4.4.\tQue las claves, registros biométricos, u otro tipo de aceptación electrónica establecidos en HOYSIFIO, constituyen firmas electrónicas y servirán para la aceptación de servicios ofertados a través de la aplicación HOYSIFIO sin la necesidad de una aceptación adicional.\n',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n5.\tSEGURIDAD DE LA PLATAFORMA',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nEl USUARIO durante el proceso de afiliación deberá realizar la creación de un usuario y una contraseña, los cuales constituyen los medios de autenticación que permitirán al desarrollador verificar su identidad para darle acceso a la plataforma.\n\nEl USUARIO acepta que HOYSIFO utilice dichos datos exclusivamente para brindar los servicios disponibles en la plataforma o los solicitados a través de esta.\n\nEl USUARIO no deberá compartir sus contraseñas o claves de seguridad con otra persona y debe mantener esa información en un sitio seguro. El USUARIO es responsable del cuidado de sus claves de acceso y de su dispositivo móvil.\n\nEl USUARIO es responsable de mantener la confidencialidad de su usuario, de sus \ncontraseñas, así como de restringir el acceso a su equipo o dispositivo móvil. \n\nPor seguridad, es obligación del USUARIO a cambiar su clave de manera periódica y/o cuando HOYSIFIO lo solicite y a adoptar las medidas de seguridad en el uso de la plataforma dispuestas por HOYSIFIO.\n\nEl USUARIO es responsable del nivel de seguridad de su dispositivo y de la conexión de este a redes seguras de Internet.\n\nEl USUARIO debe evitar la conexión de su dispositivo a redes públicas o que tengan niveles de restricción de accesos deficientes o inadecuados niveles de seguridad.\n\nAunque HOYSIFIO toma medidas de seguridad estrictas para proteger el contenido de sus comunicaciones y datos confidenciales, el desarrollador no se hace responsable por cualquier ataque malicioso a la plataforma electrónica o al aplicativo instalado en su dispositivo que puedan poner en riesgo la seguridad de la información siempre que tales eventos estuvieran razonablemente fuera del alcance de los controles de seguridad de HOYSIFIO.\n\nSi el USUARIO sospecha que el acceso a la plataforma, ha sido comprometido y/o se percata de transacciones no autorizadas, es su responsabilidad contactarse inmediatamente con el desarrollador a través de los canales de atención definidos para el efecto.\n\nHOYSIFIO se reserva la facultad de limitar o suspender temporal o definitivamente el acceso a la plataforma por razones de seguridad, comerciales o por presentarse eventos que pongan en peligro los intereses de los tenderos, de sus clientes o de terceros, cuando encuentre procedente hacerlo.\n',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n6.\tREQUERIMIENTOS DE HARDWARE Y SOFTWARE',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nAntes de usar, acceder y/o descargar HOYSIFIO el usuario debe verificar que cuenta con el hardware y el software necesarios para acceder a la plataforma. Los requerimientos de hardware y software mínimos que necesitará son los siguientes:\n-\tAcceso a Internet a través de su proveedor de servicio móvil o mediante conexión WiFi segura.\n-\tUn equipo o dispositivo móvil con navegador de Internet, con sistemas operativos iOS o Android (Smartphone) en las versiones actualizadas.\nSi el USUARIO no cuenta con las especificaciones antes mencionadas, ya sea para su equipo o dispositivo móvil, HOYSIFIO no será responsable de la imposibilidad de brindar sus servicios a través de la aplicación.\nEs responsabilidad del USUARIO mantener un equipo o dispositivo que sea compatible con las especificaciones de la plataforma y costos y gastos asociados con la instalación de HOYSIFIO y todos los costos asociados con su proveedor de acceso a Internet o de servicio inalámbrico y todos los servicios y/o canales de comunicación utilizados para acceder a la plataforma.\n',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n7.\tLIMITACIÓN DE RESPONSABILIDAD ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nEl desarrollador no será responsable por los daños o perjuicios directos o indirectos que se produzcan por el uso inadecuado, incorrecto o desprolijo de parte del USUARIO de HOYSIFIO o información errónea ingresada. \n\nEl USUARIO tiene la obligación de verificar los números de cuenta, montos y demás información necesaria para realizar las transacciones.\n\nEl desarrollador no es responsable por la incompatibilidad con el software del dispositivo móvil desde el cual el USUARIO accede a HOYSIFIO.\n\nEL USUARIO es responsable de todas las interacciones realizadas en HOYSIFIO; así como, de la información ingresada para guardar transacciones. \n\nEl desarrollador no está obligado a tomar medidas posteriores para confirmar o autenticar tales instrucciones y tomará acción sobre ellas tan pronto las reciba, sin necesidad de confirmación posterior.\n\nEl desarrollador no será responsable por deficiencias en el grado de exactitud, de la totalidad, de la disponibilidad o de la conveniencia de dicha información.\n\nSalvo que la ley exija lo contrario, de ninguna manera el desarrollador es legalmente responsable ante el USUARIO por concepto de daños especiales, indirectos o consecuentes derivados del uso de HOYSIFIO de parte del USUARIO.\n\nEl desarrollador no asume ni podrá adjudicársele responsabilidad alguna, por daños causados por programas maliciosos que puedan perjudicar en el equipo, dispositivo o alguna otra propiedad del USUARIO en relación con su acceso a HOYSIFIO.\n',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n8.\tCAPACIDAD',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nEl USUARIO declara que tiene capacidad legal para aceptar y obligarse con este instrumento, por lo que exime de toda responsabilidad a HOYSIFIO y al desarrollador en caso de que estas declaraciones sean falsas, inexactas o no se ajusten totalmente a la verdad.',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n9.\tNOTIFICACIONES',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nLas notificaciones respectivas con respecto a uso de HOYSIFIO y la CUENTA DE CLIENTE Y CUENTA DE TENDERO serán realizadas al correo electrónico y/o celulares registrados por el USUARIO en HOYSIFIO. En este sentido, cualquier notificación realizada por estos medios son válidas y no requieren comunicación adicional.',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n10.\tMODIFICACIONES',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nHOYSIFIO se reserva el derecho de modificar el presente instrumento en todo o en parte en cualquier tiempo. En este caso, HOYSIFIO comunicará al USUARIO sobre los cambios efectuados a través de los canales que estime pertinente.',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n11.\tORIGEN LÍCITO DE FONDOS',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nEL USUARIO declara que los fondos objeto de la(s) transacción(es) registradas en HOYSIFIO, no provienen de/ni serán destinados a ninguna actividad ilegal o delictiva. Declara adicionalmente que no tiene relación alguna con el lavado de activos, financiamiento del terrorismo y otros delitos y más infracciones previstas en la Ley Orgánica de Prevención, Detección y Erradicación del Delito de Lavado de Activos y del Financiamiento de Delitos y en la normativa vigente.\n\nEl USUARIO expresamente autoriza al desarrollador a realizar las verificaciones y debida diligencia correspondientes e informar de manera inmediata y documentada a la(s) autoridad(es) competente(s) en casos de investigación o cuando se detecten transacciones inusuales e injustificadas, por lo que El USUARIO no ejercerá ningún reclamo o acción judicial.\n',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n12.\tTERMINACIÓN',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nEl USUARIO reconoce y acepta libre y voluntariamente el derecho que tiene HOYSIFIO de rechazar una solicitud de registro, o de cancelar o suspender, temporal o definitivamente el uso de HOYSIFIO, sin que tal decisión genere para el USUARIO derechos de indemnización o resarcimiento.\nEl USUARIO tiene el derecho de dejar de usar HOYSIFIO en cualquier tiempo.\n',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n13.\tPROPIEDAD INTELECTUAL',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nEl desarrollador es titular de los derechos sobre la propiedad intelectual e industrial de la aplicación; así como, el contenido, programas de computación, códigos, bases de datos, redes, gráficos, textos, graficas, logos, iconos, imágenes, archivos de audio, material informático, publicitario, fotográfico, contenido multimedia, planes de marketing, estrategias, datos técnicos, know-how, bocetos y dibujos de ingeniería, marcas figurativas o denominativas, marcas de servicio, diseños industriales y, en general, sobre el contenido que se encuentra contenido en HOYSIFIO.\n\nEl USUARIO no puede realizar ingeniería inversa de HOYSIFIO o cualquier otra plataforma o sitio web de HOYSIFIO y no puede anular, modificar o alterar el código fuente o medida técnica o tecnológica aplicada para proteger los derechos de propiedad intelectual de HOYSIFIO o las seguridades aplicadas.\n\nCualquier uso no autorizado de la propiedad intelectual o industrial de HOYSIFIO constituye violación de los presentes Términos y Condiciones. El desarrollador se reserva el derecho de iniciar las acciones legales que considere pertinente por violaciones a la propiedad intelectual o industrial de HOYSIFIO.\n\nEn ningún caso el uso de la plataforma implica renuncia, transmisión, permiso de uso, licencia o cesión de derechos de la propiedad intelectual o industrial HOYSIFIO.\n',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n14.\tTRATAMIENTO DE DATOS PERSONALES',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .ptSerif(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nEl USUARIO como titular de sus datos personales conoce que HOYSIFIO será el responsable del tratamiento de sus datos personales, en cumplimiento de la Constitución de la República, la Ley Orgánica de Protección de Datos Personales y demás normativa aplicable.\n\nCon la finalidad de tener un esquema adecuado de tratamiento de sus datos personales, el USUARIO autoriza libre y voluntariamente al desarrollador para que realicen el tratamiento de sus datos personales, crediticios y/o datos no públicos, (DATOS o INFORMACIÓN), incluyendo aquellos que pueda entregar posteriormente. \n\nPor lo mencionado, acepta y autoriza el tratamiento inclusive de sus datos sensibles, tales como biométricos, de salud, crediticios, transaccionales, datos sujetos a sigilo o reserva, entre otros, mismos que son necesarios para que la aplicación brinde un servicio adecuado y de calidad.\n\nEl tratamiento de los DATOS tendrá las siguientes finalidades: elaborar y/o segmentar perfiles; comercializar y promocionar (incluyendo el envío de publicidad por cualquier medio) diferentes productos y servicios financieros y/o comerciales.\n\nPara efectos de esta autorización se entiende por “tratamiento” a cualquier operación o conjunto de operaciones realizadas sobre los DATOS ya sea por procedimientos técnicos de carácter automatizado, parcialmente automatizado o no automatizado, tales como, pero sin limitarse a: la recogida, recopilación, obtención, registro, organización, estructuración, evaluación, análisis, conservación, custodia, adaptación, modificación, eliminación, indexación, extracción, consulta, elaboración, utilización, procesamiento, consolidación, anonimización, seudonimización, posesión, aprovechamiento, rentabilización, distribución, cesión, comunicación, disposición, divulgación, o transferencia, o cualquier otra forma de habilitación de acceso, cotejo, interconexión, limitación, supresión, destrucción y, en general, cualquier uso de los DATOS.\n\nDe igual forma autoriza expresa y específicamente a HOYSIFIO a tratar y mantener los DATOS, incluso una vez finalizada cualquier relación contractual y/o de prestación de servicios, en los plazos establecidos por ley, con el objeto de que HOYSIFIO pueda prestar servicios, elaborar y segmentar perfiles, realizar análisis crediticios incluso mediante técnicas automáticas que utilicen los datos actuales, históricos y estadísticos, para la valoración de riesgos, confección y análisis de nuevas propuestas comerciales de servicios de cualquier tipo, inclusive como elemento de análisis en etapas pre-contractuales, contractuales y post- contractuales y, con el fin de remitirme comunicaciones comerciales y/o contactarme por cualquier medio para la oferta, promoción y contratación de productos y/o servicios que puedan ser de interés del USUARIO.\n\nPara cumplir con las finalidades previamente descritas, los DATOS, podrán consultarse, compartirse, transferirse y/o comunicarse a sus proveedores, subsidiarias, sociedades afiliadas, relacionadas y/o auxiliares, empresas encargadas del tratamiento de datos y/o sociedades con las que HOYSIFIO mantenga relación a nivel nacional o internacional. \n\nPara el efecto, HOYSIFIO adoptará las medidas técnicas y organizativas aplicables para cumplir con la confidencialidad y seguridad correspondientes. El desarrollador garantiza la seguridad y confidencialidad en el tratamiento de los datos personales de conformidad con lo dispuesto en la ley y la normativa aplicable.\n\nCualquier comunicación relacionada con los derechos del USUARIO, como es el caso de acceso, eliminación, rectificación, actualización, revisión, portabilidad y oposición, de los cuales tiene conocimiento, podrá dirigirla a la dirección de correo electrónico hoysifioapp@outlook.com.\n \nCon esta aceptación garantizo la veracidad de los datos entregados a HOYSIFIO y me comprometo a comunicarle inmediatamente cualquier variación sobre los mismos. \n\nHOYSIFIO no será responsable de los resultados derivados del procesamiento de información que se realicen como consecuencia de datos erróneos, desactualizados o inexactos. \n\nHOYSIFIO se reserva el derecho a no prestar los servicios correspondientes en caso de que se proporcione datos erróneos, desactualizados o inexactos. \n\nReconozco el derecho que tiene HOYSIFIO a limitar o terminar la relación comercial en el caso de que esta autorización sea revocada.\n',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n15.\tCARGOS POR SERVICIO',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nHOYSIFIO podrá cobrar cargos por los servicios y operaciones que presta, cuyos valores serán fijados de acuerdo con la normativa vigente y serán publicados por los mecanismos que defina el desarrollador. \n\nDe igual manera, acepta y conoce que dichas tarifas y cargos pueden ser modificados en cualquier tiempo, debiendo HOYSIFIO hacer conocer al USUARIO de tal modificación, inclusive a través de la divulgación a través de medios y/o canales electrónicos.',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\n16.\tSOLUCIÓN DE CONTROVERSIAS',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20.0,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '\n\nPara el caso de juicio por cualquier causa, entre otras, el USUARIO hace una renuncia general de domicilio y queda sometido a los jueces o tribunales del lugar donde se encuentre o a los de la ciudad de su domicilio o a los de la ciudad de Quito, a elección de HOYSIFIO y al procedimiento que por Ley corresponda.',
                                                            style: GoogleFonts
                                                                .ptSerif(
                                                              fontSize: 17.0,
                                                            ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 770.0,
                    ),
                    decoration: BoxDecoration(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
