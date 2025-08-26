import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/components/dialog_two_btns_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components_nivel_tendero/empty_clientes_list/empty_clientes_list_widget.dart';
import '/components_nivel_tendero/empty_clientes_list_fiando/empty_clientes_list_fiando_widget.dart';
import '/components_nivel_tendero/empty_clientes_list_no_fiando/empty_clientes_list_no_fiando_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:marketplace_check_internet_connection_library_vrjzhi/custom_code/actions/index.dart'
    as marketplace_check_internet_connection_library_vrjzhi_actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'lista_clientes_model.dart';
export 'lista_clientes_model.dart';

class ListaClientesWidget extends StatefulWidget {
  const ListaClientesWidget({
    super.key,
    this.tenderoRef,
    String? nombreTienda,
    this.tenderoEmail,
    this.nombreTendero,
  }) : this.nombreTienda = nombreTienda ?? '-';

  /// Referencia
  final DocumentReference? tenderoRef;

  final String nombreTienda;
  final String? tenderoEmail;
  final String? nombreTendero;

  static String routeName = 'listaClientes';
  static String routePath = '/listaClientes';

  @override
  State<ListaClientesWidget> createState() => _ListaClientesWidgetState();
}

class _ListaClientesWidgetState extends State<ListaClientesWidget>
    with TickerProviderStateMixin {
  late ListaClientesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaClientesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.tenderoReadLoad =
              await TenderosRecord.getDocumentOnce(widget.tenderoRef!);
          _model.tiempoGlobalToString = dateTimeFormat(
            "H",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          );
          safeSetState(() {});
          _model.tiempoResult = await actions.retornarStringAInt(
            _model.tiempoGlobalToString!,
          );
          _model.tiempo = _model.tiempoResult;
          safeSetState(() {});
          if (FFAppState().isFirstTimeTenderoList == true) {
            FFAppState().isFirstTimeTenderoList = false;
            safeSetState(() {});

            context.goNamed(
              PageTutorialListaClientesFTWidget.routeName,
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
                  widget.tenderoEmail,
                  ParamType.String,
                ),
                'nombreTendero': serializeParam(
                  widget.nombreTendero,
                  ParamType.String,
                ),
              }.withoutNulls,
            );
          }
        }),
        Future(() async {
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
        }),
      ]);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
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
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
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
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: 220.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 40.0, 20.0, 0.0),
                            child: StreamBuilder<TenderosRecord>(
                              stream: TenderosRecord.getDocument(
                                  widget.tenderoRef!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitWanderingCubes(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }

                                final containerTenderosRecord = snapshot.data!;

                                return Container(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 70.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Opacity(
                                        opacity: 0.0,
                                        child: FlutterFlowIconButton(
                                          icon: Icon(
                                            Icons.logout,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('iconNone pressed ...');
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            containerTenderosRecord.displayName,
                                            'nombreTienda',
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          minFontSize: 4.0,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderRadius: 8.0,
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
                                                      height: 300.0,
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
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              await authManager.signOut();
                                              GoRouter.of(context)
                                                  .clearRedirectLocation();

                                              if (animationsMap[
                                                      'columnOnActionTriggerAnimation'] !=
                                                  null) {
                                                await animationsMap[
                                                        'columnOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }

                                              context.goNamedAuth(
                                                AuthSigningInWidget.routeName,
                                                context.mounted,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 1000),
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
                                );
                              },
                            ),
                          ),
                        ),
                        StreamBuilder<TenderosRecord>(
                          stream:
                              TenderosRecord.getDocument(widget.tenderoRef!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitWanderingCubes(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }

                            final rowTenderosRecord = snapshot.data!;

                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (rowTenderosRecord.photoUrl != '')
                                  Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Lottie.asset(
                                          'assets/jsons/actualHoySiFioLoad.json',
                                          width: 73.0,
                                          height: 100.0,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    rowTenderosRecord.photoUrl,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: rowTenderosRecord
                                                      .photoUrl,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: rowTenderosRecord.photoUrl,
                                            transitionOnUserGestures: true,
                                            child: Container(
                                              width: 80.0,
                                              height: 80.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                rowTenderosRecord.photoUrl,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      if (_model.tiempoGlobalToString != null &&
                                          _model.tiempoGlobalToString != '')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 230.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    valueOrDefault<String>(
                                                      () {
                                                        if ((_model.tiempo! >=
                                                                6) &&
                                                            (_model.tiempo! <
                                                                12)) {
                                                          return '¡Buenos días!';
                                                        } else if ((_model
                                                                    .tiempo! >=
                                                                12) &&
                                                            (_model.tiempo! <
                                                                18)) {
                                                          return '¡Buenas tardes!';
                                                        } else {
                                                          return '¡Buenas noches!';
                                                        }
                                                      }(),
                                                      'Buenos dias',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    minFontSize: 6.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .quicksand(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                if ((_model.tiempo! >= 6) &&
                                                    (_model.tiempo! < 12))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Lottie.asset(
                                                      'assets/jsons/sol.json',
                                                      width: 30.0,
                                                      height: 50.0,
                                                      fit: BoxFit.contain,
                                                      animate: true,
                                                    ),
                                                  ),
                                                if ((_model.tiempo! >= 12) &&
                                                    (_model.tiempo! < 18))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Lottie.asset(
                                                      'assets/jsons/cloudy.json',
                                                      width: 30.0,
                                                      height: 50.0,
                                                      fit: BoxFit.contain,
                                                      animate: true,
                                                    ),
                                                  ),
                                                if (valueOrDefault<bool>(
                                                  () {
                                                    if ((_model.tiempo! >= 6) &&
                                                        (_model.tiempo! < 12)) {
                                                      return false;
                                                    } else if ((_model
                                                                .tiempo! >=
                                                            12) &&
                                                        (_model.tiempo! < 18)) {
                                                      return false;
                                                    } else {
                                                      return true;
                                                    }
                                                  }(),
                                                  false,
                                                ))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Lottie.asset(
                                                      'assets/jsons/luna.json',
                                                      width: 30.0,
                                                      height: 50.0,
                                                      fit: BoxFit.contain,
                                                      animate: true,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      Container(
                                        width: 190.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: StreamBuilder<
                                                  List<ClientesRecord>>(
                                                stream: queryClientesRecord(
                                                  queryBuilder:
                                                      (clientesRecord) =>
                                                          clientesRecord.where(
                                                    'cliente.idTendero',
                                                    isEqualTo:
                                                        widget.tenderoRef,
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            SpinKitWanderingCubes(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ClientesRecord>
                                                      textClientesRecordList =
                                                      snapshot.data!;

                                                  return AutoSizeText(
                                                    () {
                                                      if (_model
                                                              .tabBarCurrentIndex ==
                                                          0) {
                                                        return 'Num. Clientes: ${textClientesRecordList.length.toString()}';
                                                      } else if (_model
                                                              .tabBarCurrentIndex ==
                                                          1) {
                                                        return 'Clientes fiando: ${textClientesRecordList.where((e) => e.cliente.isFiando).toList().length.toString()}';
                                                      } else {
                                                        return 'Clientes sin fiar: ${textClientesRecordList.where((e) => !e.cliente.isFiando).toList().length.toString()}';
                                                      }
                                                    }(),
                                                    textAlign: TextAlign.center,
                                                    minFontSize: 6.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .quicksand(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                unselectedLabelStyle: TextStyle(),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).secondary,
                                indicatorWeight: 3.0,
                                tabs: [
                                  Tab(
                                    text: 'Todos',
                                  ),
                                  Tab(
                                    text: 'Fiando',
                                  ),
                                  Tab(
                                    text: 'Sin Fiar',
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Stack(
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          child: ClipRRect(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.59,
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.59,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Stack(
                                                              children: [
                                                                Opacity(
                                                                  opacity: 0.2,
                                                                  child: Lottie
                                                                      .asset(
                                                                    'assets/jsons/forBackground.json',
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    animate:
                                                                        true,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          ClientesRecord>>(
                                                                    stream:
                                                                        queryClientesRecord(
                                                                      queryBuilder:
                                                                          (clientesRecord) =>
                                                                              clientesRecord.where(
                                                                        'cliente.idTendero',
                                                                        isEqualTo:
                                                                            widget.tenderoRef,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                SpinKitWanderingCubes(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ClientesRecord>
                                                                          listViewClientesRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      if (listViewClientesRecordList
                                                                          .isEmpty) {
                                                                        return Center(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                400.0,
                                                                            height:
                                                                                360.0,
                                                                            child:
                                                                                EmptyClientesListWidget(),
                                                                          ),
                                                                        );
                                                                      }

                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            listViewClientesRecordList.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                SizedBox(height: 5.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                listViewIndex) {
                                                                          final listViewClientesRecord =
                                                                              listViewClientesRecordList[listViewIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                8.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                badges.Badge(
                                                                              badgeContent: Text(
                                                                                '!',
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.asap(
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              showBadge: listViewClientesRecord.cliente.dataTypeVouchers.where((e) => e.estadoVoucher == 'Pendiente').toList().length >= 1,
                                                                              shape: badges.BadgeShape.circle,
                                                                              badgeColor: FlutterFlowTheme.of(context).primary,
                                                                              elevation: 4.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                              position: badges.BadgePosition.topEnd(),
                                                                              animationType: badges.BadgeAnimationType.scale,
                                                                              toAnimate: true,
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.goNamed(
                                                                                    ClienteInfoEditWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'nombre': serializeParam(
                                                                                        listViewClientesRecord.cliente.nombre,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'telf': serializeParam(
                                                                                        listViewClientesRecord.cliente.telf,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'isFiando': serializeParam(
                                                                                        listViewClientesRecord.cliente.isFiando,
                                                                                        ParamType.bool,
                                                                                      ),
                                                                                      'idCliente': serializeParam(
                                                                                        listViewClientesRecord.cliente.idCliente,
                                                                                        ParamType.DocumentReference,
                                                                                      ),
                                                                                      'apellido': serializeParam(
                                                                                        listViewClientesRecord.cliente.apellido,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'cedula': serializeParam(
                                                                                        listViewClientesRecord.cliente.cedula,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'direccionDomicilio': serializeParam(
                                                                                        listViewClientesRecord.cliente.direccionDomicilio,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'emailCliente': serializeParam(
                                                                                        listViewClientesRecord.cliente.emailCliente,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                      'viviendaAlq': serializeParam(
                                                                                        listViewClientesRecord.cliente.viviendaAlq,
                                                                                        ParamType.bool,
                                                                                      ),
                                                                                      'viviendaProp': serializeParam(
                                                                                        listViewClientesRecord.cliente.viviendaPropia,
                                                                                        ParamType.bool,
                                                                                      ),
                                                                                      'tenderoRef': serializeParam(
                                                                                        widget.tenderoRef,
                                                                                        ParamType.DocumentReference,
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
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 2.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      gradient: LinearGradient(
                                                                                        colors: [
                                                                                          Color(0xFFD3EAFF),
                                                                                          FlutterFlowTheme.of(context).secondaryBackground
                                                                                        ],
                                                                                        stops: [0.0, 1.0],
                                                                                        begin: AlignmentDirectional(0.0, -1.0),
                                                                                        end: AlignmentDirectional(0, 1.0),
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          if (listViewClientesRecord.profileUrl != '')
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                width: 70.0,
                                                                                                height: 70.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  shape: BoxShape.circle,
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 3.0,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Stack(
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Lottie.asset(
                                                                                                        'assets/jsons/actualHoySiFioLoad.json',
                                                                                                        width: 100.0,
                                                                                                        height: 100.0,
                                                                                                        fit: BoxFit.contain,
                                                                                                        animate: true,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 70.0,
                                                                                                      height: 70.0,
                                                                                                      clipBehavior: Clip.antiAlias,
                                                                                                      decoration: BoxDecoration(
                                                                                                        shape: BoxShape.circle,
                                                                                                      ),
                                                                                                      child: Image.network(
                                                                                                        listViewClientesRecord.profileUrl,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          Flexible(
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 0.0, 5.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      '${valueOrDefault<String>(
                                                                                                        listViewClientesRecord.cliente.nombre,
                                                                                                        '---',
                                                                                                      )} ${listViewClientesRecord.cliente.apellido}',
                                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.asap(
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    AutoSizeText(
                                                                                                      'CI: ${valueOrDefault<String>(
                                                                                                        listViewClientesRecord.cliente.cedula,
                                                                                                        '000',
                                                                                                      )}',
                                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.asap(
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'Comprobantes: ${listViewClientesRecord.cliente.dataTypeVouchers.where((e) => e.estadoVoucher == 'Pendiente').toList().length.toString()}',
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.asap(
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Flexible(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'Fiando: \$${formatNumber(
                                                                                                                    listViewClientesRecord.cliente.totalDeudaCompleta,
                                                                                                                    formatType: FormatType.custom,
                                                                                                                    format: '#0.00',
                                                                                                                    locale: '',
                                                                                                                  )}',
                                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                        font: GoogleFonts.asap(
                                                                                                                          fontWeight: FontWeight.w600,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                        ),
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          if (listViewClientesRecord.cliente.isFiando)
                                                                                            Icon(
                                                                                              Icons.radio_button_checked,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 24.0,
                                                                                            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Stack(
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                            child: Stack(
                                              children: [
                                                Opacity(
                                                  opacity: 0.2,
                                                  child: Lottie.asset(
                                                    'assets/jsons/forBackground.json',
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    fit: BoxFit.contain,
                                                    animate: true,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<ClientesRecord>>(
                                                    stream: queryClientesRecord(
                                                      queryBuilder:
                                                          (clientesRecord) =>
                                                              clientesRecord
                                                                  .where(
                                                                    'cliente.isFiando',
                                                                    isEqualTo:
                                                                        true,
                                                                  )
                                                                  .where(
                                                                    'cliente.idTendero',
                                                                    isEqualTo:
                                                                        widget
                                                                            .tenderoRef,
                                                                  ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitWanderingCubes(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ClientesRecord>
                                                          listViewClientesRecordList =
                                                          snapshot.data!;
                                                      if (listViewClientesRecordList
                                                          .isEmpty) {
                                                        return Center(
                                                          child: Container(
                                                            width: 400.0,
                                                            height: 360.0,
                                                            child:
                                                                EmptyClientesListFiandoWidget(),
                                                          ),
                                                        );
                                                      }

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                          0,
                                                          0,
                                                          0,
                                                          20.0,
                                                        ),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewClientesRecordList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 5.0),
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewClientesRecord =
                                                              listViewClientesRecordList[
                                                                  listViewIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        8.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: badges.Badge(
                                                              badgeContent:
                                                                  Text(
                                                                '!',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .asap(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              showBadge: listViewClientesRecord
                                                                      .cliente
                                                                      .dataTypeVouchers
                                                                      .where((e) =>
                                                                          e.estadoVoucher ==
                                                                          'Pendiente')
                                                                      .toList()
                                                                      .length >=
                                                                  1,
                                                              shape: badges
                                                                  .BadgeShape
                                                                  .circle,
                                                              badgeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              elevation: 4.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              position: badges
                                                                      .BadgePosition
                                                                  .topEnd(),
                                                              animationType: badges
                                                                  .BadgeAnimationType
                                                                  .scale,
                                                              toAnimate: true,
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    ClienteInfoEditWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'nombre':
                                                                          serializeParam(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .nombre,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'telf':
                                                                          serializeParam(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .telf,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'isFiando':
                                                                          serializeParam(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .isFiando,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'idCliente':
                                                                          serializeParam(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .idCliente,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'apellido':
                                                                          serializeParam(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .apellido,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'cedula':
                                                                          serializeParam(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .cedula,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'tenderoRef':
                                                                          serializeParam(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .idTendero,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'direccionDomicilio':
                                                                          serializeParam(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .direccionDomicilio,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'viviendaAlq':
                                                                          serializeParam(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .viviendaAlq,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'viviendaProp':
                                                                          serializeParam(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .viviendaPropia,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'emailCliente':
                                                                          serializeParam(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .emailCliente,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      3.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              3.0,
                                                                          color:
                                                                              Color(0x20000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            1.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          Color(
                                                                              0xFFD3EAFF),
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground
                                                                        ],
                                                                        stops: [
                                                                          0.0,
                                                                          1.0
                                                                        ],
                                                                        begin: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        end: AlignmentDirectional(
                                                                            0,
                                                                            1.0),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          if (listViewClientesRecord.profileUrl !=
                                                                              '')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 80.0,
                                                                                height: 80.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  shape: BoxShape.circle,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    width: 3.0,
                                                                                  ),
                                                                                ),
                                                                                child: Stack(
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 80.0,
                                                                                      height: 80.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        listViewClientesRecord.profileUrl,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    Lottie.asset(
                                                                                      'assets/jsons/actualHoySiFioLoad.json',
                                                                                      width: 200.0,
                                                                                      height: 200.0,
                                                                                      fit: BoxFit.contain,
                                                                                      animate: true,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 0.0, 8.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'Cliente: ${listViewClientesRecord.cliente.nombre} ${listViewClientesRecord.cliente.apellido}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.asap(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    'CI: ${listViewClientesRecord.cliente.cedula}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.asap(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Comprobantes: ${listViewClientesRecord.cliente.dataTypeVouchers.where((e) => e.estadoVoucher == 'Pendiente').toList().length.toString()}',
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          font: GoogleFonts.asap(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      'Fiando: \$${formatNumber(
                                                                                        listViewClientesRecord.cliente.totalDeudaCompleta,
                                                                                        formatType: FormatType.custom,
                                                                                        format: '#0.00',
                                                                                        locale: '',
                                                                                      )}',
                                                                                      '---',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          font: GoogleFonts.asap(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          if (listViewClientesRecord
                                                                              .cliente
                                                                              .isFiando)
                                                                            Icon(
                                                                              Icons.radio_button_checked,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 24.0,
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Material(
                                      color: Colors.transparent,
                                      elevation: 2.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                        child: Stack(
                                          children: [
                                            Opacity(
                                              opacity: 0.2,
                                              child: Lottie.asset(
                                                'assets/jsons/forBackground.json',
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                fit: BoxFit.contain,
                                                animate: true,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: StreamBuilder<
                                                  List<ClientesRecord>>(
                                                stream: queryClientesRecord(
                                                  queryBuilder:
                                                      (clientesRecord) =>
                                                          clientesRecord
                                                              .where(
                                                                'cliente.isFiando',
                                                                isEqualTo:
                                                                    false,
                                                              )
                                                              .where(
                                                                'cliente.idTendero',
                                                                isEqualTo: widget
                                                                    .tenderoRef,
                                                              ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            SpinKitWanderingCubes(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ClientesRecord>
                                                      listViewClientesRecordList =
                                                      snapshot.data!;
                                                  if (listViewClientesRecordList
                                                      .isEmpty) {
                                                    return Center(
                                                      child: Container(
                                                        width: 400.0,
                                                        height: 360.0,
                                                        child:
                                                            EmptyClientesListNoFiandoWidget(),
                                                      ),
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      0,
                                                      20.0,
                                                    ),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewClientesRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 5.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewClientesRecord =
                                                          listViewClientesRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              ClienteInfoEditWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'nombre':
                                                                    serializeParam(
                                                                  listViewClientesRecord
                                                                      .cliente
                                                                      .nombre,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'telf':
                                                                    serializeParam(
                                                                  listViewClientesRecord
                                                                      .cliente
                                                                      .telf,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'isFiando':
                                                                    serializeParam(
                                                                  false,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                                'idCliente':
                                                                    serializeParam(
                                                                  listViewClientesRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'apellido':
                                                                    serializeParam(
                                                                  listViewClientesRecord
                                                                      .cliente
                                                                      .apellido,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'cedula':
                                                                    serializeParam(
                                                                  listViewClientesRecord
                                                                      .cliente
                                                                      .cedula,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'direccionDomicilio':
                                                                    serializeParam(
                                                                  listViewClientesRecord
                                                                      .cliente
                                                                      .direccionDomicilio,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'emailCliente':
                                                                    serializeParam(
                                                                  listViewClientesRecord
                                                                      .cliente
                                                                      .emailCliente,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'viviendaAlq':
                                                                    serializeParam(
                                                                  listViewClientesRecord
                                                                      .cliente
                                                                      .viviendaAlq,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                                'viviendaProp':
                                                                    serializeParam(
                                                                  listViewClientesRecord
                                                                      .cliente
                                                                      .viviendaPropia,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                                'tenderoRef':
                                                                    serializeParam(
                                                                  widget
                                                                      .tenderoRef,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 3.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        3.0,
                                                                    color: Color(
                                                                        0x20000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFFD3EAFF),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground
                                                                  ],
                                                                  stops: [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (listViewClientesRecord
                                                                            .profileUrl !=
                                                                        '')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              80.0,
                                                                          height:
                                                                              80.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 3.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Lottie.asset(
                                                                                  'assets/jsons/actualHoySiFioLoad.json',
                                                                                  width: 73.0,
                                                                                  height: 100.0,
                                                                                  fit: BoxFit.contain,
                                                                                  animate: true,
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 80.0,
                                                                                height: 80.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  listViewClientesRecord.profileUrl,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Cliente: ${listViewClientesRecord.cliente.nombre} ${listViewClientesRecord.cliente.apellido}',
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    font: GoogleFonts.asap(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'CI: ${listViewClientesRecord.cliente.cedula}',
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    font: GoogleFonts.asap(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                'Sin Fiar',
                                                                                '---',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    font: GoogleFonts.asap(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (listViewClientesRecord
                                                                        .cliente
                                                                        .isFiando)
                                                                      Icon(
                                                                        Icons
                                                                            .radio_button_checked,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
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
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: NavBarWidget(
                      activePage: 'Inicio',
                      nombreTienda: widget.nombreTienda,
                      emailTendero: widget.tenderoEmail,
                      nombreTendero: widget.nombreTendero,
                      pwPass: _model.tenderoReadLoad?.tenderos.pw,
                      tenderoRef: widget.tenderoRef,
                    ),
                  ),
                ],
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
