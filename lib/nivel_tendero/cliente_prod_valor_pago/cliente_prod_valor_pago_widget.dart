import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    this.sumaProductosTemporales,
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
  final double? sumaProductosTemporales;
  final String? idTransaccionPassed;
  final String? nombre;
  final String? telf;
  final bool? isFiando;
  final String? apellido;
  final int? cedula;
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
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderRadius: 12.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            HistorialPorPagarWidget.routeName,
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
                                ParamType.int,
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
                          'Total: \$${widget.totalGeneralFromHistorial?.toString()}',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Inter Tight',
                                fontSize: 40.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Text(
                          'Total por pagar: \$${formatNumber(
                            widget.totalPorPagarFromHistorial,
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.automatic,
                          )}',
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        StreamBuilder<ClientesRecord>(
                          stream: _model.queryNombreCliente(
                            requestFn: () =>
                                ClientesRecord.getDocument(widget.idCliente!),
                          ),
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

                            final textClientesRecord = snapshot.data!;

                            return Text(
                              'del cliente: ${textClientesRecord.cliente.nombre}',
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            );
                          },
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
                                          height: 150.0,
                                          child: TextFormField(
                                            controller:
                                                _model.valorAPTextController,
                                            focusNode: _model.valorAPFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'd59gff11' /* Valor a Pagar */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 28.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '0luvnqx5' /* #.## */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 28.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 28.0,
                                                  letterSpacing: 0.0,
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
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('^\\d*\\.?\\d{0,2}\$'))
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
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '9xivha2p' /* Transferencia */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
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
                                                        safeSetState(() => _model
                                                                .checkTransferValue =
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
                                                      side: BorderSide(
                                                        width: 2,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
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
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'yl0zre28' /* Efectivo */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
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
                                                        safeSetState(() => _model
                                                                .checkEfectivoValue =
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
                                                      side: BorderSide(
                                                        width: 2,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
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
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'iisu0mpl' /* Fecha de Pago:  */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter Tight',
                                                              fontSize: 30.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter Tight',
                                                                  fontSize:
                                                                      30.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 50.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.readPagoAfter =
                                                          await ClientesRecord
                                                              .getDocumentOnce(
                                                                  widget
                                                                      .idCliente!);
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
                                                      if (_model
                                                              .validarFormPago ==
                                                          true) {
                                                        if (!(((double var1,
                                                                    double var2) {
                                                              return var1 <=
                                                                  var2;
                                                            }(
                                                                double.parse(_model
                                                                    .valorAPTextController
                                                                    .text),
                                                                widget
                                                                    .totalPorPagarFromHistorial!)) &&
                                                            (double.parse(_model
                                                                    .valorAPTextController
                                                                    .text) >
                                                                0))) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'No puede pagar de más.',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        } else {
                                                          if ((_model.checkTransferValue ==
                                                                  false) &&
                                                              (_model.checkEfectivoValue ==
                                                                  false)) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Ingrese el método de pago.',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else {
                                                            if ((widget.totalPorPagarFromHistorial!) -
                                                                    double.parse(_model
                                                                        .valorAPTextController
                                                                        .text) ==
                                                                0) {
                                                              _model
                                                                  .updateDtProdHistorialAfterStruct(
                                                                (e) => e
                                                                  ..totalPagado = (widget
                                                                          .totalPorPagarFromHistorial!) -
                                                                      double.parse(_model
                                                                          .valorAPTextController
                                                                          .text)
                                                                  ..transferencia =
                                                                      _model
                                                                          .checkTransferValue
                                                                  ..efectivo =
                                                                      _model
                                                                          .checkEfectivoValue
                                                                  ..fechaPago =
                                                                      getCurrentTimestamp
                                                                  ..productos = widget
                                                                      .dtHistorial!
                                                                      .productos
                                                                      .toList()
                                                                  ..totalPorPagar = (widget
                                                                          .totalPorPagarFromHistorial!) -
                                                                      double.parse(_model
                                                                          .valorAPTextController
                                                                          .text)
                                                                  ..totalGeneral =
                                                                      widget
                                                                          .totalGeneralFromHistorial
                                                                  ..idTransaccion =
                                                                      widget
                                                                          .idTransaccionPassed,
                                                              );
                                                              safeSetState(
                                                                  () {});

                                                              await widget
                                                                  .idCliente!
                                                                  .update(
                                                                      createClientesRecordData(
                                                                cliente:
                                                                    createDataTypeClienteStruct(
                                                                  total: _model
                                                                          .readPagoAfter!
                                                                          .cliente
                                                                          .total -
                                                                      double.parse(_model
                                                                          .valorAPTextController
                                                                          .text),
                                                                  fieldValues: {
                                                                    'historialPagadosProd':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      getDataTypeHistorialPagoFirestoreData(
                                                                        updateDataTypeHistorialPagoStruct(
                                                                          _model
                                                                              .dtProdHistorialAfter,
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
                                                                          widget
                                                                              .dtHistorial,
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
                                                            } else {
                                                              _model
                                                                  .nuevoTotal = (widget
                                                                      .totalPorPagarFromHistorial!) -
                                                                  double.parse(_model
                                                                      .valorAPTextController
                                                                      .text);
                                                              safeSetState(
                                                                  () {});
                                                              _model
                                                                  .updateDtProdHistorialAfterStruct(
                                                                (e) => e
                                                                  ..totalPagado = (widget
                                                                          .totalPagadoFromHistorial!) +
                                                                      double.parse(_model
                                                                          .valorAPTextController
                                                                          .text)
                                                                  ..transferencia =
                                                                      _model
                                                                          .checkTransferValue
                                                                  ..efectivo =
                                                                      _model
                                                                          .checkEfectivoValue
                                                                  ..fechaPago =
                                                                      getCurrentTimestamp
                                                                  ..productos = widget
                                                                      .dtHistorial!
                                                                      .productos
                                                                      .toList()
                                                                  ..totalPorPagar =
                                                                      _model
                                                                          .nuevoTotal
                                                                  ..totalGeneral =
                                                                      widget
                                                                          .totalGeneralFromHistorial
                                                                  ..idTransaccion =
                                                                      widget
                                                                          .idTransaccionPassed,
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
                                                                          widget
                                                                              .dtHistorial,
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
                                                                  fieldValues: {
                                                                    'historialPorPagarProd':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      getDataTypeHistorialPagoFirestoreData(
                                                                        updateDataTypeHistorialPagoStruct(
                                                                          _model
                                                                              .dtProdHistorialAfter,
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
                                                            }

                                                            context.pushNamed(
                                                              HistorialPorPagarWidget
                                                                  .routeName,
                                                              queryParameters: {
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
                                                                  widget.telf,
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
                                                                  ParamType.int,
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
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'mztmsqm7' /* Pagar */,
                                                    ),
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
                                                                fontFamily:
                                                                    'Inter Tight',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
        );
      },
    );
  }
}
