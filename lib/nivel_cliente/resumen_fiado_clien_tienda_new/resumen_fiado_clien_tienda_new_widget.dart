import '/backend/backend.dart';
import '/components_nivel_tendero/empty_tienda_comp/empty_tienda_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/walkthroughs/cliente_tiendas_list.dart';
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'resumen_fiado_clien_tienda_new_model.dart';
export 'resumen_fiado_clien_tienda_new_model.dart';

class ResumenFiadoClienTiendaNewWidget extends StatefulWidget {
  const ResumenFiadoClienTiendaNewWidget({
    super.key,
    this.cedula,
    this.idTenderoList,
  });

  final String? cedula;
  final List<DocumentReference>? idTenderoList;

  static String routeName = 'resumenFiadoClienTiendaNew';
  static String routePath = '/resumenFiadoClienTiendaNew';

  @override
  State<ResumenFiadoClienTiendaNewWidget> createState() =>
      _ResumenFiadoClienTiendaNewWidgetState();
}

class _ResumenFiadoClienTiendaNewWidgetState
    extends State<ResumenFiadoClienTiendaNewWidget>
    with TickerProviderStateMixin {
  late ResumenFiadoClienTiendaNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResumenFiadoClienTiendaNewModel());

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
      while (
          _model.tempNombreTiendasCount < _model.queryOnLoadClientes!.length) {
        _model.readCountTendero = await TenderosRecord.getDocumentOnce(_model
            .queryOnLoadClientes!
            .elementAtOrNull(_model.tempNombreTiendasCount)!
            .cliente
            .idTendero!);
        _model.addToNombresTiendas(
            _model.readCountTendero!.tenderos.nombreTienda);
        _model.tempNombreTiendasCount = _model.tempNombreTiendasCount + 1;
        safeSetState(() {});
      }
      if (FFAppState().isFirstTimeClienteTiendaList == true) {
        safeSetState(() => _model.clienteTiendasListController =
            createPageWalkthrough(context));
        _model.clienteTiendasListController?.show(context: context);
      }
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 540.0.ms,
            duration: 490.0.ms,
            begin: 0.0,
            end: 1.0,
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
    context.watch<FFAppState>();

    return StreamBuilder<List<ClientesRecord>>(
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
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ClientesRecord> resumenFiadoClienTiendaNewClientesRecordList =
            snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              buttonSize: 46.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 25.0,
              ),
              onPressed: () async {
                context.goNamed(AuthSigningInWidget.routeName);
              },
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 24.0),
                                child: Wrap(
                                  spacing: 16.0,
                                  runSpacing: 16.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 430.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/poster-with-hand-drawn-fresh-vegetables-healthy-food-agriculture-concept-illustration-food_559587-18.png',
                                            ).image,
                                          ),
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
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 16.0, 24.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '29h3bv5a' /* Resúmen de fiados */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        height: 10.0,
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Nombre: ${resumenFiadoClienTiendaNewClientesRecordList.firstOrNull?.cliente.nombre} ${resumenFiadoClienTiendaNewClientesRecordList.firstOrNull?.cliente.apellido}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Cédula: ${resumenFiadoClienTiendaNewClientesRecordList.firstOrNull?.cliente.cedula}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Teléfono: ${resumenFiadoClienTiendaNewClientesRecordList.firstOrNull?.cliente.telf}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 5.0))
                                                        .addToStart(SizedBox(
                                                            height: 5.0))
                                                        .addToEnd(SizedBox(
                                                            height: 10.0)),
                                                  ).addWalkthrough(
                                                    columnA8g7q99j,
                                                    _model
                                                        .clienteTiendasListController,
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final tiendaChild =
                                                        resumenFiadoClienTiendaNewClientesRecordList
                                                            .map((e) => e)
                                                            .toList();
                                                    if (tiendaChild.isEmpty) {
                                                      return Center(
                                                        child:
                                                            EmptyTiendaCompWidget(),
                                                      );
                                                    }

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          tiendaChild.length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 15.0),
                                                      itemBuilder: (context,
                                                          tiendaChildIndex) {
                                                        final tiendaChildItem =
                                                            tiendaChild[
                                                                tiendaChildIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (tiendaChildItem
                                                                    .cliente
                                                                    .historialPorPagarProd
                                                                    .length !=
                                                                0) {
                                                              context.pushNamed(
                                                                ResumenFiadoClienProdsNewWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'nombreCliente':
                                                                      serializeParam(
                                                                    tiendaChildItem
                                                                        .cliente
                                                                        .nombre,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'idCliente':
                                                                      serializeParam(
                                                                    tiendaChildItem
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'idTendero':
                                                                      serializeParam(
                                                                    widget
                                                                        .idTenderoList
                                                                        ?.elementAtOrNull(
                                                                            tiendaChildIndex),
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'cedula':
                                                                      serializeParam(
                                                                    widget
                                                                        .cedula,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'idTenderoList':
                                                                      serializeParam(
                                                                    widget
                                                                        .idTenderoList,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                    isList:
                                                                        true,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            }
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 430.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          24.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              TenderosRecord>>(
                                                                        stream:
                                                                            queryTenderosRecord(
                                                                          queryBuilder: (tenderosRecord) =>
                                                                              tenderosRecord.where(
                                                                            'tenderos.idTendero',
                                                                            isEqualTo:
                                                                                widget.idTenderoList?.elementAtOrNull(tiendaChildIndex),
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: CircularProgressIndicator(
                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<TenderosRecord>
                                                                              textTenderosRecordList =
                                                                              snapshot.data!;

                                                                          return Text(
                                                                            'Tienda: ${_model.nombresTiendas.elementAtOrNull(tiendaChildIndex)}',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        tiendaChildItem.cliente.historialPorPagarProd.length <=
                                                                                0
                                                                            ? '¡Hurra! No hay deudas pendientes en esta tienda.'
                                                                            : 'Total a pagar de los productos: \$${formatNumber(
                                                                                tiendaChildItem.cliente.totalDeudaCompleta,
                                                                                formatType: FormatType.custom,
                                                                                format: '#0.00',
                                                                                locale: '',
                                                                              )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          15.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).addWalkthrough(
                                                      listView22ndqvkr,
                                                      _model
                                                          .clienteTiendasListController,
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(height: 15.0)),
                                            ),
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
                    ],
                  ),
                ),
              ],
            ),
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        );
      },
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.clienteTiendasListController = null);
          FFAppState().isFirstTimeClienteTiendaList = false;
          safeSetState(() {});
        },
        onSkip: () {
          () async {
            FFAppState().isFirstTimeClienteTiendaList = false;
            safeSetState(() {});
          }();
          return true;
        },
      );
}
