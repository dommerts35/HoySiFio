import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'historial_single_voucher_pago_model.dart';
export 'historial_single_voucher_pago_model.dart';

class HistorialSingleVoucherPagoWidget extends StatefulWidget {
  const HistorialSingleVoucherPagoWidget({
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
    this.historialPorPagarDT,
    this.doc,
    this.idTenderoList,
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
  final List<DataTypeHistorialPagoStruct>? historialPorPagarDT;
  final List<ClientesRecord>? doc;
  final List<DocumentReference>? idTenderoList;

  static String routeName = 'historialSingleVoucherPago';
  static String routePath = '/historialSingleVoucherPago';

  @override
  State<HistorialSingleVoucherPagoWidget> createState() =>
      _HistorialSingleVoucherPagoWidgetState();
}

class _HistorialSingleVoucherPagoWidgetState
    extends State<HistorialSingleVoucherPagoWidget> {
  late HistorialSingleVoucherPagoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistorialSingleVoucherPagoModel());

    _model.valorMAPTextController ??= TextEditingController();
    _model.valorMAPFocusNode ??= FocusNode();

    _model.numComprobanteTextController ??= TextEditingController();
    _model.numComprobanteFocusNode ??= FocusNode();

    _model.bancoTextController ??= TextEditingController();
    _model.bancoFocusNode ??= FocusNode();

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

        final historialSingleVoucherPagoClientesRecord = snapshot.data!;

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
                      StreamBuilder<TenderosRecord>(
                        stream: TenderosRecord.getDocument(widget.tenderoRef!),
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

                          final infoColTenderosRecord = snapshot.data!;

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AutoSizeText(
                                'Información de pago',
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
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                              ),
                              AutoSizeText(
                                'Núm. de Cuenta: ${infoColTenderosRecord.tenderos.numCuenta}',
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
                              AutoSizeText(
                                'Titular de la cuenta: ${infoColTenderosRecord.tenderos.nombreTitularBanco}',
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
                                infoColTenderosRecord.tenderos.tipoDeCuenta,
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                              ),
                              AutoSizeText(
                                'Banco: ${infoColTenderosRecord.tenderos.cuentaDeBancoName}',
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
                              AutoSizeText(
                                'Tienda: ${infoColTenderosRecord.tenderos.nombreTienda}',
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
                              AutoSizeText(
                                'Total A Pagar: \$${formatNumber(
                                  widget.totalPorPagarFromHistorial,
                                  formatType: FormatType.custom,
                                  format: '#0.00',
                                  locale: '',
                                )}',
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
                          );
                        },
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
                                child: Container(
                                  height: 700.0,
                                  constraints: BoxConstraints(
                                    maxWidth: 770.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .valorMAPTextController,
                                                focusNode:
                                                    _model.valorMAPFocusNode,
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization.none,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: 'Monto A Pagar',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                  hintText: '#.##',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .valorMAPTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  if (!isAndroid && !isiOS)
                                                    TextInputFormatter
                                                        .withFunction((oldValue,
                                                            newValue) {
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
                                          ),
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: TextFormField(
                                              controller: _model
                                                  .numComprobanteTextController,
                                              focusNode: _model
                                                  .numComprobanteFocusNode,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText:
                                                    'Núm. De Comprobante',
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .numComprobanteTextControllerValidator
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
                                                    .allow(
                                                        RegExp('[a-zA-Z0-9]'))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: TextFormField(
                                              controller:
                                                  _model.bancoTextController,
                                              focusNode: _model.bancoFocusNode,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: 'Nombre del banco',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
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
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .bancoTextControllerValidator
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
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Tipo de \nTransferencia:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
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
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
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
                                                            width: 80.0,
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
                                                                    if ((_model.checkBancaValue ==
                                                                            true) ||
                                                                        (_model.checkVentValue ==
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
                                                            width: 80.0,
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
                                                                    if ((_model.checkElectrValue ==
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
                                                                            true;
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
                                                            width: 80.0,
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
                                                                    if ((_model.checkElectrValue ==
                                                                            true) ||
                                                                        (_model.checkBancaValue ==
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
                                                    0.0, 20.0, 0.0, 20.0),
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
                                                        (_model.uploadedFileUrl_uploadDataZ9l !=
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
                                                                  pickerFontFamily:
                                                                      'Open Sans',
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_uploadDataZ9l =
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
                                                                    _model.isDataUploading_uploadDataZ9l =
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
                                                                      _model.uploadedLocalFile_uploadDataZ9l =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl_uploadDataZ9l =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                _model.dtHistorialUpdate =
                                                                    widget
                                                                        .dtHistorial;
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
                                                                            _model.dtHistorialUpdate,
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
                                                                    .updateDtHistorialUpdateStruct(
                                                                  (e) => e
                                                                    ..isVoucherSent =
                                                                        true,
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
                                                                            _model.dtHistorialUpdate,
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
                                                              },
                                                    text: _model.uploadedFileUrl_uploadDataZ9l !=
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
                                                                    .interTight(
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
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      if (_model.uploadedFileUrl_uploadDataZ9l ==
                                                              '') {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  '¡Alerta!'),
                                                              content: Text(
                                                                  'Por favor, ingresela imágen del comprobante.'),
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
                                                      } else {
                                                        if (_model.numComprobanteTextController
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
                                                                    'Ingrese el número de comprobante.'),
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
                                                        _model.urlSupaImg = _model
                                                            .uploadedFileUrl_uploadDataZ9l;
                                                        safeSetState(() {});
                                                        _model.valorMAPConv =
                                                            await actions
                                                                .normalizarValorNumerico(
                                                          _model
                                                              .valorMAPTextController
                                                              .text,
                                                        );
                                                        _shouldSetState = true;
                                                        _model.valorMAPReConv =
                                                            await actions
                                                                .normalizarValorNumerico(
                                                          formatNumber(
                                                            _model.valorMAPConv,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '#0.00',
                                                            locale: '',
                                                          ),
                                                        );
                                                        _shouldSetState = true;
                                                        if ((_model.valorMAPConv! >
                                                                widget
                                                                    .totalPorPagarFromHistorial!) ||
                                                            (_model.valorMAPConv! <=
                                                                0.0)) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '¡Alerta!'),
                                                                content: Text(
                                                                    'Por favor, ingrese un monto a pagar válido.'),
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
                                                        if ((_model.checkElectrValue == false) &&
                                                            (_model.checkBancaValue ==
                                                                false) &&
                                                            (_model.checkVentValue ==
                                                                false)) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '¡Alerta!'),
                                                                content: Text(
                                                                    'Ingrese el tipo de transferencia.'),
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
                                                        } else {
                                                          if (((_model.checkElectrValue == true) && (_model.checkBancaValue == true)) ||
                                                              ((_model.checkVentValue ==
                                                                      true) &&
                                                                  (_model.checkBancaValue ==
                                                                      true)) ||
                                                              ((_model.checkVentValue ==
                                                                      true) &&
                                                                  (_model.checkElectrValue ==
                                                                      true))) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      '¡Alerta!'),
                                                                  content: Text(
                                                                      'Ingrese solo un tipo de transferencia.'),
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
                                                                          _model
                                                                              .uploadedFileUrl_uploadDataZ9l,
                                                                      idTransaccion:
                                                                          random_data
                                                                              .randomString(
                                                                        6,
                                                                        6,
                                                                        true,
                                                                        true,
                                                                        true,
                                                                      ),
                                                                      idCliente:
                                                                          widget
                                                                              .idCliente,
                                                                      historialPagoParaEliminar:
                                                                          updateDataTypeHistorialPagoStruct(
                                                                        widget
                                                                            .dtHistorial,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      fechaDeFio: widget
                                                                          .dtHistorial
                                                                          ?.fechaDeFio,
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
                                                                        } else {
                                                                          return 'No establecido';
                                                                        }
                                                                      }(),
                                                                      montoAPagar:
                                                                          _model
                                                                              .valorMAPReConv,
                                                                      isFullPago:
                                                                          false,
                                                                      numVoucher: int.tryParse(_model
                                                                          .numComprobanteTextController
                                                                          .text),
                                                                      nombreBanco: _model
                                                                          .bancoTextController
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
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Comprobante enviado'),
                                                                content: Text(
                                                                    'El comprobante ha sido enviado.'),
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
                                                          _model.tenderoRead =
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
                                                                      .tenderoRead!
                                                                      .playerIds
                                                                      .length;
                                                              loop1Index++) {
                                                            final currentLoop1Item =
                                                                _model.tenderoRead!
                                                                        .playerIds[
                                                                    loop1Index];
                                                            await actions
                                                                .sendNotificationToPlayer(
                                                              currentLoop1Item,
                                                              'Tienda ${_model.tenderoRead?.displayName}: ¡El cliente ${widget.nombre} te ha enviado un comprobante!',
                                                            );
                                                          }
                                                          await actions
                                                              .sendCustomEmailForSentVoucherToTendero(
                                                            _model.tenderoRead!
                                                                .email,
                                                            _model.tenderoRead!
                                                                .displayName,
                                                            'El cliente: ${widget.nombre} le ha enviado un comprobante a la tienda: ${_model.tenderoRead?.displayName}',
                                                            _model.tenderoRead!
                                                                .displayName,
                                                            '${widget.nombre} ${widget.apellido}',
                                                            _model
                                                                .valorMAPTextController
                                                                .text,
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
                                                              } else {
                                                                return 'No establecido';
                                                              }
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
                                                                widget.nombre,
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
                                                                widget.cedula,
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
                                                              .tertiary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
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
                                                          BorderRadius.circular(
                                                              8.0),
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
