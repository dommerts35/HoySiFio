import '/backend/backend.dart';
import '/components_nivel_tendero/check_cuentas_comp/check_cuentas_comp_widget.dart';
import '/components_nivel_tendero/empty_productos_pagados_comp/empty_productos_pagados_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'historial_por_pagar_model.dart';
export 'historial_por_pagar_model.dart';

class HistorialPorPagarWidget extends StatefulWidget {
  const HistorialPorPagarWidget({
    super.key,
    this.idCliente,
    this.idTendero,
    this.nombre,
    this.telf,
    this.isFiando,
    this.apellido,
    this.cedula,
    this.direccionDomicilio,
    this.viviendaAlq,
    this.viviendaProp,
    this.emailCliente,
  });

  final DocumentReference? idCliente;
  final DocumentReference? idTendero;
  final String? nombre;
  final String? telf;
  final bool? isFiando;
  final String? apellido;
  final String? cedula;
  final String? direccionDomicilio;
  final bool? viviendaAlq;
  final bool? viviendaProp;
  final String? emailCliente;

  static String routeName = 'historialPorPagar';
  static String routePath = '/historialPorPagar';

  @override
  State<HistorialPorPagarWidget> createState() =>
      _HistorialPorPagarWidgetState();
}

class _HistorialPorPagarWidgetState extends State<HistorialPorPagarWidget> {
  late HistorialPorPagarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistorialPorPagarModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.idCliente!.update(createClientesRecordData(
        cliente: createDataTypeClienteStruct(
          fieldValues: {
            'historialPorPagarSelectedList': FieldValue.delete(),
          },
          clearUnsetFields: false,
        ),
      ));
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
    return StreamBuilder<ClientesRecord>(
      stream: _model.queryNameClienteHistorialPorPagar(
        requestFn: () => ClientesRecord.getDocument(widget.idCliente!),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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

        final historialPorPagarClientesRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 1170.0,
                        ),
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 12.0, 8.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: 12.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          ClienteProdInfoEditWidget.routeName,
                                          queryParameters: {
                                            'nombre': serializeParam(
                                              widget.nombre,
                                              ParamType.String,
                                            ),
                                            'telf': serializeParam(
                                              widget.telf,
                                              ParamType.String,
                                            ),
                                            'isFiando': serializeParam(
                                              widget.isFiando,
                                              ParamType.bool,
                                            ),
                                            'idCliente': serializeParam(
                                              widget.idCliente,
                                              ParamType.DocumentReference,
                                            ),
                                            'apellido': serializeParam(
                                              widget.apellido,
                                              ParamType.String,
                                            ),
                                            'cedula': serializeParam(
                                              widget.cedula,
                                              ParamType.String,
                                            ),
                                            'tenderoRef': serializeParam(
                                              widget.idTendero,
                                              ParamType.DocumentReference,
                                            ),
                                            'direccionDomicilio':
                                                serializeParam(
                                              widget.direccionDomicilio,
                                              ParamType.String,
                                            ),
                                            'viviendaAlq': serializeParam(
                                              widget.viviendaAlq,
                                              ParamType.bool,
                                            ),
                                            'viviendaProp': serializeParam(
                                              widget.viviendaProp,
                                              ParamType.bool,
                                            ),
                                            'emailCliente': serializeParam(
                                              widget.emailCliente,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ayphq84c' /* Cuentas por pagar */,
                                      ),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.interTight(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'whsw90kw' /* Aquí se mostrarán los producto... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'del cliente: ${historialPorPagarClientesRecord.cliente.nombre} ${historialPorPagarClientesRecord.cliente.apellido}',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Total de las cuentas: \$${formatNumber(
                                    historialPorPagarClientesRecord
                                        .cliente.totalDeudaCompleta,
                                    formatType: FormatType.custom,
                                    format: '#0.00',
                                    locale: '',
                                  )}',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              StreamBuilder<ClientesRecord>(
                                stream: ClientesRecord.getDocument(
                                    widget.idCliente!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final mainHistorialViewClientesRecord =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final listaProdPorPagarGroup =
                                          mainHistorialViewClientesRecord
                                              .cliente.historialPorPagarProd
                                              .sortedList(
                                                  keyOf: (e) => e.idTransaccion,
                                                  desc: true)
                                              .toList();
                                      if (listaProdPorPagarGroup.isEmpty) {
                                        return Center(
                                          child:
                                              EmptyProductosPagadosCompWidget(),
                                        );
                                      }

                                      return ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          12.0,
                                          0,
                                          44.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listaProdPorPagarGroup.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 12.0),
                                        itemBuilder: (context,
                                            listaProdPorPagarGroupIndex) {
                                          final listaProdPorPagarGroupItem =
                                              listaProdPorPagarGroup[
                                                  listaProdPorPagarGroupIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              constraints: BoxConstraints(
                                                maxWidth: 570.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .checkCuentasCompModels
                                                            .getModel(
                                                          listaProdPorPagarGroupItem
                                                              .idTransaccion,
                                                          listaProdPorPagarGroupIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            CheckCuentasCompWidget(
                                                          key: Key(
                                                            'Keyzem_${listaProdPorPagarGroupItem.idTransaccion}',
                                                          ),
                                                          indexFromhPP:
                                                              listaProdPorPagarGroupIndex,
                                                          idCliente:
                                                              widget.idCliente,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ryaqh50n' /* Cantidad */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'kzbxnd35' /* Producto */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'topgjp12' /* Valor Unitario */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '0kr5qigy' /* Valor */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final singleProd =
                                                          listaProdPorPagarGroupItem
                                                              .productos
                                                              .map((e) =>
                                                                  e.nombreProd)
                                                              .toList();

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            singleProd.length,
                                                            (singleProdIndex) {
                                                          final singleProdItem =
                                                              singleProd[
                                                                  singleProdIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    SizedBox(
                                                                      width:
                                                                          60.0,
                                                                      child:
                                                                          Divider(
                                                                        height:
                                                                            0.0,
                                                                        thickness:
                                                                            0.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '${listaProdPorPagarGroupItem.productos.elementAtOrNull(singleProdIndex)?.cantidad.toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    SizedBox(
                                                                      width:
                                                                          60.0,
                                                                      child:
                                                                          Divider(
                                                                        height:
                                                                            0.0,
                                                                        thickness:
                                                                            0.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        '${listaProdPorPagarGroupItem.productos.elementAtOrNull(singleProdIndex)?.nombreProd}',
                                                                        'prod',
                                                                      ).maybeHandleOverflow(
                                                                        maxChars:
                                                                            8,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    SizedBox(
                                                                      width:
                                                                          88.0,
                                                                      child:
                                                                          Divider(
                                                                        height:
                                                                            0.0,
                                                                        thickness:
                                                                            0.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '\$${formatNumber(
                                                                        listaProdPorPagarGroupItem.productos.elementAtOrNull(singleProdIndex)!.valorProd /
                                                                            listaProdPorPagarGroupItem.productos.elementAtOrNull(singleProdIndex)!.cantidad,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '#0.00',
                                                                        locale:
                                                                            '',
                                                                      )}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    SizedBox(
                                                                      width:
                                                                          30.0,
                                                                      child:
                                                                          Divider(
                                                                        height:
                                                                            0.0,
                                                                        thickness:
                                                                            0.0,
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '\$ ${formatNumber(
                                                                        listaProdPorPagarGroupItem
                                                                            .productos
                                                                            .elementAtOrNull(singleProdIndex)
                                                                            ?.valorProd,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '#0.00',
                                                                        locale:
                                                                            '',
                                                                      )}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Total: \$${formatNumber(
                                                            listaProdPorPagarGroupItem
                                                                .totalGeneral,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '#0.00',
                                                            locale: '',
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Total por pagar: \$${formatNumber(
                                                            listaProdPorPagarGroupItem
                                                                .totalPorPagar,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '#0.00',
                                                            locale: '',
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Fecha del fío: ${dateTimeFormat(
                                                            "d/M/y h:mm a",
                                                            listaProdPorPagarGroupItem
                                                                .fechaDeFio,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      if ((listaProdPorPagarGroupItem
                                                                  .transferencia ==
                                                              true) ||
                                                          (listaProdPorPagarGroupItem
                                                                  .efectivo ==
                                                              true))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Transferencia:',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      visualDensity:
                                                                          VisualDensity
                                                                              .compact,
                                                                      materialTapTargetSize:
                                                                          MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    unselectedWidgetColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                  ),
                                                                  child:
                                                                      Checkbox(
                                                                    value: _model
                                                                            .checkboxValueMap1[listaProdPorPagarGroupItem] ??=
                                                                        listaProdPorPagarGroupItem
                                                                            .transferencia,
                                                                    onChanged: true
                                                                        ? null
                                                                        : (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.checkboxValueMap1[listaProdPorPagarGroupItem] = newValue!);
                                                                          },
                                                                    side: (FlutterFlowTheme.of(context).alternate !=
                                                                            null)
                                                                        ? BorderSide(
                                                                            width:
                                                                                2,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          )
                                                                        : null,
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    checkColor: true
                                                                        ? null
                                                                        : FlutterFlowTheme.of(context)
                                                                            .info,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Efectivo: ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      visualDensity:
                                                                          VisualDensity
                                                                              .compact,
                                                                      materialTapTargetSize:
                                                                          MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    unselectedWidgetColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                  ),
                                                                  child:
                                                                      Checkbox(
                                                                    value: _model
                                                                            .checkboxValueMap2[listaProdPorPagarGroupItem] ??=
                                                                        listaProdPorPagarGroupItem
                                                                            .efectivo,
                                                                    onChanged: true
                                                                        ? null
                                                                        : (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.checkboxValueMap2[listaProdPorPagarGroupItem] = newValue!);
                                                                          },
                                                                    side: (FlutterFlowTheme.of(context).alternate !=
                                                                            null)
                                                                        ? BorderSide(
                                                                            width:
                                                                                2,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          )
                                                                        : null,
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    checkColor: true
                                                                        ? null
                                                                        : FlutterFlowTheme.of(context)
                                                                            .info,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      if (listaProdPorPagarGroupItem
                                                              .numVoucher >
                                                          0)
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Número de Voucher: ${listaProdPorPagarGroupItem.numVoucher.toString()}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      if (listaProdPorPagarGroupItem
                                                              .totalPagado <
                                                          listaProdPorPagarGroupItem
                                                              .totalGeneral)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
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
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                ClienteProdValorPagoWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'idCliente':
                                                                      serializeParam(
                                                                    widget
                                                                        .idCliente,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'indexFromHistorial':
                                                                      serializeParam(
                                                                    listaProdPorPagarGroupIndex,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                  'totalPagadoFromHistorial':
                                                                      serializeParam(
                                                                    listaProdPorPagarGroupItem
                                                                        .totalPagado,
                                                                    ParamType
                                                                        .double,
                                                                  ),
                                                                  'transferFromHistorial':
                                                                      serializeParam(
                                                                    listaProdPorPagarGroupItem
                                                                        .transferencia,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'efectivoFromHistorial':
                                                                      serializeParam(
                                                                    listaProdPorPagarGroupItem
                                                                        .efectivo,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'dtHistorial':
                                                                      serializeParam(
                                                                    listaProdPorPagarGroupItem,
                                                                    ParamType
                                                                        .DataStruct,
                                                                  ),
                                                                  'totalPorPagarFromHistorial':
                                                                      serializeParam(
                                                                    listaProdPorPagarGroupItem
                                                                        .totalPorPagar,
                                                                    ParamType
                                                                        .double,
                                                                  ),
                                                                  'totalGeneralFromHistorial':
                                                                      serializeParam(
                                                                    listaProdPorPagarGroupItem
                                                                        .totalGeneral,
                                                                    ParamType
                                                                        .double,
                                                                  ),
                                                                  'idTransaccionPassed':
                                                                      serializeParam(
                                                                    listaProdPorPagarGroupItem
                                                                        .idTransaccion,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'nombre':
                                                                      serializeParam(
                                                                    widget
                                                                        .nombre,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'telf':
                                                                      serializeParam(
                                                                    widget
                                                                        .telf,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'isFiando':
                                                                      serializeParam(
                                                                    widget
                                                                        .isFiando,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'apellido':
                                                                      serializeParam(
                                                                    widget
                                                                        .apellido,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'cedula':
                                                                      serializeParam(
                                                                    widget
                                                                        .cedula,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'tenderoRef':
                                                                      serializeParam(
                                                                    widget
                                                                        .idTendero,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'direccionDomicilio':
                                                                      serializeParam(
                                                                    widget
                                                                        .direccionDomicilio,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'viviendaAlq':
                                                                      serializeParam(
                                                                    widget
                                                                        .viviendaAlq,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'vivendaProp':
                                                                      serializeParam(
                                                                    widget
                                                                        .viviendaProp,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                  'emailCliente':
                                                                      serializeParam(
                                                                    widget
                                                                        .emailCliente,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 180.0,
                                                              height: 32.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Click para pagar',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 5.0))
                                                    .addToEnd(
                                                        SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (historialPorPagarClientesRecord
                          .cliente.historialPorPagarSelectedList.length >
                      0)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          for (int loop1Index = 0;
                              loop1Index <
                                  historialPorPagarClientesRecord.cliente
                                      .historialPorPagarSelectedList.length;
                              loop1Index++) {
                            final currentLoop1Item =
                                historialPorPagarClientesRecord.cliente
                                    .historialPorPagarSelectedList[loop1Index];
                            _model.totalAPagarCalc = _model.totalAPagarCalc +
                                currentLoop1Item.totalPorPagar;
                            safeSetState(() {});
                          }
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('¿Pagar \$${formatNumber(
                                      _model.totalAPagarCalc,
                                      formatType: FormatType.custom,
                                      format: '#0.00',
                                      locale: '',
                                    )} ?'),
                                    content: Text(
                                        'Al aceptar, se confirmarán todos los pagos seleccionados del cliente.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Aceptar'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            context.pushNamed(
                              ClienteProdSelectPagoWidget.routeName,
                              queryParameters: {
                                'idCliente': serializeParam(
                                  widget.idCliente,
                                  ParamType.DocumentReference,
                                ),
                                'nombre': serializeParam(
                                  widget.nombre,
                                  ParamType.String,
                                ),
                                'telf': serializeParam(
                                  widget.telf,
                                  ParamType.String,
                                ),
                                'isFiando': serializeParam(
                                  widget.isFiando,
                                  ParamType.bool,
                                ),
                                'apellido': serializeParam(
                                  widget.apellido,
                                  ParamType.String,
                                ),
                                'cedula': serializeParam(
                                  widget.cedula,
                                  ParamType.String,
                                ),
                                'tenderoRef': serializeParam(
                                  widget.idTendero,
                                  ParamType.DocumentReference,
                                ),
                                'direccionDomicilio': serializeParam(
                                  widget.direccionDomicilio,
                                  ParamType.String,
                                ),
                                'viviendaAlq': serializeParam(
                                  widget.viviendaAlq,
                                  ParamType.bool,
                                ),
                                'vivendaProp': serializeParam(
                                  widget.viviendaProp,
                                  ParamType.bool,
                                ),
                                'emailCliente': serializeParam(
                                  widget.emailCliente,
                                  ParamType.String,
                                ),
                                'calcForTotalPorPagar': serializeParam(
                                  _model.totalAPagarCalc,
                                  ParamType.double,
                                ),
                              }.withoutNulls,
                            );
                          }
                        },
                        text: FFLocalizations.of(context).getText(
                          '5fs0byh5' /* Pagar productos seleccionados */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  if (historialPorPagarClientesRecord
                          .cliente.historialPorPagarSelectedList.length ==
                      0)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: FFButtonWidget(
                        onPressed: (historialPorPagarClientesRecord
                                    .cliente.historialPorPagarProd.length ==
                                0)
                            ? null
                            : () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('¿Pagar \$${formatNumber(
                                            historialPorPagarClientesRecord
                                                .cliente.totalDeudaCompleta,
                                            formatType: FormatType.custom,
                                            format: '#0.00',
                                            locale: '',
                                          )} en total?'),
                                          content: Text(
                                              'Al aceptar, se confirmarán todos los pagos del cliente.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancelar'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Aceptar'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  context.pushNamed(
                                    ClienteProdFullPagoWidget.routeName,
                                    queryParameters: {
                                      'idCliente': serializeParam(
                                        widget.idCliente,
                                        ParamType.DocumentReference,
                                      ),
                                      'nombre': serializeParam(
                                        widget.nombre,
                                        ParamType.String,
                                      ),
                                      'telf': serializeParam(
                                        widget.telf,
                                        ParamType.String,
                                      ),
                                      'isFiando': serializeParam(
                                        widget.isFiando,
                                        ParamType.bool,
                                      ),
                                      'apellido': serializeParam(
                                        widget.apellido,
                                        ParamType.String,
                                      ),
                                      'cedula': serializeParam(
                                        widget.cedula,
                                        ParamType.String,
                                      ),
                                      'tenderoRef': serializeParam(
                                        widget.idTendero,
                                        ParamType.DocumentReference,
                                      ),
                                      'direccionDomicilio': serializeParam(
                                        widget.direccionDomicilio,
                                        ParamType.String,
                                      ),
                                      'viviendaAlq': serializeParam(
                                        widget.viviendaAlq,
                                        ParamType.bool,
                                      ),
                                      'vivendaProp': serializeParam(
                                        widget.viviendaProp,
                                        ParamType.bool,
                                      ),
                                      'emailCliente': serializeParam(
                                        widget.emailCliente,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              },
                        text: FFLocalizations.of(context).getText(
                          '318e7au3' /* Pagar todos los productos */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                          borderRadius: BorderRadius.circular(0.0),
                          disabledColor: Color(0xA542271C),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
