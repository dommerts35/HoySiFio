import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/components/dialog_two_btns_widget.dart';
import '/components_cliente/empty_productos_fiados_cliente/empty_productos_fiados_cliente_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
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
                                        height: 730.0,
                                        constraints: BoxConstraints(
                                          maxWidth: 430.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 0.0),
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
                                                              0.0),
                                                    ),
                                                    child: Column(
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
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                borderRadius:
                                                                    12.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    35.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_back_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  size: 18.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    ResumenFiadoClienTiendaNewWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
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
                                                                },
                                                              ),
                                                              AutoSizeText(
                                                                'Resúmen de productos\nde fiados',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                minFontSize:
                                                                    16.0,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .readexPro(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                  borderRadius:
                                                                      12.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      35.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .logout,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    size: 18.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    var _shouldSetState =
                                                                        false;
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: 300.0,
                                                                              child: DialogTwoBtnsWidget(
                                                                                titulo: '¿Desea cerrar sesión?',
                                                                                mensaje: 'Sus datos se guardarán automáticamente.',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(() =>
                                                                            _model.isLogoff =
                                                                                value));

                                                                    _shouldSetState =
                                                                        true;
                                                                    if (_model
                                                                        .isLogoff!) {
                                                                      context.goNamed(
                                                                          AuthSigningInWidget
                                                                              .routeName);
                                                                    } else {
                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    }

                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 300.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        TenderosRecord>(
                                                                      stream: TenderosRecord.getDocument(
                                                                          widget
                                                                              .idTendero!),
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

                                                                        final textTenderosRecord =
                                                                            snapshot.data!;

                                                                        return AutoSizeText(
                                                                          'Tienda: ${textTenderosRecord.tenderos.nombreTienda}',
                                                                          minFontSize:
                                                                              8.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                              ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Total: \$${formatNumber(
                                                                    resumenFiadoClienProdsNewClientesRecord
                                                                        .cliente
                                                                        .totalDeudaCompleta,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format:
                                                                        '#0.00',
                                                                    locale: '',
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .readexPro(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 5.0))
                                                          .addToStart(SizedBox(
                                                              height: 5.0))
                                                          .addToEnd(SizedBox(
                                                              height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 455.0,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 430.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 5.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final historialColumns =
                                                            resumenFiadoClienProdsNewClientesRecord
                                                                .cliente
                                                                .historialPorPagarProd
                                                                .map((e) => e)
                                                                .toList();
                                                        if (historialColumns
                                                            .isEmpty) {
                                                          return Center(
                                                            child:
                                                                EmptyProductosFiadosClienteWidget(),
                                                          );
                                                        }

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
                                                              return Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 2.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child:
                                                                    Container(
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
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            24.0),
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
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              constraints: BoxConstraints(
                                                                                minHeight: 190.0,
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
                                                                                              font: GoogleFonts.asap(
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
                                                                                              font: GoogleFonts.asap(
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
                                                                                              font: GoogleFonts.asap(
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
                                                                                              font: GoogleFonts.asap(
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
                                                                                          return Container(
                                                                                            width: 285.0,
                                                                                            height: 45.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    child: Column(
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
                                                                                                        Flexible(
                                                                                                          child: AutoSizeText(
                                                                                                            valueOrDefault<String>(
                                                                                                              productosChildItem.nombreProd,
                                                                                                              'p',
                                                                                                            ),
                                                                                                            maxLines: 2,
                                                                                                            minFontSize: 4.0,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.asap(
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
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    child: Column(
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
                                                                                                        Flexible(
                                                                                                          child: AutoSizeText(
                                                                                                            valueOrDefault<String>(
                                                                                                              productosChildItem.cantidad.toString(),
                                                                                                              '0',
                                                                                                            ),
                                                                                                            minFontSize: 6.0,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.asap(
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
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    child: Column(
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
                                                                                                        Flexible(
                                                                                                          child: AutoSizeText(
                                                                                                            '\$${formatNumber(
                                                                                                              productosChildItem.valorProd / productosChildItem.cantidad,
                                                                                                              formatType: FormatType.custom,
                                                                                                              format: '#0.00',
                                                                                                              locale: '',
                                                                                                            )}',
                                                                                                            textAlign: TextAlign.end,
                                                                                                            minFontSize: 6.0,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.asap(
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
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    child: Column(
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
                                                                                                        Flexible(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                            child: AutoSizeText(
                                                                                                              '\$${formatNumber(
                                                                                                                productosChildItem.valorProd,
                                                                                                                formatType: FormatType.custom,
                                                                                                                format: '#0.00',
                                                                                                                locale: '',
                                                                                                              )}',
                                                                                                              textAlign: TextAlign.end,
                                                                                                              minFontSize: 6.0,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.asap(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                font: GoogleFonts.asap(
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
                                                                                                font: GoogleFonts.asap(
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
                                                                                                font: GoogleFonts.asap(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 300.0,
                                                                                          height: 20.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: AutoSizeText(
                                                                                                      'Fecha del fio: ${dateTimeFormat(
                                                                                                        "d/M/y h:mm a",
                                                                                                        historialColumnsItem.fechaDeFio,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      )}',
                                                                                                      minFontSize: 6.0,
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.asap(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
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
                                                                                                          font: GoogleFonts.asap(
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
                                                                                                          font: GoogleFonts.asap(
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
                                                                                      Builder(
                                                                                        builder: (context) => StreamBuilder<ClientesRecord>(
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
                                                                                                    builder: (dialogContext) {
                                                                                                      return Dialog(
                                                                                                        elevation: 0,
                                                                                                        insetPadding: EdgeInsets.zero,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () {
                                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            height: 200.0,
                                                                                                            child: DialogBtnWidget(
                                                                                                              titulo: '¡Alerta!',
                                                                                                              mensaje: 'Ya ha enviado un voucher, por favor espere a que el tendero acepte su voucher.',
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
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
                                                                                                      font: GoogleFonts.asap(
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
                                                                                ].divide(SizedBox(height: 5.0)),
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
                                                Builder(
                                                  builder: (context) => Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed:
                                                          (resumenFiadoClienProdsNewClientesRecord
                                                                      .cliente
                                                                      .historialPorPagarProd
                                                                      .length <=
                                                                  0)
                                                              ? null
                                                              : () async {
                                                                  var _shouldSetState =
                                                                      false;
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                500.0,
                                                                            child:
                                                                                DialogTwoBtnsWidget(
                                                                              titulo: '¡Alerta!',
                                                                              mensaje: 'Esta por enviar un comprobante de todos los productos, debe pagar: \$${formatNumber(
                                                                                resumenFiadoClienProdsNewClientesRecord.cliente.totalDeudaCompleta,
                                                                                formatType: FormatType.custom,
                                                                                format: '#0.00',
                                                                                locale: '',
                                                                              )} en total. ¿Está seguro?',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(() =>
                                                                          _model.isPagarTodo =
                                                                              value));

                                                                  _shouldSetState =
                                                                      true;
                                                                  if (_model
                                                                      .isPagarTodo!) {
                                                                    if (resumenFiadoClienProdsNewClientesRecord
                                                                            .cliente
                                                                            .historialPorPagarProd
                                                                            .where((e) =>
                                                                                e.isVoucherSent)
                                                                            .toList()
                                                                            .length >
                                                                        0) {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Container(
                                                                                height: 200.0,
                                                                                child: DialogBtnWidget(
                                                                                  titulo: '¡Alerta!',
                                                                                  mensaje: 'Ya ha enviado un comprobante, por favor espere a que el tendero acepte su comprobante.',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    } else {
                                                                      context
                                                                          .pushNamed(
                                                                        HistorialFullVoucherPagoWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'idCliente':
                                                                              serializeParam(
                                                                            widget.idCliente,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                          'nombre':
                                                                              serializeParam(
                                                                            widget.nombreCliente,
                                                                            ParamType.String,
                                                                          ),
                                                                          'tenderoRef':
                                                                              serializeParam(
                                                                            widget.idTendero,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                          'historialPorPagarDT':
                                                                              serializeParam(
                                                                            widget.historialPorPagarDTList,
                                                                            ParamType.DataStruct,
                                                                            isList:
                                                                                true,
                                                                          ),
                                                                          'doc':
                                                                              serializeParam(
                                                                            widget.doc,
                                                                            ParamType.Document,
                                                                            isList:
                                                                                true,
                                                                          ),
                                                                          'idTenderoList':
                                                                              serializeParam(
                                                                            widget.idTenderoList,
                                                                            ParamType.DocumentReference,
                                                                            isList:
                                                                                true,
                                                                          ),
                                                                          'telf':
                                                                              serializeParam(
                                                                            resumenFiadoClienProdsNewClientesRecord.cliente.telf,
                                                                            ParamType.String,
                                                                          ),
                                                                          'isFiando':
                                                                              serializeParam(
                                                                            resumenFiadoClienProdsNewClientesRecord.cliente.isFiando,
                                                                            ParamType.bool,
                                                                          ),
                                                                          'apellido':
                                                                              serializeParam(
                                                                            resumenFiadoClienProdsNewClientesRecord.cliente.apellido,
                                                                            ParamType.String,
                                                                          ),
                                                                          'cedula':
                                                                              serializeParam(
                                                                            resumenFiadoClienProdsNewClientesRecord.cliente.cedula,
                                                                            ParamType.String,
                                                                          ),
                                                                          'direccionDomicilio':
                                                                              serializeParam(
                                                                            resumenFiadoClienProdsNewClientesRecord.cliente.direccionDomicilio,
                                                                            ParamType.String,
                                                                          ),
                                                                          'viviendaAlq':
                                                                              serializeParam(
                                                                            resumenFiadoClienProdsNewClientesRecord.cliente.viviendaAlq,
                                                                            ParamType.bool,
                                                                          ),
                                                                          'vivendaProp':
                                                                              serializeParam(
                                                                            resumenFiadoClienProdsNewClientesRecord.cliente.viviendaPropia,
                                                                            ParamType.bool,
                                                                          ),
                                                                          'emailCliente':
                                                                              serializeParam(
                                                                            resumenFiadoClienProdsNewClientesRecord.cliente.emailCliente,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'doc':
                                                                              widget.doc,
                                                                        },
                                                                      );
                                                                    }
                                                                  } else {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                      text:
                                                          'Pagar Todo Por Transferencia',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: resumenFiadoClienProdsNewClientesRecord
                                                                    .cliente
                                                                    .historialPorPagarProd
                                                                    .where((e) => e
                                                                        .isVoucherSent)
                                                                    .toList()
                                                                    .length >
                                                                0
                                                            ? Color(0xFFFFBEA1)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
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
                                                                          .primaryText
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
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
                                                        elevation: 1.0,
                                                        borderSide: BorderSide(
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        disabledColor:
                                                            Color(0xFFFFBEA1),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: FFButtonWidget(
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
                                                            ParamType
                                                                .DataStruct,
                                                            isList: true,
                                                          ),
                                                          'nombreCliente':
                                                              serializeParam(
                                                            widget
                                                                .nombreCliente,
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
                                                            widget
                                                                .idTenderoList,
                                                            ParamType
                                                                .DocumentReference,
                                                            isList: true,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
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
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .asap(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        HistorialPagosClienteWidget
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
                                                          'historialPagosDTList':
                                                              serializeParam(
                                                            widget
                                                                .historialPorPagarDTList,
                                                            ParamType
                                                                .DataStruct,
                                                            isList: true,
                                                          ),
                                                          'nombreCliente':
                                                              serializeParam(
                                                            widget
                                                                .nombreCliente,
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
                                                            widget
                                                                .idTenderoList,
                                                            ParamType
                                                                .DocumentReference,
                                                            isList: true,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'doc': widget.doc,
                                                        },
                                                      );
                                                    },
                                                    text: 'Historial de pagos',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .asap(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
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
                      ],
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
