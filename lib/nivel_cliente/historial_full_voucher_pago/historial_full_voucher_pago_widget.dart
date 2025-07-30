import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/components/dialog_btn_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'historial_full_voucher_pago_model.dart';
export 'historial_full_voucher_pago_model.dart';

class HistorialFullVoucherPagoWidget extends StatefulWidget {
  const HistorialFullVoucherPagoWidget({
    super.key,
    required this.idCliente,
    this.nombre,
    this.telf,
    this.isFiando,
    this.apellido,
    this.cedula,
    this.tenderoRef,
    this.direccionDomicilio,
    this.viviendaAlq,
    this.vivendaProp,
    this.emailCliente,
    this.historialPorPagarDT,
    this.doc,
    this.idTenderoList,
  });

  /// idCliente
  final DocumentReference? idCliente;

  final String? nombre;
  final String? telf;
  final bool? isFiando;
  final String? apellido;
  final String? cedula;
  final DocumentReference? tenderoRef;
  final String? direccionDomicilio;
  final bool? viviendaAlq;
  final bool? vivendaProp;
  final String? emailCliente;
  final List<DataTypeHistorialPagoStruct>? historialPorPagarDT;
  final List<ClientesRecord>? doc;
  final List<DocumentReference>? idTenderoList;

  static String routeName = 'historialFullVoucherPago';
  static String routePath = '/historialFullVoucherPago';

  @override
  State<HistorialFullVoucherPagoWidget> createState() =>
      _HistorialFullVoucherPagoWidgetState();
}

