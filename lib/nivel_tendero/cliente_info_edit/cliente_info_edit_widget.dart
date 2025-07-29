import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/components/dialog_two_btns_widget.dart';
import '/components_nivel_tendero/info_comp/info_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cliente_info_edit_model.dart';
export 'cliente_info_edit_model.dart';

class ClienteInfoEditWidget extends StatefulWidget {
  const ClienteInfoEditWidget({
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

  static String routeName = 'clienteInfoEdit';
  static String routePath = '/clienteInfoEdit';

  @override
  State<ClienteInfoEditWidget> createState() => _ClienteInfoEditWidgetState();
}

class _ClienteInfoEditWidgetState extends State<ClienteInfoEditWidget> {
  late ClienteInfoEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteInfoEditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isFirstTimeInfoEdit == true) {
        FFAppState().isFirstTimeInfoEdit = false;
        safeSetState(() {});

        context.goNamed(
          PageTutorialinfoProdFTWidget.routeName,
          queryParameters: {
            'tenderoRef': serializeParam(
              widget.tenderoRef,
              ParamType.DocumentReference,
            ),
            'nombreCliente': serializeParam(
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
            'idCliente': serializeParam(
              widget.idCliente,
              ParamType.DocumentReference,
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
              widget.viviendaProp,
              ParamType.bool,
            ),
            'emailCliente': serializeParam(
              widget.emailCliente,
              ParamType.String,
            ),
          }.withoutNulls,
        );

        return;
      }
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
      if (_model.queryOnLoad?.cliente.historialPorPagarProd.length == 0) {
        await widget.idCliente!.update(createClientesRecordData(
          cliente: createDataTypeClienteStruct(
            isFiando: false,
            clearUnsetFields: false,
          ),
        ));
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

        final clienteInfoEditClientesRecord = snapshot.data!;

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
                preferredSize: Size.fromHeight(75.0),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 12.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            icon: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primary,
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
                            AutoSizeText(
                              'Información del cliente',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 3.0, 0.0),
                                  child: Text(
                                    '${widget.nombre}',
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
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
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.apellido,
                                    '-',
                                  ),
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                        Builder(
                          builder: (context) => FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).error,
                            borderRadius: 12.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.logout,
                              color: Color(0xFFE75353),
                              size: 24.0,
                            ),
                            onPressed: () async {
                              var _shouldSetState = false;
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
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Container(
                                        height: 300.0,
                                        child: DialogTwoBtnsWidget(
                                          titulo: '¿Desea cerrar sesión?',
                                          mensaje:
                                              'Sus datos se guardarán automáticamente.',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) =>
                                  safeSetState(() => _model.isLogoff = value));

                              _shouldSetState = true;
                              if (_model.isLogoff!) {
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                    AuthSigningInWidget.routeName,
                                    context.mounted);
                              } else {
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                          ),
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
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 770.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              Text(
                                                'Datos ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
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
                                              Text(
                                                'Edición y visualización',
                                                maxLines: 1,
                                                style:
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
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if ((widget.viviendaProp ==
                                                                      true) &&
                                                                  (_model.totalDeudaCompleta >
                                                                      20.0)) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                              } else if ((widget
                                                                          .viviendaAlq ==
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
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
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
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          hoverIconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                          hoverBorderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
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
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -0.02),
                                                        child: Builder(
                                                          builder: (context) =>
                                                              FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            borderRadius: 12.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            hoverColor: Color(
                                                                0xFFE75353),
                                                            hoverIconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            hoverBorderColor:
                                                                Color(
                                                                    0xFFE75353),
                                                            icon: Icon(
                                                              Icons.delete,
                                                              color: Color(
                                                                  0xFFE75353),
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
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
                                                                            400.0,
                                                                        child:
                                                                            DialogTwoBtnsWidget(
                                                                          titulo:
                                                                              '¿Está seguro que desea eliminar este cliente?',
                                                                          mensaje:
                                                                              'Esta acción es permanente y no se podrá recuperar los datos del cliente.',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.isDeleting =
                                                                          value));

                                                              _shouldSetState =
                                                                  true;
                                                              if (_model
                                                                  .isDeleting!) {
                                                                _model.readForClienteDelete =
                                                                    await ClientesRecord
                                                                        .getDocumentOnce(
                                                                            widget.idCliente!);
                                                                _shouldSetState =
                                                                    true;
                                                                if ((_model.readForClienteDelete?.cliente.historialPorPagarProd !=
                                                                            null &&
                                                                        (_model.readForClienteDelete?.cliente.historialPorPagarProd)!
                                                                            .isNotEmpty) ==
                                                                    true) {
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
                                                                              mensaje: 'El cliente tiene deudas pendientes, por lo tanto, sus datos no podrán ser eliminados.',
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
                                                                if (_model
                                                                        .readForClienteDelete!
                                                                        .cliente
                                                                        .totalDeudaCompleta >
                                                                    0.0) {
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
                                                                              titulo: '¡Este cliente no puede ser eliminado!',
                                                                              mensaje: 'El cliente aún tiene deudas pendientes',
                                                                            ),
                                                                          ),
                                                                        ),
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
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              font: GoogleFonts.readexPro(
                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                          ),
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
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                          hoverIconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                          hoverBorderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
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
                                                                'codigoInicioSesion':
                                                                    serializeParam(
                                                                  clienteInfoEditClientesRecord
                                                                      .cliente
                                                                      .secretPass,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 5.0)),
                                                  ),
                                                ],
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Cuentas y Pagos',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
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
                                                          'Historiales de cobranza',
                                                          maxLines: 1,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.queryHistorialPagado =
                                                                  await queryClientesRecordOnce(
                                                                queryBuilder:
                                                                    (clientesRecord) =>
                                                                        clientesRecord
                                                                            .where(
                                                                              'cliente.cedula',
                                                                              isEqualTo: widget.cedula,
                                                                            )
                                                                            .where(
                                                                              'cliente.idTendero',
                                                                              isEqualTo: widget.tenderoRef,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);

                                                              context.goNamed(
                                                                HistorialPagosWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
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

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text:
                                                                'Productos pagados',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 35.0,
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
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            2.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              hoverBorderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
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
                                                            onPressed:
                                                                () async {
                                                              _model.queryHistorialPorPagar =
                                                                  await queryClientesRecordOnce(
                                                                queryBuilder:
                                                                    (clientesRecord) =>
                                                                        clientesRecord
                                                                            .where(
                                                                              'cliente.cedula',
                                                                              isEqualTo: widget.cedula,
                                                                            )
                                                                            .where(
                                                                              'cliente.idTendero',
                                                                              isEqualTo: widget.tenderoRef,
                                                                            ),
                                                                singleRecord:
                                                                    true,
                                                              ).then((s) => s
                                                                      .firstOrNull);

                                                              context.goNamed(
                                                                HistorialPorCobrarWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
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
                                                                  'totalPassed':
                                                                      serializeParam(
                                                                    formatNumber(
                                                                      clienteInfoEditClientesRecord
                                                                          .cliente
                                                                          .totalDeudaCompleta,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '#0.00',
                                                                      locale:
                                                                          '',
                                                                    ),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text:
                                                                'Productos por cobrar',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 35.0,
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
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            2.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              hoverBorderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
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
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        badges.Badge(
                                                          badgeContent: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              clienteInfoEditClientesRecord
                                                                  .cliente
                                                                  .dataTypeVouchers
                                                                  .where((e) =>
                                                                      e.estadoVoucher ==
                                                                      'Pendiente')
                                                                  .toList()
                                                                  .length
                                                                  .toString(),
                                                              '0',
                                                            ).maybeHandleOverflow(
                                                              maxChars: 2,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
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
                                                          ),
                                                          showBadge: true,
                                                          shape: badges
                                                              .BadgeShape
                                                              .circle,
                                                          badgeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          elevation: 0.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      8.0,
                                                                      8.0),
                                                          position: badges
                                                                  .BadgePosition
                                                              .topEnd(),
                                                          animationType: badges
                                                              .BadgeAnimationType
                                                              .scale,
                                                          toAnimate: true,
                                                          child: FFButtonWidget(
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
                                                            text:
                                                                'Comprobantes bancarios',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 35.0,
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
                                                                  .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            2.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              hoverBorderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
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
                                                  ),
                                                ],
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        AutoSizeText(
                                                          'Fiar Productos',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
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

                                                            return AutoSizeText(
                                                              'Total por cobrar: \$${formatNumber(
                                                                textClientesRecord
                                                                    .cliente
                                                                    .totalDeudaCompleta,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#0.00',
                                                                locale: '',
                                                              )}/${widget.viviendaProp == true ? '20' : '10'}',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 10.0, 5.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
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
                                                                TextCapitalization
                                                                    .none,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelText:
                                                                  'Cantidad',
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
                                                              hintText: '0',
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
                                                                      .primaryText,
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
                                                            maxLength: 4,
                                                            maxLengthEnforcement:
                                                                MaxLengthEnforcement
                                                                    .enforced,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .cantidatTfTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              if (!isAndroid &&
                                                                  !isiOS)
                                                                TextInputFormatter
                                                                    .withFunction(
                                                                        (oldValue,
                                                                            newValue) {
                                                                  return TextEditingValue(
                                                                    selection:
                                                                        newValue
                                                                            .selection,
                                                                    text: newValue
                                                                        .text
                                                                        .toCapitalization(
                                                                            TextCapitalization.none),
                                                                  );
                                                                }),
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '^(0|[1-9]\\d*)([,.]\\d{0,2})?\$'))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width: 200.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .prodTFTextController,
                                                            focusNode: _model
                                                                .prodTFFocusNode,
                                                            autofocus: false,
                                                            textCapitalization:
                                                                TextCapitalization
                                                                    .words,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelText:
                                                                  'Producto',
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
                                                                  'Nombre',
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
                                                                      .primaryText,
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
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              if (!isAndroid &&
                                                                  !isiOS)
                                                                TextInputFormatter
                                                                    .withFunction(
                                                                        (oldValue,
                                                                            newValue) {
                                                                  return TextEditingValue(
                                                                    selection:
                                                                        newValue
                                                                            .selection,
                                                                    text: newValue
                                                                        .text
                                                                        .toCapitalization(
                                                                            TextCapitalization.words),
                                                                  );
                                                                }),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width: 2.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .valorTFTextController,
                                                            focusNode: _model
                                                                .valorTFFocusNode,
                                                            autofocus: false,
                                                            textCapitalization:
                                                                TextCapitalization
                                                                    .none,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelText:
                                                                  'Valor unitario',
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
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              hintText: '#.##',
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
                                                                            13.0,
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
                                                                      .primaryText,
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
                                                            maxLength: 5,
                                                            keyboardType:
                                                                const TextInputType
                                                                    .numberWithOptions(
                                                                    decimal:
                                                                        true),
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .valorTFTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              if (!isAndroid &&
                                                                  !isiOS)
                                                                TextInputFormatter
                                                                    .withFunction(
                                                                        (oldValue,
                                                                            newValue) {
                                                                  return TextEditingValue(
                                                                    selection:
                                                                        newValue
                                                                            .selection,
                                                                    text: newValue
                                                                        .text
                                                                        .toCapitalization(
                                                                            TextCapitalization.none),
                                                                  );
                                                                }),
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '^(0|[1-9]\\d*)([,.]\\d{0,2})?\$'))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 15.0)),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'Total actual: \$${formatNumber(
                                                        _model.tempSumProductos,
                                                        formatType:
                                                            FormatType.custom,
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
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFFF22833),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Expanded(
                                                      child: Builder(
                                                        builder: (context) =>
                                                            Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed: () {
                                                              if ((clienteInfoEditClientesRecord
                                                                          .cliente
                                                                          .viviendaPropia ==
                                                                      true) &&
                                                                  (clienteInfoEditClientesRecord
                                                                          .cliente
                                                                          .totalDeudaCompleta >=
                                                                      20.0)) {
                                                                return true;
                                                              } else if ((clienteInfoEditClientesRecord
                                                                          .cliente
                                                                          .viviendaAlq ==
                                                                      true) &&
                                                                  (clienteInfoEditClientesRecord
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
                                                                    if ((_model.cantidatTfTextController.text !=
                                                                                '') &&
                                                                        (_model.valorTFTextController.text !=
                                                                                '')) {
                                                                      if (widget
                                                                              .viviendaProp ==
                                                                          true) {
                                                                        if ((_model.totalDeudaCompleta +
                                                                                ((_model.valorConvVTF!) * (_model.valorConvCTF!))) >
                                                                            20.0) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 200.0,
                                                                                    child: DialogBtnWidget(
                                                                                      titulo: '¡Alerta!',
                                                                                      mensaje: 'El cliente ha superado el límite de crédito. No se aumentará más productos.',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        } else {
                                                                          await widget
                                                                              .idCliente!
                                                                              .update(createClientesRecordData(
                                                                            cliente:
                                                                                createDataTypeClienteStruct(
                                                                              fieldValues: {
                                                                                'producto': FieldValue.arrayUnion([
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
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                          ));
                                                                          safeSetState(
                                                                              () {
                                                                            _model.cantidatTfTextController?.clear();
                                                                            _model.valorTFTextController?.clear();
                                                                            _model.prodTFTextController?.clear();
                                                                          });
                                                                        }
                                                                      } else {
                                                                        if ((_model.totalDeudaCompleta +
                                                                                ((_model.valorConvVTF!) * (_model.valorConvCTF!))) >
                                                                            10.0) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 200.0,
                                                                                    child: DialogBtnWidget(
                                                                                      titulo: '¡Alerta!',
                                                                                      mensaje: 'El cliente ha superado el límite de crédito. No se aumentará más productos.',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        } else {
                                                                          await widget
                                                                              .idCliente!
                                                                              .update(createClientesRecordData(
                                                                            cliente:
                                                                                createDataTypeClienteStruct(
                                                                              fieldValues: {
                                                                                'producto': FieldValue.arrayUnion([
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
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                          ));
                                                                          safeSetState(
                                                                              () {
                                                                            _model.cantidatTfTextController?.clear();
                                                                            _model.valorTFTextController?.clear();
                                                                            _model.prodTFTextController?.clear();
                                                                          });
                                                                        }
                                                                      }

                                                                      _model.queryOnAnadir =
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
                                                                        singleRecord:
                                                                            true,
                                                                      ).then((s) =>
                                                                              s.firstOrNull);
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
                                                                      if ((_model.queryOnAnadir?.cliente.producto != null &&
                                                                              (_model.queryOnAnadir?.cliente.producto)!.isNotEmpty) ==
                                                                          true) {
                                                                        while (_model.tempCount <
                                                                            _model.queryOnAnadir!.cliente.producto.length) {
                                                                          _model.tempSumProductos =
                                                                              _model.tempSumProductos + _model.queryOnAnadir!.cliente.producto.elementAtOrNull(_model.tempCount)!.valorProd;
                                                                          safeSetState(
                                                                              () {});
                                                                          _model.tempCount =
                                                                              _model.tempCount + 1;
                                                                          safeSetState(
                                                                              () {});
                                                                        }
                                                                      }
                                                                      _model.tempCount =
                                                                          0;
                                                                      safeSetState(
                                                                          () {});
                                                                      if ((_model.queryOnAnadir?.cliente.historialPorPagarProd != null &&
                                                                              (_model.queryOnAnadir?.cliente.historialPorPagarProd)!.isNotEmpty) ==
                                                                          true) {
                                                                        while (_model.tempCount <
                                                                            _model.queryOnAnadir!.cliente.historialPorPagarProd.length) {
                                                                          _model.tempSumHistorial =
                                                                              _model.tempSumHistorial + _model.queryOnAnadir!.cliente.historialPorPagarProd.elementAtOrNull(_model.tempCount)!.totalPorPagar;
                                                                          safeSetState(
                                                                              () {});
                                                                          _model.tempCount =
                                                                              _model.tempCount + 1;
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
                                                                            FormatType.custom,
                                                                        format:
                                                                            '#0.00',
                                                                        locale:
                                                                            '',
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
                                                                              _model.totalDeudaCompletaNorm,
                                                                          clearUnsetFields:
                                                                              false,
                                                                        ),
                                                                      ));
                                                                    }
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                  },
                                                            text:
                                                                'Añadir Producto',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 25.0,
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
                                                              color: Color(
                                                                  0xFF02CE7C),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/poster-with-hand-drawn-fresh-vegetables-healthy-food-agriculture-concept-illustration-food_559587-18.png',
                                                ).image,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFF0197B8),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        height: 260.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xD539D2C0),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          primary: false,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        10.0,
                                                                        16.0,
                                                                        10.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Text(
                                                                      'Canti.',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '| Producto',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '| Valor U.',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '| Valor',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          0.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        width:
                                                                            10.0,
                                                                        thickness:
                                                                            0.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      ),
                                                                    ),
                                                                  ]
                                                                      .addToStart(SizedBox(
                                                                          width:
                                                                              15.0))
                                                                      .addToEnd(SizedBox(
                                                                          width:
                                                                              15.0)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: StreamBuilder<
                                                                    ClientesRecord>(
                                                                  stream: _model
                                                                      .queryUpdateTotal(
                                                                    requestFn: () =>
                                                                        ClientesRecord.getDocument(
                                                                            widget.idCliente!),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }

                                                                    final vistaMainClientesRecord =
                                                                        snapshot
                                                                            .data!;

                                                                    return Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final vistaMain = vistaMainClientesRecord
                                                                            .cliente
                                                                            .producto
                                                                            .toList();
                                                                        if (vistaMain
                                                                            .isEmpty) {
                                                                          return Center(
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.asset(
                                                                                'assets/images/imagen_2025-06-18_135131020.png',
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }

                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              vistaMain.length,
                                                                          itemBuilder:
                                                                              (context, vistaMainIndex) {
                                                                            final vistaMainItem =
                                                                                vistaMain[vistaMainIndex];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 3.0,
                                                                                      color: Color(0x20000000),
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        1.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 8.0, 10.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.min,
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
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          SizedBox(
                                                                                            width: 78.0,
                                                                                            child: Divider(
                                                                                              height: 0.0,
                                                                                              thickness: 0.0,
                                                                                              color: Colors.transparent,
                                                                                            ),
                                                                                          ),
                                                                                          AutoSizeText(
                                                                                            vistaMainItem.nombreProd.maybeHandleOverflow(
                                                                                              maxChars: 10,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                            minFontSize: 10.0,
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
                                                                                        mainAxisSize: MainAxisSize.min,
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
                                                                                            '\$${formatNumber(
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
                                                                                        mainAxisSize: MainAxisSize.min,
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
                                                                                            '\$${formatNumber(
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
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
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
                                                                                              _model.queryAfterDelete = await queryClientesRecordOnce(
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
                                                                                              if ((_model.queryAfterDelete?.cliente.producto != null && (_model.queryAfterDelete?.cliente.producto)!.isNotEmpty) == true) {
                                                                                                while (_model.tempCount < _model.queryAfterDelete!.cliente.producto.length) {
                                                                                                  _model.tempSumProductos = _model.tempSumProductos + _model.queryAfterDelete!.cliente.producto.elementAtOrNull(_model.tempCount)!.valorProd;
                                                                                                  safeSetState(() {});
                                                                                                  _model.tempCount = _model.tempCount + 1;
                                                                                                  safeSetState(() {});
                                                                                                }
                                                                                              }
                                                                                              _model.tempCount = 0;
                                                                                              safeSetState(() {});
                                                                                              if ((_model.queryAfterDelete?.cliente.historialPorPagarProd != null && (_model.queryAfterDelete?.cliente.historialPorPagarProd)!.isNotEmpty) == true) {
                                                                                                while (_model.tempCount < _model.queryAfterDelete!.cliente.historialPorPagarProd.length) {
                                                                                                  _model.tempSumHistorial = _model.tempSumHistorial + _model.queryAfterDelete!.cliente.historialPorPagarProd.elementAtOrNull(_model.tempCount)!.totalPorPagar;
                                                                                                  safeSetState(() {});
                                                                                                  _model.tempCount = _model.tempCount + 1;
                                                                                                  safeSetState(() {});
                                                                                                }
                                                                                              }
                                                                                              _model.totalDeudaCompleta = _model.tempSumHistorial + _model.tempSumProductos;
                                                                                              safeSetState(() {});

                                                                                              await widget.idCliente!.update(createClientesRecordData(
                                                                                                cliente: createDataTypeClienteStruct(
                                                                                                  totalDeudaCompleta: _model.totalDeudaCompleta,
                                                                                                  clearUnsetFields: false,
                                                                                                ),
                                                                                              ));

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.close,
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        ],
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
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      _model.queryGuardar =
                                          await queryClientesRecordOnce(
                                        queryBuilder: (clientesRecord) =>
                                            clientesRecord
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
                                      if ((_model.queryGuardar?.cliente
                                                      .producto !=
                                                  null &&
                                              (_model.queryGuardar?.cliente
                                                      .producto)!
                                                  .isNotEmpty) ==
                                          false) {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Container(
                                                  height: 200.0,
                                                  child: DialogBtnWidget(
                                                    titulo: '¡Alerta!',
                                                    mensaje:
                                                        'No ha sido ingresado ningún producto.',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        _model.tempCount = 0;
                                        _model.sumaValoresEnDTProd = 0.0;
                                        safeSetState(() {});
                                        while (_model.tempCount <
                                            _model.queryGuardar!.cliente
                                                .producto.length) {
                                          _model.addToDtProdItem(
                                              DataTypeProductosStruct(
                                            nombreProd: (_model.queryGuardar
                                                    ?.cliente.producto
                                                    .elementAtOrNull(
                                                        _model.tempCount))
                                                ?.nombreProd,
                                            valorProd: (_model.queryGuardar
                                                    ?.cliente.producto
                                                    .elementAtOrNull(
                                                        _model.tempCount))
                                                ?.valorProd,
                                            cantidad: (_model.queryGuardar
                                                    ?.cliente.producto
                                                    .elementAtOrNull(
                                                        _model.tempCount))
                                                ?.cantidad,
                                          ));
                                          _model.tempCount =
                                              _model.tempCount + 1;
                                          safeSetState(() {});
                                        }
                                      }

                                      _model.tempCount = 0;
                                      safeSetState(() {});
                                      while (_model.tempCount <
                                          _model.dtProdItem.length) {
                                        _model.sumaValoresEnDTProd =
                                            _model.sumaValoresEnDTProd! +
                                                _model.dtProdItem
                                                    .elementAtOrNull(
                                                        _model.tempCount)!
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
                                          isFiando: true,
                                          fieldValues: {
                                            'historialPorPagarProd':
                                                FieldValue.arrayUnion([
                                              getDataTypeHistorialPagoFirestoreData(
                                                updateDataTypeHistorialPagoStruct(
                                                  DataTypeHistorialPagoStruct(
                                                    productos:
                                                        _model.dtProdItem,
                                                    totalPagado: 0.0,
                                                    totalGeneral: _model
                                                        .sumaValoresEnDTProd,
                                                    totalPorPagar: _model
                                                        .sumaValoresEnDTProd,
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
                                                    fechaDeFio:
                                                        getCurrentTimestamp,
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
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Container(
                                                height: 200.0,
                                                child: DialogBtnWidget(
                                                  titulo:
                                                      '¡Productos guardados!',
                                                  mensaje:
                                                      'Los productos añadidos han sido guardados correctamente.',
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      _model.tenderoReadForEmailToClientProds =
                                          await TenderosRecord.getDocumentOnce(
                                              widget.tenderoRef!);
                                      _shouldSetState = true;
                                      for (int loop1Index = 0;
                                          loop1Index <
                                              clienteInfoEditClientesRecord
                                                  .playerIds.length;
                                          loop1Index++) {
                                        final currentLoop1Item =
                                            clienteInfoEditClientesRecord
                                                .playerIds[loop1Index];
                                        unawaited(
                                          () async {
                                            await actions
                                                .sendNotificationToPlayer(
                                              currentLoop1Item,
                                              '${widget.nombre}: ¡Se han agregado productos adeudados a tu cuenta en la tienda: ${_model.tenderoReadForEmailToClientProds?.displayName}!',
                                            );
                                          }(),
                                        );
                                      }
                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: 'Guardar',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF2482FF),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0x4C03369F),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
