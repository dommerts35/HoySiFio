import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/components/dialog_two_btns_widget.dart';
import '/components/nav_bar_cliente_widget.dart';
import '/components_cliente/about_us/about_us_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marketplace_check_internet_connection_library_vrjzhi/custom_code/actions/index.dart'
    as marketplace_check_internet_connection_library_vrjzhi_actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'inicio_cliente_model.dart';
export 'inicio_cliente_model.dart';

class InicioClienteWidget extends StatefulWidget {
  const InicioClienteWidget({
    super.key,
    this.cedula,
    this.idTenderoList,
    this.nombreCliente,
  });

  final String? cedula;
  final List<DocumentReference>? idTenderoList;
  final String? nombreCliente;

  static String routeName = 'inicioCliente';
  static String routePath = '/inicioCliente';

  @override
  State<InicioClienteWidget> createState() => _InicioClienteWidgetState();
}

class _InicioClienteWidgetState extends State<InicioClienteWidget>
    with TickerProviderStateMixin {
  late InicioClienteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InicioClienteModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.queryOnLoadClientes = await queryClientesRecordOnce(
        queryBuilder: (clientesRecord) => clientesRecord
            .whereIn('cliente.idTendero', widget.idTenderoList)
            .where(
              'cliente.cedula',
              isEqualTo: widget.cedula,
            ),
      );
      _model.tiempoGlobalToString = dateTimeFormat(
        "H",
        getCurrentTimestamp,
        locale: FFLocalizations.of(context).languageCode,
      );
      safeSetState(() {});
      _model.tiempoResultCliente = await actions.retornarStringAInt(
        _model.tiempoGlobalToString!,
      );
      _model.tiempo = _model.tiempoResultCliente;
      safeSetState(() {});
      if (FFAppState().isFirstTimeClienteTiendaList == true) {
        FFAppState().isFirstTimeClienteTiendaList = false;
        safeSetState(() {});

        context.goNamed(
          PageTutorialForClienteFTWidget.routeName,
          queryParameters: {
            'cedula': serializeParam(
              widget.cedula,
              ParamType.String,
            ),
            'idTenderoList': serializeParam(
              widget.idTenderoList,
              ParamType.DocumentReference,
              isList: true,
            ),
            'nombreCliente': serializeParam(
              widget.nombreCliente,
              ParamType.String,
            ),
          }.withoutNulls,
        );

        return;
      }
      while (true) {
        await Future.delayed(
          Duration(
            milliseconds: 5000,
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
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => StreamBuilder<List<ClientesRecord>>(
        stream: queryClientesRecord(
          queryBuilder: (clientesRecord) => clientesRecord.where(
            'cliente.cedula',
            isEqualTo: widget.cedula,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitWanderingCubes(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 50.0,
                  ),
                ),
              ),
            );
          }
          List<ClientesRecord> inicioClienteClientesRecordList = snapshot.data!;

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: PopScope(
              canPop: false,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.6,
                                  child: CarouselSlider(
                                    items: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/tendero2.jpg',
                                          width: double.infinity,
                                          height: 400.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/tuxpi.com.1755820815.jpg',
                                          width: double.infinity,
                                          height: 400.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/imagen_2025-08-21_190322408.png',
                                          width: double.infinity,
                                          height: 400.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/tendero3.jpg',
                                          width: 200.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                    carouselController:
                                        _model.carouselController ??=
                                            CarouselSliderController(),
                                    options: CarouselOptions(
                                      initialPage: 1,
                                      viewportFraction: 1.0,
                                      disableCenter: true,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.15,
                                      enableInfiniteScroll: true,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: true,
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      autoPlayInterval:
                                          Duration(milliseconds: (800 + 3000)),
                                      autoPlayCurve: Curves.linear,
                                      pauseAutoPlayInFiniteScroll: true,
                                      onPageChanged: (index, _) =>
                                          _model.carouselCurrentIndex = index,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 60.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: AboutUsWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 8.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.info_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              Text(
                                                'Info',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.asap(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderRadius: 12.0,
                                          borderWidth: 1.0,
                                          icon: Icon(
                                            Icons.logout,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            var _shouldSetState = false;
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Container(
                                                      height: 200.0,
                                                      child:
                                                          DialogTwoBtnsWidget(
                                                        titulo:
                                                            '¿Desea cerrar sesión?',
                                                        mensaje:
                                                            'Sus datos se guardarán automáticamente.',
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(
                                                () => _model.isLogoff = value));

                                            _shouldSetState = true;
                                            if (_model.isLogoff!) {
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation'] !=
                                                  null) {
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }

                                              context.goNamed(
                                                AuthSigningInWidget.routeName,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            } else {
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: AutoSizeText(
                                      '¡Hola ${inicioClienteClientesRecordList.firstOrNull?.cliente.nombre}!',
                                      textAlign: TextAlign.start,
                                      minFontSize: 4.0,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  if (_model.tiempoGlobalToString != null &&
                                      _model.tiempoGlobalToString != '')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            () {
                                              if ((_model.tiempo! >= 6) &&
                                                  (_model.tiempo! < 12)) {
                                                return '¡Buenos días!';
                                              } else if ((_model.tiempo! >=
                                                      12) &&
                                                  (_model.tiempo! < 18)) {
                                                return '¡Buenas tardes!';
                                              } else {
                                                return '¡Buenas noches!';
                                              }
                                            }(),
                                            'Buenos dias',
                                          ),
                                          minFontSize: 6.0,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        if ((_model.tiempo! >= 6) &&
                                            (_model.tiempo! < 12))
                                          Lottie.asset(
                                            'assets/jsons/sol.json',
                                            width: 30.0,
                                            height: 50.0,
                                            fit: BoxFit.contain,
                                            animate: true,
                                          ),
                                        if ((_model.tiempo! >= 12) &&
                                            (_model.tiempo! < 18))
                                          Lottie.asset(
                                            'assets/jsons/cloudy.json',
                                            width: 30.0,
                                            height: 50.0,
                                            fit: BoxFit.contain,
                                            animate: true,
                                          ),
                                        if (valueOrDefault<bool>(
                                          () {
                                            if ((_model.tiempo! >= 6) &&
                                                (_model.tiempo! < 12)) {
                                              return false;
                                            } else if ((_model.tiempo! >= 12) &&
                                                (_model.tiempo! < 18)) {
                                              return false;
                                            } else {
                                              return true;
                                            }
                                          }(),
                                          false,
                                        ))
                                          Lottie.asset(
                                            'assets/jsons/luna.json',
                                            width: 30.0,
                                            height: 50.0,
                                            fit: BoxFit.contain,
                                            animate: true,
                                          ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            wrapWithModel(
                              model: _model.navBarClienteModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: NavBarClienteWidget(
                                activePage: 'Inicio',
                                nombreCliente: widget.nombreCliente,
                                cedula: widget.cedula,
                                idTenderoList: widget.idTenderoList,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                    .animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!)
                    .animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation']!,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
