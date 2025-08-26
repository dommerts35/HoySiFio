import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:marketplace_check_internet_connection_library_vrjzhi/custom_code/actions/index.dart'
    as marketplace_check_internet_connection_library_vrjzhi_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'cliente_prod_valor_pago_model.dart';
export 'cliente_prod_valor_pago_model.dart';

class ClienteProdValorPagoWidget extends StatefulWidget {
  const ClienteProdValorPagoWidget({
    super.key,
    required this.idCliente,
    this.indexFromHistorial,
    this.totalPagadoFromHistorial,
    this.transferFromHistorial,
    this.efectivoFromHistorial,
    this.dtHistorial,
    this.totalPorPagarFromHistorial,
    this.totalGeneralFromHistorial,
    this.idTransaccionPassed,
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
    this.totalPassed,
  });

  /// idCliente
  final DocumentReference? idCliente;

  final int? indexFromHistorial;
  final double? totalPagadoFromHistorial;
  final bool? transferFromHistorial;
  final bool? efectivoFromHistorial;
  final DataTypeHistorialPagoStruct? dtHistorial;
  final double? totalPorPagarFromHistorial;
  final double? totalGeneralFromHistorial;
  final String? idTransaccionPassed;
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
  final String? totalPassed;

  static String routeName = 'clienteProd-ValorPago';
  static String routePath = '/clienteProdValorPago';

  @override
  State<ClienteProdValorPagoWidget> createState() =>
      _ClienteProdValorPagoWidgetState();
}

