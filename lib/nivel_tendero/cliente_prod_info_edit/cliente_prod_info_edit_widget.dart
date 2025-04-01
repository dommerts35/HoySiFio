import '/backend/backend.dart';
import '/components_nivel_tendero/info_comp/info_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
    required this.nombre,
    required this.telf,
    required this.isFiando,
    required this.idCliente,
    required this.fechaPago,
    required this.apellido,
    required this.cedula,
    required this.tenderoRef,
    required this.direccionDomicilio,
    this.viviendaAlq,
    this.viviendaProp,
    required this.emailCliente,
  });

  /// fullName
  final String? nombre;

  /// phoneNumber
  final String? telf;

  /// isFiandoE
  final bool? isFiando;

  /// idCliente
  final DocumentReference? idCliente;

  /// FechaPago
  final DateTime? fechaPago;

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
      _model.lastSumTotalPago = valueOrDefault<double>(
        _model.readOnLoad?.cliente.total,
        0.0,
      );
      safeSetState(() {});
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
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                        _model.readBack = await ClientesRecord.getDocumentOnce(
                            widget.idCliente!);
                        _model.tempCount = 0;
                        _model.tempSum1 = 0.0;
                        safeSetState(() {});
                        while (_model.tempCount! <
                            _model.readBack!.cliente.producto.length) {
                          _model.tempSum1 = (double var1, double var2) {
                            return var2 += var1;
                          }(
                              _model.readBack!.cliente.producto
                                  .elementAtOrNull(_model.tempCount!)!
                                  .valorProd,
                              _model.tempSum1!);
                          _model.tempCount = _model.tempCount! + 1;
                          safeSetState(() {});
                        }
                        _model.lastSumTotalPago = _model.tempSum1;
                        safeSetState(() {});

                        await widget.idCliente!
                            .update(createClientesRecordData(
                          cliente: createDataTypeClienteStruct(
                            total: _model.lastSumTotalPago,
                            clearUnsetFields: false,
                          ),
                        ));
                        if ((_model.readBack?.cliente.total == 0.0) ||
                            (_model.readBack?.cliente.total == null)) {
                          await widget.idCliente!
                              .update(createClientesRecordData(
                            cliente: createDataTypeClienteStruct(
                              isFiando: false,
                              clearUnsetFields: false,
                            ),
                          ));
                        }
                        context.safePop();

                        safeSetState(() {});
                      },
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '8bowq0tq' /* Editar cliente */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Inter Tight',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'ktufeslb' /* Edición de datos del cliente */,
                        ),
                        maxLines: 1,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          fullName: widget.nombre!,
                                          secondName: widget.apellido!,
                                          phoneNumber: widget.telf!,
                                          ced: widget.cedula!,
                                          domicilio:
                                              widget.direccionDomicilio!,
                                          email: widget.emailCliente!,
                                          alq: widget.viviendaAlq,
                                          prop: widget.viviendaProp,
                                        ),
                                      ),
                                      Container(
                                        height: 178.19,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -0.74),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    ClienteEditInfoWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'nombre': serializeParam(
                                                        widget.nombre,
                                                        ParamType.String,
                                                      ),
                                                      'telf': serializeParam(
                                                        widget.telf,
                                                        ParamType.String,
                                                      ),
                                                      'isFiando':
                                                          serializeParam(
                                                        widget.isFiando,
                                                        ParamType.bool,
                                                      ),
                                                      'idCliente':
                                                          serializeParam(
                                                        widget.idCliente,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'fechaPago':
                                                          serializeParam(
                                                        widget.fechaPago,
                                                        ParamType.DateTime,
                                                      ),
                                                      'apellido':
                                                          serializeParam(
                                                        widget.apellido,
                                                        ParamType.String,
                                                      ),
                                                      'cedula': serializeParam(
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
                                                        widget.viviendaProp,
                                                        ParamType.bool,
                                                      ),
                                                      'emailCliente':
                                                          serializeParam(
                                                        widget.emailCliente,
                                                        ParamType.String,
                                                      ),
                                                      'tenderoRef':
                                                          serializeParam(
                                                        widget.tenderoRef,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -0.02),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                borderRadius: 12.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Color(0xFFE75353),
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '¿Eliminar cliente?'),
                                                                content: Text(
                                                                    'Esta acción no se puede deshacer.'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancelar'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Eliminar'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    await widget.idCliente!
                                                        .delete();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'El cliente ha sido eliminado.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter Tight',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
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
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.68),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                borderRadius: 12.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.info,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    ClienteReadInfoWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'nombre': serializeParam(
                                                        widget.nombre,
                                                        ParamType.String,
                                                      ),
                                                      'telf': serializeParam(
                                                        widget.telf,
                                                        ParamType.String,
                                                      ),
                                                      'isFiando':
                                                          serializeParam(
                                                        widget.isFiando,
                                                        ParamType.bool,
                                                      ),
                                                      'idCliente':
                                                          serializeParam(
                                                        widget.idCliente,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'fechaPago':
                                                          serializeParam(
                                                        widget.fechaPago,
                                                        ParamType.DateTime,
                                                      ),
                                                      'apellido':
                                                          serializeParam(
                                                        widget.apellido,
                                                        ParamType.String,
                                                      ),
                                                      'cedula': serializeParam(
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
                                                        widget.viviendaProp,
                                                        ParamType.bool,
                                                      ),
                                                      'emailCliente':
                                                          serializeParam(
                                                        widget.emailCliente,
                                                        ParamType.String,
                                                      ),
                                                      'tenderoRef':
                                                          serializeParam(
                                                        widget.tenderoRef,
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
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qkzdh8m8' /* Fiar Productos */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                StreamBuilder<ClientesRecord>(
                                                  stream: ClientesRecord
                                                      .getDocument(
                                                          widget.idCliente!),
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

                                                    final textClientesRecord =
                                                        snapshot.data!;

                                                    return Text(
                                                      'Total de productos fiados: \$${valueOrDefault<String>(
                                                        _model.lastSumTotalPago
                                                            ?.toString(),
                                                        '0',
                                                      )}'
                                                          .maybeHandleOverflow(
                                                        maxChars: 33,
                                                      ),
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
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
                                                controller:
                                                    _model.prodTFTextController,
                                                focusNode:
                                                    _model.prodTFFocusNode,
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '83pjv5dz' /* Producto */,
                                                  ),
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'x7hrnybu' /* Ingrese el producto */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
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
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLength: 15,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
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
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'minmxdls' /* Valor */,
                                                  ),
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '8qnas4ho' /* #.## */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
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
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLength: 8,
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
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
                                          onPressed: () async {
                                            if ((_model.prodTFTextController
                                                            .text !=
                                                        '') &&
                                                (_model.valorTFTextController
                                                            .text !=
                                                        '')) {
                                              await widget.idCliente!.update(
                                                  createClientesRecordData(
                                                cliente:
                                                    createDataTypeClienteStruct(
                                                  fieldValues: {
                                                    'producto':
                                                        FieldValue.arrayUnion([
                                                      getDataTypeProductosFirestoreData(
                                                        createDataTypeProductosStruct(
                                                          nombreProd: _model
                                                              .prodTFTextController
                                                              .text,
                                                          valorProd: double
                                                              .tryParse(_model
                                                                  .valorTFTextController
                                                                  .text),
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                        true,
                                                      )
                                                    ]),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                              safeSetState(() {
                                                _model.prodTFTextController
                                                    ?.clear();
                                                _model.valorTFTextController
                                                    ?.clear();
                                              });
                                              _model.readAnadirFirst =
                                                  await ClientesRecord
                                                      .getDocumentOnce(
                                                          widget.idCliente!);
                                              _model.tempCount = 0;
                                              _model.tempSum1 = 0.0;
                                              safeSetState(() {});
                                              while (_model.tempCount! <
                                                  _model
                                                      .readAnadirFirst!
                                                      .cliente
                                                      .producto
                                                      .length) {
                                                _model.tempSum1 = (double var1,
                                                        double var2) {
                                                  return var2 += var1;
                                                }(
                                                    _model.readAnadirFirst!
                                                        .cliente.producto
                                                        .elementAtOrNull(
                                                            _model.tempCount!)!
                                                        .valorProd,
                                                    _model.tempSum1!);
                                                _model.tempCount =
                                                    _model.tempCount! + 1;
                                                safeSetState(() {});
                                              }
                                              _model.lastSumTotalPago =
                                                  _model.tempSum1;
                                              safeSetState(() {});

                                              await widget.idCliente!.update(
                                                  createClientesRecordData(
                                                cliente:
                                                    createDataTypeClienteStruct(
                                                  total:
                                                      _model.lastSumTotalPago,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1000));
                                            }

                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '28ox95x7' /* Añadir Producto */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 30.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      color: Colors.white,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                        child: StreamBuilder<ClientesRecord>(
                                          stream: ClientesRecord.getDocument(
                                              widget.idCliente!)
                                            ..listen(
                                                (vistaMainClientesRecord) async {
                                              if (_model.vistaMainPreviousSnapshot !=
                                                      null &&
                                                  !ClientesRecordDocumentEquality()
                                                      .equals(
                                                          vistaMainClientesRecord,
                                                          _model
                                                              .vistaMainPreviousSnapshot)) {
                                                safeSetState(() {});
                                              }
                                              _model.vistaMainPreviousSnapshot =
                                                  vistaMainClientesRecord;
                                            }),
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
                                                  itemCount: vistaMain.length,
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
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3.0,
                                                              color: Color(
                                                                  0x20000000),
                                                              offset: Offset(
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
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  VerticalDivider(
                                                                    width: 20.0,
                                                                    thickness:
                                                                        2.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                  Text(
                                                                    '\$ ${vistaMainItem.valorProd.toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
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
                                                                  _model.tempCount =
                                                                      0;
                                                                  _model.tempSum1 =
                                                                      0.0;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.readDeleteFirst =
                                                                      await ClientesRecord.getDocumentOnce(
                                                                          widget
                                                                              .idCliente!);
                                                                  while (_model
                                                                          .tempCount! <
                                                                      _model
                                                                          .readDeleteFirst!
                                                                          .cliente
                                                                          .producto
                                                                          .length) {
                                                                    _model
                                                                        .tempSum1 = (double
                                                                                var1,
                                                                            double
                                                                                var2) {
                                                                      return var2 +=
                                                                          var1;
                                                                    }(
                                                                        _model
                                                                            .readDeleteFirst!
                                                                            .cliente
                                                                            .producto
                                                                            .elementAtOrNull(_model
                                                                                .tempCount!)!
                                                                            .valorProd,
                                                                        _model
                                                                            .tempSum1!);
                                                                    _model.tempCount =
                                                                        _model.tempCount! +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                  _model.lastSumTotalPago =
                                                                      _model
                                                                          .tempSum1;
                                                                  safeSetState(
                                                                      () {});

                                                                  await widget
                                                                      .idCliente!
                                                                      .update(
                                                                          createClientesRecordData(
                                                                    cliente:
                                                                        createDataTypeClienteStruct(
                                                                      total: _model
                                                                          .lastSumTotalPago,
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                  ));

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.close,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  size: 24.0,
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final _datePickedDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate:
                                                    (getCurrentTimestamp ??
                                                        DateTime(1900)),
                                                lastDate: (_model.datePicked ??
                                                    DateTime(2050)),
                                                builder: (context, child) {
                                                  return wrapInMaterialDatePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    headerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Inter Tight',
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                    pickerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    pickerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    selectedDateTimeBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    selectedDateTimeForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    actionButtonForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );

                                              if (_datePickedDate != null) {
                                                safeSetState(() {
                                                  _model.datePicked = DateTime(
                                                    _datePickedDate.year,
                                                    _datePickedDate.month,
                                                    _datePickedDate.day,
                                                  );
                                                });
                                              } else if (_model.datePicked !=
                                                  null) {
                                                safeSetState(() {
                                                  _model.datePicked =
                                                      getCurrentTimestamp;
                                                });
                                              }
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'uwlfqv5j' /* Fecha de Pago del Producto */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                '¿Pagar productos?'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Confirm'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                _model.readPago =
                                                    await ClientesRecord
                                                        .getDocumentOnce(
                                                            widget.idCliente!);
                                                _model.tempCount = 0;
                                                safeSetState(() {});
                                                while (_model.tempCount! <
                                                    _model.readPago!.cliente
                                                        .producto.length) {
                                                  _model.addToDtProdItem(
                                                      DataTypeProductosStruct(
                                                    nombreProd: (_model.readPago
                                                            ?.cliente.producto
                                                            .elementAtOrNull(
                                                                _model
                                                                    .tempCount!))
                                                        ?.nombreProd,
                                                    valorProd: (_model.readPago
                                                            ?.cliente.producto
                                                            .elementAtOrNull(
                                                                _model
                                                                    .tempCount!))
                                                        ?.valorProd,
                                                    diaPagado:
                                                        getCurrentTimestamp,
                                                  ));
                                                  safeSetState(() {});
                                                  _model.tempCount =
                                                      _model.tempCount! + 1;
                                                  safeSetState(() {});
                                                }

                                                context.pushNamed(
                                                  ClienteProdValorPagoFirstWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'idCliente': serializeParam(
                                                      widget.idCliente,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'passedDTProd':
                                                        serializeParam(
                                                      _model.dtProdItem,
                                                      ParamType.DataStruct,
                                                      isList: true,
                                                    ),
                                                    'lastSumTotalPagoToVPF':
                                                        serializeParam(
                                                      _model.lastSumTotalPago,
                                                      ParamType.double,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'cs2ofbsh' /* Pagar */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.queryHistorial =
                                              await queryClientesRecordOnce(
                                            queryBuilder: (clientesRecord) =>
                                                clientesRecord.where(
                                              'cliente.cedula',
                                              isEqualTo: widget.cedula,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);

                                          context.pushNamed(
                                            HistorialPagosWidget.routeName,
                                            queryParameters: {
                                              'idCliente': serializeParam(
                                                _model
                                                    .queryHistorial?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '3upxvyh0' /* Historial */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 2.0,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          hoverBorderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          hoverTextColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final firestoreBatch =
                            FirebaseFirestore.instance.batch();
                        try {
                          _model.readEnviar =
                              await ClientesRecord.getDocumentOnce(
                                  widget.idCliente!);
                          _model.tempCount = 0;
                          _model.tempSum1 = 0.0;
                          safeSetState(() {});
                          while (_model.tempCount! <
                              _model.readEnviar!.cliente.producto.length) {
                            _model.tempSum1 = (double var1, double var2) {
                              return var2 += var1;
                            }(
                                _model.readEnviar!.cliente.producto
                                    .elementAtOrNull(_model.tempCount!)!
                                    .valorProd,
                                _model.tempSum1!);
                            _model.tempCount = _model.tempCount! + 1;
                            safeSetState(() {});
                          }
                          _model.lastSumTotalPago = _model.tempSum1;
                          safeSetState(() {});

                          firestoreBatch.update(
                              widget.idCliente!,
                              createClientesRecordData(
                                cliente: createDataTypeClienteStruct(
                                  total: _model.lastSumTotalPago,
                                  clearUnsetFields: false,
                                ),
                              ));
                          if (!(_model
                              .readEnviar!.cliente.producto.isNotEmpty)) {
                            firestoreBatch.update(
                                widget.idCliente!,
                                createClientesRecordData(
                                  cliente: createDataTypeClienteStruct(
                                    isFiando: false,
                                    clearUnsetFields: false,
                                  ),
                                ));
                          } else {
                            firestoreBatch.update(
                                widget.idCliente!,
                                createClientesRecordData(
                                  cliente: createDataTypeClienteStruct(
                                    isFiando: true,
                                    fechaPago: _model.datePicked,
                                    clearUnsetFields: false,
                                  ),
                                ));
                          }

                          context.pushNamed(
                            ListaProdClienWidget.routeName,
                            queryParameters: {
                              'tenderoRef': serializeParam(
                                widget.tenderoRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        } finally {
                          await firestoreBatch.commit();
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
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
  }
}
