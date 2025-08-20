import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'politicas_priv_from_make_cliente_model.dart';
export 'politicas_priv_from_make_cliente_model.dart';

class PoliticasPrivFromMakeClienteWidget extends StatefulWidget {
  const PoliticasPrivFromMakeClienteWidget({
    super.key,
    this.tenderoRef,
    this.nombreTendero,
    this.nombreTienda,
    this.emailTendero,
  });

  final DocumentReference? tenderoRef;
  final String? nombreTendero;
  final String? nombreTienda;
  final String? emailTendero;

  static String routeName = 'politicasPrivFromMakeCliente';
  static String routePath = '/politicasPrivFromMakeCliente';

  @override
  State<PoliticasPrivFromMakeClienteWidget> createState() =>
      _PoliticasPrivFromMakeClienteWidgetState();
}

class _PoliticasPrivFromMakeClienteWidgetState
    extends State<PoliticasPrivFromMakeClienteWidget>
    with TickerProviderStateMixin {
  late PoliticasPrivFromMakeClienteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PoliticasPrivFromMakeClienteModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, -17.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: Offset(0.0, -17.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation': AnimationInfo(
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
      'columnOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, -17.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: Offset(0.0, -17.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF1F4F8),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(65.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Container(
                height: 105.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 16.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(
                                  ClienteMakeInfoWidget.routeName,
                                  queryParameters: {
                                    'tenderoRef': serializeParam(
                                      widget.tenderoRef,
                                      ParamType.DocumentReference,
                                    ),
                                    'nombreTienda': serializeParam(
                                      widget.nombreTienda,
                                      ParamType.String,
                                    ),
                                    'tenderoEmail': serializeParam(
                                      widget.emailTendero,
                                      ParamType.String,
                                    ),
                                    'nombreTendero': serializeParam(
                                      widget.nombreTendero,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ).animateOnPageLoad(
                                animationsMap['iconOnPageLoadAnimation']!),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      'HoySíFio',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF14181B),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'POLÍTICA DE PRIVACIDAD',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF14181B),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 44.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color: Color(0x4C4B39EF),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFF4B39EF),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(44.0),
                                  child: Image.asset(
                                    'assets/images/imagen_2025-08-14_123634728.png',
                                    width: 44.0,
                                    height: 44.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  .animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!)
                  .animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation']!,
                  ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: double.infinity,
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
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Text(
                                    'Política de privacidad\nÚltima actualización: 05 de junio de 2025\n\nEsta política de privacidad describe nuestras políticas y procedimientos sobre la recopilación, uso y divulgación de su información cuando utiliza el servicio, y le informa sobre sus derechos de privacidad y cómo la ley lo protege.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.asap(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 16.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              '\n1. Interpretación y definiciones',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text: '\n\n  1.1. Interpretación',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n      Las siguientes definiciones tendrán el mismo significado independientemente de si aparecen en singular o en plural.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text: '\n\n  1.2. Definiciones',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n       Para los fines de esta política de privacidad:\n',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text: '\n      1.2.1. Cuenta: \n',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n      Significa una cuenta única creada para que usted acceda a nuestro servicio o partes de nuestro dervicio.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text: '\n\n      1.2.2. Afiliado: ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n     Significa una entidad que controla, es controlada por o está bajo control común con una parte, donde \"control\" significa la propiedad del 50% o más de las acciones, participación en el capital u otros valores con derecho a voto para la elección de directivos u otra autoridad administrativa.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text: '\n\n     1.2.3. Aplicación: ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nSe refiere a HoySíFio, el programa de software proporcionado por la compañía.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text: '\n\n    1.2.4. Compañía',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text: ': Se refiere a HoySíFio Org.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text: '\n\n\n    1.2.5. País:',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text: ' Ecuador.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text: '\n\n    1.2.6. Dispositivo:',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nCualquier dispositivo que pueda acceder al servicio, como una computadora, un teléfono móvil o una tableta digital.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n     1.2.7. Datos personales:',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nCualquier información relacionada con un individuo identificado o identificable.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text: '\n\n     1.2.8. Servicio',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text: ': se refiere a la aplicación.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n     1.2.9. Proveedor de servicios:',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nCualquier persona natural o jurídica que procesa los datos en nombre de la compañía. Se refiere a empresas o individuos terceros empleados por la compañía para facilitar el servicio, proporcionarlo en nombre de la compañía, realizar servicios relacionados con el servicio o ayudar a la compañía a analizar cómo se utiliza el servicio proveído.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n      1.2.10. Datos de uso: ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nDatos recopilados automáticamente, generados por el uso del servicio o por la infraestructura del servicio mismo (por ejemplo, la duración de una visita a una página).',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text: '\n\n      1.2.11. Usted:',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nEl individuo que accede o utiliza el servicio, o la empresa u otra entidad legal en nombre de la cual dicho individuo accede o utiliza el servicio, según corresponda.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n2. Recopilación y uso de datos personales',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n   2.1. Tipos de datos recopilados',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n       2.1.1. Datos personales:',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nMientras utiliza nuestro servicio, podemos pedirle que nos proporcione cierta información personalmente identificable que puede ser utilizada para contactarlo o identificarlo. Esta información puede incluir, pero no limitarse a:',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n- Dirección de correo electrónico\n- Nombre y apellido\n- Número de teléfono\n- Dirección, estado, provincia, código postal, ciudad',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text: '\n\n      2.1.2. Datos de uso',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nLos datos de uso se recopilan automáticamente al utilizar el servicio e incluyen:',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n- Dirección IP de su dispositivo\n- Tipo y versión del navegador\n- Páginas visitadas dentro del servicio\n- Fecha y hora de la visita\n- Tiempo dedicado a esas páginas\n- Identificadores únicos de dispositivo y otros datos de diagnóstico. \n\nSi accede al servicio a través de un dispositivo móvil, también podemos recopilar información como:',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n- Tipo de dispositivo móvil\n- ID único del dispositivo móvil\n- Sistema operativo del dispositivo\n- Tipo de navegador móvil utilizado ',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n       2.1.3. Uso de sus datos personales',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nLa compañía puede utilizar los datos personales para:\n\n- Proporcionar y mantener el servicio.\n- Gestionar su cuenta.\n- Cumplir con contratos.\n- Contactarlo con actualizaciones o comunicaciones informativas.\n- Ofrecer noticias, ofertas especiales o información sobre otros bienes/servicios similares.\n- Gestionar sus solicitudes.\n- Otros fines como análisis de datos, mejora del servicio o marketing.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n       2.1.4. Divulgación de sus datos personales ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nPodemos compartir su información en las siguientes situaciones:\n\n- Con proveedores de servicios para monitorear y analizar el uso del servicio.\n\n- En transferencias comerciales (venta de activos, fusiones, etc.).\n\n- Con afiliados, socios comerciales u otros usuarios (si interactúa en áreas públicas).\n\n- Con su consentimiento o por requisitos legales.',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n       2.1.5. Seguridad de sus datos ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nMientras implementamos medidas comerciales aceptables para proteger sus datos personales, ningún método de transmisión o almacenamiento electrónico es 100% seguro. ',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n       2.1.6. Privacidad de los niños',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nNuestro servicio no está dirigido a menores de 13 años. Si descubre que un menor nos ha proporcionado datos personales sin consentimiento parental, contáctenos para eliminarlos. ',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\n     2.1.7. Cambios en esta política',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nNotificaremos actualizaciones publicando la nueva política en esta página y actualizando la fecha de \"última actualización\". Se recomienda revisarla periódicamente. ',
                                          style: GoogleFonts.ptSerif(),
                                        ),
                                        TextSpan(
                                          text: '\n\n3. Contáctenos',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.ptSerif(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nSi tiene preguntas sobre esta política, puede contactarnos:\n\nPor correo electrónico: hoysifioapp@outlook.com',
                                          style: GoogleFonts.ptSerif(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.asap(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                  ]
                      .addToStart(SizedBox(height: 10.0))
                      .addToEnd(SizedBox(height: 10.0)),
                ),
              )
                  .animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!)
                  .animateOnActionTrigger(
                    animationsMap['columnOnActionTriggerAnimation']!,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
