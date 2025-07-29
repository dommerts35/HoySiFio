import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/components/dialog_two_btns_widget.dart';
import '/components_nivel_tendero/empty_voucher_comp/empty_voucher_comp_widget.dart';
import '/components_nivel_tendero/razon_negado_c/razon_negado_c_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

class _HistorialVouchersWidgetState extends State<HistorialVouchersWidget> {
  late HistorialVouchersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistorialVouchersModel());

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: double.infinity,
                      height: 820.0,
                      constraints: BoxConstraints(
                        maxWidth: 1170.0,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/poster-with-hand-drawn-fresh-vegetables-healthy-food-agriculture-concept-illustration-food_559587-18.png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 1.0,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 12.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed(
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
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 5.0, 10.0, 5.0),
                                          child: Text(
                                            'Historial de \ncomprobantes',
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
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
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                          borderRadius: 12.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.logout,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
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
                                            ).then((value) => safeSetState(
                                                () => _model.isLogoff = value));

                                            _shouldSetState = true;
                                            if (_model.isLogoff!) {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              await authManager.signOut();
                                              GoRouter.of(context)
                                                  .clearRedirectLocation();

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
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 5.0, 5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Comprobantes enviados del cliente: ',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                            StreamBuilder<ClientesRecord>(
                                              stream: _model
                                                  .queryNameClienteHistorialPagado(
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

                                                final textClientesRecord =
                                                    snapshot.data!;

                                                return Text(
                                                  '${textClientesRecord.cliente.nombre} ${textClientesRecord.cliente.apellido}',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
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
                                              itemBuilder: (context,
                                                  listaVouchersIndex) {
                                                final listaVouchersItem =
                                                    listaVouchers[
                                                        listaVouchersIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
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
                                                                  .primaryText,
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
                                                          child: Opacity(
                                                            opacity:
                                                                listaVouchersItem
                                                                            .estadoVoucher ==
                                                                        'Negado'
                                                                    ? 0.5
                                                                    : 1.0,
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
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
                                                                      BorderRadius
                                                                          .circular(
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
                                                        ),
                                                        if ((listaVouchersItem
                                                                    .estadoVoucher ==
                                                                'Pendiente') &&
                                                            (listaVouchersItem
                                                                    .historialPagoParaEliminar !=
                                                                null))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                      FormatType
                                                                          .custom,
                                                                  format:
                                                                      '#0.00',
                                                                  locale: '',
                                                                ) : formatNumber(
                                                                  mainHistorialViewClientesRecord
                                                                      .cliente
                                                                      .totalDeudaCompleta,
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  format:
                                                                      '#0.00',
                                                                  locale: '',
                                                                )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                          ),
                                                        if ((listaVouchersItem
                                                                    .estadoVoucher ==
                                                                'Pendiente') &&
                                                            (listaVouchersItem
                                                                    .historialPagoParaEliminar !=
                                                                null))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                      FormatType
                                                                          .custom,
                                                                  format:
                                                                      '#0.00',
                                                                  locale: '',
                                                                ) : formatNumber(
                                                                  mainHistorialViewClientesRecord
                                                                      .cliente
                                                                      .totalDeudaCompleta,
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  format:
                                                                      '#0.00',
                                                                  locale: '',
                                                                )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Tipo de Comprobante: ${listaVouchersItem.tipoVoucher}',
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Num. Comprobante: ${listaVouchersItem.numVoucher.toString()}',
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Estado: ${listaVouchersItem.estadoVoucher}',
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
                                                                          .inter(
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
                                                                    builder:
                                                                        (context) =>
                                                                            FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .error,
                                                                      borderRadius:
                                                                          12.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .do_not_disturb_on,
                                                                        color: Color(
                                                                            0xFFE75353),
                                                                        size:
                                                                            24.0,
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
                                                                                        'Negado de comprobante enviado a la tienda: ${_model.readForTenderoDenyPush?.displayName}',
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
                                                                    ),
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
                                                                    builder:
                                                                        (context) =>
                                                                            FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .success,
                                                                      borderRadius:
                                                                          12.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .paid_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        size:
                                                                            24.0,
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
                                                                                    totalPorPagar: listaVouchersItem.historialPagoParaEliminar.totalPorPagar,
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
                                                                                    isVoucherSent: listaVouchersItem.historialPagoParaEliminar.isVoucherSent,
                                                                                    fechaDeCobro: listaVouchersItem.historialPagoParaEliminar.fechaDeCobro,
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                  _model.tempHistorialList = mainHistorialViewClientesRecord.cliente.historialPorPagarProd.toList().cast<DataTypeHistorialPagoStruct>();
                                                                                  safeSetState(() {});
                                                                                  if (listaVouchersItem.isFullPago == true) {
                                                                                    firestoreBatch.update(
                                                                                        widget.idCliente!,
                                                                                        createClientesRecordData(
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

                                                                                      firestoreBatch.update(
                                                                                          widget.idCliente!,
                                                                                          createClientesRecordData(
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

                                                                                    firestoreBatch.update(
                                                                                        widget.idCliente!,
                                                                                        createClientesRecordData(
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

                                                                                      firestoreBatch.update(
                                                                                          widget.idCliente!,
                                                                                          createClientesRecordData(
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

                                                                                      firestoreBatch.update(
                                                                                          widget.idCliente!,
                                                                                          createClientesRecordData(
                                                                                            cliente: createDataTypeClienteStruct(
                                                                                              fieldValues: {
                                                                                                'historialPorPagarProd': getDataTypeHistorialPagoListFirestoreData(
                                                                                                  _model.tempHistorialList,
                                                                                                ),
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

                                                                                      firestoreBatch.update(
                                                                                          widget.idCliente!,
                                                                                          createClientesRecordData(
                                                                                            cliente: createDataTypeClienteStruct(
                                                                                              totalDeudaCompleta: (_model.tDCNormV2!) - listaVouchersItem.montoAPagar,
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
                                                                                      _model.updateDtHistorialPagoNewStruct(
                                                                                        (e) => e
                                                                                          ..incrementTotalPagado(listaVouchersItem.montoAPagar)
                                                                                          ..incrementTotalPorPagar(-listaVouchersItem.montoAPagar)
                                                                                          ..fechaDeCobro = getCurrentTimestamp
                                                                                          ..transferencia = true
                                                                                          ..efectivo = false
                                                                                          ..isVoucherSent = false,
                                                                                      );
                                                                                      safeSetState(() {});

                                                                                      firestoreBatch.update(
                                                                                          widget.idCliente!,
                                                                                          createClientesRecordData(
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
                                                                                      _model.addToTempHistorialList(_model.dtHistorialPagoNew!);
                                                                                      safeSetState(() {});

                                                                                      firestoreBatch.update(
                                                                                          widget.idCliente!,
                                                                                          createClientesRecordData(
                                                                                            cliente: createDataTypeClienteStruct(
                                                                                              fieldValues: {
                                                                                                'historialPorPagarProd': getDataTypeHistorialPagoListFirestoreData(
                                                                                                  _model.tempHistorialList,
                                                                                                ),
                                                                                              },
                                                                                              clearUnsetFields: false,
                                                                                            ),
                                                                                          ));
                                                                                      _model.tDCNormVF = await actions.normalizarValorNumerico(
                                                                                        formatNumber(
                                                                                          mainHistorialViewClientesRecord.cliente.totalDeudaCompleta,
                                                                                          formatType: FormatType.custom,
                                                                                          format: '#0.00',
                                                                                          locale: '',
                                                                                        ),
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      _model.tDCNormVF2 = await actions.normalizarValorNumerico(
                                                                                        formatNumber(
                                                                                          _model.tDCNormVF,
                                                                                          formatType: FormatType.custom,
                                                                                          format: '#0.00',
                                                                                          locale: '',
                                                                                        ),
                                                                                      );
                                                                                      _shouldSetState = true;

                                                                                      firestoreBatch.update(
                                                                                          widget.idCliente!,
                                                                                          createClientesRecordData(
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
                                                                                      firestoreBatch.update(
                                                                                          widget.idCliente!,
                                                                                          createClientesRecordData(
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
                                                                              } finally {
                                                                                await firestoreBatch.commit();
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
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 10.0))
                                                          .addToStart(SizedBox(
                                                              height: 15.0))
                                                          .addToEnd(SizedBox(
                                                              height: 10.0)),
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
            ),
          ),
        ),
      ),
    );
  }
}
