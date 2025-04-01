import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cliente_prod_valor_pago_after_model.dart';
export 'cliente_prod_valor_pago_after_model.dart';

class ClienteProdValorPagoAfterWidget extends StatefulWidget {
  const ClienteProdValorPagoAfterWidget({
    super.key,
    required this.idCliente,
    this.indexFromHistorial,
    required this.totalFromHistorial,
    this.transferFromHistorial,
    this.efectivoFromHistorial,
    this.dtHistorial,
    this.dtClientePassed,
  });

  /// idCliente
  final DocumentReference? idCliente;

  final int? indexFromHistorial;
  final double? totalFromHistorial;
  final bool? transferFromHistorial;
  final bool? efectivoFromHistorial;
  final DataTypeHistorialPagoStruct? dtHistorial;
  final DataTypeClienteStruct? dtClientePassed;

  static String routeName = 'clienteProd-ValorPagoAfter';
  static String routePath = '/clienteProdValorPagoAfter';

  @override
  State<ClienteProdValorPagoAfterWidget> createState() =>
      _ClienteProdValorPagoAfterWidgetState();
}

class _ClienteProdValorPagoAfterWidgetState
    extends State<ClienteProdValorPagoAfterWidget> {
  late ClienteProdValorPagoAfterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteProdValorPagoAfterModel());

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
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderRadius: 12.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total: \$${widget.totalFromHistorial?.toString()}',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter Tight',
                                fontSize: 40.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                    Text(
                      'Total de productos fiados',
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          labelText: FFLocalizations.of(context)
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
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                          hintText: FFLocalizations.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            .numberWithOptions(decimal: true),
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                        VisualDensity.standard,
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
                                                          .checkTransferValue ??=
                                                      widget
                                                          .transferFromHistorial!,
                                                  onChanged: (newValue) async {
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
                                                    color: FlutterFlowTheme.of(
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                        VisualDensity.standard,
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
                                                          .checkEfectivoValue ??=
                                                      widget
                                                          .efectivoFromHistorial!,
                                                  onChanged: (newValue) async {
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
                                                    color: FlutterFlowTheme.of(
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
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
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'iisu0mpl' /* Fecha de Pago:  */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          fontSize: 40.0,
                                                          letterSpacing: 0.0,
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
                                                        .getDocument(
                                                            widget.idCliente!),
                                                    builder:
                                                        (context, snapshot) {
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

                                                      final textClientesRecord =
                                                          snapshot.data!;

                                                      return Text(
                                                        dateTimeFormat(
                                                          "d/M/y",
                                                          getCurrentTimestamp,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Inter Tight',
                                                              fontSize: 40.0,
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
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
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
                                                  _model
                                                      .updateDtProdHistorialAfterStruct(
                                                    (e) => e
                                                      ..totalPagado = ((widget
                                                                      .totalFromHistorial!) -
                                                                  double.parse(_model
                                                                      .valorAPTextController
                                                                      .text)) <
                                                              0.0
                                                          ? 0.0
                                                          : ((widget
                                                                  .totalFromHistorial!) -
                                                              double.parse(_model
                                                                  .valorAPTextController
                                                                  .text))
                                                      ..transferencia = _model
                                                          .checkTransferValue
                                                      ..efectivo = _model
                                                          .checkEfectivoValue
                                                      ..fechaPago =
                                                          getCurrentTimestamp
                                                      ..productos = widget
                                                          .dtHistorial!
                                                          .productos
                                                          .toList(),
                                                  );
                                                  _model.dtClienteAfter =
                                                      widget.dtClientePassed;
                                                  safeSetState(() {});
                                                  _model
                                                      .updateDtClienteAfterStruct(
                                                    (e) => e
                                                      ..updateHistorialPagadosProd(
                                                        (e) => e[widget
                                                                .indexFromHistorial!] =
                                                            _model
                                                                .dtProdHistorialAfter!,
                                                      ),
                                                  );
                                                  safeSetState(() {});

                                                  await widget.idCliente!.update(
                                                      createClientesRecordData(
                                                    cliente:
                                                        updateDataTypeClienteStruct(
                                                      _model.dtClienteAfter,
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));
                                                  context.safePop();

                                                  safeSetState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'mztmsqm7' /* Pagar */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Inter Tight',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
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
                                  ].divide(SizedBox(height: 70.0)),
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
  }
}
