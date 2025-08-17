import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'cliente_prod_select_pago_model.dart';
export 'cliente_prod_select_pago_model.dart';

class ClienteProdSelectPagoWidget extends StatefulWidget {
  const ClienteProdSelectPagoWidget({
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
    double? calcForTotalPorPagar,
    this.totalPassed,
  }) : this.calcForTotalPorPagar = calcForTotalPorPagar ?? 0.0;

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
  final double calcForTotalPorPagar;
  final String? totalPassed;

  static String routeName = 'clienteProd-SelectPago';
  static String routePath = '/clienteProdSelectPago';

  @override
  State<ClienteProdSelectPagoWidget> createState() =>
      _ClienteProdSelectPagoWidgetState();
}

class _ClienteProdSelectPagoWidgetState
    extends State<ClienteProdSelectPagoWidget> with TickerProviderStateMixin {
  late ClienteProdSelectPagoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteProdSelectPagoModel());

    _model.comprobanteNumTFTextController ??= TextEditingController();
    _model.comprobanteNumTFFocusNode ??= FocusNode();

    animationsMap.addAll({
      'formOnActionTriggerAnimation': AnimationInfo(
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
      'formOnPageLoadAnimation': AnimationInfo(
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
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-10.0, 0.0),
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.1, 1.1),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 650.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.1, 1.1),
            end: Offset(0.9, 0.9),
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

        final clienteProdSelectPagoClientesRecord = snapshot.data!;

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
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        child: Container(
                          height: 80.0,
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
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 12.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    if (animationsMap[
                                            'formOnActionTriggerAnimation'] !=
                                        null) {
                                      await animationsMap[
                                              'formOnActionTriggerAnimation']!
                                          .controller
                                          .forward(from: 0.0);
                                    }

                                    context.goNamed(
                                      HistorialPorCobrarWidget.routeName,
                                      queryParameters: {
                                        'idCliente': serializeParam(
                                          widget.idCliente,
                                          ParamType.DocumentReference,
                                        ),
                                        'idTendero': serializeParam(
                                          widget.tenderoRef,
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
                                        'direccionDomicilio': serializeParam(
                                          widget.direccionDomicilio,
                                          ParamType.String,
                                        ),
                                        'viviendaAlq': serializeParam(
                                          widget.viviendaAlq,
                                          ParamType.bool,
                                        ),
                                        'viviendaProp': serializeParam(
                                          widget.vivendaProp,
                                          ParamType.bool,
                                        ),
                                        'emailCliente': serializeParam(
                                          widget.emailCliente,
                                          ParamType.String,
                                        ),
                                        'totalPassed': serializeParam(
                                          widget.totalPassed,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                ).animateOnPageLoad(animationsMap[
                                    'iconButtonOnPageLoadAnimation']!),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total: \$${formatNumber(
                                        widget.calcForTotalPorPagar,
                                        formatType: FormatType.custom,
                                        format: '#0.00',
                                        locale: '',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Total por cobrar: \$${formatNumber(
                                        widget.calcForTotalPorPagar,
                                        formatType: FormatType.custom,
                                        format: '#0.00',
                                        locale: '',
                                      )}',
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.asap(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
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
                                    ),
                                    Text(
                                      'del cliente: ${widget.nombre}',
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.asap(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
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
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 16.0, 24.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 770.0,
                                    ),
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
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Seleccione el tipo de pago',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  font: GoogleFonts.asap(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (_model.checkTransferValue ==
                                                  true)
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Text(
                                                        'Transferencia',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
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
                                                    ),
                                                    Transform.scale(
                                                      scaleX: 1.5,
                                                      scaleY: 1.5,
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
                                                                  BorderRadius
                                                                      .circular(
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
                                                                  .checkTransferValue ??=
                                                              false,
                                                          onChanged:
                                                              (newValue) async {
                                                            safeSetState(() =>
                                                                _model.checkTransferValue =
                                                                    newValue!);
                                                            if (newValue!) {
                                                              if (_model
                                                                      .checkEfectivoValue ==
                                                                  true) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.checkTransferValue =
                                                                      true;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.checkEfectivoValue =
                                                                      false;
                                                                });
                                                              } else {
                                                                safeSetState(
                                                                    () {
                                                                  _model.checkTransferValue =
                                                                      true;
                                                                });
                                                              }
                                                            } else {
                                                              safeSetState(() {
                                                                _model.checkTransferValue =
                                                                    false;
                                                              });
                                                              safeSetState(() {
                                                                _model.checkEfectivoValue =
                                                                    false;
                                                              });
                                                            }
                                                          },
                                                          side: (FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate !=
                                                                  null)
                                                              ? BorderSide(
                                                                  width: 2,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                    Container(
                                                      width: 118.0,
                                                    ),
                                                  ],
                                                ),
                                              SizedBox(
                                                height: 100.0,
                                                child: VerticalDivider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              if (_model.checkEfectivoValue ==
                                                  true)
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Text(
                                                        'Efectivo',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
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
                                                    ),
                                                    Transform.scale(
                                                      scaleX: 1.5,
                                                      scaleY: 1.5,
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
                                                                  BorderRadius
                                                                      .circular(
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
                                                                  .checkEfectivoValue ??=
                                                              false,
                                                          onChanged:
                                                              (newValue) async {
                                                            safeSetState(() =>
                                                                _model.checkEfectivoValue =
                                                                    newValue!);
                                                            if (newValue!) {
                                                              if (_model
                                                                      .checkTransferValue ==
                                                                  true) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.checkEfectivoValue =
                                                                      true;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.checkTransferValue =
                                                                      false;
                                                                });
                                                              } else {
                                                                safeSetState(
                                                                    () {
                                                                  _model.checkEfectivoValue =
                                                                      true;
                                                                });
                                                              }
                                                            } else {
                                                              safeSetState(() {
                                                                _model.checkEfectivoValue =
                                                                    false;
                                                              });
                                                              safeSetState(() {
                                                                _model.checkTransferValue =
                                                                    false;
                                                              });
                                                            }
                                                          },
                                                          side: (FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate !=
                                                                  null)
                                                              ? BorderSide(
                                                                  width: 2,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                    Container(
                                                      width: 118.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                          if (_model.checkTransferValue == true)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Ingrese el número de comprobante:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        font: GoogleFonts.asap(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                                TextFormField(
                                                  controller: _model
                                                      .comprobanteNumTFTextController,
                                                  focusNode: _model
                                                      .comprobanteNumTFFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.asap(
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
                                                    alignLabelWithHint: true,
                                                    hintText: 'N# Comprobante',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.asap(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.all(14.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                  maxLength: 15,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  buildCounter: (context,
                                                          {required currentLength,
                                                          required isFocused,
                                                          maxLength}) =>
                                                      null,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .comprobanteNumTFTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          if (_model.checkTransferValue ==
                                              false)
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Fecha de pago registrado: ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.asap(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    "d/M/y",
                                                    getCurrentTimestamp,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        font: GoogleFonts.asap(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Builder(
                                                builder: (context) =>
                                                    FFButtonWidget(
                                                  onPressed: () async {
                                                    var _shouldSetState = false;
                                                    final firestoreBatch =
                                                        FirebaseFirestore
                                                            .instance
                                                            .batch();
                                                    try {
                                                      _model.validarFormPago =
                                                          true;
                                                      if (_model.formKey
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey
                                                              .currentState!
                                                              .validate()) {
                                                        _model.validarFormPago =
                                                            false;
                                                      }
                                                      _shouldSetState = true;
                                                      if (_model
                                                              .validarFormPago ==
                                                          true) {
                                                        if ((_model.checkTransferValue ==
                                                                false) &&
                                                            (_model.checkEfectivoValue ==
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
                                                                          'Ingrese el método de pago.',
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          if ((_model.checkTransferValue ==
                                                                  true) &&
                                                              (_model.comprobanteNumTFTextController
                                                                          .text ==
                                                                      '')) {
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
                                                                            'ingrese el número del comprobante.',
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
                                                            _model.dtSelectHPListAfter =
                                                                clienteProdSelectPagoClientesRecord
                                                                    .cliente
                                                                    .historialPorPagarSelectedList
                                                                    .toList()
                                                                    .cast<
                                                                        DataTypeHistorialPagoStruct>();
                                                            safeSetState(() {});
                                                            for (int loop1Index =
                                                                    0;
                                                                loop1Index <
                                                                    _model
                                                                        .dtSelectHPListAfter
                                                                        .length;
                                                                loop1Index++) {
                                                              final currentLoop1Item =
                                                                  _model.dtSelectHPListAfter[
                                                                      loop1Index];

                                                              firestoreBatch.update(
                                                                  widget.idCliente!,
                                                                  createClientesRecordData(
                                                                    cliente:
                                                                        createDataTypeClienteStruct(
                                                                      fieldValues: {
                                                                        'historialPorPagarProd':
                                                                            FieldValue.arrayRemove([
                                                                          getDataTypeHistorialPagoFirestoreData(
                                                                            updateDataTypeHistorialPagoStruct(
                                                                              currentLoop1Item,
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            true,
                                                                          )
                                                                        ]),
                                                                      },
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                  ));
                                                              _model
                                                                  .updateDtSelectHPListAfterAtIndex(
                                                                loop1Index,
                                                                (e) => e
                                                                  ..transferencia =
                                                                      _model
                                                                          .checkTransferValue
                                                                  ..efectivo =
                                                                      _model
                                                                          .checkEfectivoValue
                                                                  ..numVoucher =
                                                                      int.tryParse(_model
                                                                          .comprobanteNumTFTextController
                                                                          .text)
                                                                  ..totalPorPagar =
                                                                      0.0
                                                                  ..fechaDeCobro =
                                                                      getCurrentTimestamp,
                                                              );
                                                              safeSetState(
                                                                  () {});

                                                              firestoreBatch.update(
                                                                  widget.idCliente!,
                                                                  createClientesRecordData(
                                                                    cliente:
                                                                        createDataTypeClienteStruct(
                                                                      fieldValues: {
                                                                        'historialPagadosProd':
                                                                            FieldValue.arrayUnion([
                                                                          getDataTypeHistorialPagoFirestoreData(
                                                                            updateDataTypeHistorialPagoStruct(
                                                                              currentLoop1Item,
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            true,
                                                                          )
                                                                        ]),
                                                                      },
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                  ));
                                                            }
                                                            for (int loop2Index =
                                                                    0;
                                                                loop2Index <
                                                                    clienteProdSelectPagoClientesRecord
                                                                        .cliente
                                                                        .historialPorPagarProd
                                                                        .length;
                                                                loop2Index++) {
                                                              final currentLoop2Item =
                                                                  clienteProdSelectPagoClientesRecord
                                                                          .cliente
                                                                          .historialPorPagarProd[
                                                                      loop2Index];
                                                              _model
                                                                  .calcForTDC = _model
                                                                      .calcForTDC +
                                                                  currentLoop2Item
                                                                      .totalPorPagar;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                            _model.totalDeudaCompletaNewNorm =
                                                                await actions
                                                                    .normalizarValorNumerico(
                                                              formatNumber(
                                                                _model
                                                                    .calcForTDC,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#0.00',
                                                                locale: '',
                                                              ),
                                                            );
                                                            _shouldSetState =
                                                                true;

                                                            firestoreBatch.update(
                                                                widget.idCliente!,
                                                                createClientesRecordData(
                                                                  cliente:
                                                                      createDataTypeClienteStruct(
                                                                    totalDeudaCompleta:
                                                                        _model
                                                                            .totalDeudaCompletaNewNorm,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                          }

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
                                                                          '¡Pago guardado exitosamente!',
                                                                      mensaje:
                                                                          'El pago ha sido registrado.',
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          _model.tenderoReadSP =
                                                              await TenderosRecord
                                                                  .getDocumentOnce(
                                                                      widget
                                                                          .tenderoRef!);
                                                          _shouldSetState =
                                                              true;
                                                          for (int loop1Index =
                                                                  0;
                                                              loop1Index <
                                                                  clienteProdSelectPagoClientesRecord
                                                                      .playerIds
                                                                      .length;
                                                              loop1Index++) {
                                                            final currentLoop1Item =
                                                                clienteProdSelectPagoClientesRecord
                                                                        .playerIds[
                                                                    loop1Index];
                                                            unawaited(
                                                              () async {
                                                                await actions
                                                                    .sendNotificationToPlayer(
                                                                  currentLoop1Item,
                                                                  '${clienteProdSelectPagoClientesRecord.cliente.nombre}: ¡Se ha registrado un pago completo de productos seleccionados en la tienda: ${_model.tenderoReadSP?.displayName}!',
                                                                );
                                                              }(),
                                                            );
                                                          }
                                                          unawaited(
                                                            () async {}(),
                                                          );
                                                          if (animationsMap[
                                                                  'buttonOnActionTriggerAnimation'] !=
                                                              null) {
                                                            await animationsMap[
                                                                    'buttonOnActionTriggerAnimation']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                          if (animationsMap[
                                                                  'formOnActionTriggerAnimation'] !=
                                                              null) {
                                                            await animationsMap[
                                                                    'formOnActionTriggerAnimation']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }

                                                          context.goNamed(
                                                            ClienteInfoEditWidget
                                                                .routeName,
                                                            queryParameters: {
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
                                                              'idCliente':
                                                                  serializeParam(
                                                                widget
                                                                    .idCliente,
                                                                ParamType
                                                                    .DocumentReference,
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
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'tenderoRef':
                                                                  serializeParam(
                                                                widget
                                                                    .tenderoRef,
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
                                                              'viviendaProp':
                                                                  serializeParam(
                                                                widget
                                                                    .vivendaProp,
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
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
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
                                                      } else {
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
                                                                        'Ingrese el método de pago.',
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }
                                                    } finally {
                                                      await firestoreBatch
                                                          .commit();
                                                    }

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                  text: 'Registrar pago',
                                                  options: FFButtonOptions(
                                                    width: 280.0,
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
                                                        .tertiary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.asap(
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
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'buttonOnActionTriggerAnimation']!,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(height: 15.0))
                                            .addToStart(SizedBox(height: 20.0))
                                            .addToEnd(SizedBox(height: 20.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                      Lottie.asset(
                        'assets/jsons/coinAnimated.json',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ].addToEnd(SizedBox(height: 20.0)),
                  ),
                )
                    .animateOnPageLoad(
                        animationsMap['formOnPageLoadAnimation']!)
                    .animateOnActionTrigger(
                      animationsMap['formOnActionTriggerAnimation']!,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
