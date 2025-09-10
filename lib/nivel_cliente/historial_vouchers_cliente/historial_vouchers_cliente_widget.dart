import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/components/dialog_two_btns_widget.dart';
import '/components_nivel_tendero/empty_voucher_comp/empty_voucher_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
import 'historial_vouchers_cliente_model.dart';
export 'historial_vouchers_cliente_model.dart';

class HistorialVouchersClienteWidget extends StatefulWidget {
  const HistorialVouchersClienteWidget({
    super.key,
    this.idCliente,
    this.idTendero,
    this.historialPorPagarDTList,
    this.nombreCliente,
    this.doc,
    this.cedula,
    this.idTenderoList,
  });

  final DocumentReference? idCliente;
  final DocumentReference? idTendero;
  final List<DataTypeHistorialPagoStruct>? historialPorPagarDTList;
  final String? nombreCliente;
  final List<ClientesRecord>? doc;
  final String? cedula;
  final List<DocumentReference>? idTenderoList;

  static String routeName = 'historialVouchersCliente';
  static String routePath = '/historialVouchersCliente';

  @override
  State<HistorialVouchersClienteWidget> createState() =>
      _HistorialVouchersClienteWidgetState();
}

class _HistorialVouchersClienteWidgetState
    extends State<HistorialVouchersClienteWidget>
    with TickerProviderStateMixin {
  late HistorialVouchersClienteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistorialVouchersClienteModel());

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
      'textOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
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
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: PopScope(
          canPop: false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 12.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.goNamed(
                                        ResumenFiadoClienProdsNewWidget
                                            .routeName,
                                        queryParameters: {
                                          'historialPorPagarDTList':
                                              serializeParam(
                                            widget.historialPorPagarDTList,
                                            ParamType.DataStruct,
                                            isList: true,
                                          ),
                                          'nombreCliente': serializeParam(
                                            widget.nombreCliente,
                                            ParamType.String,
                                          ),
                                          'idCliente': serializeParam(
                                            widget.idCliente,
                                            ParamType.DocumentReference,
                                          ),
                                          'idTendero': serializeParam(
                                            widget.idTendero,
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
                                ),
                                Text(
                                  'Historial de\ncomprobantes',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation1']!),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 12.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.logout,
                                        color:
                                            FlutterFlowTheme.of(context).error,
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
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'containerOnActionTriggerAnimation']!
                                                .controller
                                                .forward(from: 0.0);
                                          }

                                          context.goNamed(
                                              AuthSigningInWidget.routeName);
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 1170.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 6.0, 24.0, 0.0),
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
                                            primary: false,
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
                                                    width: double.infinity,
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
                                                        width: 1.0,
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
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'textOnPageLoadAnimation2']!),
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
                                                              Lottie.asset(
                                                                'assets/jsons/actualHoySiFioLoad.json',
                                                                width: 200.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                                animate: true,
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
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          FlutterFlowExpandedImageView(
                                                                        image: Image
                                                                            .network(
                                                                          listaVouchersItem
                                                                              .imgVoucher,
                                                                          fit: BoxFit
                                                                              .contain,
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
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 280.0,
                                                            height: 120.0,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 300.0,
                                                              maxHeight: 150.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if ((listaVouchersItem
                                                                            .estadoVoucher ==
                                                                        'Pendiente') &&
                                                                    (listaVouchersItem
                                                                            .historialPagoParaEliminar !=
                                                                        null))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Total a pagar de esta cuenta: \$${listaVouchersItem.isFullPago == false ? formatNumber(
                                                                          listaVouchersItem
                                                                              .historialPagoParaEliminar
                                                                              .totalPorPagar,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '#0.00',
                                                                          locale:
                                                                              '',
                                                                        ) : formatNumber(
                                                                          mainHistorialViewClientesRecord
                                                                              .cliente
                                                                              .totalDeudaCompleta,
                                                                          formatType:
                                                                              FormatType.custom,
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
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                if ((listaVouchersItem
                                                                            .estadoVoucher ==
                                                                        'Pendiente') &&
                                                                    (listaVouchersItem
                                                                            .historialPagoParaEliminar !=
                                                                        null))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Total de pago enviado: \$${listaVouchersItem.historialPagoParaEliminar != null ? formatNumber(
                                                                          listaVouchersItem
                                                                              .montoAPagar,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '#0.00',
                                                                          locale:
                                                                              '',
                                                                        ) : formatNumber(
                                                                          mainHistorialViewClientesRecord
                                                                              .cliente
                                                                              .totalDeudaCompleta,
                                                                          formatType:
                                                                              FormatType.custom,
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
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                Flexible(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      'Tipo de comprobante: ${listaVouchersItem.tipoVoucher}',
                                                                      minFontSize:
                                                                          4.0,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.asap(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            color: listaVouchersItem.estadoVoucher == 'Negado'
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Num. Comprobante: ${listaVouchersItem.numVoucher.toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.asap(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            color: listaVouchersItem.estadoVoucher == 'Negado'
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Estado del Comprobante: ${listaVouchersItem.estadoVoucher}',
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
                                                                          color: listaVouchersItem.estadoVoucher == 'Negado'
                                                                              ? FlutterFlowTheme.of(context).secondaryBackground
                                                                              : FlutterFlowTheme.of(context).secondaryText,
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
                                                              ],
                                                            ),
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animateOnActionTrigger(
              animationsMap['containerOnActionTriggerAnimation']!,
            ),
          ),
        ),
      ),
    );
  }
}
