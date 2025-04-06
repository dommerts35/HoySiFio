import '/backend/backend.dart';
import '/components_nivel_tendero/info_comp/info_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'cliente_prod_info_edit_model.dart';
export 'cliente_prod_info_edit_model.dart';

class ClienteProdInfoEditWidget extends StatefulWidget {
  const ClienteProdInfoEditWidget({
    super.key,
    this.nombre,
    this.telf,
    this.isFiando,
    this.idCliente,
    this.apellido,
    this.cedula,
    this.tenderoRef,
    this.direccionDomicilio,
    this.viviendaAlq,
    this.viviendaProp,
    this.emailCliente,
  });

  /// fullName
  final String? nombre;

  /// phoneNumber
  final String? telf;

  /// isFiandoE
  final bool? isFiando;

  /// idCliente
  final DocumentReference? idCliente;

  /// secondName
  final String? apellido;

  /// ced
  final int? cedula;

  final DocumentReference? tenderoRef;

  /// domicilio
  final String? direccionDomicilio;

  /// alq
  final bool? viviendaAlq;

  final bool? viviendaProp;

  /// email
  final String? emailCliente;

  static String routeName = 'clienteProd-InfoEdit';
  static String routePath = '/clienteProdInfoEdit';

  @override
  State<ClienteProdInfoEditWidget> createState() =>
      _ClienteProdInfoEditWidgetState();
}

class _ClienteProdInfoEditWidgetState extends State<ClienteProdInfoEditWidget> {
  late ClienteProdInfoEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteProdInfoEditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.readOnLoad =
          await ClientesRecord.getDocumentOnce(widget.idCliente!);
      _model.tempCount = 0;
      _model.tempSumHistorial = 0.0;
      _model.tempSumProductos = 0.0;
      _model.totalDeudaCompleta = 0.0;
      safeSetState(() {});
      if ((_model.readOnLoad?.cliente.producto != null &&
              (_model.readOnLoad?.cliente.producto)!.isNotEmpty) ==
          true) {
        while (_model.tempCount < _model.readOnLoad!.cliente.producto.length) {
          _model.tempSumProductos = _model.tempSumProductos +
              _model.readOnLoad!.cliente.producto
                  .elementAtOrNull(_model.tempCount)!
                  .valorProd;
          safeSetState(() {});
          _model.tempCount = _model.tempCount + 1;
          safeSetState(() {});
        }
      }
      _model.tempCount = 0;
      safeSetState(() {});
      if ((_model.readOnLoad?.cliente.historialPorPagarProd != null &&
              (_model.readOnLoad?.cliente.historialPorPagarProd)!
                  .isNotEmpty) ==
          true) {
        while (_model.tempCount <
            _model.readOnLoad!.cliente.historialPorPagarProd.length) {
          _model.tempSumHistorial = _model.tempSumHistorial +
              _model.readOnLoad!.cliente.historialPorPagarProd
                  .elementAtOrNull(_model.tempCount)!
                  .totalPorPagar;
          safeSetState(() {});
          _model.tempCount = _model.tempCount + 1;
          safeSetState(() {});
        }
      }
      await Future.delayed(const Duration(milliseconds: 500));
      _model.totalDeudaCompleta =
          _model.tempSumHistorial + _model.tempSumProductos;
      safeSetState(() {});

