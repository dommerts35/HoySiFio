import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/components/dialog_two_btns_widget.dart';
import '/components_nivel_tendero/check_cuentas_comp/check_cuentas_comp_widget.dart';
import '/components_nivel_tendero/empty_productos_pagados_comp/empty_productos_pagados_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:marketplace_check_internet_connection_library_vrjzhi/custom_code/actions/index.dart'
    as marketplace_check_internet_connection_library_vrjzhi_actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'historial_por_cobrar_model.dart';
export 'historial_por_cobrar_model.dart';

class HistorialPorCobrarWidget extends StatefulWidget {
  const HistorialPorCobrarWidget({
    super.key,
    this.idCliente,
    this.idTendero,
    this.nombre,
    this.telf,
    this.isFiando,
    this.apellido,
    this.cedula,
    this.direccionDomicilio,
    this.viviendaAlq,
    this.viviendaProp,
    this.emailCliente,
    this.totalPassed,
  });

  final DocumentReference? idCliente;
  final DocumentReference? idTendero;
  final String? nombre;
  final String? telf;
  final bool? isFiando;
  final String? apellido;
  final String? cedula;
  final String? direccionDomicilio;
  final bool? viviendaAlq;
  final bool? viviendaProp;
  final String? emailCliente;
  final String? totalPassed;

  static String routeName = 'historialPorCobrar';
  static String routePath = '/historialPorCobrar';

  @override
  State<HistorialPorCobrarWidget> createState() =>
      _HistorialPorCobrarWidgetState();
}

