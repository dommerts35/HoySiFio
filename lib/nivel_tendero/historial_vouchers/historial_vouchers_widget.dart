import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/components/dialog_two_btns_widget.dart';
import '/components_nivel_tendero/empty_voucher_comp/empty_voucher_comp_widget.dart';
import '/components_nivel_tendero/razon_negado_c/razon_negado_c_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'historial_vouchers_model.dart';
export 'historial_vouchers_model.dart';

class HistorialVouchersWidget extends StatefulWidget {
  const HistorialVouchersWidget({
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

  static String routeName = 'historialVouchers';
  static String routePath = '/historialVouchers';

  @override
  State<HistorialVouchersWidget> createState() =>
      _HistorialVouchersWidgetState();
}

class _HistorialVouchersWidgetState extends State<HistorialVouchersWidget>
    with TickerProviderStateMixin {
  late HistorialVouchersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistorialVouchersModel());

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
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
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
            delay: 1500.0.ms,
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
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 2.0,
                child: Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 12.0,
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
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                        ).animateOnPageLoad(
                            animationsMap['iconButtonOnPageLoadAnimation1']!),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 5.0),
                            child: Text(
                              'Historial de \ncomprobantes',
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) => FlutterFlowIconButton(
                            borderRadius: 12.0,
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
                                  context.mounted,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 1000),
                                    ),
                                  },
                                );
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
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: StreamBuilder<ClientesRecord>(
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
                                          final listaVouchers =
                                              mainHistorialViewClientesRecord
                                                  .cliente.dataTypeVouchers
                                                  .map((e) => e)
                                                  .toList();
                                          if (listaVouchers.isEmpty) {
                                            return Center(
                                              child: EmptyVoucherCompWidget(),
                                            );
                                          }

                                          return ListView.separated(
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              12.0,
                                              0,
                                              44.0,
                                            ),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listaVouchers.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 12.0),
                                            itemBuilder:
                                                (context, listaVouchersIndex) {
                                              final listaVouchersItem =
                                                  listaVouchers[
                                                      listaVouchersIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      maxWidth: 570.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        listaVouchersItem
                                                                    .estadoVoucher ==
                                                                'Negado'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      ),
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
                                                        color: valueOrDefault<
                                                            Color>(
                                                          listaVouchersItem
                                                                      .estadoVoucher ==
                                                                  'Negado'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                        ),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        if (listaVouchersItem
                                                                .estadoVoucher ==
                                                            'Negado')
                                                          Text(
                                                            'Comprobante Negado',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Opacity(
                                                                opacity: listaVouchersItem
                                                                            .estadoVoucher ==
                                                                        'Negado'
                                                                    ? 0.5
                                                                    : 1.0,
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
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              Image.network(
                                                                            listaVouchersItem.imgVoucher,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag: listaVouchersItem
                                                                              .imgVoucher,
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag: listaVouchersItem
                                                                        .imgVoucher,
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        listaVouchersItem
                                                                            .imgVoucher,
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            200.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Lottie.asset(
                                                                'assets/jsons/actualHoySiFioLoad.json',
                                                                width: 200.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                                animate: true,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if ((listaVouchersItem
                                                                    .estadoVoucher ==
                                                                'Pendiente') &&
                                                            (listaVouchersItem
                                                                    .historialPagoParaEliminar !=
                                                                null))
                                                          Text(
                                                            'Total a cobrar de esta cuenta: \$${listaVouchersItem.isFullPago == false ? formatNumber(
                                                                listaVouchersItem
                                                                    .historialPagoParaEliminar
                                                                    .totalPorPagar,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#0.00',
                                                                locale: '',
                                                              ) : formatNumber(
                                                                mainHistorialViewClientesRecord
                                                                    .cliente
                                                                    .totalDeudaCompleta,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#0.00',
                                                                locale: '',
                                                              )}',
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
                                                        if ((listaVouchersItem
                                                                    .estadoVoucher ==
                                                                'Pendiente') &&
                                                            (listaVouchersItem
                                                                    .historialPagoParaEliminar !=
                                                                null))
                                                          Text(
                                                            'Total de pago enviado: \$${listaVouchersItem.historialPagoParaEliminar != null ? formatNumber(
                                                                listaVouchersItem
                                                                    .montoAPagar,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#0.00',
                                                                locale: '',
                                                              ) : formatNumber(
                                                                mainHistorialViewClientesRecord
                                                                    .cliente
                                                                    .totalDeudaCompleta,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#0.00',
                                                                locale: '',
                                                              )}',
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
                                                        Text(
                                                          'Tipo de comprobante: ${listaVouchersItem.tipoVoucher}',
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
                                                                color: listaVouchersItem
                                                                            .estadoVoucher ==
                                                                        'Negado'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground
                                                                    : FlutterFlowTheme.of(
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
                                                        Text(
                                                          'Num. comprobante: ${listaVouchersItem.numVoucher.toString()}',
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
                                                                color: listaVouchersItem
                                                                            .estadoVoucher ==
                                                                        'Negado'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground
                                                                    : FlutterFlowTheme.of(
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
                                                        Text(
                                                          'Estado: ${listaVouchersItem.estadoVoucher}',
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
                                                                color: listaVouchersItem
                                                                            .estadoVoucher ==
                                                                        'Negado'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground
                                                                    : FlutterFlowTheme.of(
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
                                                        if (listaVouchersItem
                                                                .estadoVoucher ==
                                                            'Negado')
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          40.0,
                                                                          5.0,
                                                                          40.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Razón de negación: ${listaVouchersItem.razonDenegado}',
                                                                minFontSize:
                                                                    4.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
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
                                                            ),
                                                          ),
                                                        if (listaVouchersItem
                                                                .estadoVoucher ==
                                                            'Pendiente')
                                                          wrapWithModel(
                                                            model: _model
                                                                .razonNegadoCModels
                                                                .getModel(
                                                              listaVouchersItem
                                                                  .idTransaccion,
                                                              listaVouchersIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                RazonNegadoCWidget(
                                                              key: Key(
                                                                'Keyf1p_${listaVouchersItem.idTransaccion}',
                                                              ),
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
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              if (listaVouchersItem
                                                                      .estadoVoucher ==
                                                                  'Pendiente')
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -0.02),
                                                                  child:
                                                                      Builder(
                                                                    builder: (context) =>
                                                                        FlutterFlowIconButton(
                                                                      borderRadius:
                                                                          12.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          50.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .do_not_disturb_on,
                                                                        color: Color(
                                                                            0xFFE75353),
                                                                        size:
                                                                            38.0,
                                                                      ),
                                                                      onPressed: (listaVouchersItem.estadoVoucher ==
                                                                              'Negado')
                                                                          ? null
                                                                          : () async {
                                                                              var _shouldSetState = false;
                                                                              final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                              try {
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
                                                                                          child: DialogTwoBtnsWidget(
                                                                                            titulo: '¿Denegar pago?',
                                                                                            mensaje: 'El cliente será notificado de esta acción.',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() => _model.isDeny = value));

                                                                                _shouldSetState = true;
                                                                                if (_model.isDeny!) {
                                                                                  if (_model.razonNegadoCModels.getValueAtIndex(
                                                                                            listaVouchersIndex,
                                                                                            (m) => m.razonNegadoTextController.text,
                                                                                          ) ==
                                                                                          null ||
                                                                                      _model.razonNegadoCModels.getValueAtIndex(
                                                                                            listaVouchersIndex,
                                                                                            (m) => m.razonNegadoTextController.text,
                                                                                          ) ==
                                                                                          '') {
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
                                                                                                mensaje: 'Ingrese la razón de la negación.',
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );

                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                  _model.voucherDT = listaVouchersItem;
                                                                                  _model.voucherHPDT = listaVouchersItem.historialPagoParaEliminar;
                                                                                  safeSetState(() {});
                                                                                  if ((_model.voucherHPDT?.productos != null && (_model.voucherHPDT?.productos)!.isNotEmpty) == false) {
                                                                                    firestoreBatch.update(
                                                                                        widget.idCliente!,
                                                                                        createClientesRecordData(
                                                                                          cliente: createDataTypeClienteStruct(
                                                                                            fieldValues: {
                                                                                              'DataTypeVouchers': FieldValue.arrayRemove([
                                                                                                getDataTypeVouchersFirestoreData(
                                                                                                  updateDataTypeVouchersStruct(
                                                                                                    _model.voucherDT,
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                  true,
                                                                                                )
                                                                                              ]),
                                                                                              'historialPorPagarProd': FieldValue.arrayRemove([
                                                                                                getDataTypeHistorialPagoFirestoreData(
                                                                                                  updateDataTypeHistorialPagoStruct(
                                                                                                    _model.voucherHPDT,
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                  true,
                                                                                                )
                                                                                              ]),
                                                                                            },
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                    _model.updateVoucherDTStruct(
                                                                                      (e) => e
                                                                                        ..estadoVoucher = 'Negado'
                                                                                        ..historialPagoParaEliminar = null
                                                                                        ..razonDenegado = _model.razonNegadoCModels.getValueAtIndex(
                                                                                          listaVouchersIndex,
                                                                                          (m) => m.razonNegadoTextController.text,
                                                                                        ),
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                    for (int loop1Index = 0; loop1Index < mainHistorialViewClientesRecord.cliente.historialPorPagarProd.length; loop1Index++) {
                                                                                      final currentLoop1Item = mainHistorialViewClientesRecord.cliente.historialPorPagarProd[loop1Index];
                                                                                      _model.addToTempHistorialList(currentLoop1Item);
                                                                                      safeSetState(() {});
                                                                                      _model.updateTempHistorialListAtIndex(
                                                                                        loop1Index,
                                                                                        (e) => e..isVoucherSent = false,
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                    }

                                                                                    firestoreBatch.update(
                                                                                        widget.idCliente!,
                                                                                        createClientesRecordData(
                                                                                          cliente: createDataTypeClienteStruct(
                                                                                            fieldValues: {
                                                                                              'historialPorPagarProd': getDataTypeHistorialPagoListFirestoreData(
                                                                                                _model.tempHistorialList,
                                                                                              ),
                                                                                              'DataTypeVouchers': FieldValue.arrayUnion([
                                                                                                getDataTypeVouchersFirestoreData(
                                                                                                  updateDataTypeVouchersStruct(
                                                                                                    _model.voucherDT,
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                  true,
                                                                                                )
                                                                                              ]),
                                                                                            },
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                  } else {
                                                                                    firestoreBatch.update(
                                                                                        widget.idCliente!,
                                                                                        createClientesRecordData(
                                                                                          cliente: createDataTypeClienteStruct(
                                                                                            fieldValues: {
                                                                                              'DataTypeVouchers': FieldValue.arrayRemove([
                                                                                                getDataTypeVouchersFirestoreData(
                                                                                                  updateDataTypeVouchersStruct(
                                                                                                    _model.voucherDT,
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                  true,
                                                                                                )
                                                                                              ]),
                                                                                              'historialPorPagarProd': FieldValue.arrayRemove([
                                                                                                getDataTypeHistorialPagoFirestoreData(
                                                                                                  updateDataTypeHistorialPagoStruct(
                                                                                                    _model.voucherHPDT,
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                  true,
                                                                                                )
                                                                                              ]),
                                                                                            },
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                    _model.updateVoucherDTStruct(
                                                                                      (e) => e
                                                                                        ..estadoVoucher = 'Negado'
                                                                                        ..historialPagoParaEliminar = null
                                                                                        ..razonDenegado = _model.razonNegadoCModels.getValueAtIndex(
                                                                                          listaVouchersIndex,
                                                                                          (m) => m.razonNegadoTextController.text,
                                                                                        ),
                                                                                    );
                                                                                    _model.updateVoucherHPDTStruct(
                                                                                      (e) => e..isVoucherSent = false,
                                                                                    );
                                                                                    safeSetState(() {});

                                                                                    firestoreBatch.update(
                                                                                        widget.idCliente!,
                                                                                        createClientesRecordData(
                                                                                          cliente: createDataTypeClienteStruct(
                                                                                            fieldValues: {
                                                                                              'DataTypeVouchers': FieldValue.arrayUnion([
                                                                                                getDataTypeVouchersFirestoreData(
                                                                                                  updateDataTypeVouchersStruct(
                                                                                                    _model.voucherDT,
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                  true,
                                                                                                )
                                                                                              ]),
                                                                                              'historialPorPagarProd': FieldValue.arrayUnion([
                                                                                                getDataTypeHistorialPagoFirestoreData(
                                                                                                  createDataTypeHistorialPagoStruct(
                                                                                                    totalPagado: _model.voucherHPDT?.totalPagado,
                                                                                                    totalPorPagar: _model.voucherHPDT?.totalPorPagar,
                                                                                                    transferencia: _model.voucherHPDT?.transferencia,
                                                                                                    efectivo: _model.voucherHPDT?.efectivo,
                                                                                                    totalGeneral: _model.voucherHPDT?.totalGeneral,
                                                                                                    idTransaccion: _model.voucherHPDT?.idTransaccion,
                                                                                                    fechaDeFio: _model.voucherHPDT?.fechaDeFio,
                                                                                                    numVoucher: _model.voucherHPDT?.numVoucher,
                                                                                                    isVoucherSent: false,
                                                                                                    fechaDeCobro: _model.voucherHPDT?.fechaDeCobro,
                                                                                                    fieldValues: {
                                                                                                      'productos': getDataTypeProductosListFirestoreData(
                                                                                                        _model.voucherHPDT?.productos,
                                                                                                      ),
                                                                                                    },
                                                                                                    clearUnsetFields: false,
                                                                                                  ),
                                                                                                  true,
                                                                                                )
                                                                                              ]),
                                                                                            },
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                        ));
                                                                                  }

                                                                                  _model.readForTenderoDenyPush = await TenderosRecord.getDocumentOnce(widget.idTendero!);
                                                                                  _shouldSetState = true;
                                                                                  for (int loop2Index = 0; loop2Index < mainHistorialViewClientesRecord.playerIds.length; loop2Index++) {
                                                                                    final currentLoop2Item = mainHistorialViewClientesRecord.playerIds[loop2Index];
                                                                                    await actions.sendNotificationToPlayer(
                                                                                      currentLoop2Item,
                                                                                      '${widget.nombre}: Ha sido denegado un comprobante enviado a la tienda: \"${_model.readForTenderoDenyPush?.displayName}\" debido a: \"${_model.razonNegadoCModels.getValueAtIndex(
                                                                                        listaVouchersIndex,
                                                                                        (m) => m.razonNegadoTextController.text,
                                                                                      )}\". Revise su historial de comprobantes.',
                                                                                    );
                                                                                  }
                                                                                  unawaited(
                                                                                    () async {
                                                                                      await actions.sendCustomEmailForDeniedVoucher(
                                                                                        widget.emailCliente!,
                                                                                        widget.nombre!,
                                                                                        'Comprobante negado: El comprobante enviado a la tienda: ${_model.readForTenderoDenyPush?.displayName} ha sido negado.',
                                                                                        _model.readForTenderoDenyPush!.displayName,
                                                                                        _model.razonNegadoCModels.getValueAtIndex(
                                                                                          listaVouchersIndex,
                                                                                          (m) => m.razonNegadoTextController.text,
                                                                                        )!,
                                                                                        _model.voucherDT!.numVoucher.toString(),
                                                                                        formatNumber(
                                                                                          _model.voucherDT!.montoAPagar,
                                                                                          formatType: FormatType.custom,
                                                                                          format: '#0.00',
                                                                                          locale: '',
                                                                                        ),
                                                                                      );
                                                                                    }(),
                                                                                  );
                                                                                } else {
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                }
                                                                              } finally {
                                                                                await firestoreBatch.commit();
                                                                              }

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['iconButtonOnPageLoadAnimation2']!),
                                                                  ),
                                                                ),
                                                              if (listaVouchersItem
                                                                      .estadoVoucher ==
                                                                  'Pendiente')
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -0.02),
                                                                  child:
                                                                      Builder(
                                                                    builder: (context) =>
                                                                        FlutterFlowIconButton(
                                                                      borderRadius:
                                                                          12.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          60.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .paid_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        size:
                                                                            40.0,
                                                                      ),
                                                                      onPressed: (listaVouchersItem.estadoVoucher ==
                                                                              'Negado')
                                                                          ? null
                                                                          : () async {
                                                                              var _shouldSetState = false;
                                                                              _model.readClienteToNormalize = await ClientesRecord.getDocumentOnce(widget.idCliente!);
                                                                              _shouldSetState = true;
                                                                              _model.totalDeudaRCompletaReal = await actions.normalizarValorParaAceptacionDePago(
                                                                                formatNumber(
                                                                                  _model.readClienteToNormalize!.cliente.totalDeudaCompleta,
                                                                                  formatType: FormatType.custom,
                                                                                  format: '#0.00',
                                                                                  locale: '',
                                                                                ),
                                                                              );
                                                                              _shouldSetState = true;

                                                                              await widget.idCliente!.update(createClientesRecordData(
                                                                                cliente: createDataTypeClienteStruct(
                                                                                  totalDeudaCompleta: _model.totalDeudaRCompletaReal,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                              _model.totalPorPagarNormalized = await actions.normalizarValorParaAceptacionDePago(
                                                                                formatNumber(
                                                                                  listaVouchersItem.historialPagoParaEliminar.totalPorPagar,
                                                                                  formatType: FormatType.custom,
                                                                                  format: '#0.00',
                                                                                  locale: '',
                                                                                ),
                                                                              );
                                                                              _shouldSetState = true;
                                                                              _model.totalPorPagarRE = await actions.normalizarValorParaAceptacionDePago(
                                                                                formatNumber(
                                                                                  _model.totalPorPagarNormalized,
                                                                                  formatType: FormatType.custom,
                                                                                  format: '#0.00',
                                                                                  locale: '',
                                                                                ),
                                                                              );
                                                                              _shouldSetState = true;
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
                                                                                        height: 300.0,
                                                                                        child: DialogTwoBtnsWidget(
                                                                                          titulo: '¿Confirmar pago?',
                                                                                          mensaje: '¿Está seguro de confirmar el pago de este comprobante?',
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() => _model.isConfirmar = value));

                                                                              _shouldSetState = true;
                                                                              if (_model.isConfirmar!) {
                                                                                _model.dtHistorialPagoNew = DataTypeHistorialPagoStruct(
                                                                                  productos: listaVouchersItem.historialPagoParaEliminar.productos,
                                                                                  totalPagado: listaVouchersItem.historialPagoParaEliminar.totalPagado,
                                                                                  totalPorPagar: _model.totalPorPagarRE,
                                                                                  transferencia: listaVouchersItem.historialPagoParaEliminar.transferencia,
                                                                                  efectivo: listaVouchersItem.historialPagoParaEliminar.transferencia,
                                                                                  totalGeneral: listaVouchersItem.historialPagoParaEliminar.totalGeneral,
                                                                                  idTransaccion: listaVouchersItem.historialPagoParaEliminar.idTransaccion,
                                                                                  fechaDeFio: listaVouchersItem.historialPagoParaEliminar.fechaDeFio,
                                                                                  numVoucher: listaVouchersItem.numVoucher,
                                                                                  isVoucherSent: listaVouchersItem.historialPagoParaEliminar.isVoucherSent,
                                                                                  fechaDeCobro: listaVouchersItem.historialPagoParaEliminar.fechaDeCobro,
                                                                                );
                                                                                _model.dtHistorialPagoOld = DataTypeHistorialPagoStruct(
                                                                                  productos: listaVouchersItem.historialPagoParaEliminar.productos,
                                                                                  totalPagado: listaVouchersItem.historialPagoParaEliminar.totalPagado,
                                                                                  totalPorPagar: listaVouchersItem.historialPagoParaEliminar.totalPorPagar,
                                                                                  transferencia: listaVouchersItem.historialPagoParaEliminar.transferencia,
                                                                                  efectivo: listaVouchersItem.historialPagoParaEliminar.transferencia,
                                                                                  totalGeneral: listaVouchersItem.historialPagoParaEliminar.totalGeneral,
                                                                                  idTransaccion: listaVouchersItem.historialPagoParaEliminar.idTransaccion,
                                                                                  fechaDeFio: listaVouchersItem.historialPagoParaEliminar.fechaDeFio,
                                                                                  numVoucher: 0,
                                                                                  isVoucherSent: false,
                                                                                  fechaDeCobro: listaVouchersItem.historialPagoParaEliminar.fechaDeCobro,
                                                                                );
                                                                                safeSetState(() {});
                                                                                _model.tempHistorialList = mainHistorialViewClientesRecord.cliente.historialPorPagarProd.toList().cast<DataTypeHistorialPagoStruct>();
                                                                                safeSetState(() {});
                                                                                if (listaVouchersItem.isFullPago == true) {
                                                                                  await widget.idCliente!.update(createClientesRecordData(
                                                                                    cliente: createDataTypeClienteStruct(
                                                                                      fieldValues: {
                                                                                        'historialPorPagarProd': FieldValue.delete(),
                                                                                      },
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
                                                                                  for (int loop1Index = 0; loop1Index < _model.tempHistorialList.length; loop1Index++) {
                                                                                    final currentLoop1Item = _model.tempHistorialList[loop1Index];
                                                                                    _model.updateTempHistorialListAtIndex(
                                                                                      loop1Index,
                                                                                      (e) => e
                                                                                        ..totalPorPagar = 0.0
                                                                                        ..totalPagado = currentLoop1Item.totalGeneral
                                                                                        ..transferencia = true
                                                                                        ..efectivo = false
                                                                                        ..isVoucherSent = false
                                                                                        ..fechaDeCobro = getCurrentTimestamp,
                                                                                    );
                                                                                    safeSetState(() {});

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
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
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                  }

                                                                                  await widget.idCliente!.update(createClientesRecordData(
                                                                                    cliente: createDataTypeClienteStruct(
                                                                                      totalDeudaCompleta: 0.0,
                                                                                      isFiando: false,
                                                                                      fieldValues: {
                                                                                        'DataTypeVouchers': FieldValue.arrayRemove([
                                                                                          getDataTypeVouchersFirestoreData(
                                                                                            updateDataTypeVouchersStruct(
                                                                                              listaVouchersItem,
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                            true,
                                                                                          )
                                                                                        ]),
                                                                                      },
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
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
                                                                                              titulo: '¡Pago completo confirmado!',
                                                                                              mensaje: 'Se ha registrado el pago exitosamente.',
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  if (listaVouchersItem.montoAPagar == listaVouchersItem.historialPagoParaEliminar.totalPorPagar) {
                                                                                    _model.removeFromTempHistorialList(_model.dtHistorialPagoOld!);
                                                                                    safeSetState(() {});
                                                                                    _model.updateDtHistorialPagoNewStruct(
                                                                                      (e) => e
                                                                                        ..totalPorPagar = 0.0
                                                                                        ..isVoucherSent = false
                                                                                        ..transferencia = true
                                                                                        ..efectivo = false
                                                                                        ..fechaDeCobro = getCurrentTimestamp,
                                                                                    );
                                                                                    safeSetState(() {});

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        fieldValues: {
                                                                                          'historialPagadosProd': FieldValue.arrayUnion([
                                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                                              updateDataTypeHistorialPagoStruct(
                                                                                                _model.dtHistorialPagoNew,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        fieldValues: {
                                                                                          'historialPorPagarProd': getDataTypeHistorialPagoListFirestoreData(
                                                                                            _model.tempHistorialList,
                                                                                          ),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        fieldValues: {
                                                                                          'historialPorPagarProd': FieldValue.arrayRemove([
                                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                                              updateDataTypeHistorialPagoStruct(
                                                                                                _model.dtHistorialPagoOld,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        fieldValues: {
                                                                                          'historialPorPagarProd': FieldValue.arrayRemove([
                                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                                              createDataTypeHistorialPagoStruct(
                                                                                                totalPagado: listaVouchersItem.historialPagoParaEliminar.totalPagado,
                                                                                                totalPorPagar: listaVouchersItem.historialPagoParaEliminar.totalPorPagar,
                                                                                                transferencia: listaVouchersItem.historialPagoParaEliminar.transferencia,
                                                                                                efectivo: listaVouchersItem.historialPagoParaEliminar.efectivo,
                                                                                                totalGeneral: listaVouchersItem.historialPagoParaEliminar.totalGeneral,
                                                                                                idTransaccion: listaVouchersItem.historialPagoParaEliminar.idTransaccion,
                                                                                                fechaDeFio: listaVouchersItem.historialPagoParaEliminar.fechaDeFio,
                                                                                                numVoucher: null,
                                                                                                isVoucherSent: false,
                                                                                                fechaDeCobro: listaVouchersItem.historialPagoParaEliminar.fechaDeCobro,
                                                                                                fieldValues: {
                                                                                                  'productos': getDataTypeProductosListFirestoreData(
                                                                                                    listaVouchersItem.historialPagoParaEliminar.productos,
                                                                                                  ),
                                                                                                },
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        fieldValues: {
                                                                                          'historialPorPagarProd': FieldValue.arrayRemove([
                                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                                              createDataTypeHistorialPagoStruct(
                                                                                                totalPagado: listaVouchersItem.historialPagoParaEliminar.totalPagado,
                                                                                                totalPorPagar: listaVouchersItem.historialPagoParaEliminar.totalPorPagar,
                                                                                                transferencia: listaVouchersItem.historialPagoParaEliminar.transferencia,
                                                                                                efectivo: listaVouchersItem.historialPagoParaEliminar.efectivo,
                                                                                                totalGeneral: listaVouchersItem.historialPagoParaEliminar.totalGeneral,
                                                                                                idTransaccion: listaVouchersItem.historialPagoParaEliminar.idTransaccion,
                                                                                                fechaDeFio: listaVouchersItem.historialPagoParaEliminar.fechaDeFio,
                                                                                                numVoucher: null,
                                                                                                isVoucherSent: true,
                                                                                                fechaDeCobro: listaVouchersItem.historialPagoParaEliminar.fechaDeCobro,
                                                                                                fieldValues: {
                                                                                                  'productos': getDataTypeProductosListFirestoreData(
                                                                                                    listaVouchersItem.historialPagoParaEliminar.productos,
                                                                                                  ),
                                                                                                },
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        fieldValues: {
                                                                                          'historialPorPagarProd': FieldValue.arrayRemove([
                                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                                              createDataTypeHistorialPagoStruct(
                                                                                                totalPagado: listaVouchersItem.historialPagoParaEliminar.totalPagado,
                                                                                                totalPorPagar: listaVouchersItem.historialPagoParaEliminar.totalPorPagar,
                                                                                                transferencia: listaVouchersItem.historialPagoParaEliminar.transferencia,
                                                                                                efectivo: listaVouchersItem.historialPagoParaEliminar.efectivo,
                                                                                                totalGeneral: listaVouchersItem.historialPagoParaEliminar.totalGeneral,
                                                                                                idTransaccion: listaVouchersItem.historialPagoParaEliminar.idTransaccion,
                                                                                                fechaDeFio: listaVouchersItem.historialPagoParaEliminar.fechaDeFio,
                                                                                                numVoucher: 0,
                                                                                                isVoucherSent: true,
                                                                                                fechaDeCobro: listaVouchersItem.historialPagoParaEliminar.fechaDeCobro,
                                                                                                fieldValues: {
                                                                                                  'productos': getDataTypeProductosListFirestoreData(
                                                                                                    listaVouchersItem.historialPagoParaEliminar.productos,
                                                                                                  ),
                                                                                                },
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        fieldValues: {
                                                                                          'historialPorPagarProd': FieldValue.arrayRemove([
                                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                                              createDataTypeHistorialPagoStruct(
                                                                                                totalPagado: listaVouchersItem.historialPagoParaEliminar.totalPagado,
                                                                                                totalPorPagar: listaVouchersItem.historialPagoParaEliminar.totalPorPagar,
                                                                                                transferencia: listaVouchersItem.historialPagoParaEliminar.transferencia,
                                                                                                efectivo: listaVouchersItem.historialPagoParaEliminar.efectivo,
                                                                                                totalGeneral: listaVouchersItem.historialPagoParaEliminar.totalGeneral,
                                                                                                idTransaccion: listaVouchersItem.historialPagoParaEliminar.idTransaccion,
                                                                                                fechaDeFio: listaVouchersItem.historialPagoParaEliminar.fechaDeFio,
                                                                                                numVoucher: 0,
                                                                                                isVoucherSent: false,
                                                                                                fechaDeCobro: listaVouchersItem.historialPagoParaEliminar.fechaDeCobro,
                                                                                                fieldValues: {
                                                                                                  'productos': getDataTypeProductosListFirestoreData(
                                                                                                    listaVouchersItem.historialPagoParaEliminar.productos,
                                                                                                  ),
                                                                                                },
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                    _model.tDCNormV = await actions.normalizarValorNumerico(
                                                                                      formatNumber(
                                                                                        mainHistorialViewClientesRecord.cliente.totalDeudaCompleta,
                                                                                        formatType: FormatType.custom,
                                                                                        format: '#0.00',
                                                                                        locale: '',
                                                                                      ),
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.tDCNormV2 = await actions.normalizarValorNumerico(
                                                                                      formatNumber(
                                                                                        _model.tDCNormV,
                                                                                        formatType: FormatType.custom,
                                                                                        format: '#0.00',
                                                                                        locale: '',
                                                                                      ),
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.calculoNormalized = await actions.normalizarValorNumerico(
                                                                                      ((_model.tDCNormV2!) - listaVouchersItem.montoAPagar).toString(),
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        totalDeudaCompleta: _model.calculoNormalized,
                                                                                        fieldValues: {
                                                                                          'DataTypeVouchers': FieldValue.arrayRemove([
                                                                                            getDataTypeVouchersFirestoreData(
                                                                                              updateDataTypeVouchersStruct(
                                                                                                listaVouchersItem,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
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
                                                                                                titulo: '¡Pago completo confirmado!',
                                                                                                mensaje: 'Se ha registrado el pago exitosamente.',
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    _model.removeFromTempHistorialList(_model.dtHistorialPagoOld!);
                                                                                    safeSetState(() {});
                                                                                    _model.updateDtHistorialPagoOldStruct(
                                                                                      (e) => e..isVoucherSent = true,
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                    _model.removeFromTempHistorialList(_model.dtHistorialPagoOld!);
                                                                                    safeSetState(() {});
                                                                                    _model.montoAPagarNormalized = await actions.normalizarValorParaAceptacionDePago(
                                                                                      formatNumber(
                                                                                        -listaVouchersItem.montoAPagar,
                                                                                        formatType: FormatType.custom,
                                                                                        format: '#0.00',
                                                                                        locale: '',
                                                                                      ),
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.montoAPagarReal = await actions.normalizarValorParaAceptacionDePago(
                                                                                      ((_model.totalPorPagarRE!) - listaVouchersItem.montoAPagar).toString(),
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.resultadoProcesado = await actions.normalizarValorParaAceptacionDePago(
                                                                                      formatNumber(
                                                                                        _model.montoAPagarReal,
                                                                                        formatType: FormatType.custom,
                                                                                        format: '#0.00',
                                                                                        locale: '',
                                                                                      ),
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    _model.updateDtHistorialPagoNewStruct(
                                                                                      (e) => e
                                                                                        ..incrementTotalPagado(listaVouchersItem.montoAPagar)
                                                                                        ..totalPorPagar = _model.resultadoProcesado
                                                                                        ..fechaDeCobro = getCurrentTimestamp
                                                                                        ..transferencia = true
                                                                                        ..efectivo = false
                                                                                        ..isVoucherSent = false,
                                                                                    );
                                                                                    safeSetState(() {});

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        fieldValues: {
                                                                                          'historialPagadosProd': FieldValue.arrayUnion([
                                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                                              updateDataTypeHistorialPagoStruct(
                                                                                                _model.dtHistorialPagoNew,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                    _model.updateDtHistorialPagoNewStruct(
                                                                                      (e) => e..numVoucher = 0,
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                    _model.addToTempHistorialList(_model.dtHistorialPagoNew!);
                                                                                    safeSetState(() {});
                                                                                    _model.tDCNormVF = await actions.normalizarValorNumerico(
                                                                                      formatNumber(
                                                                                        mainHistorialViewClientesRecord.cliente.totalDeudaCompleta,
                                                                                        formatType: FormatType.custom,
                                                                                        format: '#0.00',
                                                                                        locale: '',
                                                                                      ),
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        fieldValues: {
                                                                                          'historialPorPagarProd': FieldValue.arrayRemove([
                                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                                              createDataTypeHistorialPagoStruct(
                                                                                                totalPagado: listaVouchersItem.historialPagoParaEliminar.totalPagado,
                                                                                                totalPorPagar: listaVouchersItem.historialPagoParaEliminar.totalPorPagar,
                                                                                                transferencia: listaVouchersItem.historialPagoParaEliminar.transferencia,
                                                                                                efectivo: listaVouchersItem.historialPagoParaEliminar.efectivo,
                                                                                                totalGeneral: listaVouchersItem.historialPagoParaEliminar.totalGeneral,
                                                                                                idTransaccion: listaVouchersItem.historialPagoParaEliminar.idTransaccion,
                                                                                                fechaDeFio: listaVouchersItem.historialPagoParaEliminar.fechaDeFio,
                                                                                                numVoucher: 0,
                                                                                                isVoucherSent: true,
                                                                                                fechaDeCobro: listaVouchersItem.historialPagoParaEliminar.fechaDeCobro,
                                                                                                fieldValues: {
                                                                                                  'productos': getDataTypeProductosListFirestoreData(
                                                                                                    listaVouchersItem.historialPagoParaEliminar.productos,
                                                                                                  ),
                                                                                                },
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        fieldValues: {
                                                                                          'historialPorPagarProd': FieldValue.arrayRemove([
                                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                                              updateDataTypeHistorialPagoStruct(
                                                                                                _model.dtHistorialPagoOld,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        fieldValues: {
                                                                                          'historialPorPagarProd': FieldValue.arrayUnion([
                                                                                            getDataTypeHistorialPagoFirestoreData(
                                                                                              updateDataTypeHistorialPagoStruct(
                                                                                                _model.dtHistorialPagoNew,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                    _model.tDCNormVF2 = await actions.normalizarValorNumerico(
                                                                                      formatNumber(
                                                                                        _model.tDCNormVF,
                                                                                        formatType: FormatType.custom,
                                                                                        format: '#0.00',
                                                                                        locale: '',
                                                                                      ),
                                                                                    );
                                                                                    _shouldSetState = true;

                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        totalDeudaCompleta: (_model.tDCNormVF2!) - listaVouchersItem.montoAPagar,
                                                                                        fieldValues: {
                                                                                          'DataTypeVouchers': FieldValue.arrayRemove([
                                                                                            getDataTypeVouchersFirestoreData(
                                                                                              updateDataTypeVouchersStruct(
                                                                                                listaVouchersItem,
                                                                                                clearUnsetFields: false,
                                                                                              ),
                                                                                              true,
                                                                                            )
                                                                                          ]),
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
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
                                                                                                titulo: '¡Pago confirmado!',
                                                                                                mensaje: 'Aún falta por pagar: \$${formatNumber(
                                                                                                  _model.dtHistorialPagoNew?.totalPorPagar,
                                                                                                  formatType: FormatType.custom,
                                                                                                  format: '#0.00',
                                                                                                  locale: '',
                                                                                                )} de esta cuenta.',
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  }

                                                                                  if (mainHistorialViewClientesRecord.cliente.historialPorPagarProd.length <= 0) {
                                                                                    await widget.idCliente!.update(createClientesRecordData(
                                                                                      cliente: createDataTypeClienteStruct(
                                                                                        isFiando: false,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                  }
                                                                                }

                                                                                _model.readForTenderoAcceptPush = await TenderosRecord.getDocumentOnce(widget.idTendero!);
                                                                                _shouldSetState = true;
                                                                                for (int loop1Index = 0; loop1Index < mainHistorialViewClientesRecord.playerIds.length; loop1Index++) {
                                                                                  final currentLoop1Item = mainHistorialViewClientesRecord.playerIds[loop1Index];
                                                                                  unawaited(
                                                                                    () async {
                                                                                      await actions.sendNotificationToPlayer(
                                                                                        currentLoop1Item,
                                                                                        '${widget.nombre}: ¡Ha sido aceptado un comprobante enviado a la tienda: \"${_model.readForTenderoAcceptPush?.displayName}\". Revise su historial de comprobantes!',
                                                                                      );
                                                                                    }(),
                                                                                  );
                                                                                }
                                                                                unawaited(
                                                                                  () async {
                                                                                    await actions.sendCustomEmailForAcceptedVoucher(
                                                                                      mainHistorialViewClientesRecord.cliente.emailCliente,
                                                                                      widget.nombre!,
                                                                                      'Comprobante aceptado por la tienda: ${_model.readForTenderoAcceptPush?.displayName}',
                                                                                      _model.readForTenderoAcceptPush!.displayName,
                                                                                      _model.dtHistorialPagoNew!.numVoucher.toString(),
                                                                                      formatNumber(
                                                                                        _model.dtHistorialPagoNew!.totalPagado,
                                                                                        formatType: FormatType.custom,
                                                                                        format: '#0.00',
                                                                                        locale: '',
                                                                                      ),
                                                                                    );
                                                                                  }(),
                                                                                );
                                                                              } else {
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['iconButtonOnPageLoadAnimation3']!),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 10.0))
                                                          .addToStart(SizedBox(
                                                              height: 15.0))
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
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).animateOnActionTrigger(
            animationsMap['columnOnActionTriggerAnimation']!,
          ),
        ),
      ),
    );
  }
}
