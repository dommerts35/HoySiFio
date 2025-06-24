import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'resumen_fiado_clien_prods_new_model.dart';
export 'resumen_fiado_clien_prods_new_model.dart';

class ResumenFiadoClienProdsNewWidget extends StatefulWidget {
  const ResumenFiadoClienProdsNewWidget({
    super.key,
    this.historialPorPagarDTList,
    this.nombreCliente,
    this.idCliente,
    this.idTendero,
    this.doc,
    this.cedula,
    this.idTenderoList,
  });

  final List<DataTypeHistorialPagoStruct>? historialPorPagarDTList;
  final String? nombreCliente;
  final DocumentReference? idCliente;
  final DocumentReference? idTendero;
  final List<ClientesRecord>? doc;
  final String? cedula;
  final List<DocumentReference>? idTenderoList;

  static String routeName = 'resumenFiadoClienProdsNew';
  static String routePath = '/resumenFiadoClienProdsNew';

  @override
  State<ResumenFiadoClienProdsNewWidget> createState() =>
      _ResumenFiadoClienProdsNewWidgetState();
}

class _ResumenFiadoClienProdsNewWidgetState
    extends State<ResumenFiadoClienProdsNewWidget> {
  late ResumenFiadoClienProdsNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResumenFiadoClienProdsNewModel());

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
      stream: ClientesRecord.getDocument(widget.idCliente!),
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

        final resumenFiadoClienProdsNewClientesRecord = snapshot.data!;

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
                context.pushNamed(
                  ResumenFiadoClienTiendaNewWidget.routeName,
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
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
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
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          'Resúmen de fiados',
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
                                                        Divider(
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: StreamBuilder<
                                                              TenderosRecord>(
                                                            stream: TenderosRecord
                                                                .getDocument(widget
                                                                    .idTendero!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final textTenderosRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return Text(
                                                                'Tienda: ${textTenderosRecord.tenderos.nombreTienda}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .interTight(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Total: \$${formatNumber(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .totalDeudaCompleta,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '#0.00',
                                                              locale: '',
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
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
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 450.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 430.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                    child: Builder(
                                                      builder: (context) {
                                                        final historialColumns =
                                                            resumenFiadoClienProdsNewClientesRecord
                                                                .cliente
                                                                .historialPorPagarProd
                                                                .map((e) => e)
                                                                .toList();

                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: List.generate(
                                                                historialColumns
                                                                    .length,
                                                                (historialColumnsIndex) {
                                                              final historialColumnsItem =
                                                                  historialColumns[
                                                                      historialColumnsIndex];
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      430.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          24.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: 430.0,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Producto',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Cantidad',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Valor U.',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Valor',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      final productosChild = historialColumnsItem.productos.map((e) => e).toList();

                                                                                      return Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: List.generate(productosChild.length, (productosChildIndex) {
                                                                                          final productosChildItem = productosChild[productosChildIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                      width: 65.0,
                                                                                                      child: Divider(
                                                                                                        height: 0.0,
                                                                                                        thickness: 0.0,
                                                                                                        color: Colors.transparent,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        productosChildItem.nombreProd,
                                                                                                        'p',
                                                                                                      ).maybeHandleOverflow(
                                                                                                        maxChars: 8,
                                                                                                        replacement: '…',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                      width: 60.0,
                                                                                                      child: Divider(
                                                                                                        height: 0.0,
                                                                                                        thickness: 0.0,
                                                                                                        color: Colors.transparent,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        productosChildItem.cantidad.toString(),
                                                                                                        '0',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                      width: 51.0,
                                                                                                      child: Divider(
                                                                                                        height: 0.0,
                                                                                                        thickness: 0.0,
                                                                                                        color: Colors.transparent,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      '\$${formatNumber(
                                                                                                        productosChildItem.valorProd / productosChildItem.cantidad,
                                                                                                        formatType: FormatType.custom,
                                                                                                        format: '#0.00',
                                                                                                        locale: '',
                                                                                                      )}',
                                                                                                      textAlign: TextAlign.end,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                      width: 33.0,
                                                                                                      child: Divider(
                                                                                                        height: 0.0,
                                                                                                        thickness: 0.0,
                                                                                                        color: Colors.transparent,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                      child: Text(
                                                                                                        '\$${formatNumber(
                                                                                                          productosChildItem.valorProd,
                                                                                                          formatType: FormatType.custom,
                                                                                                          format: '#0.00',
                                                                                                          locale: '',
                                                                                                        )}',
                                                                                                        textAlign: TextAlign.end,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
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
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Total precio de productos: \$${formatNumber(
                                                                                            historialColumnsItem.totalGeneral,
                                                                                            formatType: FormatType.custom,
                                                                                            format: '#0.00',
                                                                                            locale: '',
                                                                                          )}',
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Total pagado: \$${formatNumber(
                                                                                            historialColumnsItem.totalPagado,
                                                                                            formatType: FormatType.custom,
                                                                                            format: '#0.00',
                                                                                            locale: '',
                                                                                          )}',
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Total por pagar: \$${formatNumber(
                                                                                            historialColumnsItem.totalPorPagar,
                                                                                            formatType: FormatType.custom,
                                                                                            format: '#0.00',
                                                                                            locale: '',
                                                                                          )}',
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Fecha del fio: ${dateTimeFormat(
                                                                                            "d/M/y h:mm a",
                                                                                            historialColumnsItem.fechaDeFio,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          )}',
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      if (false)
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Transferencia:',
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Theme(
                                                                                                  data: ThemeData(
                                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                                      visualDensity: VisualDensity.compact,
                                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                      shape: RoundedRectangleBorder(
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                  child: Checkbox(
                                                                                                    value: _model.checkboxValueMap1[historialColumnsItem] ??= historialColumnsItem.transferencia,
                                                                                                    onChanged: true
                                                                                                        ? null
                                                                                                        : (newValue) async {
                                                                                                            safeSetState(() => _model.checkboxValueMap1[historialColumnsItem] = newValue!);
                                                                                                          },
                                                                                                    side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                                        ? BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                          )
                                                                                                        : null,
                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                    checkColor: true ? null : FlutterFlowTheme.of(context).info,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Efectivo',
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Theme(
                                                                                                  data: ThemeData(
                                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                                      visualDensity: VisualDensity.compact,
                                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                      shape: RoundedRectangleBorder(
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                  child: Checkbox(
                                                                                                    value: _model.checkboxValueMap2[historialColumnsItem] ??= historialColumnsItem.efectivo,
                                                                                                    onChanged: true
                                                                                                        ? null
                                                                                                        : (newValue) async {
                                                                                                            safeSetState(() => _model.checkboxValueMap2[historialColumnsItem] = newValue!);
                                                                                                          },
                                                                                                    side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                                        ? BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                          )
                                                                                                        : null,
                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                    checkColor: true ? null : FlutterFlowTheme.of(context).info,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                        child: StreamBuilder<ClientesRecord>(
                                                                                          stream: ClientesRecord.getDocument(widget.idCliente!),
                                                                                          builder: (context, snapshot) {
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

                                                                                            final buttonClientesRecord = snapshot.data!;

                                                                                            return FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                if (historialColumnsItem.isVoucherSent == true) {
                                                                                                  await showDialog(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return AlertDialog(
                                                                                                        title: Text('¡Alerta!'),
                                                                                                        content: Text('Ya ha enviado un voucher, por favor espere a que el tendero acepte su voucher.'),
                                                                                                        actions: [
                                                                                                          TextButton(
                                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                            child: Text('Ok'),
                                                                                                          ),
                                                                                                        ],
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                } else {
                                                                                                  context.pushNamed(
                                                                                                    HistorialSingleVoucherPagoWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'idCliente': serializeParam(
                                                                                                        widget.idCliente,
                                                                                                        ParamType.DocumentReference,
                                                                                                      ),
                                                                                                      'indexFromHistorial': serializeParam(
                                                                                                        historialColumnsIndex,
                                                                                                        ParamType.int,
                                                                                                      ),
                                                                                                      'totalPagadoFromHistorial': serializeParam(
                                                                                                        historialColumnsItem.totalPagado,
                                                                                                        ParamType.double,
                                                                                                      ),
                                                                                                      'transferFromHistorial': serializeParam(
                                                                                                        historialColumnsItem.transferencia,
                                                                                                        ParamType.bool,
                                                                                                      ),
                                                                                                      'efectivoFromHistorial': serializeParam(
                                                                                                        historialColumnsItem.efectivo,
                                                                                                        ParamType.bool,
                                                                                                      ),
                                                                                                      'dtHistorial': serializeParam(
                                                                                                        historialColumnsItem,
                                                                                                        ParamType.DataStruct,
                                                                                                      ),
                                                                                                      'totalPorPagarFromHistorial': serializeParam(
                                                                                                        historialColumnsItem.totalPorPagar,
                                                                                                        ParamType.double,
                                                                                                      ),
                                                                                                      'totalGeneralFromHistorial': serializeParam(
                                                                                                        historialColumnsItem.totalGeneral,
                                                                                                        ParamType.double,
                                                                                                      ),
                                                                                                      'idTransaccionPassed': serializeParam(
                                                                                                        historialColumnsItem.idTransaccion,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'nombre': serializeParam(
                                                                                                        buttonClientesRecord.cliente.nombre,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'telf': serializeParam(
                                                                                                        buttonClientesRecord.cliente.telf,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'isFiando': serializeParam(
                                                                                                        buttonClientesRecord.cliente.isFiando,
                                                                                                        ParamType.bool,
                                                                                                      ),
                                                                                                      'apellido': serializeParam(
                                                                                                        buttonClientesRecord.cliente.apellido,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'cedula': serializeParam(
                                                                                                        buttonClientesRecord.cliente.cedula,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'tenderoRef': serializeParam(
                                                                                                        widget.idTendero,
                                                                                                        ParamType.DocumentReference,
                                                                                                      ),
                                                                                                      'direccionDomicilio': serializeParam(
                                                                                                        buttonClientesRecord.cliente.direccionDomicilio,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'viviendaAlq': serializeParam(
                                                                                                        buttonClientesRecord.cliente.viviendaAlq,
                                                                                                        ParamType.bool,
                                                                                                      ),
                                                                                                      'vivendaProp': serializeParam(
                                                                                                        buttonClientesRecord.cliente.viviendaPropia,
                                                                                                        ParamType.bool,
                                                                                                      ),
                                                                                                      'emailCliente': serializeParam(
                                                                                                        buttonClientesRecord.cliente.emailCliente,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'historialPorPagarDT': serializeParam(
                                                                                                        widget.historialPorPagarDTList,
                                                                                                        ParamType.DataStruct,
                                                                                                        isList: true,
                                                                                                      ),
                                                                                                      'doc': serializeParam(
                                                                                                        widget.doc,
                                                                                                        ParamType.Document,
                                                                                                        isList: true,
                                                                                                      ),
                                                                                                      'idTenderoList': serializeParam(
                                                                                                        widget.idTenderoList,
                                                                                                        ParamType.DocumentReference,
                                                                                                        isList: true,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'doc': widget.doc,
                                                                                                    },
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                              text: historialColumnsItem.isVoucherSent == true ? '¡Voucher enviado!' : 'Pagar por Transferencia',
                                                                                              options: FFButtonOptions(
                                                                                                width: 180.0,
                                                                                                height: 32.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: historialColumnsItem.isVoucherSent == true ? FlutterFlowTheme.of(context).accent2 : FlutterFlowTheme.of(context).accent1,
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: historialColumnsItem.isVoucherSent == true ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primary,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  width: 2.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].divide(SizedBox(height: 5.0)).addToEnd(SizedBox(height: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 15.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 15.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }).divide(SizedBox(
                                                                height: 15.0)),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      '¡Alerta!'),
                                                                  content: Text(
                                                                      'Esta por enviar un comprobante de todos los productos, debe pagar: \$${formatNumber(
                                                                    resumenFiadoClienProdsNewClientesRecord
                                                                        .cliente
                                                                        .totalDeudaCompleta,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format:
                                                                        '#0.00',
                                                                    locale: '',
                                                                  )} en total. ¿Está seguro?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Cancel'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Confirm'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      if (resumenFiadoClienProdsNewClientesRecord
                                                              .cliente
                                                              .historialPorPagarProd
                                                              .where((e) => e
                                                                  .isVoucherSent)
                                                              .toList()
                                                              .length >
                                                          0) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  '¡Alerta!'),
                                                              content: Text(
                                                                  'Ya ha enviado un comprobante, por favor espere a que el tendero acepte su comprobante.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        return;
                                                      } else {
                                                        context.pushNamed(
                                                          HistorialFullVoucherPagoWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'idCliente':
                                                                serializeParam(
                                                              widget.idCliente,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'nombre':
                                                                serializeParam(
                                                              widget
                                                                  .nombreCliente,
                                                              ParamType.String,
                                                            ),
                                                            'tenderoRef':
                                                                serializeParam(
                                                              widget.idTendero,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'historialPorPagarDT':
                                                                serializeParam(
                                                              widget
                                                                  .historialPorPagarDTList,
                                                              ParamType
                                                                  .DataStruct,
                                                              isList: true,
                                                            ),
                                                            'doc':
                                                                serializeParam(
                                                              widget.doc,
                                                              ParamType
                                                                  .Document,
                                                              isList: true,
                                                            ),
                                                            'idTenderoList':
                                                                serializeParam(
                                                              widget
                                                                  .idTenderoList,
                                                              ParamType
                                                                  .DocumentReference,
                                                              isList: true,
                                                            ),
                                                            'telf':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente.telf,
                                                              ParamType.String,
                                                            ),
                                                            'isFiando':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .isFiando,
                                                              ParamType.bool,
                                                            ),
                                                            'apellido':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .apellido,
                                                              ParamType.String,
                                                            ),
                                                            'cedula':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .cedula,
                                                              ParamType.String,
                                                            ),
                                                            'direccionDomicilio':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .direccionDomicilio,
                                                              ParamType.String,
                                                            ),
                                                            'viviendaAlq':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .viviendaAlq,
                                                              ParamType.bool,
                                                            ),
                                                            'vivendaProp':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .viviendaPropia,
                                                              ParamType.bool,
                                                            ),
                                                            'emailCliente':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .emailCliente,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'doc': widget.doc,
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      return;
                                                    }
                                                  },
                                                  text:
                                                      'Pagar Todo Por Transferencia',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: resumenFiadoClienProdsNewClientesRecord
                                                                .cliente
                                                                .historialPorPagarProd
                                                                .where((e) => e
                                                                    .isVoucherSent)
                                                                .toList()
                                                                .length >
                                                            0
                                                        ? Color(0xFFF2AC8D)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .interTight(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                              color: resumenFiadoClienProdsNewClientesRecord
                                                                          .cliente
                                                                          .historialPorPagarProd
                                                                          .where((e) => e
                                                                              .isVoucherSent)
                                                                          .toList()
                                                                          .length >
                                                                      0
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                            ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      HistorialVouchersClienteWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'idCliente':
                                                            serializeParam(
                                                          widget.idCliente,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'idTendero':
                                                            serializeParam(
                                                          widget.idTendero,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'historialPorPagarDTList':
                                                            serializeParam(
                                                          widget
                                                              .historialPorPagarDTList,
                                                          ParamType.DataStruct,
                                                          isList: true,
                                                        ),
                                                        'nombreCliente':
                                                            serializeParam(
                                                          widget.nombreCliente,
                                                          ParamType.String,
                                                        ),
                                                        'doc': serializeParam(
                                                          widget.doc,
                                                          ParamType.Document,
                                                          isList: true,
                                                        ),
                                                        'cedula':
                                                            serializeParam(
                                                          widget.cedula,
                                                          ParamType.String,
                                                        ),
                                                        'idTenderoList':
                                                            serializeParam(
                                                          widget.idTenderoList,
                                                          ParamType
                                                              .DocumentReference,
                                                          isList: true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'doc': widget.doc,
                                                      },
                                                    );
                                                  },
                                                  text:
                                                      'Historial de Comprobantes',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
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
          ),
        );
      },
    );
  }
}
