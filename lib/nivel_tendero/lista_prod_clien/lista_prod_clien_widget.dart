import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'lista_prod_clien_model.dart';
export 'lista_prod_clien_model.dart';

class ListaProdClienWidget extends StatefulWidget {
  const ListaProdClienWidget({
    super.key,
    this.tenderoRef,
  });

  /// Referencia
  final DocumentReference? tenderoRef;

  static String routeName = 'listaProdClien';
  static String routePath = '/listaProdClien';

  @override
  State<ListaProdClienWidget> createState() => _ListaProdClienWidgetState();
}

class _ListaProdClienWidgetState extends State<ListaProdClienWidget>
    with TickerProviderStateMixin {
  late ListaProdClienModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaProdClienModel());

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('¿Desea cerrar sesión?'),
                            content: Text('Sus datos ya están guardados.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    context.goNamed(AuthSigningInWidget.routeName);
                  }
                },
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'z73flnfh' /* Clientes Fiados */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 50.0,
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
                        }.withoutNulls,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
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
                                fontFamily: 'Inter Tight',
                                letterSpacing: 0.0,
                              ),
                      unselectedLabelStyle: TextStyle(),
                      indicatorColor: FlutterFlowTheme.of(context).secondary,
                      indicatorWeight: 3.0,
                      tabs: [
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'nu28y6p5' /* Todos */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '8z0trr3q' /* Fiando */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'tdonvu0o' /* Sin Fiar */,
                          ),
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
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
                              List<ClientesRecord> listViewClientesRecordList =
                                  snapshot.data!;

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewClientesRecordList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 5.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewClientesRecord =
                                      listViewClientesRecordList[listViewIndex];
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
                                          ClienteProdInfoEditWidget.routeName,
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
                                              listViewClientesRecord.reference,
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
                                              ParamType.int,
                                            ),
                                            'direccionDomicilio':
                                                serializeParam(
                                              listViewClientesRecord
                                                  .cliente.direccionDomicilio,
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
                                          color: FlutterFlowTheme.of(context)
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
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                      CrossAxisAlignment.start,
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
                                                        '${valueOrDefault<String>(
                                                          listViewClientesRecord
                                                              .cliente.cedula
                                                              .toString(),
                                                          '000',
                                                        )}: ${valueOrDefault<String>(
                                                          listViewClientesRecord
                                                              .cliente.nombre,
                                                          '---',
                                                        )} ${listViewClientesRecord.cliente.apellido}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        'Fiando: \$${listViewClientesRecord.cliente.totalDeudaCompleta.toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (listViewClientesRecord
                                                  .cliente.isFiando)
                                                Icon(
                                                  Icons.radio_button_checked,
                                                  color: FlutterFlowTheme.of(
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: StreamBuilder<List<ClientesRecord>>(
                            stream: queryClientesRecord(
                              queryBuilder: (clientesRecord) => clientesRecord
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<ClientesRecord> listViewClientesRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewClientesRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewClientesRecord =
                                      listViewClientesRecordList[listViewIndex];
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
                                          ClienteEditInfoWidget.routeName,
                                          queryParameters: {
                                            'nombre': serializeParam(
                                              valueOrDefault<String>(
                                                listViewClientesRecord
                                                    .cliente.nombre,
                                                '---',
                                              ),
                                              ParamType.String,
                                            ),
                                            'telf': serializeParam(
                                              valueOrDefault<String>(
                                                listViewClientesRecord
                                                    .cliente.telf,
                                                '---',
                                              ),
                                              ParamType.String,
                                            ),
                                            'isFiando': serializeParam(
                                              listViewClientesRecord
                                                  .cliente.isFiando,
                                              ParamType.bool,
                                            ),
                                            'idCliente': serializeParam(
                                              listViewClientesRecord.reference,
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
                                              ParamType.int,
                                            ),
                                            'direccionDomicilio':
                                                serializeParam(
                                              listViewClientesRecord
                                                  .cliente.direccionDomicilio,
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
                                          color: FlutterFlowTheme.of(context)
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
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                      CrossAxisAlignment.start,
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
                                                        '${listViewClientesRecord.cliente.cedula.toString()}: ${listViewClientesRecord.cliente.nombre} ${listViewClientesRecord.cliente.apellido}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        valueOrDefault<String>(
                                                          'Fiando: ${listViewClientesRecord.cliente.total.toString()}',
                                                          '---',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (listViewClientesRecord
                                                  .cliente.isFiando)
                                                Icon(
                                                  Icons.radio_button_checked,
                                                  color: FlutterFlowTheme.of(
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: StreamBuilder<List<ClientesRecord>>(
                            stream: queryClientesRecord(
                              queryBuilder: (clientesRecord) => clientesRecord
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
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<ClientesRecord> listViewClientesRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewClientesRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewClientesRecord =
                                      listViewClientesRecordList[listViewIndex];
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
                                          ClienteProdInfoEditWidget.routeName,
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
                                              listViewClientesRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                            'apellido': serializeParam(
                                              '',
                                              ParamType.String,
                                            ),
                                            'cedula': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                            'direccionDomicilio':
                                                serializeParam(
                                              '',
                                              ParamType.String,
                                            ),
                                            'emailCliente': serializeParam(
                                              '',
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
                                          color: FlutterFlowTheme.of(context)
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
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                      CrossAxisAlignment.start,
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
                                                        '${listViewClientesRecord.cliente.cedula.toString()}: ${listViewClientesRecord.cliente.nombre} ${listViewClientesRecord.cliente.apellido}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        valueOrDefault<String>(
                                                          'Sin Fiar',
                                                          '---',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (listViewClientesRecord
                                                  .cliente.isFiando)
                                                Icon(
                                                  Icons.radio_button_checked,
                                                  color: FlutterFlowTheme.of(
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
          ],
        ),
      ),
    );
  }
}