class _HistorialFullVoucherPagoWidgetState
    extends State<HistorialFullVoucherPagoWidget> {
  late HistorialFullVoucherPagoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistorialFullVoucherPagoModel());

    _model.numComprobanteTextController ??= TextEditingController();
    _model.numComprobanteFocusNode ??= FocusNode();

    _model.nombreBancoTextController ??= TextEditingController();
    _model.nombreBancoFocusNode ??= FocusNode();

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
      stream: _model.queryNombreCliente(
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

        final historialFullVoucherPagoClientesRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(200.0),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 12.0, 8.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 12.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.goNamed(
                                  ResumenFiadoClienProdsNewWidget.routeName,
                                  queryParameters: {
                                    'historialPorPagarDTList': serializeParam(
                                      widget.historialPorPagarDT,
                                      ParamType.DataStruct,
                                      isList: true,
                                    ),
                                    'nombreCliente': serializeParam(
                                      widget.nombre,
                                      ParamType.String,
                                    ),
                                    'idCliente': serializeParam(
                                      widget.idCliente,
                                      ParamType.DocumentReference,
                                    ),
                                    'idTendero': serializeParam(
                                      widget.tenderoRef,
                                      ParamType.DocumentReference,
                                    ),
                                    'doc': serializeParam(
                                      widget.doc,
                                      ParamType.Document,
                                      isList: true,
                                    ),
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
                                  extra: <String, dynamic>{
                                    'doc': widget.doc,
                                  },
                                );
                              },
                            ),
                          ),
                          Expanded(
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
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final pageViewTenderosRecord = snapshot.data!;

                                return Container(
                                  height: 190.0,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 40.0),
                                        child: PageView(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(initialPage: 0),
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            StreamBuilder<TenderosRecord>(
                                              stream:
                                                  TenderosRecord.getDocument(
                                                      widget.tenderoRef!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final infoColumnTenderosRecord =
                                                    snapshot.data!;

                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      AutoSizeText(
                                                        'Cuenta principal',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      26.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Flexible(
                                                        child: AutoSizeText(
                                                          'Núm. de Cuenta: ${infoColumnTenderosRecord.tenderos.numCuenta}',
                                                          minFontSize: 10.0,
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
                                                                fontSize: 16.0,
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
                                                      Flexible(
                                                        child: AutoSizeText(
                                                          'Titular: ${infoColumnTenderosRecord.tenderos.nombreTitularBanco}',
                                                          maxLines: 2,
                                                          minFontSize: 10.0,
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
                                                                fontSize: 16.0,
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
                                                      AutoSizeText(
                                                        infoColumnTenderosRecord
                                                            .tenderos
                                                            .tipoDeCuenta,
                                                        minFontSize: 10.0,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Flexible(
                                                        child: AutoSizeText(
                                                          'Banco: ${infoColumnTenderosRecord.tenderos.cuentaDeBancoName}',
                                                          minFontSize: 10.0,
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
                                                                fontSize: 16.0,
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
                                                      Flexible(
                                                        child: AutoSizeText(
                                                          'Tienda: ${infoColumnTenderosRecord.tenderos.nombreTienda}',
                                                          minFontSize: 10.0,
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
                                                                fontSize: 16.0,
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
                                                      AutoSizeText(
                                                        'Total A Pagar: \$${formatNumber(
                                                          historialFullVoucherPagoClientesRecord
                                                              .cliente
                                                              .totalDeudaCompleta,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '#0.00',
                                                          locale: '',
                                                        )}',
                                                        minFontSize: 10.0,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  AutoSizeText(
                                                    'Cuenta secundaria',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                          fontSize: 26.0,
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
                                                  if (pageViewTenderosRecord
                                                              .tenderos
                                                              .cuentaSecTendero
                                                              .numCuentaSec !=
                                                          '')
                                                    Flexible(
                                                      child: AutoSizeText(
                                                        'Núm. de Cuenta: ${pageViewTenderosRecord.tenderos.cuentaSecTendero.numCuentaSec}',
                                                        minFontSize: 8.0,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  if (pageViewTenderosRecord
                                                              .tenderos
                                                              .cuentaSecTendero
                                                              .numCuentaSec !=
                                                          '')
                                                    Flexible(
                                                      child: AutoSizeText(
                                                        'Titular: ${pageViewTenderosRecord.tenderos.cuentaSecTendero.nombreTitularBancoSec}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        minFontSize: 8.0,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  if (pageViewTenderosRecord
                                                              .tenderos
                                                              .cuentaSecTendero
                                                              .numCuentaSec !=
                                                          '')
                                                    AutoSizeText(
                                                      pageViewTenderosRecord
                                                          .tenderos
                                                          .cuentaSecTendero
                                                          .tipoDeCuentaSec,
                                                      minFontSize: 8.0,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  if (pageViewTenderosRecord
                                                              .tenderos
                                                              .cuentaSecTendero
                                                              .numCuentaSec !=
                                                          '')
                                                    Flexible(
                                                      child: AutoSizeText(
                                                        'Banco: ${pageViewTenderosRecord.tenderos.cuentaSecTendero.cuentaDeBancoSecName}',
                                                        minFontSize: 8.0,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  Flexible(
                                                    child: AutoSizeText(
                                                      'Tienda: ${pageViewTenderosRecord.tenderos.nombreTienda}',
                                                      minFontSize: 8.0,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                fontSize: 16.0,
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
                                                  if (pageViewTenderosRecord
                                                              .tenderos
                                                              .cuentaSecTendero
                                                              .numCuentaSec ==
                                                          '')
                                                    AutoSizeText(
                                                      'Este tendero no tiene \nuna cuenta secundaria',
                                                      minFontSize: 10.0,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                fontSize: 16.0,
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
                                                  AutoSizeText(
                                                    'Total A Pagar: \$${formatNumber(
                                                      historialFullVoucherPagoClientesRecord
                                                          .cliente
                                                          .totalDeudaCompleta,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '#0.00',
                                                      locale: '',
                                                    )}',
                                                    minFontSize: 10.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: smooth_page_indicator
                                              .SmoothPageIndicator(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(initialPage: 0),
                                            count: 2,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) async {
                                              await _model.pageViewController!
                                                  .animateToPage(
                                                i,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                              safeSetState(() {});
                                            },
                                            effect: smooth_page_indicator
                                                .SlideEffect(
                                              spacing: 8.0,
                                              radius: 8.0,
                                              dotWidth: 8.0,
                                              dotHeight: 8.0,
                                              dotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              activeDotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              paintStyle: PaintingStyle.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [],
                  centerTitle: false,
                  toolbarHeight: 200.0,
                  elevation: 0.0,
                ),
              ),
              body: SafeArea(
                top: true,
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Container(
                                  width: 360.0,
                                  height: 60.0,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.numComprobanteTextController,
                                      focusNode: _model.numComprobanteFocusNode,
                                      autofocus: false,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'Núm. de comprobante',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
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
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                            lineHeight: 3.0,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .numComprobanteTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        if (!isAndroid && !isiOS)
                                          TextInputFormatter.withFunction(
                                              (oldValue, newValue) {
                                            return TextEditingValue(
                                              selection: newValue.selection,
                                              text: newValue.text
                                                  .toCapitalization(
                                                      TextCapitalization.none),
                                            );
                                          }),
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 360.0,
                                height: 60.1,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: TextFormField(
                                    controller:
                                        _model.nombreBancoTextController,
                                    focusNode: _model.nombreBancoFocusNode,
                                    autofocus: false,
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelText: 'Nombre del banco',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
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
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 3.0,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .nombreBancoTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.none),
                                          );
                                        }),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 770.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Text(
                                            'Tipo de \nTransferencia:',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
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
                                                  fontSize: 26.0,
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Ventanilla',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
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
                                                          SizedBox(
                                                            width: 110.0,
                                                            child: Divider(
                                                              height: 0.0,
                                                              thickness: 0.0,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Transform.scale(
                                                            scaleX: 1.2,
                                                            scaleY: 1.2,
                                                            child: Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .standard,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .padded,
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
                                                                        .checkVentValue ??=
                                                                    false,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.checkVentValue =
                                                                          newValue!);
                                                                  if (newValue!) {
                                                                    if ((_model.checkElectrValue == true) ||
                                                                        (_model.checkBancaValue ==
                                                                            true) ||
                                                                        (_model.checkMovilValue ==
                                                                            true)) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkElectrValue =
                                                                            false;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkBancaValue =
                                                                            false;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkMovilValue =
                                                                            false;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkVentValue =
                                                                            true;
                                                                      });
                                                                    } else {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkVentValue =
                                                                            true;
                                                                      });
                                                                    }
                                                                  }
                                                                },
                                                                side: (FlutterFlowTheme.of(context)
                                                                            .alternate !=
                                                                        null)
                                                                    ? BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      )
                                                                    : null,
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                checkColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
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
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Aplicación Móvil',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
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
                                                          SizedBox(
                                                            width: 110.0,
                                                            child: Divider(
                                                              height: 0.0,
                                                              thickness: 0.0,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Transform.scale(
                                                            scaleX: 1.2,
                                                            scaleY: 1.2,
                                                            child: Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .standard,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .padded,
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
                                                                        .checkMovilValue ??=
                                                                    false,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.checkMovilValue =
                                                                          newValue!);
                                                                  if (newValue!) {
                                                                    if ((_model.checkElectrValue == true) ||
                                                                        (_model.checkBancaValue ==
                                                                            true) ||
                                                                        (_model.checkVentValue ==
                                                                            true)) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkElectrValue =
                                                                            false;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkBancaValue =
                                                                            false;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkVentValue =
                                                                            false;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkMovilValue =
                                                                            true;
                                                                      });
                                                                    } else {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkMovilValue =
                                                                            true;
                                                                      });
                                                                    }
                                                                  }
                                                                },
                                                                side: (FlutterFlowTheme.of(context)
                                                                            .alternate !=
                                                                        null)
                                                                    ? BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      )
                                                                    : null,
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                checkColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Banca Web',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
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
                                                          SizedBox(
                                                            width: 110.0,
                                                            child: Divider(
                                                              height: 0.0,
                                                              thickness: 0.0,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Transform.scale(
                                                            scaleX: 1.2,
                                                            scaleY: 1.2,
                                                            child: Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .standard,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .padded,
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
                                                                        .checkBancaValue ??=
                                                                    false,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.checkBancaValue =
                                                                          newValue!);
                                                                  if (newValue!) {
                                                                    if ((_model.checkElectrValue == true) ||
                                                                        (_model.checkVentValue ==
                                                                            true) ||
                                                                        (_model.checkMovilValue ==
                                                                            true)) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkElectrValue =
                                                                            false;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkBancaValue =
                                                                            true;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkMovilValue =
                                                                            false;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkVentValue =
                                                                            false;
                                                                      });
                                                                    } else {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkBancaValue =
                                                                            true;
                                                                      });
                                                                    }
                                                                  }
                                                                },
                                                                side: (FlutterFlowTheme.of(context)
                                                                            .alternate !=
                                                                        null)
                                                                    ? BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      )
                                                                    : null,
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                checkColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
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
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Electrónico',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
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
                                                          SizedBox(
                                                            width: 110.0,
                                                            child: Divider(
                                                              height: 0.0,
                                                              thickness: 0.0,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Transform.scale(
                                                            scaleX: 1.2,
                                                            scaleY: 1.2,
                                                            child: Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .standard,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .padded,
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
                                                                        .checkElectrValue ??=
                                                                    false,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.checkElectrValue =
                                                                          newValue!);
                                                                  if (newValue!) {
                                                                    if ((_model.checkBancaValue == true) ||
                                                                        (_model.checkVentValue ==
                                                                            true) ||
                                                                        (_model.checkMovilValue ==
                                                                            true)) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkElectrValue =
                                                                            true;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkBancaValue =
                                                                            false;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkMovilValue =
                                                                            false;
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkVentValue =
                                                                            false;
                                                                      });
                                                                    } else {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.checkElectrValue =
                                                                            true;
                                                                      });
                                                                    }
                                                                  }
                                                                },
                                                                side: (FlutterFlowTheme.of(context)
                                                                            .alternate !=
                                                                        null)
                                                                    ? BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      )
                                                                    : null,
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                checkColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed:
                                                        (_model.uploadedFileUrl_uploadDataZ9l2 !=
                                                                    '')
                                                            ? null
                                                            : () async {
                                                                final selectedMedia =
                                                                    await selectMediaWithSourceBottomSheet(
                                                                  context:
                                                                      context,
                                                                  storageFolderPath:
                                                                      'clientes/uploads',
                                                                  allowPhoto:
                                                                      true,
                                                                  textColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataZ9l2 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls =
                                                                        await uploadSupabaseStorageFiles(
                                                                      bucketName:
                                                                          'img.vouchers',
                                                                      selectedFiles:
                                                                          selectedMedia,
                                                                    );
                                                                  } finally {
                                                                    _model.isDataUploading_uploadDataZ9l2 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile_uploadDataZ9l2 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataZ9l2 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                _model.dtHistorialUpdateList =
                                                                    historialFullVoucherPagoClientesRecord
                                                                        .cliente
                                                                        .historialPorPagarProd
                                                                        .toList()
                                                                        .cast<
                                                                            DataTypeHistorialPagoStruct>();
                                                                safeSetState(
                                                                    () {});
                                                                for (int loop1Index =
                                                                        0;
                                                                    loop1Index <
                                                                        historialFullVoucherPagoClientesRecord
                                                                            .cliente
                                                                            .historialPorPagarProd
                                                                            .length;
                                                                    loop1Index++) {
                                                                  final currentLoop1Item =
                                                                      historialFullVoucherPagoClientesRecord
                                                                          .cliente
                                                                          .historialPorPagarProd[loop1Index];
                                                                  _model
                                                                      .updateDtHistorialUpdateListAtIndex(
                                                                    loop1Index,
                                                                    (e) => e
                                                                      ..isVoucherSent =
                                                                          true,
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                await widget
                                                                    .idCliente!
                                                                    .update(
                                                                        createClientesRecordData(
                                                                  cliente:
                                                                      createDataTypeClienteStruct(
                                                                    fieldValues: {
                                                                      'historialPorPagarProd':
                                                                          getDataTypeHistorialPagoListFirestoreData(
                                                                        _model
                                                                            .dtHistorialUpdateList,
                                                                      ),
                                                                    },
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                              },
                                                    text: _model.uploadedFileUrl_uploadDataZ9l2 !=
                                                                ''
                                                        ? '¡Comprobante Enviado!'
                                                        : 'Subir Comprobante',
                                                    options: FFButtonOptions(
                                                      width: 250.0,
                                                      height: 50.0,
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
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      disabledColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      disabledTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        if (_model.uploadedFileUrl_uploadDataZ9l2 ==
                                                                '') {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
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
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        200.0,
                                                                    child:
                                                                        DialogBtnWidget(
                                                                      titulo:
                                                                          '¡Alerta!',
                                                                      mensaje:
                                                                          'Ingrese la imágen del comprobante.',
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        } else {
                                                          if (_model.numComprobanteTextController
                                                                      .text ==
                                                                  '') {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
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
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          200.0,
                                                                      child:
                                                                          DialogBtnWidget(
                                                                        titulo:
                                                                            '¡Alerta!',
                                                                        mensaje:
                                                                            'Ingrese el número del comprobante.',
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
                                                          }
                                                          _model.urlSupaImg = _model
                                                              .uploadedFileUrl_uploadDataZ9l2;
                                                          safeSetState(() {});
                                                          if ((_model.checkElectrValue == false) &&
                                                              (_model.checkBancaValue ==
                                                                  false) &&
                                                              (_model.checkVentValue ==
                                                                  false) &&
                                                              (_model.checkMovilValue ==
                                                                  false)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
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
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          200.0,
                                                                      child:
                                                                          DialogBtnWidget(
                                                                        titulo:
                                                                            '¡Alerta!',
                                                                        mensaje:
                                                                            'Ingrese el tipo de transferencia.',
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
                                                            if (((_model.checkElectrValue == true) && (_model.checkBancaValue == true)) ||
                                                                ((_model.checkVentValue ==
                                                                        true) &&
                                                                    (_model.checkBancaValue ==
                                                                        true)) ||
                                                                ((_model.checkVentValue ==
                                                                        true) &&
                                                                    (_model.checkElectrValue ==
                                                                        true)) ||
                                                                ((_model.checkElectrValue ==
                                                                        true) &&
                                                                    (_model.checkMovilValue ==
                                                                        true)) ||
                                                                ((_model.checkVentValue ==
                                                                        true) &&
                                                                    (_model.checkMovilValue ==
                                                                        true)) ||
                                                                ((_model.checkBancaValue ==
                                                                        true) &&
                                                                    (_model.checkMovilValue ==
                                                                        true)) ||
                                                                ((_model.checkBancaValue ==
                                                                        true) &&
                                                                    (_model.checkMovilValue ==
                                                                        true) &&
                                                                    (_model.checkVentValue ==
                                                                        true)) ||
                                                                ((_model.checkElectrValue == true) &&
                                                                    (_model.checkMovilValue ==
                                                                        true) &&
                                                                    (_model.checkVentValue ==
                                                                        true)) ||
                                                                ((_model
                                                                            .checkElectrValue ==
                                                                        true) &&
                                                                    (_model.checkBancaValue ==
                                                                        true) &&
                                                                    (_model.checkVentValue ==
                                                                        true)) ||
                                                                ((_model
                                                                            .checkMovilValue ==
                                                                        true) &&
                                                                    (_model.checkBancaValue ==
                                                                        true) &&
                                                                    (_model.checkElectrValue ==
                                                                        true))) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            200.0,
                                                                        child:
                                                                            DialogBtnWidget(
                                                                          titulo:
                                                                              '¡Alerta!',
                                                                          mensaje:
                                                                              'Ingrese un solo tipo de transferencia.',
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
                                                            }

                                                            await widget
                                                                .idCliente!
                                                                .update(
                                                                    createClientesRecordData(
                                                              cliente:
                                                                  createDataTypeClienteStruct(
                                                                fieldValues: {
                                                                  'DataTypeVouchers':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getDataTypeVouchersFirestoreData(
                                                                      createDataTypeVouchersStruct(
                                                                        imgVoucher:
                                                                            _model.uploadedFileUrl_uploadDataZ9l2,
                                                                        idCliente:
                                                                            widget.idCliente,
                                                                        estadoVoucher:
                                                                            'Pendiente',
                                                                        tipoVoucher:
                                                                            () {
                                                                          if (_model.checkElectrValue ==
                                                                              true) {
                                                                            return 'Electrónico';
                                                                          } else if (_model.checkBancaValue ==
                                                                              true) {
                                                                            return 'Banca Web';
                                                                          } else if (_model.checkVentValue ==
                                                                              true) {
                                                                            return 'Ventanilla';
                                                                          } else if (_model.checkMovilValue ==
                                                                              true) {
                                                                            return 'Aplicación móvil';
                                                                          } else {
                                                                            return 'No establecido';
                                                                          }
                                                                        }(),
                                                                        montoAPagar: historialFullVoucherPagoClientesRecord
                                                                            .cliente
                                                                            .totalDeudaCompleta,
                                                                        isFullPago:
                                                                            true,
                                                                        idTransaccion:
                                                                            random_data.randomString(
                                                                          6,
                                                                          6,
                                                                          true,
                                                                          true,
                                                                          true,
                                                                        ),
                                                                        numVoucher: int.tryParse(_model
                                                                            .numComprobanteTextController
                                                                            .text),
                                                                        nombreBanco: _model
                                                                            .nombreBancoTextController
                                                                            .text,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                },
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                            ));
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
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
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          200.0,
                                                                      child:
                                                                          DialogBtnWidget(
                                                                        titulo:
                                                                            '¡Comprobante registrado!',
                                                                        mensaje:
                                                                            'El comprobante ha sido enviado.',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            _model.tenderoReadFull =
                                                                await TenderosRecord
                                                                    .getDocumentOnce(
                                                                        widget
                                                                            .tenderoRef!);
                                                            _shouldSetState =
                                                                true;
                                                            for (int loop1Index =
                                                                    0;
                                                                loop1Index <
                                                                    _model
                                                                        .tenderoReadFull!
                                                                        .playerIds
                                                                        .length;
                                                                loop1Index++) {
                                                              final currentLoop1Item = _model
                                                                      .tenderoReadFull!
                                                                      .playerIds[
                                                                  loop1Index];
                                                              unawaited(
                                                                () async {
                                                                  await actions
                                                                      .sendNotificationToPlayer(
                                                                    currentLoop1Item,
                                                                    'Tienda ${_model.tenderoReadFull?.displayName}: ¡El cliente ${widget.nombre} ha enviado un comprobante de pago de todos los productos que fía actualmente.',
                                                                  );
                                                                }(),
                                                              );
                                                            }
                                                            unawaited(
                                                              () async {
                                                                await actions
                                                                    .sendCustomEmailForSentVoucherToTendero(
                                                                  _model
                                                                      .tenderoReadFull!
                                                                      .email,
                                                                  _model
                                                                      .tenderoReadFull!
                                                                      .displayName,
                                                                  'El cliente: ${widget.nombre} ha enviado un comprobante a la tienda: ${_model.tenderoReadFull?.displayName}',
                                                                  _model
                                                                      .tenderoReadFull!
                                                                      .displayName,
                                                                  '${widget.nombre} ${widget.apellido}',
                                                                  formatNumber(
                                                                    historialFullVoucherPagoClientesRecord
                                                                        .cliente
                                                                        .totalDeudaCompleta,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format:
                                                                        '#0.00',
                                                                    locale: '',
                                                                  ),
                                                                  () {
                                                                    if (_model
                                                                            .checkElectrValue ==
                                                                        true) {
                                                                      return 'Electrónico';
                                                                    } else if (_model
                                                                            .checkBancaValue ==
                                                                        true) {
                                                                      return 'Banca Web';
                                                                    } else if (_model
                                                                            .checkVentValue ==
                                                                        true) {
                                                                      return 'Ventanilla';
                                                                    } else if (_model
                                                                            .checkMovilValue ==
                                                                        true) {
                                                                      return 'Aplicación móvil';
                                                                    } else {
                                                                      return 'No establecido';
                                                                    }
                                                                  }(),
                                                                  _model
                                                                      .numComprobanteTextController
                                                                      .text,
                                                                );
                                                              }(),
                                                            );

                                                            context.goNamed(
                                                              ResumenFiadoClienProdsNewWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'historialPorPagarDTList':
                                                                    serializeParam(
                                                                  widget
                                                                      .historialPorPagarDT,
                                                                  ParamType
                                                                      .DataStruct,
                                                                  isList: true,
                                                                ),
                                                                'nombreCliente':
                                                                    serializeParam(
                                                                  widget
                                                                      .nombre,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'idCliente':
                                                                    serializeParam(
                                                                  widget
                                                                      .idCliente,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'idTendero':
                                                                    serializeParam(
                                                                  widget
                                                                      .tenderoRef,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'doc':
                                                                    serializeParam(
                                                                  widget.doc,
                                                                  ParamType
                                                                      .Document,
                                                                  isList: true,
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
                                                                  isList: true,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'doc':
                                                                    widget.doc,
                                                              },
                                                            );
                                                          }
                                                        }

                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                      },
                                                      text: 'Guardar',
                                                      options: FFButtonOptions(
                                                        width: 160.0,
                                                        height: 50.0,
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
                                                                .secondary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 15.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
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
  }
}
