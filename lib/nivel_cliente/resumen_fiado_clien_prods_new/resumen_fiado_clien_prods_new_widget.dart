import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/components/dialog_two_btns_widget.dart';
import '/components_cliente/empty_productos_fiados_cliente/empty_productos_fiados_cliente_widget.dart';
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
import 'package:lottie/lottie.dart';
import 'resumen_fiado_clien_prods_new_model.dart';
export 'resumen_fiado_clien_prods_new_model.dart';

class ResumenFiadoClienProdsNewWidget extends StatefulWidget {
  const ResumenFiadoClienProdsNewWidget({
    super.key,
    this.historialPorPagarDTList,
    this.nombreCliente,
    this.idCliente,
    this.idTendero,
    this.doc,
    this.cedula,
    this.idTenderoList,
  });

  final List<DataTypeHistorialPagoStruct>? historialPorPagarDTList;
  final String? nombreCliente;
  final DocumentReference? idCliente;
  final DocumentReference? idTendero;
  final List<ClientesRecord>? doc;
  final String? cedula;
  final List<DocumentReference>? idTenderoList;

  static String routeName = 'resumenFiadoClienProdsNew';
  static String routePath = '/resumenFiadoClienProdsNew';

  @override
  State<ResumenFiadoClienProdsNewWidget> createState() =>
      _ResumenFiadoClienProdsNewWidgetState();
}

