import '/backend/backend.dart';
import '/components_nivel_tendero/info_comp/info_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/tendero_i_c_pde_cliente.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
  final String? cedula;

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
      _model.dtProdItem = [];
      safeSetState(() {});
      _model.queryOnLoad = await queryClientesRecordOnce(
        queryBuilder: (clientesRecord) => clientesRecord
            .where(
              'cliente.idCliente',
              isEqualTo: widget.idCliente,
            )
            .where(
              'cliente.idTendero',
              isEqualTo: widget.tenderoRef,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.tempCount = 0;
      _model.tempSumHistorial = 0.0;
      _model.tempSumProductos = 0.0;
      _model.totalDeudaCompleta = 0.0;
      safeSetState(() {});
      if ((_model.queryOnLoad?.cliente.producto != null &&
              (_model.queryOnLoad?.cliente.producto)!.isNotEmpty) ==
          true) {
        while (_model.tempCount < _model.queryOnLoad!.cliente.producto.length) {
          _model.tempSumProductos = _model.tempSumProductos +
              _model.queryOnLoad!.cliente.producto
                  .elementAtOrNull(_model.tempCount)!
                  .valorProd;
          safeSetState(() {});
          _model.tempCount = _model.tempCount + 1;
          safeSetState(() {});
        }
      }
      _model.tempCount = 0;
      safeSetState(() {});
      if ((_model.queryOnLoad?.cliente.historialPorPagarProd != null &&
              (_model.queryOnLoad?.cliente.historialPorPagarProd)!
                  .isNotEmpty) ==
          true) {
        while (_model.tempCount <
            _model.queryOnLoad!.cliente.historialPorPagarProd.length) {
          _model.tempSumHistorial = _model.tempSumHistorial +
              _model.queryOnLoad!.cliente.historialPorPagarProd
                  .elementAtOrNull(_model.tempCount)!
                  .totalPorPagar;
          safeSetState(() {});
          _model.tempCount = _model.tempCount + 1;
          safeSetState(() {});
        }
      }
      _model.totalDeudaCompleta =
          _model.tempSumHistorial + _model.tempSumProductos;
      safeSetState(() {});

      await widget.idCliente!.update(createClientesRecordData(
        cliente: createDataTypeClienteStruct(
          totalDeudaCompleta: _model.totalDeudaCompleta,
          clearUnsetFields: false,
        ),
      ));
      if (FFAppState().isFirstTimeInfoEdit == true) {
        safeSetState(() => _model.tenderoICPdeClienteController =
            createPageWalkthrough(context));
        _model.tenderoICPdeClienteController?.show(context: context);
      }
    });

    _model.cantidatTfTextController ??= TextEditingController();
    _model.cantidatTfFocusNode ??= FocusNode();

    _model.prodTFTextController ??= TextEditingController();
    _model.prodTFFocusNode ??= FocusNode();

    _model.valorTFTextController ??= TextEditingController();
    _model.valorTFFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      _model.queryOnDispose = await queryClientesRecordOnce(
        queryBuilder: (clientesRecord) => clientesRecord
            .where(
              'cliente.idCliente',
              isEqualTo: widget.idCliente,
            )
            .where(
              'cliente.idTendero',
              isEqualTo: widget.tenderoRef,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if ((_model.queryOnDispose?.cliente.historialPorPagarProd != null &&
              (_model.queryOnDispose?.cliente.historialPorPagarProd)!
                  .isNotEmpty) ==
          true) {
        await widget.idCliente!.update(createClientesRecordData(
          cliente: createDataTypeClienteStruct(
            isFiando: true,
            clearUnsetFields: false,
          ),
        ));
      } else {
        await widget.idCliente!.update(createClientesRecordData(
          cliente: createDataTypeClienteStruct(
            isFiando: false,
            clearUnsetFields: false,
          ),
        ));
      }
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ClientesRecord>(
      stream: _model.queryUpdateTotal(
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
              preferredSize: Size.fromHeight(75.0),
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

                            context.goNamed(
                              ListaClientesWidget.routeName,
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
                          Text(
                            valueOrDefault<String>(
                              widget.nombre,
                              '-',
                            ),
                            maxLines: 1,
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
                ),
                actions: [],
                centerTitle: false,
                toolbarHeight: 75.0,
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
                                                            context.goNamed(
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
                                                        ).addWalkthrough(
                                                          iconButton84oxlft0,
                                                          _model
                                                              .tenderoICPdeClienteController,
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
                                                            var _shouldSetState =
                                                                false;
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
                                                              _model.readForClienteDelete =
                                                                  await ClientesRecord
                                                                      .getDocumentOnce(
                                                                          widget
                                                                              .idCliente!);
                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model.readForClienteDelete?.cliente
                                                                              .historialPorPagarProd !=
                                                                          null &&
                                                                      (_model
                                                                              .readForClienteDelete
                                                                              ?.cliente
                                                                              .historialPorPagarProd)!
                                                                          .isNotEmpty) ==
                                                                  true) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'No puede borrar al cliente'),
                                                                      content: Text(
                                                                          'Su cliente aun le adeuda cuentas'),
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
                                                              if (_model
                                                                      .readForClienteDelete!
                                                                      .cliente
                                                                      .totalDeudaCompleta >
                                                                  0.0) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          '¡Este cliente no puede ser eliminado!'),
                                                                      content: Text(
                                                                          'El cliente aún tiene deudas pendientes'),
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
                                                              } else {
                                                                await widget
                                                                    .idCliente!
                                                                    .delete();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'El cliente ha sido eliminado.',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );

                                                                context
                                                                    .pushNamed(
                                                                  ListaClientesWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'tenderoRef':
                                                                        serializeParam(
                                                                      widget
                                                                          .tenderoRef,
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              }
                                                            }
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                        ).addWalkthrough(
                                                          iconButtonZwyz2l9o,
                                                          _model
                                                              .tenderoICPdeClienteController,
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
                                                        ).addWalkthrough(
                                                          iconButtonXjfzyogm,
                                                          _model
                                                              .tenderoICPdeClienteController,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ).addWalkthrough(
                                              rowNzxu284f,
                                              _model
                                                  .tenderoICPdeClienteController,
                                            ),
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 20.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'zsfx0k4u' /* Cuentas y Pagos */,
                                                        ),
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
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '0knn29rs' /* Historiales de cobranza */,
                                                        ),
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    () {
                                                                      if ((widget.viviendaProp ==
                                                                              true) &&
                                                                          (_model.totalDeudaCompleta >
                                                                              20.0)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else if ((widget.viviendaAlq ==
                                                                              true) &&
                                                                          (_model.totalDeudaCompleta >
                                                                              10.0)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondaryText;
                                                                      }
                                                                    }(),
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
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
                                                                        )
                                                                        .where(
                                                                          'cliente.idTendero',
                                                                          isEqualTo:
                                                                              widget.tenderoRef,
                                                                        ),
                                                            singleRecord: true,
                                                          ).then((s) => s
                                                                  .firstOrNull);

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
                                                                widget
                                                                    .tenderoRef,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
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
                                                                    .viviendaProp,
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
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '3upxvyh0' /* Productos pagados */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
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
                                                              .info,
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        2.0,
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          hoverBorderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                                        )
                                                                        .where(
                                                                          'cliente.idTendero',
                                                                          isEqualTo:
                                                                              widget.tenderoRef,
                                                                        ),
                                                            singleRecord: true,
                                                          ).then((s) => s
                                                                  .firstOrNull);

                                                          context.goNamed(
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
                                                                widget
                                                                    .tenderoRef,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
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
                                                                    .viviendaProp,
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
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'cynop57y' /* Productos por pagar */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
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
                                                              .info,
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        2.0,
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          hoverBorderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                ).addWalkthrough(
                                                  rowL0vfsgti,
                                                  _model
                                                      .tenderoICPdeClienteController,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00FFFFFF),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                context.goNamed(
                                                                  HistorialVouchersWidget
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
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '6guodlw7' /* Vouchers */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 35.0,
                                                                padding: EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .interTight(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          2.0,
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
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.93,
                                                                      -1.72),
                                                              child: Container(
                                                                width: 20.0,
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFFF0000),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      clienteProdInfoEditClientesRecord
                                                                          .cliente
                                                                          .dataTypeVouchers
                                                                          .where((e) =>
                                                                              e.estadoVoucher ==
                                                                              'Pendiente')
                                                                          .toList()
                                                                          .length
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ).addWalkthrough(
                                                          stackSh8miu7t,
                                                          _model
                                                              .tenderoICPdeClienteController,
                                                        ),
                                                      ),
                                                    ].addToStart(
                                                        SizedBox(width: 13.0)),
                                                  ),
                                                ),
                                              ],
                                            ).addWalkthrough(
                                              columnF5wlylrs,
                                              _model
                                                  .tenderoICPdeClienteController,
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
                                                MainAxisAlignment.spaceEvenly,
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
                                                    StreamBuilder<
                                                        ClientesRecord>(
                                                      stream: ClientesRecord
                                                          .getDocument(widget
                                                              .idCliente!),
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
                                                          'Total por pagar: \$${formatNumber(
                                                            textClientesRecord
                                                                .cliente
                                                                .totalDeudaCompleta,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '#0.00',
                                                            locale: '',
                                                          )}/${widget.viviendaProp == true ? '20' : '10'}'
                                                              .maybeHandleOverflow(
                                                            maxChars: 33,
                                                            replacement: '…',
                                                          ),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                    StreamBuilder<
                                                        ClientesRecord>(
                                                      stream: ClientesRecord
                                                          .getDocument(widget
                                                              .idCliente!),
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
                                                          'Total actual: \$${formatNumber(
                                                            _model
                                                                .tempSumProductos,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '#0.00',
                                                            locale: '',
                                                          )}'
                                                              .maybeHandleOverflow(
                                                            maxChars: 33,
                                                            replacement: '…',
                                                          ),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
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
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 2.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .cantidatTfTextController,
                                                    focusNode: _model
                                                        .cantidatTfFocusNode,
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
                                                        '83pjv5dz' /* Cantidad */,
                                                      ),
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'x7hrnybu' /* 0 */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                    maxLength: 3,
                                                    maxLengthEnforcement:
                                                        MaxLengthEnforcement
                                                            .enforced,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .cantidatTfTextControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      if (!isAndroid && !isiOS)
                                                        TextInputFormatter
                                                            .withFunction(
                                                                (oldValue,
                                                                    newValue) {
                                                          return TextEditingValue(
                                                            selection: newValue
                                                                .selection,
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
                                                ).addWalkthrough(
                                                  textFieldRz0u7lkw,
                                                  _model
                                                      .tenderoICPdeClienteController,
                                                ),
                                              ),
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
                                                        'uiip5pgs' /* Producto */,
                                                      ),
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '5ghpqato' /* Ingrese el producto */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                    maxLength: 10,
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
                                                    inputFormatters: [
                                                      if (!isAndroid && !isiOS)
                                                        TextInputFormatter
                                                            .withFunction(
                                                                (oldValue,
                                                                    newValue) {
                                                          return TextEditingValue(
                                                            selection: newValue
                                                                .selection,
                                                            text: newValue.text
                                                                .toCapitalization(
                                                                    TextCapitalization
                                                                        .words),
                                                          );
                                                        }),
                                                    ],
                                                  ),
                                                ).addWalkthrough(
                                                  textFieldNwk9jlpz,
                                                  _model
                                                      .tenderoICPdeClienteController,
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
                                                        'minmxdls' /* Valor unitario */,
                                                      ),
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                      if (!isAndroid && !isiOS)
                                                        TextInputFormatter
                                                            .withFunction(
                                                                (oldValue,
                                                                    newValue) {
                                                          return TextEditingValue(
                                                            selection: newValue
                                                                .selection,
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
                                                ).addWalkthrough(
                                                  textFieldOejhq5lq,
                                                  _model
                                                      .tenderoICPdeClienteController,
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 15.0)),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      if ((clienteProdInfoEditClientesRecord
                                                                  .cliente
                                                                  .viviendaPropia ==
                                                              true) &&
                                                          (clienteProdInfoEditClientesRecord
                                                                  .cliente
                                                                  .totalDeudaCompleta >=
                                                              20.0)) {
                                                        return true;
                                                      } else if ((clienteProdInfoEditClientesRecord
                                                                  .cliente
                                                                  .viviendaAlq ==
                                                              true) &&
                                                          (clienteProdInfoEditClientesRecord
                                                                  .cliente
                                                                  .totalDeudaCompleta >=
                                                              10.0)) {
                                                        return true;
                                                      } else {
                                                        return false;
                                                      }
                                                    }()
                                                        ? null
                                                        : () async {
                                                            var _shouldSetState =
                                                                false;
                                                            _model.valorConvVTF =
                                                                await actions
                                                                    .normalizarValorNumerico(
                                                              _model
                                                                  .valorTFTextController
                                                                  .text,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            _model.valorConvCTF =
                                                                await actions
                                                                    .normalizarValorNumerico(
                                                              _model
                                                                  .cantidatTfTextController
                                                                  .text,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.cantidatTfTextController
                                                                            .text !=
                                                                        '') &&
                                                                (_model.valorTFTextController
                                                                            .text !=
                                                                        '')) {
                                                              if (widget
                                                                      .viviendaProp ==
                                                                  true) {
                                                                if ((_model.totalDeudaCompleta +
                                                                        ((_model.valorConvVTF!) *
                                                                            (_model.valorConvCTF!))) >
                                                                    20.0) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            '¡Alerta!'),
                                                                        content:
                                                                            Text('No puede superar el límite de crédito'),
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
                                                                } else {
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
                                                                            FieldValue.arrayUnion([
                                                                          getDataTypeProductosFirestoreData(
                                                                            createDataTypeProductosStruct(
                                                                              nombreProd: _model.prodTFTextController.text,
                                                                              valorProd: (_model.valorConvVTF!) * (_model.valorConvCTF!),
                                                                              cantidad: _model.valorConvCTF,
                                                                              idProd: random_data.randomString(
                                                                                6,
                                                                                6,
                                                                                true,
                                                                                true,
                                                                                true,
                                                                              ),
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
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .cantidatTfTextController
                                                                        ?.clear();
                                                                    _model
                                                                        .valorTFTextController
                                                                        ?.clear();
                                                                    _model
                                                                        .prodTFTextController
                                                                        ?.clear();
                                                                  });
                                                                }
                                                              } else {
                                                                if ((_model.totalDeudaCompleta +
                                                                        ((_model.valorConvVTF!) *
                                                                            (_model.valorConvCTF!))) >
                                                                    10.0) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            '¡Alerta!'),
                                                                        content:
                                                                            Text('No puede superar el límite de crédito.'),
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
                                                                } else {
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
                                                                            FieldValue.arrayUnion([
                                                                          getDataTypeProductosFirestoreData(
                                                                            createDataTypeProductosStruct(
                                                                              nombreProd: _model.prodTFTextController.text,
                                                                              valorProd: (_model.valorConvVTF!) * (_model.valorConvCTF!),
                                                                              cantidad: _model.valorConvCTF,
                                                                              idProd: random_data.randomString(
                                                                                6,
                                                                                6,
                                                                                true,
                                                                                true,
                                                                                true,
                                                                              ),
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
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .cantidatTfTextController
                                                                        ?.clear();
                                                                    _model
                                                                        .valorTFTextController
                                                                        ?.clear();
                                                                    _model
                                                                        .prodTFTextController
                                                                        ?.clear();
                                                                  });
                                                                }
                                                              }

                                                              _model.queryOnAnadir =
                                                                  await queryClientesRecordOnce(
                                                                queryBuilder:
                                                                    (clientesRecord) =>
                                                                        clientesRecord
                                                                            .where(
                                                                              'cliente.idCliente',
                                                                              isEqualTo: widget.idCliente,
                                                                            )
                                                                            .where(
                                                                              'cliente.idTendero',
                                                                              isEqualTo: widget.tenderoRef,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);
                                                              _shouldSetState =
                                                                  true;
                                                              _model.tempCount =
                                                                  0;
                                                              _model.tempSumHistorial =
                                                                  0.0;
                                                              _model.tempSumProductos =
                                                                  0.0;
                                                              _model.totalDeudaCompleta =
                                                                  0.0;
                                                              safeSetState(
                                                                  () {});
                                                              if ((_model.queryOnAnadir?.cliente
                                                                              .producto !=
                                                                          null &&
                                                                      (_model
                                                                              .queryOnAnadir
                                                                              ?.cliente
                                                                              .producto)!
                                                                          .isNotEmpty) ==
                                                                  true) {
                                                                while (_model
                                                                        .tempCount <
                                                                    _model
                                                                        .queryOnAnadir!
                                                                        .cliente
                                                                        .producto
                                                                        .length) {
                                                                  _model
                                                                      .tempSumProductos = _model
                                                                          .tempSumProductos +
                                                                      _model
                                                                          .queryOnAnadir!
                                                                          .cliente
                                                                          .producto
                                                                          .elementAtOrNull(
                                                                              _model.tempCount)!
                                                                          .valorProd;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.tempCount =
                                                                      _model.tempCount +
                                                                          1;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              }
                                                              _model.tempCount =
                                                                  0;
                                                              safeSetState(
                                                                  () {});
                                                              if ((_model.queryOnAnadir?.cliente
                                                                              .historialPorPagarProd !=
                                                                          null &&
                                                                      (_model
                                                                              .queryOnAnadir
                                                                              ?.cliente
                                                                              .historialPorPagarProd)!
                                                                          .isNotEmpty) ==
                                                                  true) {
                                                                while (_model
                                                                        .tempCount <
                                                                    _model
                                                                        .queryOnAnadir!
                                                                        .cliente
                                                                        .historialPorPagarProd
                                                                        .length) {
                                                                  _model
                                                                      .tempSumHistorial = _model
                                                                          .tempSumHistorial +
                                                                      _model
                                                                          .queryOnAnadir!
                                                                          .cliente
                                                                          .historialPorPagarProd
                                                                          .elementAtOrNull(
                                                                              _model.tempCount)!
                                                                          .totalPorPagar;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.tempCount =
                                                                      _model.tempCount +
                                                                          1;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              }
                                                              _model
                                                                  .totalDeudaCompleta = _model
                                                                      .tempSumHistorial +
                                                                  _model
                                                                      .tempSumProductos;
                                                              _model.valorANormalizar =
                                                                  formatNumber(
                                                                _model
                                                                    .totalDeudaCompleta,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#0.00',
                                                                locale: '',
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              _model.totalDeudaCompletaNorm =
                                                                  await actions
                                                                      .normalizarValorNumerico(
                                                                _model
                                                                    .valorANormalizar!,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              _model.totalDeudaCompleta =
                                                                  _model
                                                                      .totalDeudaCompletaNorm!;
                                                              safeSetState(
                                                                  () {});

                                                              await widget
                                                                  .idCliente!
                                                                  .update(
                                                                      createClientesRecordData(
                                                                cliente:
                                                                    createDataTypeClienteStruct(
                                                                  totalDeudaCompleta:
                                                                      _model
                                                                          .totalDeudaCompletaNorm,
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            }
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '28ox95x7' /* Añadir Producto */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 120.0,
                                                      height: 30.0,
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
                                                              .success,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 16.0,
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
                                                      disabledColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      disabledTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ).addWalkthrough(
                                                    button88ci7uwn,
                                                    _model
                                                        .tenderoICPdeClienteController,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 20.0)),
                                      ).addWalkthrough(
                                        columnNhblu9cp,
                                        _model.tenderoICPdeClienteController,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '21qsx8ot' /* Canti. */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'c9gcltak' /* | Producto */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'pfuj7yc5' /* | Valor U. */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'pp0mfneo' /* | Valor */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                        ),
                                                      ]
                                                          .addToStart(SizedBox(
                                                              width: 20.0))
                                                          .addToEnd(SizedBox(
                                                              width: 50.0)),
                                                    ),
                                                  ),
                                                  StreamBuilder<ClientesRecord>(
                                                    stream:
                                                        _model.queryUpdateTotal(
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

                                                      final vistaMainClientesRecord =
                                                          snapshot.data!;

                                                      return Builder(
                                                        builder: (context) {
                                                          final vistaMain =
                                                              vistaMainClientesRecord
                                                                  .cliente
                                                                  .producto
                                                                  .toList();
                                                          if (vistaMain
                                                              .isEmpty) {
                                                            return Image.asset(
                                                              'assets/images/imagen_2025-04-22_160024498.png',
                                                              height: 200.0,
                                                            );
                                                          }

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount: vistaMain
                                                                .length,
                                                            itemBuilder: (context,
                                                                vistaMainIndex) {
                                                              final vistaMainItem =
                                                                  vistaMain[
                                                                      vistaMainIndex];
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        8.0,
                                                                        16.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            30.0,
                                                                            8.0,
                                                                            10.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 38.0,
                                                                              child: Divider(
                                                                                height: 0.0,
                                                                                thickness: 0.0,
                                                                                color: Colors.transparent,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              vistaMainItem.cantidad.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 78.0,
                                                                              child: Divider(
                                                                                height: 0.0,
                                                                                thickness: 0.0,
                                                                                color: Colors.transparent,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              vistaMainItem.nombreProd.maybeHandleOverflow(
                                                                                maxChars: 8,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 50.0,
                                                                              child: Divider(
                                                                                height: 0.0,
                                                                                thickness: 0.0,
                                                                                color: Colors.transparent,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '\$ ${formatNumber(
                                                                                vistaMainItem.valorProd / vistaMainItem.cantidad,
                                                                                formatType: FormatType.custom,
                                                                                format: '#0.00',
                                                                                locale: '',
                                                                              )}',
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            SizedBox(
                                                                              width: 33.0,
                                                                              child: Divider(
                                                                                height: 0.0,
                                                                                thickness: 0.0,
                                                                                color: Colors.transparent,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '\$ ${formatNumber(
                                                                                vistaMainItem.valorProd,
                                                                                formatType: FormatType.custom,
                                                                                format: '#0.00',
                                                                                locale: '',
                                                                              )}',
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await vistaMainClientesRecord.reference.update(createClientesRecordData(
                                                                              cliente: createDataTypeClienteStruct(
                                                                                fieldValues: {
                                                                                  'producto': FieldValue.arrayRemove([
                                                                                    getDataTypeProductosFirestoreData(
                                                                                      updateDataTypeProductosStruct(
                                                                                        vistaMainItem,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      true,
                                                                                    )
                                                                                  ]),
                                                                                },
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                            ));
                                                                            _model.queryAfterDelete =
                                                                                await queryClientesRecordOnce(
                                                                              queryBuilder: (clientesRecord) => clientesRecord
                                                                                  .where(
                                                                                    'cliente.idCliente',
                                                                                    isEqualTo: widget.idCliente,
                                                                                  )
                                                                                  .where(
                                                                                    'cliente.idTendero',
                                                                                    isEqualTo: widget.tenderoRef,
                                                                                  ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            _model.tempCount =
                                                                                0;
                                                                            _model.tempSumHistorial =
                                                                                0.0;
                                                                            _model.tempSumProductos =
                                                                                0.0;
                                                                            _model.totalDeudaCompleta =
                                                                                0.0;
                                                                            safeSetState(() {});
                                                                            if ((_model.queryAfterDelete?.cliente.producto != null && (_model.queryAfterDelete?.cliente.producto)!.isNotEmpty) ==
                                                                                true) {
                                                                              while (_model.tempCount < _model.queryAfterDelete!.cliente.producto.length) {
                                                                                _model.tempSumProductos = _model.tempSumProductos + _model.queryAfterDelete!.cliente.producto.elementAtOrNull(_model.tempCount)!.valorProd;
                                                                                safeSetState(() {});
                                                                                _model.tempCount = _model.tempCount + 1;
                                                                                safeSetState(() {});
                                                                              }
                                                                            }
                                                                            _model.tempCount =
                                                                                0;
                                                                            safeSetState(() {});
                                                                            if ((_model.queryAfterDelete?.cliente.historialPorPagarProd != null && (_model.queryAfterDelete?.cliente.historialPorPagarProd)!.isNotEmpty) ==
                                                                                true) {
                                                                              while (_model.tempCount < _model.queryAfterDelete!.cliente.historialPorPagarProd.length) {
                                                                                _model.tempSumHistorial = _model.tempSumHistorial + _model.queryAfterDelete!.cliente.historialPorPagarProd.elementAtOrNull(_model.tempCount)!.totalPorPagar;
                                                                                safeSetState(() {});
                                                                                _model.tempCount = _model.tempCount + 1;
                                                                                safeSetState(() {});
                                                                              }
                                                                            }
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
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
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
                                                ].addToEnd(
                                                    SizedBox(height: 20.0)),
                                              ).addWalkthrough(
                                                columnIkyldudd,
                                                _model
                                                    .tenderoICPdeClienteController,
                                              ),
                                            ),
                                          ],
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            _model.queryGuardar = await queryClientesRecordOnce(
                              queryBuilder: (clientesRecord) => clientesRecord
                                  .where(
                                    'cliente.idCliente',
                                    isEqualTo: widget.idCliente,
                                  )
                                  .where(
                                    'cliente.idTendero',
                                    isEqualTo: widget.tenderoRef,
                                  ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            _shouldSetState = true;
                            if ((_model.queryGuardar?.cliente.producto !=
                                        null &&
                                    (_model.queryGuardar?.cliente.producto)!
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
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            } else {
                              _model.tempCount = 0;
                              _model.sumaValoresEnDTProd = 0.0;
                              safeSetState(() {});
                              while (_model.tempCount <
                                  _model
                                      .queryGuardar!.cliente.producto.length) {
                                _model.addToDtProdItem(DataTypeProductosStruct(
                                  nombreProd: (_model
                                          .queryGuardar?.cliente.producto
                                          .elementAtOrNull(_model.tempCount))
                                      ?.nombreProd,
                                  valorProd: (_model
                                          .queryGuardar?.cliente.producto
                                          .elementAtOrNull(_model.tempCount))
                                      ?.valorProd,
                                  cantidad: (_model
                                          .queryGuardar?.cliente.producto
                                          .elementAtOrNull(_model.tempCount))
                                      ?.cantidad,
                                ));
                                _model.tempCount = _model.tempCount + 1;
                                safeSetState(() {});
                              }
                            }

                            _model.tempCount = 0;
                            safeSetState(() {});
                            while (
                                _model.tempCount < _model.dtProdItem.length) {
                              _model.sumaValoresEnDTProd =
                                  _model.sumaValoresEnDTProd! +
                                      _model.dtProdItem
                                          .elementAtOrNull(_model.tempCount)!
                                          .valorProd;
                              _model.tempCount = _model.tempCount + 1;
                              safeSetState(() {});
                            }
                            _model.valorANormalizar = formatNumber(
                              _model.sumaValoresEnDTProd,
                              formatType: FormatType.custom,
                              format: '#0.00',
                              locale: '',
                            );
                            safeSetState(() {});
                            _model.sumaValoresEnDTNorm =
                                await actions.normalizarValorNumerico(
                              _model.valorANormalizar!,
                            );
                            _shouldSetState = true;
                            _model.sumaValoresEnDTProd =
                                _model.sumaValoresEnDTNorm;
                            safeSetState(() {});

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
                                              _model.sumaValoresEnDTProd,
                                          totalPorPagar:
                                              _model.sumaValoresEnDTProd,
                                          transferencia: false,
                                          efectivo: false,
                                          idTransaccion: valueOrDefault<String>(
                                            random_data.randomString(
                                              5,
                                              5,
                                              true,
                                              true,
                                              true,
                                            ),
                                            'id000',
                                          ),
                                          fechaDeFio: getCurrentTimestamp,
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
                            _model.dtProdItem = [];
                            _model.tempSumProductos = 0.0;
                            safeSetState(() {});
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('¡Productos guardados!'),
                                  content: Text(
                                      'Los productos añadidos han sido guardados correctamente.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (_shouldSetState) safeSetState(() {});
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
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
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

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.tenderoICPdeClienteController = null);
          FFAppState().isFirstTimeInfoEdit = false;
          safeSetState(() {});
        },
        onSkip: () {
          () async {
            FFAppState().isFirstTimeInfoEdit = false;
            safeSetState(() {});
          }();
          return true;
        },
      );
}