class _ClienteProdValorPagoWidgetState extends State<ClienteProdValorPagoWidget>
    with TickerProviderStateMixin {
  late ClienteProdValorPagoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteProdValorPagoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
    });

    _model.valorAPTextController ??= TextEditingController();
    _model.valorAPFocusNode ??= FocusNode();

    _model.comprobanteNumTFTextController ??= TextEditingController();
    _model.comprobanteNumTFFocusNode ??= FocusNode();

    animationsMap.addAll({
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
    return Builder(
      builder: (context) => StreamBuilder<ClientesRecord>(
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

          final clienteProdValorPagoClientesRecord = snapshot.data!;

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: PopScope(
              canPop: false,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 12.0, 8.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 12.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
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
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                    ).animateOnPageLoad(animationsMap[
                                        'iconButtonOnPageLoadAnimation']!),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Total: \$${formatNumber(
                                          widget.totalGeneralFromHistorial,
                                          formatType: FormatType.custom,
                                          format: '#0.00',
                                          locale: '',
                                        )}',
                                        textAlign: TextAlign.center,
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
                                          widget.totalPorPagarFromHistorial,
                                          formatType: FormatType.custom,
                                          format: '#0.00',
                                          locale: '',
                                        )}',
                                        textAlign: TextAlign.center,
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
                                        'del cliente: ${clienteProdValorPagoClientesRecord.cliente.nombre}',
                                        textAlign: TextAlign.center,
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
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
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
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
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
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Ingrese el valor del pago:',
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
                                                Container(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .valorAPTextController,
                                                      focusNode: _model
                                                          .valorAPFocusNode,
                                                      autofocus: false,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .none,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText:
                                                            'Valor del pago',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
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
                                                        alignLabelWithHint:
                                                            true,
                                                        hintText: '#.##',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      16.0,
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
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                14.0),
                                                      ),
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
                                                                fontSize: 16.0,
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
                                                      maxLength: 6,
                                                      maxLengthEnforcement:
                                                          MaxLengthEnforcement
                                                              .enforced,
                                                      buildCounter: (context,
                                                              {required currentLength,
                                                              required isFocused,
                                                              maxLength}) =>
                                                          null,
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(
                                                              decimal: true),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .valorAPTextControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        if (!isAndroid &&
                                                            !isiOS)
                                                          TextInputFormatter
                                                              .withFunction(
                                                                  (oldValue,
                                                                      newValue) {
                                                            return TextEditingValue(
                                                              selection: newValue
                                                                  .selection,
                                                              text: newValue
                                                                  .text
                                                                  .toCapitalization(
                                                                      TextCapitalization
                                                                          .none),
                                                            );
                                                          }),
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                '^(0|[1-9]\\d*)([,.]\\d{0,2})?\$'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Seleccione el tipo de pago',
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
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
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
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
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Text(
                                                            'Efectivo',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                if (_model.checkTransferValue ==
                                                    true)
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Ingrese el número de comprobante:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
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
                                                      TextFormField(
                                                        controller: _model
                                                            .comprobanteNumTFTextController,
                                                        focusNode: _model
                                                            .comprobanteNumTFFocusNode,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .asap(
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
                                                          alignLabelWithHint:
                                                              true,
                                                          hintText:
                                                              'N#. Comprobante',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .asap(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          errorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  14.0),
                                                        ),
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
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 15.0)),
                                                  ),
                                                if (_model.checkTransferValue ==
                                                    false)
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Fecha de pago registrado:',
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
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          "d/M/y",
                                                          widget.dtHistorial!
                                                              .fechaDeFio!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
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
                                                            if (_model.valorAPTextController
                                                                        .text ==
                                                                    '') {
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
                                                                              'Ingrese un monto a pagar.',
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
                                                            _model.valorConv =
                                                                await actions
                                                                    .normalizarValorNumerico(
                                                              _model
                                                                  .valorAPTextController
                                                                  .text,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.totalPorPagarFromHistorialConv =
                                                                await actions
                                                                    .normalizarValorNumerico(
                                                              formatNumber(
                                                                widget
                                                                    .totalPorPagarFromHistorial,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#0.00',
                                                                locale: '',
                                                              ),
                                                            );
                                                            _shouldSetState =
                                                                true;
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
                                                            _shouldSetState =
                                                                true;
                                                            if (_model
                                                                    .validarFormPago ==
                                                                true) {
                                                              if (((_model.valorConv!) >
                                                                      (_model
                                                                          .totalPorPagarFromHistorialConv!)) ||
                                                                  ((double
                                                                      var1) {
                                                                    return var1 <=
                                                                        0;
                                                                  }(_model
                                                                      .valorConv!))) {
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
                                                                                'Ingrese un monto válido.',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              } else {
                                                                if ((_model.checkTransferValue ==
                                                                        false) &&
                                                                    (_model.checkEfectivoValue ==
                                                                        false)) {
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
                                                                                200.0,
                                                                            child:
                                                                                DialogBtnWidget(
                                                                              titulo: '¡Alerta!',
                                                                              mensaje: 'Ingrese el método de pago.',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                } else {
                                                                  if ((_model.checkTransferValue ==
                                                                          true) &&
                                                                      (_model.comprobanteNumTFTextController.text ==
                                                                              '')) {
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
                                                                              height: 200.0,
                                                                              child: DialogBtnWidget(
                                                                                titulo: '¡Falta el número del comprobante!',
                                                                                mensaje: 'Ingrese el número de comprobante.',
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
                                                                  if ((_model.totalPorPagarFromHistorialConv!) -
                                                                          (_model
                                                                              .valorConv!) ==
                                                                      0.000) {
                                                                    _model
                                                                        .updateDtProdHistorialAfterStruct(
                                                                      (e) => e
                                                                        ..totalPagado =
                                                                            (_model.totalPorPagarFromHistorialConv!) -
                                                                                (_model.valorConv!)
                                                                        ..transferencia =
                                                                            _model.checkTransferValue
                                                                        ..efectivo =
                                                                            _model.checkEfectivoValue
                                                                        ..productos = widget
                                                                            .dtHistorial!
                                                                            .productos
                                                                            .toList()
                                                                        ..totalPorPagar =
                                                                            (_model.totalPorPagarFromHistorialConv!) -
                                                                                (_model.valorConv!)
                                                                        ..totalGeneral =
                                                                            widget.totalGeneralFromHistorial
                                                                        ..idTransaccion =
                                                                            widget.idTransaccionPassed
                                                                        ..fechaDeFio = widget
                                                                            .dtHistorial
                                                                            ?.fechaDeFio
                                                                        ..numVoucher =
                                                                            valueOrDefault<int>(
                                                                          int.tryParse(_model
                                                                              .comprobanteNumTFTextController
                                                                              .text),
                                                                          0,
                                                                        )
                                                                        ..fechaDeCobro =
                                                                            getCurrentTimestamp,
                                                                    );
                                                                    safeSetState(
                                                                        () {});

                                                                    await widget
                                                                        .idCliente!
                                                                        .update(
                                                                            createClientesRecordData(
                                                                      cliente:
                                                                          createDataTypeClienteStruct(
                                                                        fieldValues: {
                                                                          'historialPagadosProd':
                                                                              FieldValue.arrayUnion([
                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                              updateDataTypeHistorialPagoStruct(
                                                                                _model.dtProdHistorialAfter,
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                              true,
                                                                            )
                                                                          ]),
                                                                          'historialPorPagarProd':
                                                                              FieldValue.arrayRemove([
                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                              updateDataTypeHistorialPagoStruct(
                                                                                widget.dtHistorial,
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

                                                                    await widget
                                                                        .idCliente!
                                                                        .update(
                                                                            createClientesRecordData(
                                                                      cliente:
                                                                          createDataTypeClienteStruct(
                                                                        totalDeudaCompleta:
                                                                            clienteProdValorPagoClientesRecord.cliente.totalDeudaCompleta -
                                                                                (_model.valorConv!),
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                    _model.tDCNorm =
                                                                        await actions
                                                                            .normalizarValorNumerico(
                                                                      formatNumber(
                                                                        clienteProdValorPagoClientesRecord
                                                                            .cliente
                                                                            .totalDeudaCompleta,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '#0.00',
                                                                        locale:
                                                                            '',
                                                                      ),
                                                                    );
                                                                    _shouldSetState =
                                                                        true;

                                                                    await widget
                                                                        .idCliente!
                                                                        .update(
                                                                            createClientesRecordData(
                                                                      cliente:
                                                                          createDataTypeClienteStruct(
                                                                        totalDeudaCompleta:
                                                                            _model.tDCNorm,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                  } else {
                                                                    _model
                                                                        .updateDtProdHistorialAfterStruct(
                                                                      (e) => e
                                                                        ..totalPagado =
                                                                            (widget.totalPagadoFromHistorial!) +
                                                                                (_model.valorConv!)
                                                                        ..transferencia =
                                                                            _model.checkTransferValue
                                                                        ..efectivo =
                                                                            _model.checkEfectivoValue
                                                                        ..productos = widget
                                                                            .dtHistorial!
                                                                            .productos
                                                                            .toList()
                                                                        ..totalPorPagar =
                                                                            (_model.totalPorPagarFromHistorialConv!) -
                                                                                (_model.valorConv!)
                                                                        ..totalGeneral =
                                                                            widget.totalGeneralFromHistorial
                                                                        ..idTransaccion =
                                                                            widget.idTransaccionPassed
                                                                        ..fechaDeFio = widget
                                                                            .dtHistorial
                                                                            ?.fechaDeFio
                                                                        ..numVoucher =
                                                                            valueOrDefault<int>(
                                                                          int.tryParse(_model
                                                                              .comprobanteNumTFTextController
                                                                              .text),
                                                                          0,
                                                                        )
                                                                        ..fechaDeCobro =
                                                                            getCurrentTimestamp,
                                                                    );
                                                                    safeSetState(
                                                                        () {});

                                                                    await widget
                                                                        .idCliente!
                                                                        .update(
                                                                            createClientesRecordData(
                                                                      cliente:
                                                                          createDataTypeClienteStruct(
                                                                        fieldValues: {
                                                                          'historialPorPagarProd':
                                                                              FieldValue.arrayRemove([
                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                              updateDataTypeHistorialPagoStruct(
                                                                                widget.dtHistorial,
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
                                                                        .updateDtProdHistorialAfterStruct(
                                                                      (e) => e
                                                                        ..numVoucher =
                                                                            0,
                                                                    );
                                                                    safeSetState(
                                                                        () {});

                                                                    await widget
                                                                        .idCliente!
                                                                        .update(
                                                                            createClientesRecordData(
                                                                      cliente:
                                                                          createDataTypeClienteStruct(
                                                                        fieldValues: {
                                                                          'historialPorPagarProd':
                                                                              FieldValue.arrayUnion([
                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                              updateDataTypeHistorialPagoStruct(
                                                                                _model.dtProdHistorialAfter,
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                              true,
                                                                            )
                                                                          ]),
                                                                          'historialPagadosProd':
                                                                              FieldValue.arrayUnion([
                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                              updateDataTypeHistorialPagoStruct(
                                                                                _model.dtProdHistorialAfter,
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

                                                                    await widget
                                                                        .idCliente!
                                                                        .update(
                                                                            createClientesRecordData(
                                                                      cliente:
                                                                          createDataTypeClienteStruct(
                                                                        totalDeudaCompleta:
                                                                            clienteProdValorPagoClientesRecord.cliente.totalDeudaCompleta -
                                                                                (_model.valorConv!),
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                    _model.tDCNormF =
                                                                        await actions
                                                                            .normalizarValorNumerico(
                                                                      formatNumber(
                                                                        clienteProdValorPagoClientesRecord
                                                                            .cliente
                                                                            .totalDeudaCompleta,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '#0.00',
                                                                        locale:
                                                                            '',
                                                                      ),
                                                                    );
                                                                    _shouldSetState =
                                                                        true;

                                                                    await widget
                                                                        .idCliente!
                                                                        .update(
                                                                            createClientesRecordData(
                                                                      cliente:
                                                                          createDataTypeClienteStruct(
                                                                        totalDeudaCompleta:
                                                                            _model.tDCNormF,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                                  }

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
                                                                                200.0,
                                                                            child:
                                                                                DialogBtnWidget(
                                                                              titulo: '¡Pago guardado exitosamente!',
                                                                              mensaje: 'El pago ha sido registrado.',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  _model.readTenderoVP =
                                                                      await TenderosRecord.getDocumentOnce(
                                                                          widget
                                                                              .tenderoRef!);
                                                                  _shouldSetState =
                                                                      true;
                                                                  for (int loop1Index =
                                                                          0;
                                                                      loop1Index <
                                                                          clienteProdValorPagoClientesRecord
                                                                              .playerIds
                                                                              .length;
                                                                      loop1Index++) {
                                                                    final currentLoop1Item =
                                                                        clienteProdValorPagoClientesRecord
                                                                            .playerIds[loop1Index];
                                                                    unawaited(
                                                                      () async {
                                                                        await actions
                                                                            .sendNotificationToPlayer(
                                                                          currentLoop1Item,
                                                                          '${clienteProdValorPagoClientesRecord.cliente.nombre}: ¡Se ha registrado un pago en tus cuentas de la tienda: ${_model.readTenderoVP?.displayName}!',
                                                                        );
                                                                      }(),
                                                                    );
                                                                  }
                                                                  unawaited(
                                                                    () async {}(),
                                                                  );

                                                                  context
                                                                      .goNamed(
                                                                    ClienteInfoEditWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
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
                                                                        widget
                                                                            .cedula,
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
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'viviendaProp':
                                                                          serializeParam(
                                                                        widget
                                                                            .vivendaProp,
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
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 0),
                                                                      ),
                                                                    },
                                                                  );
                                                                }
                                                              }
                                                            } else {
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
                                                                              'Ingrese un monto y el método de pago.',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          text:
                                                              'Registrar pago',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 280.0,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
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
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 15.0))
                                                  .addToStart(
                                                      SizedBox(height: 20.0))
                                                  .addToEnd(
                                                      SizedBox(height: 20.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Lottie.asset(
                          'assets/jsons/coinAnimated.json',
                          width: 140.0,
                          height: 140.0,
                          fit: BoxFit.contain,
                          animate: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