class _ResumenFiadoClienProdsNewWidgetState
    extends State<ResumenFiadoClienProdsNewWidget>
    with TickerProviderStateMixin {
  late ResumenFiadoClienProdsNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResumenFiadoClienProdsNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (true) {
        await Future.delayed(
          Duration(
            milliseconds: 30000,
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
      'containerOnPageLoadAnimation': AnimationInfo(
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
      'containerOnActionTriggerAnimation': AnimationInfo(
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
      'iconButtonOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-6.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(6.0, 0.0),
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
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
    return Builder(
      builder: (context) => StreamBuilder<ClientesRecord>(
        stream: ClientesRecord.getDocument(widget.idCliente!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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

          final resumenFiadoClienProdsNewClientesRecord = snapshot.data!;

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: PopScope(
              canPop: false,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
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
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 12.0,
                                                  borderWidth: 1.0,
                                                  icon: Icon(
                                                    Icons.arrow_back_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.goNamed(
                                                      TiendaBetterWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'cedula':
                                                            serializeParam(
                                                          widget.cedula,
                                                          ParamType.String,
                                                        ),
                                                        'idTenderoList':
                                                            serializeParam(
                                                          widget.idTenderoList,
                                                          ParamType
                                                              .DocumentReference,
                                                          isList: true,
                                                        ),
                                                        'nombreCliente':
                                                            serializeParam(
                                                          widget.nombreCliente,
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
                                                  },
                                                ).animateOnPageLoad(animationsMap[
                                                    'iconButtonOnPageLoadAnimation1']!),
                                                Flexible(
                                                  child: AutoSizeText(
                                                    'Resúmen de productos fiados',
                                                    textAlign: TextAlign.center,
                                                    minFontSize: 6.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) =>
                                                      FlutterFlowIconButton(
                                                    borderRadius: 12.0,
                                                    borderWidth: 1.0,
                                                    icon: Icon(
                                                      Icons.logout,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
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
                                                                height: 300.0,
                                                                child:
                                                                    DialogTwoBtnsWidget(
                                                                  titulo:
                                                                      '¿Desea cerrar sesión?',
                                                                  mensaje:
                                                                      'Sus datos se guardarán automáticamente.',
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() =>
                                                              _model.isLogoff =
                                                                  value));

                                                      _shouldSetState = true;
                                                      if (_model.isLogoff!) {
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'containerOnActionTriggerAnimation']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }

                                                        context.goNamed(
                                                            AuthSigningInWidget
                                                                .routeName);
                                                      } else {
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                    },
                                                  ).animateOnPageLoad(animationsMap[
                                                          'iconButtonOnPageLoadAnimation2']!),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 300.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: StreamBuilder<
                                                        TenderosRecord>(
                                                      stream: TenderosRecord
                                                          .getDocument(widget
                                                              .idTendero!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitWanderingCubes(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final textTenderosRecord =
                                                            snapshot.data!;

                                                        return AutoSizeText(
                                                          'Tienda: ${textTenderosRecord.tenderos.nombreTienda}',
                                                          minFontSize: 8.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
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
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Total adeudado: \$${formatNumber(
                                                      resumenFiadoClienProdsNewClientesRecord
                                                          .cliente
                                                          .totalDeudaCompleta,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '#0.00',
                                                      locale: '',
                                                    )}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.asap(
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
                                                          letterSpacing: 0.0,
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].addToEnd(SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Wrap(
                                spacing: 16.0,
                                runSpacing: 16.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: SafeArea(
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.6,
                                        constraints: BoxConstraints(
                                          maxWidth: 430.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.59,
                                                constraints: BoxConstraints(
                                                  maxWidth: 430.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 5.0, 16.0, 5.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final historialColumns =
                                                          resumenFiadoClienProdsNewClientesRecord
                                                              .cliente
                                                              .historialPorPagarProd
                                                              .map((e) => e)
                                                              .toList();
                                                      if (historialColumns
                                                          .isEmpty) {
                                                        return Center(
                                                          child:
                                                              EmptyProductosFiadosClienteWidget(),
                                                        );
                                                      }

                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: List.generate(
                                                              historialColumns
                                                                  .length,
                                                              (historialColumnsIndex) {
                                                            final historialColumnsItem =
                                                                historialColumns[
                                                                    historialColumnsIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          0.0),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 2.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        430.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            24.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        ListView(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              constraints: BoxConstraints(
                                                                                minHeight: 190.0,
                                                                                maxWidth: 430.0,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Producto',
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
                                                                                      Text(
                                                                                        'Cantidad',
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
                                                                                      Text(
                                                                                        'Valor U.',
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
                                                                                      Text(
                                                                                        'Valor',
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
                                                                                    ].addToStart(SizedBox(width: 1.0)).addToEnd(SizedBox(width: 1.0)),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      final productosChild = historialColumnsItem.productos.map((e) => e).toList();

                                                                                      return Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: List.generate(productosChild.length, (productosChildIndex) {
                                                                                          final productosChildItem = productosChild[productosChildIndex];
                                                                                          return Container(
                                                                                            width: 285.0,
                                                                                            height: 45.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        SizedBox(
                                                                                                          width: 65.0,
                                                                                                          child: Divider(
                                                                                                            height: 0.0,
                                                                                                            thickness: 0.0,
                                                                                                            color: Colors.transparent,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Flexible(
                                                                                                          child: AutoSizeText(
                                                                                                            valueOrDefault<String>(
                                                                                                              productosChildItem.nombreProd,
                                                                                                              'p',
                                                                                                            ),
                                                                                                            maxLines: 2,
                                                                                                            minFontSize: 4.0,
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
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
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
                                                                                                            valueOrDefault<String>(
                                                                                                              productosChildItem.cantidad.toString(),
                                                                                                              '0',
                                                                                                            ),
                                                                                                            minFontSize: 6.0,
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
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        SizedBox(
                                                                                                          width: 51.0,
                                                                                                          child: Divider(
                                                                                                            height: 0.0,
                                                                                                            thickness: 0.0,
                                                                                                            color: Colors.transparent,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Flexible(
                                                                                                          child: AutoSizeText(
                                                                                                            '\$${formatNumber(
                                                                                                              productosChildItem.valorProd / productosChildItem.cantidad,
                                                                                                              formatType: FormatType.custom,
                                                                                                              format: '#0.00',
                                                                                                              locale: '',
                                                                                                            )}',
                                                                                                            textAlign: TextAlign.end,
                                                                                                            minFontSize: 6.0,
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
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        SizedBox(
                                                                                                          width: 33.0,
                                                                                                          child: Divider(
                                                                                                            height: 0.0,
                                                                                                            thickness: 0.0,
                                                                                                            color: Colors.transparent,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Flexible(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                            child: AutoSizeText(
                                                                                                              '\$${formatNumber(
                                                                                                                productosChildItem.valorProd,
                                                                                                                formatType: FormatType.custom,
                                                                                                                format: '#0.00',
                                                                                                                locale: '',
                                                                                                              )}',
                                                                                                              textAlign: TextAlign.end,
                                                                                                              minFontSize: 6.0,
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
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Total precio de productos: \$${formatNumber(
                                                                                            historialColumnsItem.totalGeneral,
                                                                                            formatType: FormatType.custom,
                                                                                            format: '#0.00',
                                                                                            locale: '',
                                                                                          )}',
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.asap(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Total pagado: \$${formatNumber(
                                                                                            historialColumnsItem.totalPagado,
                                                                                            formatType: FormatType.custom,
                                                                                            format: '#0.00',
                                                                                            locale: '',
                                                                                          )}',
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.asap(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Total por pagar: \$${formatNumber(
                                                                                            historialColumnsItem.totalPorPagar,
                                                                                            formatType: FormatType.custom,
                                                                                            format: '#0.00',
                                                                                            locale: '',
                                                                                          )}',
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                font: GoogleFonts.asap(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 300.0,
                                                                                          height: 20.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: AutoSizeText(
                                                                                                      'Fecha del fio: ${dateTimeFormat(
                                                                                                        "d/M/y h:mm a",
                                                                                                        historialColumnsItem.fechaDeFio,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      )}',
                                                                                                      minFontSize: 6.0,
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.asap(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      if (false)
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Transferencia:',
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.asap(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Theme(
                                                                                                  data: ThemeData(
                                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                                      visualDensity: VisualDensity.compact,
                                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                      shape: RoundedRectangleBorder(
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                  child: Checkbox(
                                                                                                    value: _model.checkboxValueMap1[historialColumnsItem] ??= historialColumnsItem.transferencia,
                                                                                                    onChanged: true
                                                                                                        ? null
                                                                                                        : (newValue) async {
                                                                                                            safeSetState(() => _model.checkboxValueMap1[historialColumnsItem] = newValue!);
                                                                                                          },
                                                                                                    side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                                        ? BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                          )
                                                                                                        : null,
                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                    checkColor: true ? null : FlutterFlowTheme.of(context).info,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Efectivo',
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.asap(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Theme(
                                                                                                  data: ThemeData(
                                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                                      visualDensity: VisualDensity.compact,
                                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                      shape: RoundedRectangleBorder(
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                  child: Checkbox(
                                                                                                    value: _model.checkboxValueMap2[historialColumnsItem] ??= historialColumnsItem.efectivo,
                                                                                                    onChanged: true
                                                                                                        ? null
                                                                                                        : (newValue) async {
                                                                                                            safeSetState(() => _model.checkboxValueMap2[historialColumnsItem] = newValue!);
                                                                                                          },
                                                                                                    side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                                        ? BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                          )
                                                                                                        : null,
                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                    checkColor: true ? null : FlutterFlowTheme.of(context).info,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Builder(
                                                                                          builder: (context) => StreamBuilder<ClientesRecord>(
                                                                                            stream: ClientesRecord.getDocument(widget.idCliente!),
                                                                                            builder: (context, snapshot) {
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

                                                                                              final buttonClientesRecord = snapshot.data!;

                                                                                              return FFButtonWidget(
                                                                                                onPressed: () async {
                                                                                                  if (historialColumnsItem.isVoucherSent == true) {
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
                                                                                                                mensaje: 'Ya ha enviado un voucher, por favor espere a que el tendero acepte su voucher.',
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  } else {
                                                                                                    context.goNamed(
                                                                                                      HistorialSingleVoucherPagoWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'idCliente': serializeParam(
                                                                                                          widget.idCliente,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                        'indexFromHistorial': serializeParam(
                                                                                                          historialColumnsIndex,
                                                                                                          ParamType.int,
                                                                                                        ),
                                                                                                        'totalPagadoFromHistorial': serializeParam(
                                                                                                          historialColumnsItem.totalPagado,
                                                                                                          ParamType.double,
                                                                                                        ),
                                                                                                        'transferFromHistorial': serializeParam(
                                                                                                          historialColumnsItem.transferencia,
                                                                                                          ParamType.bool,
                                                                                                        ),
                                                                                                        'efectivoFromHistorial': serializeParam(
                                                                                                          historialColumnsItem.efectivo,
                                                                                                          ParamType.bool,
                                                                                                        ),
                                                                                                        'dtHistorial': serializeParam(
                                                                                                          historialColumnsItem,
                                                                                                          ParamType.DataStruct,
                                                                                                        ),
                                                                                                        'totalPorPagarFromHistorial': serializeParam(
                                                                                                          historialColumnsItem.totalPorPagar,
                                                                                                          ParamType.double,
                                                                                                        ),
                                                                                                        'totalGeneralFromHistorial': serializeParam(
                                                                                                          historialColumnsItem.totalGeneral,
                                                                                                          ParamType.double,
                                                                                                        ),
                                                                                                        'idTransaccionPassed': serializeParam(
                                                                                                          historialColumnsItem.idTransaccion,
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'nombre': serializeParam(
                                                                                                          buttonClientesRecord.cliente.nombre,
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'telf': serializeParam(
                                                                                                          buttonClientesRecord.cliente.telf,
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'isFiando': serializeParam(
                                                                                                          buttonClientesRecord.cliente.isFiando,
                                                                                                          ParamType.bool,
                                                                                                        ),
                                                                                                        'apellido': serializeParam(
                                                                                                          buttonClientesRecord.cliente.apellido,
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'cedula': serializeParam(
                                                                                                          buttonClientesRecord.cliente.cedula,
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'tenderoRef': serializeParam(
                                                                                                          widget.idTendero,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                        'direccionDomicilio': serializeParam(
                                                                                                          buttonClientesRecord.cliente.direccionDomicilio,
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'viviendaAlq': serializeParam(
                                                                                                          buttonClientesRecord.cliente.viviendaAlq,
                                                                                                          ParamType.bool,
                                                                                                        ),
                                                                                                        'vivendaProp': serializeParam(
                                                                                                          buttonClientesRecord.cliente.viviendaPropia,
                                                                                                          ParamType.bool,
                                                                                                        ),
                                                                                                        'emailCliente': serializeParam(
                                                                                                          buttonClientesRecord.cliente.emailCliente,
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'historialPorPagarDT': serializeParam(
                                                                                                          widget.historialPorPagarDTList,
                                                                                                          ParamType.DataStruct,
                                                                                                          isList: true,
                                                                                                        ),
                                                                                                        'doc': serializeParam(
                                                                                                          widget.doc,
                                                                                                          ParamType.Document,
                                                                                                          isList: true,
                                                                                                        ),
                                                                                                        'idTenderoList': serializeParam(
                                                                                                          widget.idTenderoList,
                                                                                                          ParamType.DocumentReference,
                                                                                                          isList: true,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                      extra: <String, dynamic>{
                                                                                                        'doc': widget.doc,
                                                                                                        kTransitionInfoKey: TransitionInfo(
                                                                                                          hasTransition: true,
                                                                                                          transitionType: PageTransitionType.fade,
                                                                                                          duration: Duration(milliseconds: 0),
                                                                                                        ),
                                                                                                      },
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                                text: historialColumnsItem.isVoucherSent == true ? '¡Comprobante enviado!' : 'Enviar comprobante de pago',
                                                                                                options: FFButtonOptions(
                                                                                                  width: 190.0,
                                                                                                  height: 32.0,
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: historialColumnsItem.isVoucherSent == true ? FlutterFlowTheme.of(context).accent2 : FlutterFlowTheme.of(context).accent1,
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.asap(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: historialColumnsItem.isVoucherSent == true ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primary,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                              ).animateOnActionTrigger(
                                                                                                animationsMap['buttonOnActionTriggerAnimation']!,
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].divide(SizedBox(height: 5.0)),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 15.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 15.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }).divide(SizedBox(
                                                              height: 15.0)),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 3.0,
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
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    var _shouldSetState = false;
                                                    if (resumenFiadoClienProdsNewClientesRecord
                                                            .cliente
                                                            .totalDeudaCompleta ==
                                                        0.0) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
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
                                                                    DialogBtnWidget(
                                                                  titulo:
                                                                      '¡Alerta!',
                                                                  mensaje:
                                                                      'No puede enviar comprobantes porque no hay deudas en su cuenta actualmente.',
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
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
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
                                                                    '¡Alerta!',
                                                                mensaje:
                                                                    'A continuación, debe adjuntar una imagen del comprobante que respalde el pago de los productos fiados, con un total de \$${formatNumber(
                                                                  resumenFiadoClienProdsNewClientesRecord
                                                                      .cliente
                                                                      .totalDeudaCompleta,
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  format:
                                                                      '#0.00',
                                                                  locale: '',
                                                                )}. ¿Desea proceder?',
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() =>
                                                            _model.isPagarTodo =
                                                                value));

                                                    _shouldSetState = true;
                                                    if (_model.isPagarTodo!) {
                                                      if (resumenFiadoClienProdsNewClientesRecord
                                                              .cliente
                                                              .historialPorPagarProd
                                                              .where((e) => e
                                                                  .isVoucherSent)
                                                              .toList()
                                                              .length >
                                                          0) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 200.0,
                                                                  child:
                                                                      DialogBtnWidget(
                                                                    titulo:
                                                                        '¡Alerta!',
                                                                    mensaje:
                                                                        'Ya ha enviado un comprobante, por favor espere a que el tendero acepte su comprobante anterior.',
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
                                                        context.goNamed(
                                                          HistorialFullVoucherPagoWidget
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
                                                              widget
                                                                  .nombreCliente,
                                                              ParamType.String,
                                                            ),
                                                            'tenderoRef':
                                                                serializeParam(
                                                              widget.idTendero,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'historialPorPagarDT':
                                                                serializeParam(
                                                              widget
                                                                  .historialPorPagarDTList,
                                                              ParamType
                                                                  .DataStruct,
                                                              isList: true,
                                                            ),
                                                            'doc':
                                                                serializeParam(
                                                              widget.doc,
                                                              ParamType
                                                                  .Document,
                                                              isList: true,
                                                            ),
                                                            'idTenderoList':
                                                                serializeParam(
                                                              widget
                                                                  .idTenderoList,
                                                              ParamType
                                                                  .DocumentReference,
                                                              isList: true,
                                                            ),
                                                            'telf':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente.telf,
                                                              ParamType.String,
                                                            ),
                                                            'isFiando':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .isFiando,
                                                              ParamType.bool,
                                                            ),
                                                            'apellido':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .apellido,
                                                              ParamType.String,
                                                            ),
                                                            'cedula':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .cedula,
                                                              ParamType.String,
                                                            ),
                                                            'direccionDomicilio':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .direccionDomicilio,
                                                              ParamType.String,
                                                            ),
                                                            'viviendaAlq':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .viviendaAlq,
                                                              ParamType.bool,
                                                            ),
                                                            'vivendaProp':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .viviendaPropia,
                                                              ParamType.bool,
                                                            ),
                                                            'emailCliente':
                                                                serializeParam(
                                                              resumenFiadoClienProdsNewClientesRecord
                                                                  .cliente
                                                                  .emailCliente,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'doc': widget.doc,
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        resumenFiadoClienProdsNewClientesRecord
                                                                    .cliente
                                                                    .historialPorPagarProd
                                                                    .where((e) => e
                                                                        .isVoucherSent)
                                                                    .toList()
                                                                    .length >
                                                                0
                                                            ? Color(0xFFFFBEA1)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Enviar comprobante de pago total',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .asap(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: resumenFiadoClienProdsNewClientesRecord
                                                                            .cliente
                                                                            .historialPorPagarProd
                                                                            .where((e) => e
                                                                                .isVoucherSent)
                                                                            .toList()
                                                                            .length >
                                                                        0
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Lottie.asset(
                                                          'assets/jsons/Main_Scene.json',
                                                          width: 40.0,
                                                          height: 40.0,
                                                          fit: BoxFit.contain,
                                                          animate: true,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                    HistorialVouchersClienteWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'idCliente':
                                                          serializeParam(
                                                        widget.idCliente,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'idTendero':
                                                          serializeParam(
                                                        widget.idTendero,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'historialPorPagarDTList':
                                                          serializeParam(
                                                        widget
                                                            .historialPorPagarDTList,
                                                        ParamType.DataStruct,
                                                        isList: true,
                                                      ),
                                                      'nombreCliente':
                                                          serializeParam(
                                                        widget.nombreCliente,
                                                        ParamType.String,
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
                                                      'idTenderoList':
                                                          serializeParam(
                                                        widget.idTenderoList,
                                                        ParamType
                                                            .DocumentReference,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'doc': widget.doc,
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
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Historial de comprobantes',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
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
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Lottie.asset(
                                                        'assets/jsons/read.json',
                                                        width: 40.0,
                                                        height: 40.0,
                                                        fit: BoxFit.contain,
                                                        animate: true,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.goNamed(
                                                    HistorialPagosClienteWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'idCliente':
                                                          serializeParam(
                                                        widget.idCliente,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'idTendero':
                                                          serializeParam(
                                                        widget.idTendero,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'historialPagosDTList':
                                                          serializeParam(
                                                        widget
                                                            .historialPorPagarDTList,
                                                        ParamType.DataStruct,
                                                        isList: true,
                                                      ),
                                                      'nombreCliente':
                                                          serializeParam(
                                                        widget.nombreCliente,
                                                        ParamType.String,
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
                                                      'idTenderoList':
                                                          serializeParam(
                                                        widget.idTenderoList,
                                                        ParamType
                                                            .DocumentReference,
                                                        isList: true,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'doc': widget.doc,
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
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .success,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Historial de pagos',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .asap(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
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
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Lottie.asset(
                                                        'assets/jsons/coinAnimated.json',
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.contain,
                                                        animate: true,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 5.0))
                                              .addToStart(SizedBox(height: 5.0))
                                              .addToEnd(SizedBox(height: 40.0)),
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
                    ],
                  ),
                )
                    .animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!)
                    .animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation']!,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
