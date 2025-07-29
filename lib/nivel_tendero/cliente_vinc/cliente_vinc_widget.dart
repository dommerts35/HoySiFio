import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cliente_vinc_model.dart';
export 'cliente_vinc_model.dart';

class ClienteVincWidget extends StatefulWidget {
  const ClienteVincWidget({
    super.key,
    required this.idCliente,
    this.tenderoRef,
    this.nombreTienda,
    this.tenderoEmail,
    this.cedulaPassed,
  });

  /// idCliente
  final DocumentReference? idCliente;

  final DocumentReference? tenderoRef;
  final String? nombreTienda;
  final String? tenderoEmail;
  final String? cedulaPassed;

  static String routeName = 'clienteVinc';
  static String routePath = '/clienteVinc';

  @override
  State<ClienteVincWidget> createState() => _ClienteVincWidgetState();
}

class _ClienteVincWidgetState extends State<ClienteVincWidget> {
  late ClienteVincModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteVincModel());

    _model.valorUserTextController ??=
        TextEditingController(text: widget.cedulaPassed);
    _model.valorUserFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ClientesRecord>(
      stream: _model.queryNombreCliente(
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

        final clienteVincClientesRecord = snapshot.data!;

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
                preferredSize: Size.fromHeight(150.0),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vincular',
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
                                  fontSize: 40.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Text(
                              'Si su cliente ha sido registrado',
                              maxLines: 2,
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
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Text(
                            'en otras tiendas, se vinculará sus datos.',
                            maxLines: 2,
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
                                  fontSize: 16.0,
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
                  actions: [],
                  centerTitle: false,
                  toolbarHeight: 200.0,
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
                                      0.0, 10.0, 0.0, 0.0),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 150.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .valorUserTextController,
                                              focusNode:
                                                  _model.valorUserFocusNode,
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText:
                                                    'Usuario/Número de Cédula',
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 28.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                hintText: 'Número de cédula',
                                                hintStyle:
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
                                                          fontSize: 28.0,
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                                        fontSize: 28.0,
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
                                                        lineHeight: 3.0,
                                                      ),
                                              maxLength: 10,
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.enforced,
                                              buildCounter: (context,
                                                      {required currentLength,
                                                      required isFocused,
                                                      maxLength}) =>
                                                  null,
                                              keyboardType:
                                                  TextInputType.number,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .valorUserTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                if (!isAndroid && !isiOS)
                                                  TextInputFormatter
                                                      .withFunction(
                                                          (oldValue, newValue) {
                                                    return TextEditingValue(
                                                      selection:
                                                          newValue.selection,
                                                      text: newValue.text
                                                          .toCapitalization(
                                                              TextCapitalization
                                                                  .none),
                                                    );
                                                  }),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 190.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
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
                                                        child: Text(
                                                          'El cliente está registrado en: ',
                                                          textAlign:
                                                              TextAlign.center,
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
                                                                fontSize: 30.0,
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
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                ClientesRecord>>(
                                                          stream:
                                                              queryClientesRecord(
                                                            queryBuilder:
                                                                (clientesRecord) =>
                                                                    clientesRecord
                                                                        .where(
                                                              'cliente.cedula',
                                                              isEqualTo: _model
                                                                  .valorUserTextController
                                                                  .text,
                                                            ),
                                                          ),
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
                                                            List<ClientesRecord>
                                                                textClientesRecordList =
                                                                snapshot.data!;

                                                            return Text(
                                                              '${textClientesRecordList.length.toString()} ${textClientesRecordList.length == 1 ? 'Tienda' : 'Tiendas'}',
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
                                                                    fontSize:
                                                                        30.0,
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
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 5.0)),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 50.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var clientesRecordReference =
                                                            ClientesRecord
                                                                .collection
                                                                .doc();
                                                        await clientesRecordReference
                                                            .set({
                                                          ...createClientesRecordData(
                                                            cliente:
                                                                createDataTypeClienteStruct(
                                                              nombre:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .nombre,
                                                              telf:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .telf,
                                                              isFiando: false,
                                                              apellido:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .apellido,
                                                              cedula:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .cedula,
                                                              direccionDomicilio:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .direccionDomicilio,
                                                              viviendaAlq:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .viviendaAlq,
                                                              viviendaPropia:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .viviendaPropia,
                                                              emailCliente:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .emailCliente,
                                                              idTendero: widget
                                                                  .tenderoRef,
                                                              totalDeudaCompleta:
                                                                  0.0,
                                                              contrasena:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .contrasena,
                                                              pin:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .pin,
                                                              clearUnsetFields:
                                                                  false,
                                                              create: true,
                                                            ),
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'player_ids':
                                                                  clienteVincClientesRecord
                                                                      .playerIds,
                                                            },
                                                          ),
                                                        });
                                                        _model.makeVincCliente =
                                                            ClientesRecord
                                                                .getDocumentFromData({
                                                          ...createClientesRecordData(
                                                            cliente:
                                                                createDataTypeClienteStruct(
                                                              nombre:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .nombre,
                                                              telf:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .telf,
                                                              isFiando: false,
                                                              apellido:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .apellido,
                                                              cedula:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .cedula,
                                                              direccionDomicilio:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .direccionDomicilio,
                                                              viviendaAlq:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .viviendaAlq,
                                                              viviendaPropia:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .viviendaPropia,
                                                              emailCliente:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .emailCliente,
                                                              idTendero: widget
                                                                  .tenderoRef,
                                                              totalDeudaCompleta:
                                                                  0.0,
                                                              contrasena:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .contrasena,
                                                              pin:
                                                                  clienteVincClientesRecord
                                                                      .cliente
                                                                      .pin,
                                                              clearUnsetFields:
                                                                  false,
                                                              create: true,
                                                            ),
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'player_ids':
                                                                  clienteVincClientesRecord
                                                                      .playerIds,
                                                            },
                                                          ),
                                                        }, clientesRecordReference);

                                                        await _model
                                                            .makeVincCliente!
                                                            .reference
                                                            .update(
                                                                createClientesRecordData(
                                                          cliente:
                                                              createDataTypeClienteStruct(
                                                            idCliente: _model
                                                                .makeVincCliente
                                                                ?.reference,
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ));
                                                        for (int loop1Index = 0;
                                                            loop1Index <
                                                                clienteVincClientesRecord
                                                                    .playerIds
                                                                    .length;
                                                            loop1Index++) {
                                                          final currentLoop1Item =
                                                              clienteVincClientesRecord
                                                                      .playerIds[
                                                                  loop1Index];
                                                          unawaited(
                                                            () async {
                                                              await actions
                                                                  .sendNotificationToPlayer(
                                                                currentLoop1Item,
                                                                '${clienteVincClientesRecord.cliente.nombre}: ¡Has sido registrado en una nueva tienda: \" ${widget.nombreTienda}\"!',
                                                              );
                                                            }(),
                                                          );
                                                        }

                                                        context.pushNamed(
                                                          ListaClientesWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'tenderoRef':
                                                                serializeParam(
                                                              widget
                                                                  .tenderoRef,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'nombreTienda':
                                                                serializeParam(
                                                              widget
                                                                  .nombreTienda,
                                                              ParamType.String,
                                                            ),
                                                            'tenderoEmail':
                                                                serializeParam(
                                                              widget
                                                                  .tenderoEmail,
                                                              ParamType.String,
                                                            ),
                                                            'nombreTendero':
                                                                serializeParam(
                                                              widget
                                                                  .nombreTienda,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        safeSetState(() {});
                                                      },
                                                      text: 'Vincular Cuenta',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(height: 30.0))
                                            .addToStart(SizedBox(height: 15.0)),
                                      ),
                                    ),
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
            ),
          ),
        );
      },
    );
  }
}
