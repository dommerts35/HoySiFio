import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog_two_btns_widget.dart';
import '/components_nivel_tendero/empty_clientes_list/empty_clientes_list_widget.dart';
import '/components_nivel_tendero/empty_clientes_list_fiando/empty_clientes_list_fiando_widget.dart';
import '/components_nivel_tendero/empty_clientes_list_no_fiando/empty_clientes_list_no_fiando_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lista_clientes_model.dart';
export 'lista_clientes_model.dart';

class ListaClientesWidget extends StatefulWidget {
  const ListaClientesWidget({
    super.key,
    this.tenderoRef,
    String? nombreTienda,
    this.tenderoEmail,
    this.nombreTendero,
  }) : this.nombreTienda = nombreTienda ?? '-';

  /// Referencia
  final DocumentReference? tenderoRef;

  final String nombreTienda;
  final String? tenderoEmail;
  final String? nombreTendero;

  static String routeName = 'listaClientes';
  static String routePath = '/listaClientes';

  @override
  State<ListaClientesWidget> createState() => _ListaClientesWidgetState();
}

class _ListaClientesWidgetState extends State<ListaClientesWidget>
    with TickerProviderStateMixin {
  late ListaClientesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaClientesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isFirstTimeTenderoList == true) {
        FFAppState().isFirstTimeTenderoList = false;
        safeSetState(() {});

        context.goNamed(
          PageTutorialListaClientesFTWidget.routeName,
          queryParameters: {
            'tenderoRef': serializeParam(
              widget.tenderoRef,
              ParamType.DocumentReference,
            ),
            'nombreTienda': serializeParam(
              widget.nombreTienda,
              ParamType.String,
            ),
            'tenderoEmail': serializeParam(
              widget.tenderoEmail,
              ParamType.String,
            ),
            'nombreTendero': serializeParam(
              widget.nombreTendero,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) => FlutterFlowIconButton(
                      borderColor: Color(0xFFFF0000),
                      borderRadius: 8.0,
                      borderWidth: 2.0,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.logout,
                        color: Color(0xFFFF0000),
                        size: 30.0,
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
                                  FocusManager.instance.primaryFocus?.unfocus();
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
                              AuthSigningInWidget.routeName, context.mounted);
                        } else {
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        if (_shouldSetState) safeSetState(() {});
                      },
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Tienda',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 25.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Flexible(
                              child: StreamBuilder<TenderosRecord>(
                                stream: TenderosRecord.getDocument(
                                    widget.tenderoRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final textTenderosRecord = snapshot.data!;

                                  return AutoSizeText(
                                    valueOrDefault<String>(
                                      textTenderosRecord.tenderos.nombreTienda,
                                      'tiendaName',
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    minFontSize: 4.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 125.0,
                    height: 30.0,
                    constraints: BoxConstraints(
                      maxWidth: 125.0,
                    ),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: StreamBuilder<List<ClientesRecord>>(
                        stream: queryClientesRecord(
                          queryBuilder: (clientesRecord) =>
                              clientesRecord.where(
                            'cliente.idTendero',
                            isEqualTo: widget.tenderoRef,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ClientesRecord> textClientesRecordList =
                              snapshot.data!;

                          return AutoSizeText(
                            () {
                              if (_model.tabBarCurrentIndex == 0) {
                                return 'Num. Clientes: ${textClientesRecordList.length.toString()}';
                              } else if (_model.tabBarCurrentIndex == 1) {
                                return 'Clientes fiando: ${textClientesRecordList.where((e) => e.cliente.isFiando).toList().length.toString()}';
                              } else {
                                return 'Clientes sin fiar: ${textClientesRecordList.where((e) => !e.cliente.isFiando).toList().length.toString()}';
                              }
                            }(),
                            minFontSize: 6.0,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              toolbarHeight: 70.0,
              elevation: 0.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: Colors.white,
                          unselectedLabelColor: Color(0xB3FFFFFF),
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                          unselectedLabelStyle: TextStyle(),
                          indicatorColor:
                              FlutterFlowTheme.of(context).secondary,
                          indicatorWeight: 3.0,
                          tabs: [
                            Tab(
                              text: 'Todos',
                            ),
                            Tab(
                              text: 'Fiando',
                            ),
                            Tab(
                              text: 'Sin Fiar',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1F4F8),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/poster-with-hand-drawn-fresh-vegetables-healthy-food-agriculture-concept-illustration-food_559587-18.png',
                                  ).image,
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0.0,
                                      child: Divider(
                                        height: 0.0,
                                        thickness: 0.0,
                                        color: Color(0x00E0E3E7),
                                      ),
                                    ),
                                    Container(
                                      width: 380.0,
                                      height: 595.0,
                                      decoration: BoxDecoration(),
                                      child:
                                          StreamBuilder<List<ClientesRecord>>(
                                        stream: queryClientesRecord(
                                          queryBuilder: (clientesRecord) =>
                                              clientesRecord.where(
                                            'cliente.idTendero',
                                            isEqualTo: widget.tenderoRef,
                                          ),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ClientesRecord>
                                              listViewClientesRecordList =
                                              snapshot.data!;
                                          if (listViewClientesRecordList
                                              .isEmpty) {
                                            return Center(
                                              child: Container(
                                                width: 340.0,
                                                height: 360.0,
                                                child:
                                                    EmptyClientesListWidget(),
                                              ),
                                            );
                                          }

                                          return ListView.separated(
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              0,
                                              0,
                                              20.0,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewClientesRecordList
                                                    .length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 5.0),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewClientesRecord =
                                                  listViewClientesRecordList[
                                                      listViewIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 8.0, 16.0, 0.0),
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
                                                    context.pushNamed(
                                                      ClienteInfoEditWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'nombre':
                                                            serializeParam(
                                                          listViewClientesRecord
                                                              .cliente.nombre,
                                                          ParamType.String,
                                                        ),
                                                        'telf': serializeParam(
                                                          listViewClientesRecord
                                                              .cliente.telf,
                                                          ParamType.String,
                                                        ),
                                                        'isFiando':
                                                            serializeParam(
                                                          listViewClientesRecord
                                                              .cliente.isFiando,
                                                          ParamType.bool,
                                                        ),
                                                        'idCliente':
                                                            serializeParam(
                                                          listViewClientesRecord
                                                              .cliente
                                                              .idCliente,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'apellido':
                                                            serializeParam(
                                                          listViewClientesRecord
                                                              .cliente.apellido,
                                                          ParamType.String,
                                                        ),
                                                        'cedula':
                                                            serializeParam(
                                                          listViewClientesRecord
                                                              .cliente.cedula,
                                                          ParamType.String,
                                                        ),
                                                        'direccionDomicilio':
                                                            serializeParam(
                                                          listViewClientesRecord
                                                              .cliente
                                                              .direccionDomicilio,
                                                          ParamType.String,
                                                        ),
                                                        'emailCliente':
                                                            serializeParam(
                                                          listViewClientesRecord
                                                              .cliente
                                                              .emailCliente,
                                                          ParamType.String,
                                                        ),
                                                        'viviendaAlq':
                                                            serializeParam(
                                                          listViewClientesRecord
                                                              .cliente
                                                              .viviendaAlq,
                                                          ParamType.bool,
                                                        ),
                                                        'viviendaProp':
                                                            serializeParam(
                                                          listViewClientesRecord
                                                              .cliente
                                                              .viviendaPropia,
                                                          ParamType.bool,
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
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 5.0,
                                                          color:
                                                              Color(0x20000000),
                                                          offset: Offset(
                                                            0.0,
                                                            1.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF0050FF),
                                                        width: 2.0,
                                                      ),
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
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      'Cliente: ${valueOrDefault<String>(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .nombre,
                                                                        '---',
                                                                      )} ${listViewClientesRecord.cliente.apellido}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      'CI: ${valueOrDefault<String>(
                                                                        listViewClientesRecord
                                                                            .cliente
                                                                            .cedula,
                                                                        '000',
                                                                      )}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Fiando: \$${formatNumber(
                                                                        listViewClientesRecord
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
                                                                                GoogleFonts.inter(
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
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            30.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Comprobantes: ${listViewClientesRecord.cliente.dataTypeVouchers.where((e) => e.estadoVoucher == 'Pendiente').toList().length.toString()}',
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
                                                          if (listViewClientesRecord
                                                              .cliente.isFiando)
                                                            Icon(
                                                              Icons
                                                                  .radio_button_checked,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/poster-with-hand-drawn-fresh-vegetables-healthy-food-agriculture-concept-illustration-food_559587-18.png',
                                  ).image,
                                ),
                              ),
                              child: StreamBuilder<List<ClientesRecord>>(
                                stream: queryClientesRecord(
                                  queryBuilder: (clientesRecord) =>
                                      clientesRecord
                                          .where(
                                            'cliente.isFiando',
                                            isEqualTo: true,
                                          )
                                          .where(
                                            'cliente.idTendero',
                                            isEqualTo: widget.tenderoRef,
                                          ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ClientesRecord>
                                      listViewClientesRecordList =
                                      snapshot.data!;
                                  if (listViewClientesRecordList.isEmpty) {
                                    return Center(
                                      child: Container(
                                        width: 340.0,
                                        height: 360.0,
                                        child: EmptyClientesListFiandoWidget(),
                                      ),
                                    );
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      20.0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewClientesRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewClientesRecord =
                                          listViewClientesRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              ClienteInfoEditWidget.routeName,
                                              queryParameters: {
                                                'nombre': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.nombre,
                                                  ParamType.String,
                                                ),
                                                'telf': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.telf,
                                                  ParamType.String,
                                                ),
                                                'isFiando': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.isFiando,
                                                  ParamType.bool,
                                                ),
                                                'idCliente': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.idCliente,
                                                  ParamType.DocumentReference,
                                                ),
                                                'apellido': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.apellido,
                                                  ParamType.String,
                                                ),
                                                'cedula': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.cedula,
                                                  ParamType.String,
                                                ),
                                                'tenderoRef': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.idTendero,
                                                  ParamType.DocumentReference,
                                                ),
                                                'direccionDomicilio':
                                                    serializeParam(
                                                  listViewClientesRecord.cliente
                                                      .direccionDomicilio,
                                                  ParamType.String,
                                                ),
                                                'viviendaAlq': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.viviendaAlq,
                                                  ParamType.bool,
                                                ),
                                                'viviendaProp': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.viviendaPropia,
                                                  ParamType.bool,
                                                ),
                                                'emailCliente': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.emailCliente,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: Color(0xFF0050FF),
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 8.0, 12.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                            '${listViewClientesRecord.cliente.cedula}: ${listViewClientesRecord.cliente.nombre} ${listViewClientesRecord.cliente.apellido}',
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
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              'Fiando: \$${formatNumber(
                                                                listViewClientesRecord
                                                                    .cliente
                                                                    .totalDeudaCompleta,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#0.00',
                                                                locale: '',
                                                              )}',
                                                              '---',
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
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (listViewClientesRecord
                                                      .cliente.isFiando)
                                                    Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/poster-with-hand-drawn-fresh-vegetables-healthy-food-agriculture-concept-illustration-food_559587-18.png',
                                  ).image,
                                ),
                              ),
                              child: StreamBuilder<List<ClientesRecord>>(
                                stream: queryClientesRecord(
                                  queryBuilder: (clientesRecord) =>
                                      clientesRecord
                                          .where(
                                            'cliente.isFiando',
                                            isEqualTo: false,
                                          )
                                          .where(
                                            'cliente.idTendero',
                                            isEqualTo: widget.tenderoRef,
                                          ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ClientesRecord>
                                      listViewClientesRecordList =
                                      snapshot.data!;
                                  if (listViewClientesRecordList.isEmpty) {
                                    return Center(
                                      child: Container(
                                        width: 340.0,
                                        height: 360.0,
                                        child:
                                            EmptyClientesListNoFiandoWidget(),
                                      ),
                                    );
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      20.0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewClientesRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewClientesRecord =
                                          listViewClientesRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              ClienteInfoEditWidget.routeName,
                                              queryParameters: {
                                                'nombre': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.nombre,
                                                  ParamType.String,
                                                ),
                                                'telf': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.telf,
                                                  ParamType.String,
                                                ),
                                                'isFiando': serializeParam(
                                                  false,
                                                  ParamType.bool,
                                                ),
                                                'idCliente': serializeParam(
                                                  listViewClientesRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'apellido': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.apellido,
                                                  ParamType.String,
                                                ),
                                                'cedula': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.cedula,
                                                  ParamType.String,
                                                ),
                                                'direccionDomicilio':
                                                    serializeParam(
                                                  listViewClientesRecord.cliente
                                                      .direccionDomicilio,
                                                  ParamType.String,
                                                ),
                                                'emailCliente': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.emailCliente,
                                                  ParamType.String,
                                                ),
                                                'viviendaAlq': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.viviendaAlq,
                                                  ParamType.bool,
                                                ),
                                                'viviendaProp': serializeParam(
                                                  listViewClientesRecord
                                                      .cliente.viviendaPropia,
                                                  ParamType.bool,
                                                ),
                                                'tenderoRef': serializeParam(
                                                  widget.tenderoRef,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: Color(0xFF0050FF),
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 8.0, 12.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                            '${listViewClientesRecord.cliente.cedula}: ${listViewClientesRecord.cliente.nombre} ${listViewClientesRecord.cliente.apellido}',
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
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              'Sin Fiar',
                                                              '---',
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
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (listViewClientesRecord
                                                      .cliente.isFiando)
                                                    Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        hoverColor: Colors.white,
                        hoverIconColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.help,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            TenderoAyudaWidget.routeName,
                            queryParameters: {
                              'tenderoRef': serializeParam(
                                widget.tenderoRef,
                                ParamType.DocumentReference,
                              ),
                              'nombreTienda': serializeParam(
                                widget.nombreTienda,
                                ParamType.String,
                              ),
                              'tenderoEmail': serializeParam(
                                widget.tenderoEmail,
                                ParamType.String,
                              ),
                              'nombreTendero': serializeParam(
                                widget.nombreTendero,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.white,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        hoverColor: Colors.white,
                        hoverIconColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            ClienteMakeInfoWidget.routeName,
                            queryParameters: {
                              'tenderoRef': serializeParam(
                                widget.tenderoRef,
                                ParamType.DocumentReference,
                              ),
                              'nombreTienda': serializeParam(
                                widget.nombreTienda,
                                ParamType.String,
                              ),
                              'tenderoEmail': serializeParam(
                                currentUserEmail,
                                ParamType.String,
                              ),
                              'nombreTendero': serializeParam(
                                currentUserDocument?.tenderos.nombreTendero,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        hoverColor: Colors.white,
                        hoverIconColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            SigninConfirmWidget.routeName,
                            queryParameters: {
                              'tenderoRef': serializeParam(
                                widget.tenderoRef,
                                ParamType.DocumentReference,
                              ),
                              'nombreTienda': serializeParam(
                                widget.nombreTienda,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
