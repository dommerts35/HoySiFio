import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/components/dialog_btn_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
    extends State<HistorialFullVoucherPagoWidget>
    with TickerProviderStateMixin {
  late HistorialFullVoucherPagoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistorialFullVoucherPagoModel());

    _model.numComprobanteTextController ??= TextEditingController();
    _model.numComprobanteFocusNode ??= FocusNode();

    _model.nombreBancoTextController ??= TextEditingController();
    _model.nombreBancoFocusNode ??= FocusNode();

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
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-6.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
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
                child: SpinKitWanderingCubes(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
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
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: SafeArea(
                top: true,
                child: Container(
                  decoration: BoxDecoration(),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    height: 200.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderRadius: 12.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              icon: Icon(
                                                Icons.arrow_back,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation'] !=
                                                    null) {
                                                  await animationsMap[
                                                          'containerOnActionTriggerAnimation']!
                                                      .controller
                                                      .forward(from: 0.0);
                                                }

                                                context.goNamed(
                                                  ResumenFiadoClienProdsNewWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'historialPorPagarDTList':
                                                        serializeParam(
                                                      widget
                                                          .historialPorPagarDT,
                                                      ParamType.DataStruct,
                                                      isList: true,
                                                    ),
                                                    'nombreCliente':
                                                        serializeParam(
                                                      widget.nombre,
                                                      ParamType.String,
                                                    ),
                                                    'idCliente': serializeParam(
                                                      widget.idCliente,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'idTendero': serializeParam(
                                                      widget.tenderoRef,
                                                      ParamType
                                                          .DocumentReference,
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
                                            ).animateOnPageLoad(animationsMap[
                                                'iconButtonOnPageLoadAnimation']!),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 28.0, 0.0),
                                                child: StreamBuilder<
                                                    TenderosRecord>(
                                                  stream: TenderosRecord
                                                      .getDocument(
                                                          widget.tenderoRef!),
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

                                                    final pageViewTenderosRecord =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: 280.0,
                                                      height: 210.0,
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        20.0),
                                                            child: PageView(
                                                              controller: _model
                                                                      .pageViewController ??=
                                                                  PageController(
                                                                      initialPage:
                                                                          0),
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              children: [
                                                                StreamBuilder<
                                                                    TenderosRecord>(
                                                                  stream: TenderosRecord
                                                                      .getDocument(
                                                                          widget
                                                                              .tenderoRef!),
                                                                  builder: (context,
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }

                                                                    final infoColumnTenderosRecord =
                                                                        snapshot
                                                                            .data!;

                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        AutoSizeText(
                                                                          'Cuenta principal',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .override(
                                                                                font: GoogleFonts.quicksand(
                                                                                  fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 26.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              AutoSizeText(
                                                                            'Núm. de Cuenta: ${infoColumnTenderosRecord.tenderos.numCuenta}',
                                                                            minFontSize:
                                                                                10.0,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.asap(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              'Titular: ${infoColumnTenderosRecord.tenderos.nombreTitularBanco}',
                                                                              maxLines: 2,
                                                                              minFontSize: 4.0,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    font: GoogleFonts.asap(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AutoSizeText(
                                                                          infoColumnTenderosRecord
                                                                              .tenderos
                                                                              .tipoDeCuenta,
                                                                          minFontSize:
                                                                              4.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                font: GoogleFonts.asap(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              AutoSizeText(
                                                                                'Banco: ${infoColumnTenderosRecord.tenderos.cuentaDeBancoName}',
                                                                                minFontSize: 10.0,
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      font: GoogleFonts.asap(
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              AutoSizeText(
                                                                            'Tienda: ${infoColumnTenderosRecord.tenderos.nombreTienda}',
                                                                            minFontSize:
                                                                                10.0,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.asap(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        AutoSizeText(
                                                                          'Total A Pagar: \$${formatNumber(
                                                                            historialFullVoucherPagoClientesRecord.cliente.totalDeudaCompleta,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '#0.00',
                                                                            locale:
                                                                                '',
                                                                          )}',
                                                                          minFontSize:
                                                                              10.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                font: GoogleFonts.asap(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      'Cuenta secundaria',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.quicksand(
                                                                              fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                26.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    if (pageViewTenderosRecord.tenderos.cuentaSecTendero.numCuentaSec !=
                                                                            '')
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          'Núm. de Cuenta: ${pageViewTenderosRecord.tenderos.cuentaSecTendero.numCuentaSec}',
                                                                          minFontSize:
                                                                              8.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                font: GoogleFonts.asap(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    if (pageViewTenderosRecord.tenderos.cuentaSecTendero.numCuentaSec !=
                                                                            '')
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          'Titular: ${pageViewTenderosRecord.tenderos.cuentaSecTendero.nombreTitularBancoSec}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          minFontSize:
                                                                              3.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                font: GoogleFonts.asap(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    if (pageViewTenderosRecord.tenderos.cuentaSecTendero.numCuentaSec !=
                                                                            '')
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          pageViewTenderosRecord
                                                                              .tenderos
                                                                              .cuentaSecTendero
                                                                              .tipoDeCuentaSec,
                                                                          minFontSize:
                                                                              4.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                font: GoogleFonts.asap(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    Flexible(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          if (pageViewTenderosRecord.tenderos.cuentaSecTendero.numCuentaSec != '')
                                                                            Flexible(
                                                                              child: AutoSizeText(
                                                                                'Banco: ${pageViewTenderosRecord.tenderos.cuentaSecTendero.cuentaDeBancoSecName}',
                                                                                minFontSize: 4.0,
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      font: GoogleFonts.asap(
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          AutoSizeText(
                                                                        'Tienda: ${pageViewTenderosRecord.tenderos.nombreTienda}',
                                                                        minFontSize:
                                                                            4.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.asap(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    if (pageViewTenderosRecord.tenderos.cuentaSecTendero.numCuentaSec ==
                                                                            '')
                                                                      AutoSizeText(
                                                                        'Este tendero no tiene \nuna cuenta secundaria',
                                                                        minFontSize:
                                                                            4.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.asap(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    Flexible(
                                                                      child:
                                                                          AutoSizeText(
                                                                        'Total A Pagar: \$${formatNumber(
                                                                          historialFullVoucherPagoClientesRecord
                                                                              .cliente
                                                                              .totalDeudaCompleta,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '#0.00',
                                                                          locale:
                                                                              '',
                                                                        )}',
                                                                        minFontSize:
                                                                            10.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.asap(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: smooth_page_indicator
                                                                  .SmoothPageIndicator(
                                                                controller: _model
                                                                        .pageViewController ??=
                                                                    PageController(
                                                                        initialPage:
                                                                            0),
                                                                count: 2,
                                                                axisDirection: Axis
                                                                    .horizontal,
                                                                onDotClicked:
                                                                    (i) async {
                                                                  await _model
                                                                      .pageViewController!
                                                                      .animateToPage(
                                                                    i,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            500),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                effect: smooth_page_indicator
                                                                    .SlideEffect(
                                                                  spacing: 8.0,
                                                                  radius: 8.0,
                                                                  dotWidth: 8.0,
                                                                  dotHeight:
                                                                      8.0,
                                                                  dotColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  activeDotColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  paintStyle:
                                                                      PaintingStyle
                                                                          .fill,
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
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
                                          controller: _model
                                              .numComprobanteTextController,
                                          focusNode:
                                              _model.numComprobanteFocusNode,
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: 'Núm. de comprobante',
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.asap(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.asap(
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
                                                      fontSize: 14.0,
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
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            contentPadding:
                                                EdgeInsets.all(14.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.asap(
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
                                              ),
                                          maxLength: 30,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.enforced,
                                          buildCounter: (context,
                                                  {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                              null,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
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
                                                          TextCapitalization
                                                              .none),
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
                                        textCapitalization:
                                            TextCapitalization.none,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Nombre del banco',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.asap(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.asap(
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
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          contentPadding: EdgeInsets.all(14.0),
                                        ),
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
                                            ),
                                        maxLength: 30,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
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
                                                        TextCapitalization
                                                            .none),
                                              );
                                            }),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Text(
                                              'Tipo de transferencia',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
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
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          SizedBox(
                                                            width: 100.0,
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
                                                            scaleX: 1.0,
                                                            scaleY: 1.0,
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
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          SizedBox(
                                                            width: 100.0,
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
                                                            scaleX: 1.0,
                                                            scaleY: 1.0,
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
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          SizedBox(
                                                            width: 100.0,
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
                                                            scaleX: 1.0,
                                                            scaleY: 1.0,
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
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          SizedBox(
                                                            width: 100.0,
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
                                                            scaleX: 1.0,
                                                            scaleY: 1.0,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FFButtonWidget(
                                            onPressed:
                                                (_model.uploadedFileUrl_uploadDataZ9l2 !=
                                                            '')
                                                    ? null
                                                    : () async {
                                                        final selectedMedia =
                                                            await selectMediaWithSourceBottomSheet(
                                                          context: context,
                                                          storageFolderPath:
                                                              'clientes/uploads',
                                                          allowPhoto: true,
                                                          textColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
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
                                                            selectedUploadedFiles =
                                                                selectedMedia
                                                                    .map((m) =>
                                                                        FFUploadedFile(
                                                                          name: m
                                                                              .storagePath
                                                                              .split('/')
                                                                              .last,
                                                                          bytes:
                                                                              m.bytes,
                                                                          height: m
                                                                              .dimensions
                                                                              ?.height,
                                                                          width: m
                                                                              .dimensions
                                                                              ?.width,
                                                                          blurHash:
                                                                              m.blurHash,
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
                                                            safeSetState(() {
                                                              _model.uploadedLocalFile_uploadDataZ9l2 =
                                                                  selectedUploadedFiles
                                                                      .first;
                                                              _model.uploadedFileUrl_uploadDataZ9l2 =
                                                                  downloadUrls
                                                                      .first;
                                                            });
                                                          } else {
                                                            safeSetState(() {});
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
                                                        safeSetState(() {});
                                                        for (int loop1Index = 0;
                                                            loop1Index <
                                                                historialFullVoucherPagoClientesRecord
                                                                    .cliente
                                                                    .historialPorPagarProd
                                                                    .length;
                                                            loop1Index++) {
                                                          final currentLoop1Item =
                                                              historialFullVoucherPagoClientesRecord
                                                                      .cliente
                                                                      .historialPorPagarProd[
                                                                  loop1Index];
                                                          _model
                                                              .updateDtHistorialUpdateListAtIndex(
                                                            loop1Index,
                                                            (e) => e
                                                              ..isVoucherSent =
                                                                  true,
                                                          );
                                                          safeSetState(() {});
                                                        }

                                                        await widget.idCliente!
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
                                                ? '¡Imágen subida exitosamente!'
                                                : 'Subir imágen de comprobante',
                                            options: FFButtonOptions(
                                              padding: EdgeInsets.all(10.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              disabledTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Builder(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  if (_model.uploadedFileUrl_uploadDataZ9l2 ==
                                                          '') {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
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
                                                              height: 200.0,
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
                                                                height: 200.0,
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
                                                        safeSetState(() {});
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
                                                                height: 200.0,
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
                                                        safeSetState(() {});
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
                                                          ((_model
                                                                      .checkBancaValue ==
                                                                  true) &&
                                                              (_model.checkMovilValue ==
                                                                  true)) ||
                                                          ((_model
                                                                      .checkBancaValue ==
                                                                  true) &&
                                                              (_model.checkMovilValue ==
                                                                  true) &&
                                                              (_model.checkVentValue ==
                                                                  true)) ||
                                                          ((_model
                                                                      .checkElectrValue ==
                                                                  true) &&
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
                                                                child:
                                                                    Container(
                                                                  height: 200.0,
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
                                                          safeSetState(() {});
                                                        return;
                                                      }

                                                      await widget.idCliente!
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
                                                                  imgVoucher: _model
                                                                      .uploadedFileUrl_uploadDataZ9l2,
                                                                  idCliente: widget
                                                                      .idCliente,
                                                                  estadoVoucher:
                                                                      'Pendiente',
                                                                  tipoVoucher:
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
                                                                  montoAPagar:
                                                                      historialFullVoucherPagoClientesRecord
                                                                          .cliente
                                                                          .totalDeudaCompleta,
                                                                  isFullPago:
                                                                      true,
                                                                  idTransaccion:
                                                                      random_data
                                                                          .randomString(
                                                                    6,
                                                                    6,
                                                                    true,
                                                                    true,
                                                                    true,
                                                                  ),
                                                                  numVoucher: int
                                                                      .tryParse(_model
                                                                          .numComprobanteTextController
                                                                          .text),
                                                                  nombreBanco:
                                                                      _model
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
                                                                height: 200.0,
                                                                child:
                                                                    DialogBtnWidget(
                                                                  titulo:
                                                                      '¡Comprobante registrado!',
                                                                  mensaje:
                                                                      'Los datos del comprobante han sido enviados al tendero. Por favor, espere a que el comprobante sea aceptado.',
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
                                                      _shouldSetState = true;
                                                      for (int loop1Index = 0;
                                                          loop1Index <
                                                              _model
                                                                  .tenderoReadFull!
                                                                  .playerIds
                                                                  .length;
                                                          loop1Index++) {
                                                        final currentLoop1Item =
                                                            _model.tenderoReadFull!
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
                                                              format: '#0.00',
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
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'containerOnActionTriggerAnimation']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }

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
                                                            widget.nombre,
                                                            ParamType.String,
                                                          ),
                                                          'idCliente':
                                                              serializeParam(
                                                            widget.idCliente,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'idTendero':
                                                              serializeParam(
                                                            widget.tenderoRef,
                                                            ParamType
                                                                .DocumentReference,
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
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1000),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'Enviar',
                                                options: FFButtonOptions(
                                                  width: 150.0,
                                                  padding: EdgeInsets.all(10.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .headlineSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                      'buttonOnPageLoadAnimation']!),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ),
                                  Lottie.asset(
                                    'assets/jsons/coinAnimated.json',
                                    width: 100.0,
                                    height: 200.0,
                                    fit: BoxFit.contain,
                                    animate: true,
                                  ),
                                ],
                              ),
                            ),
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
              ),
            ),
          ),
        );
      },
    );
  }
}
