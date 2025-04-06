import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
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
  final int? cedula;
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                              ParamType.int,
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
                                        'ayphq84c' /* Historial de productos
por pag... */
                                        ,
                                      ),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            letterSpacing: 0.0,
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
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: StreamBuilder<ClientesRecord>(
                                  stream:
                                      _model.queryNameClienteHistorialPorPagar(
                                    requestFn: () => ClientesRecord.getDocument(
                                        widget.idCliente!),
                                  ),
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

                                    final textClientesRecord = snapshot.data!;

                                    return Text(
                                      'del cliente: ${textClientesRecord.cliente.nombre} ${textClientesRecord.cliente.apellido}',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    );
                                  },
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
                                                  keyOf: (e) => e.fechaPago!,
                                                  desc: true)
                                              .toList();

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
                                                                        16.0,
                                                                        12.0,
                                                                        16.0,
                                                                        12.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  flex: 4,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          '${listaProdPorPagarGroupItem.productos.elementAtOrNull(singleProdIndex)?.nombreProd}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        '\$ ${listaProdPorPagarGroupItem.productos.elementAtOrNull(singleProdIndex)?.valorProd.toString()}',
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: 'Inter Tight',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
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
                                                          'Total general de los productos: ${listaProdPorPagarGroupItem.totalGeneral.toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
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
                                                          'Total pagado: \$${listaProdPorPagarGroupItem.totalPagado.toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
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
                                                          'Fecha del pago anterior: \$${dateTimeFormat(
                                                            "d/M/y",
                                                            listaProdPorPagarGroupItem
                                                                .fechaPago,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
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
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Theme(
                                                                data: ThemeData(
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
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  unselectedWidgetColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                ),
                                                                child: Checkbox(
                                                                  value: _model
                                                                              .checkboxValueMap1[
                                                                          listaProdPorPagarGroupItem] ??=
                                                                      listaProdPorPagarGroupItem
                                                                          .transferencia,
                                                                  onChanged: true
                                                                      ? null
                                                                      : (newValue) async {
                                                                          safeSetState(() =>
                                                                              _model.checkboxValueMap1[listaProdPorPagarGroupItem] = newValue!);
                                                                        },
                                                                  side:
                                                                      BorderSide(
                                                                    width: 2,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  checkColor: true
                                                                      ? null
                                                                      : FlutterFlowTheme.of(
                                                                              context)
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Efectivo',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Theme(
                                                                data: ThemeData(
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
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  unselectedWidgetColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                ),
                                                                child: Checkbox(
                                                                  value: _model
                                                                              .checkboxValueMap2[
                                                                          listaProdPorPagarGroupItem] ??=
                                                                      listaProdPorPagarGroupItem
                                                                          .efectivo,
                                                                  onChanged: true
                                                                      ? null
                                                                      : (newValue) async {
                                                                          safeSetState(() =>
                                                                              _model.checkboxValueMap2[listaProdPorPagarGroupItem] = newValue!);
                                                                        },
                                                                  side:
                                                                      BorderSide(
                                                                    width: 2,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  checkColor: true
                                                                      ? null
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
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
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.readForSumaCalculada =
                                                              await ClientesRecord
                                                                  .getDocumentOnce(
                                                                      widget
                                                                          .idCliente!);
                                                          _model
                                                              .sumaTemporalCalculada = _model
                                                                  .readForSumaCalculada!
                                                                  .cliente
                                                                  .total -
                                                              listaProdPorPagarGroupItem
                                                                  .totalGeneral;
                                                          safeSetState(() {});

                                                          context.pushNamed(
                                                            ClienteProdValorPagoWidget
                                                                .routeName,
                                                            queryParameters: {
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
                                                                ParamType.int,
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
                                                                ParamType.bool,
                                                              ),
                                                              'efectivoFromHistorial':
                                                                  serializeParam(
                                                                listaProdPorPagarGroupItem
                                                                    .efectivo,
                                                                ParamType.bool,
                                                              ),
                                                              'dtHistorial':
                                                                  serializeParam(
                                                                mainHistorialViewClientesRecord
                                                                    .cliente
                                                                    .historialPorPagarProd
                                                                    .elementAtOrNull(
                                                                        listaProdPorPagarGroupIndex),
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
                                                              'sumaProductosTemporales':
                                                                  serializeParam(
                                                                _model
                                                                    .sumaTemporalCalculada,
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
                                                                widget.nombre,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'telf':
                                                                  serializeParam(
                                                                widget.telf,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'isFiando':
                                                                  serializeParam(
                                                                widget
                                                                    .isFiando,
                                                                ParamType.bool,
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
                                                                widget.cedula,
                                                                ParamType.int,
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
                                                                ParamType.bool,
                                                              ),
                                                              'vivendaProp':
                                                                  serializeParam(
                                                                widget
                                                                    .viviendaProp,
                                                                ParamType.bool,
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

                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width: 180.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Falta pagar: \$${listaProdPorPagarGroupItem.totalPorPagar.toString()}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ].addToEnd(
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
