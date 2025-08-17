import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/components/dialog_two_btns_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

class _ClienteInfoEditWidgetState extends State<ClienteInfoEditWidget>
    with TickerProviderStateMixin {
  late ClienteInfoEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

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
      _model.totalDeudaCompletaFR = await actions.normalizarValorNumerico(
        formatNumber(
          _model.totalDeudaCompleta,
          formatType: FormatType.custom,
          format: '#0.00',
          locale: '',
        ),
      );

      await widget.idCliente!.update(createClientesRecordData(
        cliente: createDataTypeClienteStruct(
          totalDeudaCompleta: _model.totalDeudaCompletaFR,
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

    animationsMap.addAll({
      'formOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, -17.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'formOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: Offset(0.0, -17.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation1': AnimationInfo(
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
      'iconButtonOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 2000.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
                child: SpinKitWanderingCubes(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
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
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: SafeArea(
                top: true,
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Material(
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
                                        0.0, 8.0, 0.0, 8.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 12.0,
                                      borderWidth: 1.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                        _model.readTendero =
                                            await TenderosRecord
                                                .getDocumentOnce(
                                                    widget.tenderoRef!);

                                        context.pushNamed(
                                          ListaClientesWidget.routeName,
                                          queryParameters: {
                                            'tenderoRef': serializeParam(
                                              widget.tenderoRef,
                                              ParamType.DocumentReference,
                                            ),
                                            'nombreTienda': serializeParam(
                                              _model.readTendero?.displayName,
                                              ParamType.String,
                                            ),
                                            'tenderoEmail': serializeParam(
                                              _model.readTendero?.email,
                                              ParamType.String,
                                            ),
                                            'nombreTendero': serializeParam(
                                              _model.readTendero?.tenderos
                                                  .nombreTendero,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        safeSetState(() {});
                                      },
                                    ).animateOnPageLoad(animationsMap[
                                        'iconButtonOnPageLoadAnimation1']!),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: AutoSizeText(
                                            'Información del cliente',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.quicksand(
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
                                                  fontSize: 20.0,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 12.0,
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
                                                  height: 300.0,
                                                  child: DialogTwoBtnsWidget(
                                                    titulo:
                                                        '¿Desea cerrar sesión?',
                                                    mensaje:
                                                        'Sus datos se guardarán automáticamente.',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(
                                            () => _model.isLogoff = value));

                                        _shouldSetState = true;
                                        if (_model.isLogoff!) {
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          await authManager.signOut();
                                          GoRouter.of(context)
                                              .clearRedirectLocation();

                                          if (animationsMap[
                                                  'formOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'formOnActionTriggerAnimation']!
                                                .controller
                                                .forward(from: 0.0);
                                          }

                                          context.goNamedAuth(
                                              AuthSigningInWidget.routeName,
                                              context.mounted);
                                        } else {
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 770.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                      BorderRadius.circular(
                                                          14.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Datos ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
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
                                                        ),
                                                        Text(
                                                          'Edición y visualización del cliente:',
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
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
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: 280.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width: 280.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              AutoSizeText(
                                                                            '${valueOrDefault<String>(
                                                                              widget.nombre,
                                                                              'nombre',
                                                                            )} ${widget.apellido}',
                                                                            maxLines:
                                                                                1,
                                                                            minFontSize:
                                                                                4.0,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.asap(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  5.0,
                                                                  16.0,
                                                                  10.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 65.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Cédula: ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              font: GoogleFonts.asap(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .cedula,
                                                                      'cedula',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.asap(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderRadius:
                                                                    8.0,
                                                                borderWidth:
                                                                    1.0,
                                                                icon: Icon(
                                                                  Icons.edit,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 26.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .goNamed(
                                                                    ClienteEditInfoWidget
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
                                                                      'customLimit':
                                                                          serializeParam(
                                                                        clienteInfoEditClientesRecord
                                                                            .cliente
                                                                            .customLimit,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'iconButtonOnPageLoadAnimation2']!),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 65.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Teléfono: ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              font: GoogleFonts.asap(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .telf,
                                                                      'telefono',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.asap(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Builder(
                                                                builder: (context) =>
                                                                    FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      12.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Color(
                                                                        0xFFE75353),
                                                                    size: 26.0,
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
                                                                              height: 400.0,
                                                                              child: DialogTwoBtnsWidget(
                                                                                titulo: '¿Está seguro que desea eliminar este cliente?',
                                                                                mensaje: 'Esta acción es permanente y no se podrá recuperar los datos del cliente.',
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
                                                                          await ClientesRecord.getDocumentOnce(
                                                                              widget.idCliente!);
                                                                      _shouldSetState =
                                                                          true;
                                                                      if ((_model.readForClienteDelete?.cliente.historialPorPagarProd != null &&
                                                                              (_model.readForClienteDelete?.cliente.historialPorPagarProd)!.isNotEmpty) ==
                                                                          true) {
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
                                                                                    titulo: '¡Este cliente no puede ser eliminado!',
                                                                                    mensaje: 'El cliente aún tiene deudas pendientes en su tienda.',
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

                                                                        context
                                                                            .pushNamed(
                                                                          ListaClientesWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'tenderoRef':
                                                                                serializeParam(
                                                                              widget.tenderoRef,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      }
                                                                    }
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                  },
                                                                ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'iconButtonOnPageLoadAnimation3']!),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 320.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  width: 230.0,
                                                                  height: 20.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            65.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'E-mail: ',
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  font: GoogleFonts.asap(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            widget.emailCliente,
                                                                            'email',
                                                                          ),
                                                                          minFontSize:
                                                                              4.0,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.asap(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      12.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  icon: Icon(
                                                                    Icons.info,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    size: 26.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      ClienteReadInfoWidget
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
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'iconButtonOnPageLoadAnimation4']!),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].addToStart(
                                                      SizedBox(height: 5.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                      BorderRadius.circular(
                                                          14.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                child: Column(
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
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Cuentas y Pagos',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
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
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
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
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                _model.queryHistorialPagado =
                                                                    await queryClientesRecordOnce(
                                                                  queryBuilder: (clientesRecord) =>
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
                                                                    .info,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                _model.queryHistorialPorPagar =
                                                                    await queryClientesRecordOnce(
                                                                  queryBuilder: (clientesRecord) =>
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
                                                                            FormatType.custom,
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
                                                                    .info,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
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
                                                                    font: GoogleFonts
                                                                        .asap(
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
                                                                    .tertiary,
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
                                                            child:
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
                                                              text:
                                                                  'Comprobantes bancarios',
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
                                                                          .asap(
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
                                                  ]
                                                      .addToStart(
                                                          SizedBox(height: 5.0))
                                                      .addToEnd(SizedBox(
                                                          height: 15.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 10.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                      BorderRadius.circular(
                                                          14.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                              child:
                                                                  AutoSizeText(
                                                                'Fiar Productos',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .readexPro(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontStyle,
                                                                      ),
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
                                                                        widget
                                                                            .idCliente!),
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
                                                                            SpinKitWanderingCubes(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  final textClientesRecord =
                                                                      snapshot
                                                                          .data!;

                                                                  return AutoSizeText(
                                                                    'Total por cobrar: \$${formatNumber(
                                                                      textClientesRecord
                                                                          .cliente
                                                                          .totalDeudaCompleta,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '#0.00',
                                                                      locale:
                                                                          '',
                                                                    )}/${() {
                                                                      if ((widget.viviendaProp ==
                                                                              true) &&
                                                                          ((textClientesRecord.cliente.customLimit == null) ||
                                                                              (textClientesRecord.cliente.customLimit <=
                                                                                  0))) {
                                                                        return '20';
                                                                      } else if ((textClientesRecord.cliente.customLimit !=
                                                                              null) &&
                                                                          (textClientesRecord.cliente.customLimit >
                                                                              0)) {
                                                                        return textClientesRecord
                                                                            .cliente
                                                                            .customLimit
                                                                            .toString();
                                                                      } else {
                                                                        return '10';
                                                                      }
                                                                    }()}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.asap(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    10.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: 2.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .cantidatTfTextController,
                                                                  focusNode: _model
                                                                      .cantidatTfFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  textCapitalization:
                                                                      TextCapitalization
                                                                          .none,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelText:
                                                                        'Cantidad',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.asap(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                    alignLabelWithHint:
                                                                        true,
                                                                    hintText:
                                                                        '0',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.asap(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              14.0,
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
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            14.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .asap(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                      TextInputFormatter.withFunction(
                                                                          (oldValue,
                                                                              newValue) {
                                                                        return TextEditingValue(
                                                                          selection:
                                                                              newValue.selection,
                                                                          text: newValue
                                                                              .text
                                                                              .toCapitalization(TextCapitalization.none),
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
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .prodTFTextController,
                                                                  focusNode: _model
                                                                      .prodTFFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  textCapitalization:
                                                                      TextCapitalization
                                                                          .words,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelText:
                                                                        'Producto',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.asap(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                    alignLabelWithHint:
                                                                        true,
                                                                    hintText:
                                                                        'Nombre',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.asap(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              14.0,
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
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            14.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .asap(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                      TextInputFormatter.withFunction(
                                                                          (oldValue,
                                                                              newValue) {
                                                                        return TextEditingValue(
                                                                          selection:
                                                                              newValue.selection,
                                                                          text: newValue
                                                                              .text
                                                                              .toCapitalization(TextCapitalization.words),
                                                                        );
                                                                      }),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                width: 2.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .valorTFTextController,
                                                                  focusNode: _model
                                                                      .valorTFFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  textCapitalization:
                                                                      TextCapitalization
                                                                          .none,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelText:
                                                                        'Valor unitario',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.asap(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                    alignLabelWithHint:
                                                                        true,
                                                                    hintText:
                                                                        '#.##',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.asap(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    errorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        UnderlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            14.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .asap(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  maxLength: 5,
                                                                  keyboardType: const TextInputType
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
                                                                      TextInputFormatter.withFunction(
                                                                          (oldValue,
                                                                              newValue) {
                                                                        return TextEditingValue(
                                                                          selection:
                                                                              newValue.selection,
                                                                          text: newValue
                                                                              .text
                                                                              .toCapitalization(TextCapitalization.none),
                                                                        );
                                                                      }),
                                                                    FilteringTextInputFormatter
                                                                        .allow(RegExp(
                                                                            '^(0|[1-9]\\d*)([,.]\\d{0,2})?\$'))
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 15.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      width:
                                                                          1.0))
                                                              .addToEnd(
                                                                  SizedBox(
                                                                      width:
                                                                          1.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Total actual: \$${formatNumber(
                                                                _model
                                                                    .tempSumProductos,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#0.00',
                                                                locale: '',
                                                              )}',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .asap(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0xFFE75353),
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
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  if ((clienteInfoEditClientesRecord.cliente.viviendaPropia == true) &&
                                                                      (clienteInfoEditClientesRecord
                                                                              .cliente.totalDeudaCompleta >=
                                                                          20.0) &&
                                                                      ((clienteInfoEditClientesRecord.cliente.customLimit ==
                                                                              null) ||
                                                                          (clienteInfoEditClientesRecord.cliente.customLimit ==
                                                                              0))) {
                                                                    return true;
                                                                  } else if ((clienteInfoEditClientesRecord
                                                                              .cliente
                                                                              .viviendaAlq ==
                                                                          true) &&
                                                                      (clienteInfoEditClientesRecord
                                                                              .cliente
                                                                              .totalDeudaCompleta >=
                                                                          10.0) &&
                                                                      ((clienteInfoEditClientesRecord.cliente.customLimit ==
                                                                              null) ||
                                                                          (clienteInfoEditClientesRecord.cliente.customLimit ==
                                                                              0))) {
                                                                    return true;
                                                                  } else if ((clienteInfoEditClientesRecord
                                                                              .cliente
                                                                              .customLimit >
                                                                          0) &&
                                                                      (clienteInfoEditClientesRecord
                                                                              .cliente
                                                                              .totalDeudaCompleta >=
                                                                          clienteInfoEditClientesRecord
                                                                              .cliente
                                                                              .customLimit
                                                                              .toDouble())) {
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
                                                                            await actions.normalizarValorNumerico(
                                                                          _model
                                                                              .valorTFTextController
                                                                              .text,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        _model.valorConvCTF =
                                                                            await actions.normalizarValorNumerico(
                                                                          _model
                                                                              .cantidatTfTextController
                                                                              .text,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        if (((_model.cantidatTfTextController.text != '') && (_model.cantidatTfTextController.text != '0')) &&
                                                                            ((_model.valorTFTextController.text != '') &&
                                                                                (_model.valorTFTextController.text != '0'))) {
                                                                          if ((widget.viviendaProp == true) &&
                                                                              (clienteInfoEditClientesRecord.cliente.customLimit == 0)) {
                                                                            if ((_model.totalDeudaCompleta + ((_model.valorConvVTF!) * (_model.valorConvCTF!))) >
                                                                                20.0) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (dialogContext) {
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
                                                                              await widget.idCliente!.update(createClientesRecordData(
                                                                                cliente: createDataTypeClienteStruct(
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
                                                                              safeSetState(() {
                                                                                _model.cantidatTfTextController?.clear();
                                                                                _model.valorTFTextController?.clear();
                                                                                _model.prodTFTextController?.clear();
                                                                              });
                                                                            }
                                                                          } else {
                                                                            if ((widget.viviendaAlq == true) &&
                                                                                (clienteInfoEditClientesRecord.cliente.customLimit == 0)) {
                                                                              if ((_model.totalDeudaCompleta + ((_model.valorConvVTF!) * (_model.valorConvCTF!))) > 10.0) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
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

                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              } else {
                                                                                await widget.idCliente!.update(createClientesRecordData(
                                                                                  cliente: createDataTypeClienteStruct(
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
                                                                                safeSetState(() {
                                                                                  _model.cantidatTfTextController?.clear();
                                                                                  _model.valorTFTextController?.clear();
                                                                                  _model.prodTFTextController?.clear();
                                                                                });
                                                                              }
                                                                            } else {
                                                                              if (clienteInfoEditClientesRecord.cliente.customLimit > 0) {
                                                                                if ((_model.totalDeudaCompleta + ((_model.valorConvVTF!) * (_model.valorConvCTF!))) > clienteInfoEditClientesRecord.cliente.customLimit.toDouble()) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
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

                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                } else {
                                                                                  await widget.idCliente!.update(createClientesRecordData(
                                                                                    cliente: createDataTypeClienteStruct(
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
                                                                                  safeSetState(() {
                                                                                    _model.cantidatTfTextController?.clear();
                                                                                    _model.valorTFTextController?.clear();
                                                                                    _model.prodTFTextController?.clear();
                                                                                  });
                                                                                }
                                                                              } else {
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }
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
                                                                          ).then((s) => s.firstOrNull);
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
                                                                          if ((_model.queryOnAnadir?.cliente.producto != null && (_model.queryOnAnadir?.cliente.producto)!.isNotEmpty) ==
                                                                              true) {
                                                                            while (_model.tempCount <
                                                                                _model.queryOnAnadir!.cliente.producto.length) {
                                                                              _model.tempSumProductos = _model.tempSumProductos + _model.queryOnAnadir!.cliente.producto.elementAtOrNull(_model.tempCount)!.valorProd;
                                                                              safeSetState(() {});
                                                                              _model.tempCount = _model.tempCount + 1;
                                                                              safeSetState(() {});
                                                                            }
                                                                          }
                                                                          _model.tempCount =
                                                                              0;
                                                                          safeSetState(
                                                                              () {});
                                                                          if ((_model.queryOnAnadir?.cliente.historialPorPagarProd != null && (_model.queryOnAnadir?.cliente.historialPorPagarProd)!.isNotEmpty) ==
                                                                              true) {
                                                                            while (_model.tempCount <
                                                                                _model.queryOnAnadir!.cliente.historialPorPagarProd.length) {
                                                                              _model.tempSumHistorial = _model.tempSumHistorial + _model.queryOnAnadir!.cliente.historialPorPagarProd.elementAtOrNull(_model.tempCount)!.totalPorPagar;
                                                                              safeSetState(() {});
                                                                              _model.tempCount = _model.tempCount + 1;
                                                                              safeSetState(() {});
                                                                            }
                                                                          }
                                                                          _model.totalDeudaCompleta =
                                                                              _model.tempSumHistorial + _model.tempSumProductos;
                                                                          _model.valorANormalizar =
                                                                              formatNumber(
                                                                            _model.totalDeudaCompleta,
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
                                                                              await actions.normalizarValorNumerico(
                                                                            _model.valorANormalizar!,
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.totalDeudaCompleta =
                                                                              _model.totalDeudaCompletaNorm!;
                                                                          safeSetState(
                                                                              () {});

                                                                          await widget
                                                                              .idCliente!
                                                                              .update(createClientesRecordData(
                                                                            cliente:
                                                                                createDataTypeClienteStruct(
                                                                              totalDeudaCompleta: _model.totalDeudaCompletaNorm,
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                          ));
                                                                        } else {
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
                                                                                    height: 300.0,
                                                                                    child: DialogBtnWidget(
                                                                                      titulo: '¡Alerta!',
                                                                                      mensaje: 'Ingrese una cantidad y valor unitario válidas.',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                      },
                                                                text:
                                                                    'Añadir Producto',
                                                                options:
                                                                    FFButtonOptions(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .asap(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
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
                                                              ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'buttonOnPageLoadAnimation1']!),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  14.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  14.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              0.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    primary:
                                                                        false,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              10.0,
                                                                              16.0,
                                                                              10.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Canti.',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.asap(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '| Producto',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.asap(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '| Valor U.',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.asap(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '| Valor',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.asap(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 0.0,
                                                                                child: VerticalDivider(
                                                                                  width: 10.0,
                                                                                  thickness: 0.0,
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                            ].addToStart(SizedBox(width: 15.0)).addToEnd(SizedBox(width: 15.0)),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              5.0),
                                                                          child:
                                                                              StreamBuilder<ClientesRecord>(
                                                                            stream:
                                                                                _model.queryUpdateTotal(
                                                                              requestFn: () => ClientesRecord.getDocument(widget.idCliente!),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: SpinKitWanderingCubes(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 50.0,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }

                                                                              final vistaMainClientesRecord = snapshot.data!;

                                                                              return Builder(
                                                                                builder: (context) {
                                                                                  final vistaMain = vistaMainClientesRecord.cliente.producto.toList();
                                                                                  if (vistaMain.isEmpty) {
                                                                                    return Center(
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                        child: Image.asset(
                                                                                          'assets/images/imagen_2025-08-07_172622687.png',
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }

                                                                                  return ListView.builder(
                                                                                    padding: EdgeInsets.zero,
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    itemCount: vistaMain.length,
                                                                                    itemBuilder: (context, vistaMainIndex) {
                                                                                      final vistaMainItem = vistaMain[vistaMainIndex];
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
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(30.0, 8.0, 10.0, 8.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Column(
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
                                                                                                              font: GoogleFonts.asap(
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
                                                                                                ),
                                                                                                Flexible(
                                                                                                  child: Column(
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
                                                                                                        minFontSize: 4.0,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.asap(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Flexible(
                                                                                                  child: Column(
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
                                                                                                              font: GoogleFonts.asap(
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
                                                                                                ),
                                                                                                Flexible(
                                                                                                  child: Column(
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
                                                                                                              font: GoogleFonts.asap(
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
                                                                      ].addToEnd(
                                                                              SizedBox(height: 20.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ]
                                                      .divide(SizedBox(
                                                          height: 10.0))
                                                      .addToStart(SizedBox(
                                                          height: 5.0)),
                                                ),
                                              ),
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
                      Material(
                        color: Colors.transparent,
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Container(
                          height: 60.0,
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
                                spreadRadius: 2.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 5.0),
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
                                                      isEqualTo:
                                                          widget.idCliente,
                                                    )
                                                    .where(
                                                      'cliente.idTendero',
                                                      isEqualTo:
                                                          widget.tenderoRef,
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
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
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
                                            _model.tempCount =
                                                _model.tempCount + 1;
                                            safeSetState(() {});
                                          }
                                          _model.valorANormalizar =
                                              formatNumber(
                                            _model.sumaValoresEnDTProd,
                                            formatType: FormatType.custom,
                                            format: '#0.00',
                                            locale: '',
                                          );
                                          safeSetState(() {});
                                          _model.sumaValoresEnDTNorm =
                                              await actions
                                                  .normalizarValorNumerico(
                                            _model.valorANormalizar!,
                                          );
                                          _shouldSetState = true;
                                          _model.sumaValoresEnDTProd =
                                              _model.sumaValoresEnDTNorm;
                                          safeSetState(() {});

                                          await widget.idCliente!
                                              .update(createClientesRecordData(
                                            cliente:
                                                createDataTypeClienteStruct(
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
                                                            valueOrDefault<
                                                                String>(
                                                          random_data
                                                              .randomString(
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
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
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
                                              await TenderosRecord
                                                  .getDocumentOnce(
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
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        text: 'Guardar',
                                        options: FFButtonOptions(
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF2482FF),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.asap(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'buttonOnPageLoadAnimation2']!),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    .animateOnPageLoad(
                        animationsMap['formOnPageLoadAnimation']!)
                    .animateOnActionTrigger(
                      animationsMap['formOnActionTriggerAnimation']!,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