class _HistorialPorCobrarWidgetState extends State<HistorialPorCobrarWidget>
    with TickerProviderStateMixin {
  late HistorialPorCobrarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistorialPorCobrarModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.idCliente!.update(createClientesRecordData(
        cliente: createDataTypeClienteStruct(
          fieldValues: {
            'historialPorPagarSelectedList': FieldValue.delete(),
          },
          clearUnsetFields: false,
        ),
      ));
      if (FFAppState().isFirstTimeHistorialCPP == true) {
        FFAppState().isFirstTimeHistorialCPP = false;
        safeSetState(() {});

        context.pushNamed(
          PageTutorialHistorialCPPFTWidget.routeName,
          queryParameters: {
            'tenderoRef': serializeParam(
              widget.idTendero,
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
            'totalPassed': serializeParam(
              widget.totalPassed,
              ParamType.String,
            ),
          }.withoutNulls,
        );

        return;
      }
      while (true) {
        await Future.delayed(
          Duration(
            milliseconds: 5000,
          ),
        );
        _model.isInternetGood =
            await marketplace_check_internet_connection_library_vrjzhi_actions
                .checkInternetConnection();
        if (_model.isInternetGood == false) {
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
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: DialogBtnWidget(
                    titulo: '¡Alerta!',
                    mensaje:
                        'No se ha podido detectar una conexión a internet. Por favor, verifica tu red y vuelve a ingresar.',
                  ),
                ),
              );
            },
          );

          context.goNamed(AuthSigningInWidget.routeName);

          return;
        }
      }
    });

    animationsMap.addAll({
      'columnOnActionTriggerAnimation': AnimationInfo(
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
      'iconButtonOnPageLoadAnimation': AnimationInfo(
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
      'buttonOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
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

    return Builder(
      builder: (context) => StreamBuilder<ClientesRecord>(
        stream: ClientesRecord.getDocument(widget.idCliente!),
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

          final historialPorCobrarClientesRecord = snapshot.data!;

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: PopScope(
              canPop: false,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                body: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Material(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 12.0,
                                  borderWidth: 1.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.goNamed(
                                      ClienteInfoEditWidget.routeName,
                                      queryParameters: {
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
                                        'tenderoRef': serializeParam(
                                          widget.idTendero,
                                          ParamType.DocumentReference,
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
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                ).animateOnPageLoad(animationsMap[
                                    'iconButtonOnPageLoadAnimation']!),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: AutoSizeText(
                                    'Cuentas por cobrar',
                                    maxLines: 2,
                                    minFontSize: 20.0,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.quicksand(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderRadius: 12.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.logout,
                                      color: FlutterFlowTheme.of(context).error,
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
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        if (animationsMap[
                                                'columnOnActionTriggerAnimation'] !=
                                            null) {
                                          await animationsMap[
                                                  'columnOnActionTriggerAnimation']!
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

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Container(
                            width: double.infinity,
                            height: 750.0,
                            constraints: BoxConstraints(
                              maxWidth: 1170.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StreamBuilder<ClientesRecord>(
                                    stream: ClientesRecord.getDocument(
                                        widget.idCliente!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitWanderingCubes(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }

                                      final mainHistorialViewClientesRecord =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final listaProdPorPagarGroup =
                                              mainHistorialViewClientesRecord
                                                  .cliente.historialPorPagarProd
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.idTransaccion,
                                                      desc: true)
                                                  .toList();
                                          if (listaProdPorPagarGroup.isEmpty) {
                                            return Center(
                                              child:
                                                  EmptyProductosPagadosCompWidget(),
                                            );
                                          }

                                          return ListView.separated(
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              12.0,
                                              0,
                                              20.0,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listaProdPorPagarGroup.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 12.0),
                                            itemBuilder: (context,
                                                listaProdPorPagarGroupIndex) {
                                              final listaProdPorPagarGroupItem =
                                                  listaProdPorPagarGroup[
                                                      listaProdPorPagarGroupIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 570.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        20.0,
                                                                        0.0),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .checkCuentasCompModels
                                                                  .getModel(
                                                                listaProdPorPagarGroupItem
                                                                    .idTransaccion,
                                                                listaProdPorPagarGroupIndex,
                                                              ),
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  CheckCuentasCompWidget(
                                                                key: Key(
                                                                  'Keyzem_${listaProdPorPagarGroupItem.idTransaccion}',
                                                                ),
                                                                indexFromhPP:
                                                                    listaProdPorPagarGroupIndex,
                                                                idCliente: widget
                                                                    .idCliente,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      15.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                'Cantidad',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .asap(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          14.0,
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
                                                                'Producto',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .asap(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          14.0,
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
                                                                'Valor Unitario',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .asap(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          14.0,
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
                                                                'Valor',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .asap(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          14.0,
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
                                                        Container(
                                                          width: 358.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final singleProd =
                                                                  listaProdPorPagarGroupItem
                                                                      .productos
                                                                      .map((e) =>
                                                                          e.nombreProd)
                                                                      .toList();

                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    singleProd
                                                                        .length,
                                                                    (singleProdIndex) {
                                                                  final singleProdItem =
                                                                      singleProd[
                                                                          singleProdIndex];
                                                                  return Container(
                                                                    width:
                                                                        358.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              SizedBox(
                                                                                width: 60.0,
                                                                                child: Divider(
                                                                                  height: 0.0,
                                                                                  thickness: 0.0,
                                                                                  color: Colors.transparent,
                                                                                ),
                                                                              ),
                                                                              Flexible(
                                                                                child: AutoSizeText(
                                                                                  '${listaProdPorPagarGroupItem.productos.elementAtOrNull(singleProdIndex)?.cantidad.toString()}',
                                                                                  minFontSize: 6.0,
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        font: GoogleFonts.asap(
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Container(
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              minWidth: 65.0,
                                                                              maxWidth: 80.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 62.0,
                                                                                  child: Divider(
                                                                                    height: 0.0,
                                                                                    thickness: 0.0,
                                                                                    color: Colors.transparent,
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                    child: AutoSizeText(
                                                                                      valueOrDefault<String>(
                                                                                        '${listaProdPorPagarGroupItem.productos.elementAtOrNull(singleProdIndex)?.nombreProd}',
                                                                                        'prod',
                                                                                      ),
                                                                                      minFontSize: 8.0,
                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            font: GoogleFonts.asap(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              SizedBox(
                                                                                width: 88.0,
                                                                                child: Divider(
                                                                                  height: 0.0,
                                                                                  thickness: 0.0,
                                                                                  color: Colors.transparent,
                                                                                ),
                                                                              ),
                                                                              Flexible(
                                                                                child: AutoSizeText(
                                                                                  '\$${formatNumber(
                                                                                    listaProdPorPagarGroupItem.productos.elementAtOrNull(singleProdIndex)!.valorProd / listaProdPorPagarGroupItem.productos.elementAtOrNull(singleProdIndex)!.cantidad,
                                                                                    formatType: FormatType.custom,
                                                                                    format: '#0.00',
                                                                                    locale: '',
                                                                                  )}',
                                                                                  minFontSize: 6.0,
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        font: GoogleFonts.asap(
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              SizedBox(
                                                                                width: 30.0,
                                                                                child: Divider(
                                                                                  height: 0.0,
                                                                                  thickness: 0.0,
                                                                                  color: Colors.transparent,
                                                                                ),
                                                                              ),
                                                                              Flexible(
                                                                                child: AutoSizeText(
                                                                                  '\$ ${formatNumber(
                                                                                    listaProdPorPagarGroupItem.productos.elementAtOrNull(singleProdIndex)?.valorProd,
                                                                                    formatType: FormatType.custom,
                                                                                    format: '#0.00',
                                                                                    locale: '',
                                                                                  )}',
                                                                                  textAlign: TextAlign.end,
                                                                                  minFontSize: 6.0,
                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        font: GoogleFonts.asap(
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Total: \$${formatNumber(
                                                                      listaProdPorPagarGroupItem
                                                                          .totalGeneral,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '#0.00',
                                                                      locale:
                                                                          '',
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
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
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Total a cobrar: \$${formatNumber(
                                                                      listaProdPorPagarGroupItem
                                                                          .totalPorPagar,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '#0.00',
                                                                      locale:
                                                                          '',
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
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
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Fecha del fío: ${dateTimeFormat(
                                                                      "d/M/y h:mm a",
                                                                      listaProdPorPagarGroupItem
                                                                          .fechaDeFio,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
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
                                                                  ),
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
                                                            if (listaProdPorPagarGroupItem
                                                                    .totalPagado <
                                                                listaProdPorPagarGroupItem
                                                                    .totalGeneral)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                    context
                                                                        .goNamed(
                                                                      ClienteProdValorPagoWidget
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
                                                                        'indexFromHistorial':
                                                                            serializeParam(
                                                                          listaProdPorPagarGroupIndex,
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                        'totalPagadoFromHistorial':
                                                                            serializeParam(
                                                                          listaProdPorPagarGroupItem
                                                                              .totalPagado,
                                                                          ParamType
                                                                              .double,
                                                                        ),
                                                                        'transferFromHistorial':
                                                                            serializeParam(
                                                                          listaProdPorPagarGroupItem
                                                                              .transferencia,
                                                                          ParamType
                                                                              .bool,
                                                                        ),
                                                                        'efectivoFromHistorial':
                                                                            serializeParam(
                                                                          listaProdPorPagarGroupItem
                                                                              .efectivo,
                                                                          ParamType
                                                                              .bool,
                                                                        ),
                                                                        'dtHistorial':
                                                                            serializeParam(
                                                                          listaProdPorPagarGroupItem,
                                                                          ParamType
                                                                              .DataStruct,
                                                                        ),
                                                                        'totalPorPagarFromHistorial':
                                                                            serializeParam(
                                                                          listaProdPorPagarGroupItem
                                                                              .totalPorPagar,
                                                                          ParamType
                                                                              .double,
                                                                        ),
                                                                        'totalGeneralFromHistorial':
                                                                            serializeParam(
                                                                          listaProdPorPagarGroupItem
                                                                              .totalGeneral,
                                                                          ParamType
                                                                              .double,
                                                                        ),
                                                                        'idTransaccionPassed':
                                                                            serializeParam(
                                                                          listaProdPorPagarGroupItem
                                                                              .idTransaccion,
                                                                          ParamType
                                                                              .String,
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
                                                                        'tenderoRef':
                                                                            serializeParam(
                                                                          widget
                                                                              .idTendero,
                                                                          ParamType
                                                                              .DocumentReference,
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
                                                                        'vivendaProp':
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
                                                                          widget
                                                                              .totalPassed,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        kTransitionInfoKey:
                                                                            TransitionInfo(
                                                                          hasTransition:
                                                                              true,
                                                                          transitionType:
                                                                              PageTransitionType.fade,
                                                                          duration:
                                                                              Duration(milliseconds: 0),
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            8.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          'Toque para cobrar',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.asap(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 5.0))
                                                          .addToEnd(SizedBox(
                                                              height: 10.0)),
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
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (animationsMap[
                                                  'columnOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'columnOnActionTriggerAnimation']!
                                                .controller
                                                .forward(from: 0.0);
                                          }

                                          context.goNamed(
                                            ClienteInfoEditWidget.routeName,
                                            queryParameters: {
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
                                              'tenderoRef': serializeParam(
                                                widget.idTendero,
                                                ParamType.DocumentReference,
                                              ),
                                              'direccionDomicilio':
                                                  serializeParam(
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
                                        },
                                        text: 'Añadir Más Productos',
                                        options: FFButtonOptions(
                                          padding: EdgeInsets.all(14.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .success,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
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
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ).animateOnPageLoad(animationsMap[
                                          'buttonOnPageLoadAnimation']!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(2.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Container(
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
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(2.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
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
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: AutoSizeText(
                                        'Total global: \$${widget.totalPassed}',
                                        textAlign: TextAlign.center,
                                        minFontSize: 15.0,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (historialPorCobrarClientesRecord.cliente
                                      .historialPorPagarSelectedList.length >
                                  0)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        for (int loop1Index = 0;
                                            loop1Index <
                                                historialPorCobrarClientesRecord
                                                    .cliente
                                                    .historialPorPagarSelectedList
                                                    .length;
                                            loop1Index++) {
                                          final currentLoop1Item =
                                              historialPorCobrarClientesRecord
                                                      .cliente
                                                      .historialPorPagarSelectedList[
                                                  loop1Index];
                                          _model.totalAPagarCalc = _model
                                                  .totalAPagarCalc +
                                              currentLoop1Item.totalPorPagar;
                                          safeSetState(() {});
                                        }
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
                                                  height: 600.0,
                                                  child: DialogTwoBtnsWidget(
                                                    titulo:
                                                        '¿Cobrar los productos fiados seleccionados por un total de \$${formatNumber(
                                                      _model.totalAPagarCalc,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '#0.00',
                                                      locale: '',
                                                    )} ?',
                                                    mensaje:
                                                        'Al aceptar, se registrarán los productos seleccionados como pagados.',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(
                                            () => _model.isSelecPago = value));

                                        if (_model.isSelecPago!) {
                                          context.goNamed(
                                            ClienteProdSelectPagoWidget
                                                .routeName,
                                            queryParameters: {
                                              'idCliente': serializeParam(
                                                widget.idCliente,
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
                                              'tenderoRef': serializeParam(
                                                widget.idTendero,
                                                ParamType.DocumentReference,
                                              ),
                                              'direccionDomicilio':
                                                  serializeParam(
                                                widget.direccionDomicilio,
                                                ParamType.String,
                                              ),
                                              'viviendaAlq': serializeParam(
                                                widget.viviendaAlq,
                                                ParamType.bool,
                                              ),
                                              'vivendaProp': serializeParam(
                                                widget.viviendaProp,
                                                ParamType.bool,
                                              ),
                                              'emailCliente': serializeParam(
                                                widget.emailCliente,
                                                ParamType.String,
                                              ),
                                              'calcForTotalPorPagar':
                                                  serializeParam(
                                                _model.totalAPagarCalc,
                                                ParamType.double,
                                              ),
                                              'totalPassed': serializeParam(
                                                widget.totalPassed,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Cobrar productos seleccionados',
                                      options: FFButtonOptions(
                                        padding: EdgeInsets.all(10.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.asap(
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
                                        elevation: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              if (historialPorCobrarClientesRecord.cliente
                                      .historialPorPagarSelectedList.length ==
                                  0)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed:
                                          (historialPorCobrarClientesRecord
                                                      .cliente
                                                      .historialPorPagarProd
                                                      .length ==
                                                  0)
                                              ? null
                                              : () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
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
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Container(
                                                            height: 600.0,
                                                            child:
                                                                DialogTwoBtnsWidget(
                                                              titulo:
                                                                  '¿Cobrar todos los productos fiados por un total de \$${formatNumber(
                                                                historialPorCobrarClientesRecord
                                                                    .cliente
                                                                    .totalDeudaCompleta,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#0.00',
                                                                locale: '',
                                                              )} ?',
                                                              mensaje:
                                                                  'Al aceptar, se registrarán todos los productos fiados como pagados.',
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() => _model
                                                          .isFullPago = value));

                                                  if (_model.isFullPago!) {
                                                    context.goNamed(
                                                      ClienteProdFullPagoWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'idCliente':
                                                            serializeParam(
                                                          widget.idCliente,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'nombre':
                                                            serializeParam(
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
                                                        'apellido':
                                                            serializeParam(
                                                          widget.apellido,
                                                          ParamType.String,
                                                        ),
                                                        'cedula':
                                                            serializeParam(
                                                          widget.cedula,
                                                          ParamType.String,
                                                        ),
                                                        'tenderoRef':
                                                            serializeParam(
                                                          widget.idTendero,
                                                          ParamType
                                                              .DocumentReference,
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
                                                        'vivendaProp':
                                                            serializeParam(
                                                          widget.viviendaProp,
                                                          ParamType.bool,
                                                        ),
                                                        'emailCliente':
                                                            serializeParam(
                                                          widget.emailCliente,
                                                          ParamType.String,
                                                        ),
                                                        'totalPassed':
                                                            serializeParam(
                                                          widget.totalPassed,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                      text: 'Cobrar todos los productos',
                                      options: FFButtonOptions(
                                        padding: EdgeInsets.all(10.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.asap(
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
                                        elevation: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        disabledColor: Color(0xA542271C),
                                      ),
                                    ),
                                  ),
                                ),
                            ]
                                .divide(SizedBox(height: 8.0))
                                .addToStart(SizedBox(height: 10.0))
                                .addToEnd(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ).animateOnActionTrigger(
                    animationsMap['columnOnActionTriggerAnimation']!,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
