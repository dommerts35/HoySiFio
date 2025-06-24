import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cliente_prod_full_pago_model.dart';
export 'cliente_prod_full_pago_model.dart';

class ClienteProdFullPagoWidget extends StatefulWidget {
  const ClienteProdFullPagoWidget({
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

  static String routeName = 'clienteProd-FullPago';
  static String routePath = '/clienteProdFullPago';

  @override
  State<ClienteProdFullPagoWidget> createState() =>
      _ClienteProdFullPagoWidgetState();
}

class _ClienteProdFullPagoWidgetState extends State<ClienteProdFullPagoWidget> {
  late ClienteProdFullPagoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteProdFullPagoModel());

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

        final clienteProdFullPagoClientesRecord = snapshot.data!;

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
                            clienteProdFullPagoClientesRecord
                                .cliente.totalDeudaCompleta,
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
                            clienteProdFullPagoClientesRecord
                                .cliente.totalDeudaCompleta,
                            formatType: FormatType.custom,
                            format: '#0.00',
                            locale: '',
                          )}',
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
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
                          'del cliente: ${clienteProdFullPagoClientesRecord.cliente.nombre}',
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    'Transferencia',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                      side: (FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate !=
                                                              null)
                                                          ? BorderSide(
                                                              width: 2,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            hintText:
                                                                'N# Comprobante',
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
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    'Efectivo',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                      side: (FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate !=
                                                              null)
                                                          ? BorderSide(
                                                              width: 2,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        'Fecha de Pago: ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                  fontSize:
                                                                      30.0,
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
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
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
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 50.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      final firestoreBatch =
                                                          FirebaseFirestore
                                                              .instance
                                                              .batch();
                                                      try {
                                                        _model.totalDeudaCompletaConv =
                                                            await actions
                                                                .normalizarValorNumerico(
                                                          formatNumber(
                                                            clienteProdFullPagoClientesRecord
                                                                .cliente
                                                                .totalDeudaCompleta,
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
                                                          if ((_model.checkTransferValue ==
                                                                  false) &&
                                                              (_model.checkEfectivoValue ==
                                                                  false)) {
                                                            await showDialog(
                                                              context: context,
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
                                                                        '¡Alerta!'),
                                                                    content: Text(
                                                                        'Por favor, ingrese el número de comprobante.'),
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
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            } else {
                                                              _model.dtProdHistorialListAfter =
                                                                  clienteProdFullPagoClientesRecord
                                                                      .cliente
                                                                      .historialPorPagarProd
                                                                      .toList()
                                                                      .cast<
                                                                          DataTypeHistorialPagoStruct>();
                                                              safeSetState(
                                                                  () {});

                                                              firestoreBatch.update(
                                                                  widget.idCliente!,
                                                                  createClientesRecordData(
                                                                    cliente:
                                                                        createDataTypeClienteStruct(
                                                                      fieldValues: {
                                                                        'historialPorPagarProd':
                                                                            FieldValue.delete(),
                                                                      },
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                  ));
                                                              for (int loop1Index =
                                                                      0;
                                                                  loop1Index <
                                                                      _model
                                                                          .dtProdHistorialListAfter
                                                                          .length;
                                                                  loop1Index++) {
                                                                final currentLoop1Item =
                                                                    _model.dtProdHistorialListAfter[
                                                                        loop1Index];
                                                                _model
                                                                    .updateDtProdHistorialListAfterAtIndex(
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

                                                                firestoreBatch
                                                                    .update(
                                                                        widget
                                                                            .idCliente!,
                                                                        createClientesRecordData(
                                                                          cliente:
                                                                              createDataTypeClienteStruct(
                                                                            fieldValues: {
                                                                              'historialPagadosProd': FieldValue.arrayUnion([
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

                                                              firestoreBatch.update(
                                                                  widget.idCliente!,
                                                                  createClientesRecordData(
                                                                    cliente:
                                                                        createDataTypeClienteStruct(
                                                                      totalDeudaCompleta:
                                                                          0.0,
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                  ));
                                                            }

                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      '¡Pago completo guardado exitosamente!'),
                                                                  content: Text(
                                                                      'El pago ha sido guardado.'),
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
                                                            _model.tenderoRead =
                                                                await TenderosRecord
                                                                    .getDocumentOnce(
                                                                        widget
                                                                            .tenderoRef!);
                                                            _shouldSetState =
                                                                true;
                                                            await actions
                                                                .sendCustomEmailForFullPaidProds(
                                                              widget
                                                                  .emailCliente!,
                                                              widget.nombre!,
                                                              '¡Pago de todos los productos fiados registrado!',
                                                              _model
                                                                  .tenderoRead!
                                                                  .displayName,
                                                            );

                                                            context.goNamed(
                                                              HistorialPorCobrarWidget
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
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '¡Alerta!'),
                                                                content: Text(
                                                                    'Por favor, ingrese el método de pago.'),
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
                                                      } finally {
                                                        await firestoreBatch
                                                            .commit();
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
