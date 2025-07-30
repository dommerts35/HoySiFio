import '/backend/backend.dart';
import '/components/dialog_two_btns_widget.dart';
import '/components_cliente/cliente_config/cliente_config_widget.dart';
import '/components_cliente/cliente_data_from_tienda_list/cliente_data_from_tienda_list_widget.dart';
import '/components_nivel_tendero/empty_tienda_comp/empty_tienda_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    extends State<ResumenFiadoClienTiendaNewWidget> {
  late ResumenFiadoClienTiendaNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        FFAppState().isFirstTimeClienteTiendaList = false;
        safeSetState(() {});

        context.pushNamed(
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
          }.withoutNulls,
        );
      }
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

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF6397FF),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
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
                                    height: 630.0,
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
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 24.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Builder(
                                                  builder: (context) =>
                                                      FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                    borderRadius: 12.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    icon: Icon(
                                                      Icons.logout,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
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
                                                      ).then((value) =>
                                                          safeSetState(() =>
                                                              _model.isLogoff =
                                                                  value));

                                                      _shouldSetState = true;
                                                      if (_model.isLogoff!) {
                                                        context.goNamed(
                                                            AuthSigningInWidget
                                                                .routeName);
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
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'Lista de tiendas',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
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
                                                        ]
                                                            .addToStart(
                                                                SizedBox(
                                                                    width: 5.0))
                                                            .addToEnd(SizedBox(
                                                                width: 5.0)),
                                                      ),
                                                    ]
                                                        .addToStart(SizedBox(
                                                            height: 5.0))
                                                        .addToEnd(SizedBox(
                                                            height: 5.0)),
                                                  ),
                                                ),
                                              ]
                                                  .divide(SizedBox(width: 5.0))
                                                  .addToEnd(
                                                      SizedBox(width: 40.0)),
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
                                                  itemCount: tiendaChild.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 15.0),
                                                  itemBuilder: (context,
                                                      tiendaChildIndex) {
                                                    final tiendaChildItem =
                                                        tiendaChild[
                                                            tiendaChildIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          ResumenFiadoClienProdsNewWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'nombreCliente':
                                                                serializeParam(
                                                              tiendaChildItem
                                                                  .cliente
                                                                  .nombre,
                                                              ParamType.String,
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
                                                              widget.cedula,
                                                              ParamType.String,
                                                            ),
                                                            'idTenderoList':
                                                                serializeParam(
                                                              widget
                                                                  .idTenderoList,
                                                              ParamType
                                                                  .DocumentReference,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 430.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: tiendaChildItem
                                                                      .cliente
                                                                      .totalDeudaCompleta >
                                                                  0.0
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: tiendaChildItem
                                                                        .cliente
                                                                        .totalDeudaCompleta >
                                                                    0.0
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      16.0),
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
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: StreamBuilder<
                                                                            List<TenderosRecord>>(
                                                                          stream:
                                                                              queryTenderosRecord(
                                                                            queryBuilder: (tenderosRecord) =>
                                                                                tenderosRecord.where(
                                                                              'tenderos.idTendero',
                                                                              isEqualTo: widget.idTenderoList?.elementAtOrNull(tiendaChildIndex),
                                                                            ),
                                                                            singleRecord:
                                                                                true,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
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
                                                                            // Return an empty Container when the item does not exist.
                                                                            if (snapshot.data!.isEmpty) {
                                                                              return Container();
                                                                            }
                                                                            final textTenderosRecord = textTenderosRecordList.isNotEmpty
                                                                                ? textTenderosRecordList.first
                                                                                : null;

                                                                            return AutoSizeText(
                                                                              '${textTenderosRecord?.displayName}',
                                                                              maxLines: 2,
                                                                              minFontSize: 14.0,
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    font: GoogleFonts.readexPro(
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    StreamBuilder<
                                                                        List<
                                                                            TenderosRecord>>(
                                                                      stream:
                                                                          queryTenderosRecord(
                                                                        queryBuilder:
                                                                            (tenderosRecord) =>
                                                                                tenderosRecord.where(
                                                                          'tenderos.idTendero',
                                                                          isEqualTo: widget
                                                                              .idTenderoList
                                                                              ?.elementAtOrNull(tiendaChildIndex),
                                                                        ),
                                                                        singleRecord:
                                                                            true,
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
                                                                            infoIconTenderosRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final infoIconTenderosRecord = infoIconTenderosRecordList.isNotEmpty
                                                                            ? infoIconTenderosRecordList.first
                                                                            : null;

                                                                        return FlutterFlowIconButton(
                                                                          borderRadius:
                                                                              8.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.info_outline,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: Container(
                                                                                      height: 400.0,
                                                                                      child: ClienteDataFromTiendaListWidget(
                                                                                        nombreCliente: tiendaChildItem.cliente.nombre,
                                                                                        telefonoCliente: tiendaChildItem.cliente.telf,
                                                                                        cedulaCliente: tiendaChildItem.cliente.cedula,
                                                                                        direccionCliente: tiendaChildItem.cliente.direccionDomicilio,
                                                                                        isViviendaPropia: tiendaChildItem.cliente.viviendaPropia,
                                                                                        isViviendaAlq: tiendaChildItem.cliente.viviendaAlq,
                                                                                        emailCliente: tiendaChildItem.cliente.emailCliente,
                                                                                        tiendaNombre: infoIconTenderosRecord?.displayName,
                                                                                        apellidoCliente: tiendaChildItem.cliente.apellido,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    tiendaChildItem.cliente.historialPorPagarProd.length <=
                                                                            0
                                                                        ? '¡Hurra! No hay deudas pendientes en esta tienda.'
                                                                        : 'Total a pagar de los productos: \$${formatNumber(
                                                                            tiendaChildItem.cliente.totalDeudaCompleta,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '#0.00',
                                                                            locale:
                                                                                '',
                                                                          )}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
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
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 20.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: 300.0,
                                            child: ClienteConfigWidget(
                                              pinCliente:
                                                  resumenFiadoClienTiendaNewClientesRecordList
                                                      .firstOrNull
                                                      ?.cliente
                                                      .pin,
                                              emailCliente:
                                                  resumenFiadoClienTiendaNewClientesRecordList
                                                      .firstOrNull
                                                      ?.cliente
                                                      .emailCliente,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                text: 'Cambiar PIN',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  hoverBorderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  hoverTextColor:
                                      FlutterFlowTheme.of(context).primary,
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
        );
      },
    );
  }
}
