import '/backend/backend.dart';
import '/components/dialog_btn_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:marketplace_check_internet_connection_library_vrjzhi/custom_code/actions/index.dart'
    as marketplace_check_internet_connection_library_vrjzhi_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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

class _ClienteVincWidgetState extends State<ClienteVincWidget>
    with TickerProviderStateMixin {
  late ClienteVincModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteVincModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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

    _model.valorUserTextController ??=
        TextEditingController(text: widget.cedulaPassed);
    _model.valorUserFocusNode ??= FocusNode();

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.1, 1.1),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 650.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.1, 1.1),
            end: Offset(0.9, 0.9),
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
                  child: SpinKitWanderingCubes(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 50.0,
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
            child: PopScope(
              canPop: false,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                body: SafeArea(
                  top: true,
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          child: Container(
                            height: 100.0,
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
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Vinculación',
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
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
                                              font: GoogleFonts.asap(
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
                                      'en otras tiendas, se vincularán sus ',
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.asap(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
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
                                    Text(
                                      'de otras tiendas, asegurando su seguridad.',
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.asap(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 770.0,
                              ),
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
                                borderRadius: BorderRadius.circular(14.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: TextFormField(
                                        controller:
                                            _model.valorUserTextController,
                                        focusNode: _model.valorUserFocusNode,
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Usuario/Número de Cédula',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.asap(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintText: 'Número de cédula',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.asap(
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
                                                fontSize: 16.0,
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
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          contentPadding: EdgeInsets.all(14.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.asap(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16.0,
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
                                        maxLength: 10,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .valorUserTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          if (!isAndroid && !isiOS)
                                            TextInputFormatter.withFunction(
                                                (oldValue, newValue) {
                                              return TextEditingValue(
                                                selection: newValue.selection,
                                                text: newValue.text
                                                    .toCapitalization(
                                                        TextCapitalization
                                                            .none),
                                              );
                                            }),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Builder(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  if (_model.valorUserTextController
                                                              .text ==
                                                          '') {
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
                                                            child:
                                                                DialogBtnWidget(
                                                              titulo:
                                                                  '¡Alerta!',
                                                              mensaje:
                                                                  'No ha sido ingresada la cédula del cliente registrado.',
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  var clientesRecordReference =
                                                      ClientesRecord.collection
                                                          .doc();
                                                  await clientesRecordReference
                                                      .set({
                                                    ...createClientesRecordData(
                                                      cliente:
                                                          createDataTypeClienteStruct(
                                                        nombre:
                                                            clienteVincClientesRecord
                                                                .cliente.nombre,
                                                        telf:
                                                            clienteVincClientesRecord
                                                                .cliente.telf,
                                                        isFiando: false,
                                                        apellido:
                                                            clienteVincClientesRecord
                                                                .cliente
                                                                .apellido,
                                                        cedula:
                                                            clienteVincClientesRecord
                                                                .cliente.cedula,
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
                                                        idTendero:
                                                            widget.tenderoRef,
                                                        totalDeudaCompleta: 0.0,
                                                        contrasena:
                                                            clienteVincClientesRecord
                                                                .cliente
                                                                .contrasena,
                                                        pin:
                                                            clienteVincClientesRecord
                                                                .cliente.pin,
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                      profileUrl:
                                                          clienteVincClientesRecord
                                                              .profileUrl,
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
                                                                .cliente.nombre,
                                                        telf:
                                                            clienteVincClientesRecord
                                                                .cliente.telf,
                                                        isFiando: false,
                                                        apellido:
                                                            clienteVincClientesRecord
                                                                .cliente
                                                                .apellido,
                                                        cedula:
                                                            clienteVincClientesRecord
                                                                .cliente.cedula,
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
                                                        idTendero:
                                                            widget.tenderoRef,
                                                        totalDeudaCompleta: 0.0,
                                                        contrasena:
                                                            clienteVincClientesRecord
                                                                .cliente
                                                                .contrasena,
                                                        pin:
                                                            clienteVincClientesRecord
                                                                .cliente.pin,
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                      profileUrl:
                                                          clienteVincClientesRecord
                                                              .profileUrl,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'player_ids':
                                                            clienteVincClientesRecord
                                                                .playerIds,
                                                      },
                                                    ),
                                                  }, clientesRecordReference);
                                                  _shouldSetState = true;

                                                  await _model.makeVincCliente!
                                                      .reference
                                                      .update(
                                                          createClientesRecordData(
                                                    cliente:
                                                        createDataTypeClienteStruct(
                                                      idCliente: _model
                                                          .makeVincCliente
                                                          ?.reference,
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));
                                                  for (int loop1Index = 0;
                                                      loop1Index <
                                                          clienteVincClientesRecord
                                                              .playerIds.length;
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

                                                  context.goNamed(
                                                    ListaClientesWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'tenderoRef':
                                                          serializeParam(
                                                        widget.tenderoRef,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'nombreTienda':
                                                          serializeParam(
                                                        widget.nombreTienda,
                                                        ParamType.String,
                                                      ),
                                                      'tenderoEmail':
                                                          serializeParam(
                                                        widget.tenderoEmail,
                                                        ParamType.String,
                                                      ),
                                                      'nombreTendero':
                                                          serializeParam(
                                                        widget.nombreTienda,
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

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'Vincular Cuenta',
                                                options: FFButtonOptions(
                                                  width: 200.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ).animateOnActionTrigger(
                                                animationsMap[
                                                    'buttonOnActionTriggerAnimation']!,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]
                                      .addToStart(SizedBox(height: 5.0))
                                      .addToEnd(SizedBox(height: 10.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Lottie.asset(
                          'assets/jsons/forBackground.json',
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          fit: BoxFit.fill,
                          animate: true,
                        ),
                      ],
                    ),
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