      await widget.idCliente!.update(createClientesRecordData(
        cliente: createDataTypeClienteStruct(
          totalDeudaCompleta: _model.totalDeudaCompleta,
          clearUnsetFields: false,
        ),
      ));
    });

    _model.prodTFTextController ??= TextEditingController();
    _model.prodTFFocusNode ??= FocusNode();

    _model.valorTFTextController ??= TextEditingController();
    _model.valorTFFocusNode ??= FocusNode();

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
      stream: _model.queryUpdateTotal(
        requestFn: () => ClientesRecord.getDocument(widget.idCliente!),
      )..listen((clienteProdInfoEditClientesRecord) async {
          if (_model.clienteProdInfoEditPreviousSnapshot != null &&
              !ClientesRecordDocumentEquality().equals(
                  clienteProdInfoEditClientesRecord,
                  _model.clienteProdInfoEditPreviousSnapshot)) {
            _model.readOnChange =
                await ClientesRecord.getDocumentOnce(widget.idCliente!);
            _model.tempCount = 0;
            _model.tempSumHistorial = 0.0;
            _model.tempSumProductos = 0.0;
            _model.totalDeudaCompleta = 0.0;
            safeSetState(() {});
            if ((_model.readOnChange?.cliente.historialPorPagarProd != null &&
                    (_model.readOnChange?.cliente.historialPorPagarProd)!
                        .isNotEmpty) ==
                true) {
              while (_model.tempCount <
                  _model.readOnChange!.cliente.historialPorPagarProd.length) {
                _model.tempSumHistorial = _model.tempSumHistorial +
                    _model.readOnChange!.cliente.historialPorPagarProd
                        .elementAtOrNull(_model.tempCount)!
                        .totalPorPagar;
                safeSetState(() {});
                _model.tempCount = _model.tempCount + 1;
                safeSetState(() {});
              }
            }
            _model.tempCount = 0;
            safeSetState(() {});
            if ((_model.readOnChange?.cliente.producto != null &&
                    (_model.readOnChange?.cliente.producto)!.isNotEmpty) ==
                true) {
              while (_model.tempCount <
                  _model.readOnChange!.cliente.producto.length) {
                _model.tempSumProductos = _model.tempSumProductos +
                    _model.readOnChange!.cliente.producto
                        .elementAtOrNull(_model.tempCount)!
                        .valorProd;
                safeSetState(() {});
                _model.tempCount = _model.tempCount + 1;
                safeSetState(() {});
              }
            }
            await Future.delayed(const Duration(milliseconds: 500));
            _model.totalDeudaCompleta =
                _model.tempSumHistorial + _model.tempSumProductos;
            safeSetState(() {});

            await widget.idCliente!.update(createClientesRecordData(
              cliente: createDataTypeClienteStruct(
                totalDeudaCompleta: _model.totalDeudaCompleta,
                clearUnsetFields: false,
              ),
            ));

            safeSetState(() {});
          }
          _model.clienteProdInfoEditPreviousSnapshot =
              clienteProdInfoEditClientesRecord;
        }),
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

        final clienteProdInfoEditClientesRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
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
                            await widget.idCliente!
                                .update(createClientesRecordData(
                              cliente: createDataTypeClienteStruct(
                                fieldValues: {
                                  'producto': FieldValue.delete(),
                                },
                                clearUnsetFields: false,
                              ),
                            ));

                            context.pushNamed(
                              ListaProdClienWidget.routeName,
                              queryParameters: {
                                'tenderoRef': serializeParam(
                                  widget.tenderoRef,
                                  ParamType.DocumentReference,
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
                            FFLocalizations.of(context).getText(
                              '8bowq0tq' /* Información del cliente */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.nombre,
                              '-',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [],
                centerTitle: false,
                toolbarHeight: 70.0,
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
                                constraints: BoxConstraints(
                                  maxWidth: 770.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                wrapWithModel(
                                                  model: _model.infoCompModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: InfoCompWidget(
                                                    fullName: widget.nombre,
                                                    secondName:
                                                        widget.apellido,
                                                    phoneNumber: widget.telf,
                                                    ced: widget.cedula,
                                                  ),
                                                ),
                                                Container(
                                                  height: 178.19,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -0.74),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderRadius: 8.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons.edit,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              ClienteEditInfoWidget
                                                                  .routeName,
                                                              queryParameters: {
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
                                                                      .viviendaProp,
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
                                                                'tenderoRef':
                                                                    serializeParam(
                                                                  widget
                                                                      .tenderoRef,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -0.02),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                          borderRadius: 12.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color: Color(
                                                                0xFFE75353),
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('¿Eliminar cliente?'),
                                                                          content:
                                                                              Text('Esta acción no se puede deshacer.'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('Cancelar'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Eliminar'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              await widget
                                                                  .idCliente!
                                                                  .delete();
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .clearSnackBars();
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'El cliente ha sido eliminado.',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter Tight',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                              context.safePop();
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.68),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                          borderRadius: 12.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons.info,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              ClienteReadInfoWidget
                                                                  .routeName,
                                                              queryParameters: {
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
                                                                      .viviendaProp,
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
                                                                'tenderoRef':
                                                                    serializeParam(
                                                                  widget
                                                                      .tenderoRef,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.queryHistorialPagado =
                                                          await queryClientesRecordOnce(
                                                        queryBuilder:
                                                            (clientesRecord) =>
                                                                clientesRecord
                                                                    .where(
                                                          'cliente.cedula',
                                                          isEqualTo:
                                                              widget.cedula,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);

                                                      context.goNamed(
                                                        HistorialPagosWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'idCliente':
                                                              serializeParam(
                                                            _model
                                                                .queryHistorialPagado
                                                                ?.reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'idTendero':
                                                              serializeParam(
                                                            widget.tenderoRef,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'nombre':
                                                              serializeParam(
                                                            widget.nombre,
                                                            ParamType.String,
                                                          ),
                                                          'telf':
                                                              serializeParam(
                                                            widget.telf,
                                                            ParamType.String,
                                                          ),
                                                          'isFiando':
                                                              serializeParam(
                                                            widget.isFiando,
                                                            ParamType.bool,
                                                          ),
                                                          'apellido':
                                                              serializeParam(
                                                            widget.apellido,
                                                            ParamType.String,
                                                          ),
                                                          'cedula':
                                                              serializeParam(
                                                            widget.cedula,
                                                            ParamType.int,
                                                          ),
                                                          'direccionDomicilio':
                                                              serializeParam(
                                                            widget
                                                                .direccionDomicilio,
                                                            ParamType.String,
                                                          ),
                                                          'viviendaAlq':
                                                              serializeParam(
                                                            widget.viviendaAlq,
                                                            ParamType.bool,
                                                          ),
                                                          'viviendaProp':
                                                              serializeParam(
                                                            widget
                                                                .viviendaProp,
                                                            ParamType.bool,
                                                          ),
                                                          'emailCliente':
                                                              serializeParam(
                                                            widget
                                                                .emailCliente,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '3upxvyh0' /* Productos pagados */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                              .info,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter Tight',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 2.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      hoverBorderSide:
                                                          BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      hoverTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.queryHistorialPorPagar =
                                                          await queryClientesRecordOnce(
                                                        queryBuilder:
                                                            (clientesRecord) =>
                                                                clientesRecord
                                                                    .where(
                                                          'cliente.cedula',
                                                          isEqualTo:
                                                              widget.cedula,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);

                                                      context.pushNamed(
                                                        HistorialPorPagarWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'idCliente':
                                                              serializeParam(
                                                            _model
                                                                .queryHistorialPorPagar
                                                                ?.reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'idTendero':
                                                              serializeParam(
                                                            widget.tenderoRef,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'nombre':
                                                              serializeParam(
                                                            widget.nombre,
                                                            ParamType.String,
                                                          ),
                                                          'telf':
                                                              serializeParam(
                                                            widget.telf,
                                                            ParamType.String,
                                                          ),
                                                          'isFiando':
                                                              serializeParam(
                                                            widget.isFiando,
                                                            ParamType.bool,
                                                          ),
                                                          'apellido':
                                                              serializeParam(
                                                            widget.apellido,
                                                            ParamType.String,
                                                          ),
                                                          'cedula':
                                                              serializeParam(
                                                            widget.cedula,
                                                            ParamType.int,
                                                          ),
                                                          'direccionDomicilio':
                                                              serializeParam(
                                                            widget
                                                                .direccionDomicilio,
                                                            ParamType.String,
                                                          ),
                                                          'viviendaAlq':
                                                              serializeParam(
                                                            widget.viviendaAlq,
                                                            ParamType.bool,
                                                          ),
                                                          'viviendaProp':
                                                              serializeParam(
                                                            widget
                                                                .viviendaProp,
                                                            ParamType.bool,
                                                          ),
                                                          'emailCliente':
                                                              serializeParam(
                                                            widget
                                                                .emailCliente,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'cynop57y' /* Productos por pagar */,
                                                    ),
                                                    options: FFButtonOptions(
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
                                                              .info,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter Tight',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 2.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      hoverBorderSide:
                                                          BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      hoverTextColor:
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
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'qkzdh8m8' /* Fiar Productos */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inter Tight',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    StreamBuilder<
                                                        ClientesRecord>(
                                                      stream: _model
                                                          .queryUpdateTotal(
                                                        requestFn: () =>
                                                            ClientesRecord
                                                                .getDocument(widget
                                                                    .idCliente!),
                                                      ),
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
                                                          'Total por pagar: \$${_model.totalDeudaCompleta.toString()}/${widget.viviendaProp == true ? '20' : '10'}'
                                                              .maybeHandleOverflow(
                                                            maxChars: 33,
                                                          ),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  () {
                                                                    if ((widget.viviendaProp ==
                                                                            true) &&
                                                                        (_model.totalDeudaCompleta >
                                                                            20.0)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                    } else if ((widget.viviendaAlq ==
                                                                            true) &&
                                                                        (_model.totalDeudaCompleta >
                                                                            10.0)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .error;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText;
                                                                    }
                                                                  }(),
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 4.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .prodTFTextController,
                                                    focusNode:
                                                        _model.prodTFFocusNode,
                                                    autofocus: false,
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .words,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '83pjv5dz' /* Producto */,
                                                      ),
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'x7hrnybu' /* Ingrese el producto */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    maxLength: 15,
                                                    maxLengthEnforcement:
                                                        MaxLengthEnforcement
                                                            .enforced,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .prodTFTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 2.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .valorTFTextController,
                                                    focusNode:
                                                        _model.valorTFFocusNode,
                                                    autofocus: false,
                                                    textCapitalization:
                                                        TextCapitalization.none,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'minmxdls' /* Valor */,
                                                      ),
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '8qnas4ho' /* #.## */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    maxLength: 8,
                                                    keyboardType:
                                                        const TextInputType
                                                            .numberWithOptions(
                                                            decimal: true),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .valorTFTextControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .allow(RegExp(
                                                              '^\\d*\\.?\\d{0,2}\$'))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 25.0)),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed:
                                                  (_model.totalDeudaCompleta >=
                                                          20.0)
                                                      ? null
                                                      : () async {
                                                          var _shouldSetState =
                                                              false;
                                                          if ((_model.prodTFTextController
                                                                          .text !=
                                                                      '') &&
                                                              (_model.valorTFTextController
                                                                          .text !=
                                                                      '')) {
                                                            _model.readValidarLimiteAnadir =
                                                                await ClientesRecord
                                                                    .getDocumentOnce(
                                                                        widget
                                                                            .idCliente!);
                                                            _shouldSetState =
                                                                true;
                                                            if (widget
                                                                    .viviendaProp ==
                                                                true) {
                                                              if ((_model.totalDeudaCompleta +
                                                                      double.parse(_model
                                                                          .valorTFTextController
                                                                          .text)) >
                                                                  20.0) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'No puede superar el límite de crédito.',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .warning,
                                                                  ),
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                            } else {
                                                              if ((_model.totalDeudaCompleta +
                                                                      double.parse(_model
                                                                          .valorTFTextController
                                                                          .text)) >
                                                                  10.0) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'No puede superar el límite de crédito.',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                            }

                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        300));

                                                            await widget
                                                                .idCliente!
                                                                .update(
                                                                    createClientesRecordData(
                                                              cliente:
                                                                  createDataTypeClienteStruct(
                                                                fieldValues: {
                                                                  'producto':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getDataTypeProductosFirestoreData(
                                                                      createDataTypeProductosStruct(
                                                                        nombreProd: _model
                                                                            .prodTFTextController
                                                                            .text,
                                                                        valorProd: double.tryParse(_model
                                                                            .valorTFTextController
                                                                            .text),
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
                                                            safeSetState(() {
                                                              _model
                                                                  .prodTFTextController
                                                                  ?.clear();
                                                              _model
                                                                  .valorTFTextController
                                                                  ?.clear();
                                                            });
                                                          }
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '28ox95x7' /* Añadir Producto */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Inter Tight',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                disabledColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                disabledTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 20.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child:
                                                StreamBuilder<ClientesRecord>(
                                              stream: _model.queryUpdateTotal(
                                                requestFn: () =>
                                                    ClientesRecord.getDocument(
                                                        widget.idCliente!),
                                              ),
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

                                                final vistaMainClientesRecord =
                                                    snapshot.data!;

                                                return Builder(
                                                  builder: (context) {
                                                    final vistaMain =
                                                        vistaMainClientesRecord
                                                            .cliente.producto
                                                            .toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          vistaMain.length,
                                                      itemBuilder: (context,
                                                          vistaMainIndex) {
                                                        final vistaMainItem =
                                                            vistaMain[
                                                                vistaMainIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      8.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      3.0,
                                                                  color: Color(
                                                                      0x20000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    1.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        vistaMainItem
                                                                            .nombreProd,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      VerticalDivider(
                                                                        width:
                                                                            20.0,
                                                                        thickness:
                                                                            2.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      ),
                                                                      Text(
                                                                        '\$ ${vistaMainItem.valorProd.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await vistaMainClientesRecord
                                                                          .reference
                                                                          .update(
                                                                              createClientesRecordData(
                                                                        cliente:
                                                                            createDataTypeClienteStruct(
                                                                          fieldValues: {
                                                                            'producto':
                                                                                FieldValue.arrayRemove([
                                                                              getDataTypeProductosFirestoreData(
                                                                                createDataTypeProductosStruct(
                                                                                  nombreProd: vistaMainClientesRecord.cliente.producto.elementAtOrNull(vistaMainIndex)?.nombreProd,
                                                                                  valorProd: vistaMainClientesRecord.cliente.producto.elementAtOrNull(vistaMainIndex)?.valorProd,
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
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 5.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 700.0,
                        maxHeight: 65.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.readGuardar =
                                await ClientesRecord.getDocumentOnce(
                                    widget.idCliente!);
                            if ((_model.readGuardar?.cliente.producto !=
                                        null &&
                                    (_model.readGuardar?.cliente.producto)!
                                        .isNotEmpty) ==
                                false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Ingrese un producto a guardar',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            } else {
                              _model.tempCount = 0;
                              safeSetState(() {});
                              while (_model.tempCount <
                                  _model.readGuardar!.cliente.producto.length) {
                                _model.addToDtProdItem(DataTypeProductosStruct(
                                  nombreProd: (_model
                                          .readGuardar?.cliente.producto
                                          .elementAtOrNull(_model.tempCount))
                                      ?.nombreProd,
                                  valorProd: (_model
                                          .readGuardar?.cliente.producto
                                          .elementAtOrNull(_model.tempCount))
                                      ?.valorProd,
                                ));
                                _model.tempCount = _model.tempCount + 1;
                                safeSetState(() {});
                              }
                              await Future.delayed(
                                  const Duration(milliseconds: 500));

                              await widget.idCliente!
                                  .update(createClientesRecordData(
                                cliente: createDataTypeClienteStruct(
                                  fieldValues: {
                                    'historialPorPagarProd':
                                        FieldValue.arrayUnion([
                                      getDataTypeHistorialPagoFirestoreData(
                                        updateDataTypeHistorialPagoStruct(
                                          DataTypeHistorialPagoStruct(
                                            productos: _model.dtProdItem,
                                            totalPagado: 0.0,
                                            totalGeneral:
                                                _model.totalDeudaCompleta,
                                            totalPorPagar:
                                                _model.totalDeudaCompleta,
                                            fechaPago: getCurrentTimestamp,
                                            transferencia: false,
                                            efectivo: false,
                                            idTransaccion:
                                                valueOrDefault<String>(
                                              random_data.randomString(
                                                5,
                                                5,
                                                true,
                                                true,
                                                true,
                                              ),
                                              'id000',
                                            ),
                                          ),
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                    'producto': FieldValue.delete(),
                                  },
                                  clearUnsetFields: false,
                                ),
                              ));
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Productos guardados correctamente',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).success,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '5bfvmyfh' /* Guardar */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
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
