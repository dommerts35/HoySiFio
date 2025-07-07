import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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

  static String routeName = 'clienteProd-ValorPago';
  static String routePath = '/clienteProdValorPago';

  @override
  State<ClienteProdValorPagoWidget> createState() =>
      _ClienteProdValorPagoWidgetState();
}

class _ClienteProdValorPagoWidgetState
    extends State<ClienteProdValorPagoWidget> {
  late ClienteProdValorPagoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteProdValorPagoModel());

    _model.valorAPTextController ??= TextEditingController();
    _model.valorAPFocusNode ??= FocusNode();

    _model.comprobanteNumTFTextController ??= TextEditingController();
    _model.comprobanteNumTFFocusNode ??= FocusNode();

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

        final clienteProdValorPagoClientesRecord = snapshot.data!;

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
                preferredSize: Size.fromHeight(150.0),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 12.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primary,
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
                              }.withoutNulls,
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total: \$${formatNumber(
                              widget.totalGeneralFromHistorial,
                              formatType: FormatType.custom,
                              format: '#0.00',
                              locale: '',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 40.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
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
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            'del cliente: ${clienteProdValorPagoClientesRecord.cliente.nombre}',
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
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
                                          Container(
                                            height: 96.59,
                                            child: TextFormField(
                                              controller:
                                                  _model.valorAPTextController,
                                              focusNode:
                                                  _model.valorAPFocusNode,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: 'Valor a Pagar',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                hintText: '#.##',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                          fontSize: 16.0,
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        lineHeight: 3.0,
                                                      ),
                                              maxLength: 8,
                                              keyboardType: const TextInputType
                                                  .numberWithOptions(
                                                  decimal: true),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .valorAPTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                if (!isAndroid && !isiOS)
                                                  TextInputFormatter
                                                      .withFunction(
                                                          (oldValue, newValue) {
                                                    return TextEditingValue(
                                                      selection:
                                                          newValue.selection,
                                                      text: newValue.text
                                                          .toCapitalization(
                                                              TextCapitalization
                                                                  .none),
                                                    );
                                                  }),
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(
                                                        '^\\d*[,.]?\\d{0,2}\$'))
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Text(
                                                      'Transferencia',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                  ),
                                                  Transform.scale(
                                                    scaleX: 2.2,
                                                    scaleY: 2.2,
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
                                                              safeSetState(() {
                                                                _model.checkTransferValue =
                                                                    true;
                                                              });
                                                              safeSetState(() {
                                                                _model.checkEfectivoValue =
                                                                    false;
                                                              });
                                                            } else {
                                                              safeSetState(() {
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
                                                    child: Visibility(
                                                      visible: _model
                                                              .checkTransferValue ==
                                                          true,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          child: TextFormField(
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
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              hintText:
                                                                  'N#. Comprobante',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
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
                                                                        fontSize:
                                                                            11.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
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
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Text(
                                                      'Efectivo',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                  ),
                                                  Transform.scale(
                                                    scaleX: 2.2,
                                                    scaleY: 2.2,
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
                                                              safeSetState(() {
                                                                _model.checkEfectivoValue =
                                                                    true;
                                                              });
                                                              safeSetState(() {
                                                                _model.checkTransferValue =
                                                                    false;
                                                              });
                                                            } else {
                                                              safeSetState(() {
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
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          'Fecha de Fiado: ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 30.0,
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
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: StreamBuilder<
                                                            ClientesRecord>(
                                                          stream: ClientesRecord
                                                              .getDocument(widget
                                                                  .idCliente!),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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

                                                            final textClientesRecord =
                                                                snapshot.data!;

                                                            return Text(
                                                              dateTimeFormat(
                                                                "d/M/y",
                                                                widget
                                                                    .dtHistorial!
                                                                    .fechaDeFio!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .interTight(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        30.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 5.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        if (_model.valorAPTextController
                                                                    .text ==
                                                                '') {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '¡Alerta!'),
                                                                content: Text(
                                                                    'Por favor, ingrese un monto a pagar.'),
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
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                        _model.valorConv =
                                                            await actions
                                                                .normalizarValorNumerico(
                                                          _model
                                                              .valorAPTextController
                                                              .text,
                                                        );
                                                        _shouldSetState = true;
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
                                                        _shouldSetState = true;
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
                                                          if (((_model.valorConv!) >
                                                                  (_model
                                                                      .totalPorPagarFromHistorialConv!)) ||
                                                              ((double var1) {
                                                                return var1 <=
                                                                    0;
                                                              }(_model
                                                                  .valorConv!))) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      '¡Alerta!'),
                                                                  content: Text(
                                                                      'Ingrese un monto válido.'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
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
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        '¡Alerta!'),
                                                                    content: Text(
                                                                        'Ingrese el método de pago.'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
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
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          '¡Falta el número del comprobante!'),
                                                                      content: Text(
                                                                          'Por favor, ingrese el número de comprobante.'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
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
                                                                    ..totalPagado = (_model
                                                                            .totalPorPagarFromHistorialConv!) -
                                                                        (_model
                                                                            .valorConv!)
                                                                    ..transferencia =
                                                                        _model
                                                                            .checkTransferValue
                                                                    ..efectivo =
                                                                        _model
                                                                            .checkEfectivoValue
                                                                    ..productos = widget
                                                                        .dtHistorial!
                                                                        .productos
                                                                        .toList()
                                                                    ..totalPorPagar = (_model
                                                                            .totalPorPagarFromHistorialConv!) -
                                                                        (_model
                                                                            .valorConv!)
                                                                    ..totalGeneral =
                                                                        widget
                                                                            .totalGeneralFromHistorial
                                                                    ..idTransaccion =
                                                                        widget
                                                                            .idTransaccionPassed
                                                                    ..fechaDeFio = widget
                                                                        .dtHistorial
                                                                        ?.fechaDeFio
                                                                    ..numVoucher =
                                                                        valueOrDefault<
                                                                            int>(
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
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        getDataTypeHistorialPagoFirestoreData(
                                                                          updateDataTypeHistorialPagoStruct(
                                                                            _model.dtProdHistorialAfter,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                      'historialPorPagarProd':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        getDataTypeHistorialPagoFirestoreData(
                                                                          updateDataTypeHistorialPagoStruct(
                                                                            widget.dtHistorial,
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

                                                                await widget
                                                                    .idCliente!
                                                                    .update(
                                                                        createClientesRecordData(
                                                                  cliente:
                                                                      createDataTypeClienteStruct(
                                                                    totalDeudaCompleta: clienteProdValorPagoClientesRecord
                                                                            .cliente
                                                                            .totalDeudaCompleta -
                                                                        (_model
                                                                            .valorConv!),
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
                                                                        FormatType
                                                                            .custom,
                                                                    format:
                                                                        '#0.00',
                                                                    locale: '',
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
                                                                        _model
                                                                            .tDCNorm,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                              } else {
                                                                _model
                                                                    .updateDtProdHistorialAfterStruct(
                                                                  (e) => e
                                                                    ..totalPagado = (widget
                                                                            .totalPagadoFromHistorial!) +
                                                                        (_model
                                                                            .valorConv!)
                                                                    ..transferencia =
                                                                        _model
                                                                            .checkTransferValue
                                                                    ..efectivo =
                                                                        _model
                                                                            .checkEfectivoValue
                                                                    ..productos = widget
                                                                        .dtHistorial!
                                                                        .productos
                                                                        .toList()
                                                                    ..totalPorPagar = (_model
                                                                            .totalPorPagarFromHistorialConv!) -
                                                                        (_model
                                                                            .valorConv!)
                                                                    ..totalGeneral =
                                                                        widget
                                                                            .totalGeneralFromHistorial
                                                                    ..idTransaccion =
                                                                        widget
                                                                            .idTransaccionPassed
                                                                    ..fechaDeFio = widget
                                                                        .dtHistorial
                                                                        ?.fechaDeFio
                                                                    ..numVoucher =
                                                                        valueOrDefault<
                                                                            int>(
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
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        getDataTypeHistorialPagoFirestoreData(
                                                                          updateDataTypeHistorialPagoStruct(
                                                                            widget.dtHistorial,
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
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        getDataTypeHistorialPagoFirestoreData(
                                                                          updateDataTypeHistorialPagoStruct(
                                                                            _model.dtProdHistorialAfter,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                      'historialPagadosProd':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        getDataTypeHistorialPagoFirestoreData(
                                                                          updateDataTypeHistorialPagoStruct(
                                                                            _model.dtProdHistorialAfter,
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

                                                                await widget
                                                                    .idCliente!
                                                                    .update(
                                                                        createClientesRecordData(
                                                                  cliente:
                                                                      createDataTypeClienteStruct(
                                                                    totalDeudaCompleta: clienteProdValorPagoClientesRecord
                                                                            .cliente
                                                                            .totalDeudaCompleta -
                                                                        (_model
                                                                            .valorConv!),
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
                                                                        FormatType
                                                                            .custom,
                                                                    format:
                                                                        '#0.00',
                                                                    locale: '',
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
                                                                        _model
                                                                            .tDCNormF,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                              }

                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        '¡Pago guardado exitosamente!'),
                                                                    content: Text(
                                                                        'El pago ha sido registrado.'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Continuar'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              _model.readTenderoVP =
                                                                  await TenderosRecord
                                                                      .getDocumentOnce(
                                                                          widget
                                                                              .tenderoRef!);
                                                              _shouldSetState =
                                                                  true;
                                                              unawaited(
                                                                () async {
                                                                  await actions
                                                                      .sendCustomEmailForValorProds(
                                                                    widget
                                                                        .emailCliente!,
                                                                    widget
                                                                        .nombre!,
                                                                    'Registro de pago de productos fiados de la tienda: ${_model.readTenderoVP?.displayName}',
                                                                    _model
                                                                        .readTenderoVP!
                                                                        .displayName,
                                                                  );
                                                                }(),
                                                              );

                                                              context.goNamed(
                                                                HistorialPorCobrarWidget
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
                                                                  'idTendero':
                                                                      serializeParam(
                                                                    widget
                                                                        .tenderoRef,
                                                                    ParamType
                                                                        .DocumentReference,
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
                                                              );
                                                            }
                                                          }
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '¡Alerta!'),
                                                                content: Text(
                                                                    'Por favor, ingrese un monto y el método de pago.'),
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
                                                        }

                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                      },
                                                      text: 'Pagar',
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
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 30.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
