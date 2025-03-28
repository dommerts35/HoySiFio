import '/backend/backend.dart';
import '/components_nivel_tendero/info_comp/info_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cliente_prod_info_edit_model.dart';
export 'cliente_prod_info_edit_model.dart';

class ClienteProdInfoEditWidget extends StatefulWidget {
  const ClienteProdInfoEditWidget({
    super.key,
    required this.nombre,
    required this.telf,
    required this.isFiando,
    required this.idCliente,
    required this.fechaPago,
    required this.apellido,
    required this.cedula,
    required this.direccionDomicilio,
    this.viviendaAlq,
    this.viviendaProp,
    required this.emailCliente,
    required this.tenderoRef,
  });

  /// fullName
  final String? nombre;

  /// phoneNumber
  final String? telf;

  /// isFiandoE
  final bool? isFiando;

  /// idCliente
  final DocumentReference? idCliente;

  /// FechaPago
  final DateTime? fechaPago;

  /// secondName
  final String? apellido;

  /// ced
  final int? cedula;

  /// domicilio
  final String? direccionDomicilio;

  /// alq
  final bool? viviendaAlq;

  final bool? viviendaProp;

  /// email
  final String? emailCliente;

  final DocumentReference? tenderoRef;

  static String routeName = 'clienteProd-InfoEdit';
  static String routePath = '/clienteProdInfoEdit';

  @override
  State<ClienteProdInfoEditWidget> createState() =>
      _ClienteProdInfoEditWidgetState();
}

class _ClienteProdInfoEditWidgetState extends State<ClienteProdInfoEditWidget> {
  late ClienteProdInfoEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteProdInfoEditModel());

    _model.prodTFTextController ??= TextEditingController();
    _model.prodTFFocusNode ??= FocusNode();

    _model.valorTFTextController ??= TextEditingController();
    _model.valorTFFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderRadius: 12.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.goNamed(
                          ListaProdClienWidget.routeName,
                          queryParameters: {
                            'tenderoRef': serializeParam(
                              widget.tenderoRef,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '8bowq0tq' /* Editar cliente */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Inter Tight',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'ktufeslb' /* Edición de datos del cliente */,
                        ),
                        maxLines: 1,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [],
            centerTitle: false,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      wrapWithModel(
                                        model: _model.infoCompModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: InfoCompWidget(
                                          parameter1: widget.nombre!,
                                          parameter2: widget.apellido!,
                                          parameter3: widget.telf!,
                                          parameter4: widget.cedula!,
                                          parameter5:
                                              widget.direccionDomicilio!,
                                          parameter6: widget.emailCliente!,
                                          parameter7: widget.viviendaAlq,
                                          parameter8: widget.viviendaProp,
                                        ),
                                      ),
                                      Container(
                                        height: 178.19,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -0.74),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    ClienteEditInfoWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'nombre': serializeParam(
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
                                                      'idCliente':
                                                          serializeParam(
                                                        widget.idCliente,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'fechaPago':
                                                          serializeParam(
                                                        widget.fechaPago,
                                                        ParamType.DateTime,
                                                      ),
                                                      'apellido':
                                                          serializeParam(
                                                        widget.apellido,
                                                        ParamType.String,
                                                      ),
                                                      'cedula': serializeParam(
                                                        widget.cedula,
                                                        ParamType.int,
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
                                                      'viviendaProp':
                                                          serializeParam(
                                                        widget.viviendaProp,
                                                        ParamType.bool,
                                                      ),
                                                      'emailCliente':
                                                          serializeParam(
                                                        widget.emailCliente,
                                                        ParamType.String,
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
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -0.02),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                borderRadius: 12.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Color(0xFFE75353),
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '¿Eliminar cliente?'),
                                                                content: Text(
                                                                    'Esta acción no se puede deshacer.'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancelar'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Eliminar'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    await widget.idCliente!
                                                        .delete();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'El cliente ha sido eliminado.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter Tight',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                    context.safePop();
                                                  }
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.68),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                borderRadius: 12.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.info,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    ClienteReadInfoWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'nombre': serializeParam(
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
                                                      'idCliente':
                                                          serializeParam(
                                                        widget.idCliente,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'fechaPago':
                                                          serializeParam(
                                                        widget.fechaPago,
                                                        ParamType.DateTime,
                                                      ),
                                                      'apellido':
                                                          serializeParam(
                                                        widget.apellido,
                                                        ParamType.String,
                                                      ),
                                                      'cedula': serializeParam(
                                                        widget.cedula,
                                                        ParamType.int,
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
                                                      'viviendaProp':
                                                          serializeParam(
                                                        widget.viviendaProp,
                                                        ParamType.bool,
                                                      ),
                                                      'emailCliente':
                                                          serializeParam(
                                                        widget.emailCliente,
                                                        ParamType.String,
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Divider(
                                        thickness: 2.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qkzdh8m8' /* Fiar Productos */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  'Total de productos fiados: ?',
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 200.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.prodTFTextController,
                                                focusNode:
                                                    _model.prodTFFocusNode,
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '83pjv5dz' /* Producto */,
                                                  ),
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'x7hrnybu' /* Ingrese el producto */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLength: 15,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .prodTFTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 2.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .valorTFTextController,
                                                focusNode:
                                                    _model.valorTFFocusNode,
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization.none,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'minmxdls' /* Valor */,
                                                  ),
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '8qnas4ho' /* #.## */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLength: 8,
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .valorTFTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          '^\\d*\\.?\\d{0,2}\$'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 25.0)),
                                      ),
                                    ].divide(SizedBox(height: 20.0)),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if ((_model.prodTFTextController
                                                        .text !=
                                                    '') &&
                                            (_model.valorTFTextController
                                                        .text !=
                                                    '')) {
                                          await widget.idCliente!
                                              .update(createClientesRecordData(
                                            cliente:
                                                createDataTypeClienteStruct(
                                              fieldValues: {
                                                'producto':
                                                    FieldValue.arrayUnion([
                                                  getDataTypeProductosFirestoreData(
                                                    createDataTypeProductosStruct(
                                                      nombreProd: _model
                                                          .prodTFTextController
                                                          .text,
                                                      valorProd:
                                                          double.tryParse(_model
                                                              .valorTFTextController
                                                              .text),
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
                                            _model.prodTFTextController
                                                ?.clear();
                                            _model.valorTFTextController
                                                ?.clear();
                                          });
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '28ox95x7' /* Añadir Producto */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 30.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
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

                                      final vistaMainClientesRecord =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final test1 = vistaMainClientesRecord
                                              .cliente.producto
                                              .toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: test1.length,
                                            itemBuilder: (context, test1Index) {
                                              final test1Item =
                                                  test1[test1Index];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 8.0, 16.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 3.0,
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
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                                12.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                  '${test1Item.nombreProd}: \$${test1Item.valorProd.toString()}',
                                                                  style: FlutterFlowTheme.of(
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
                                                            ],
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await widget
                                                                .idCliente!
                                                                .update(
                                                                    createClientesRecordData(
                                                              cliente:
                                                                  createDataTypeClienteStruct(
                                                                fieldValues: {
                                                                  'producto':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    getDataTypeProductosFirestoreData(
                                                                      createDataTypeProductosStruct(
                                                                        nombreProd:
                                                                            test1Item.nombreProd,
                                                                        valorProd:
                                                                            test1Item.valorProd,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                },
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                            ));
                                                          },
                                                          child: Icon(
                                                            Icons.close,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 24.0,
                                                          ),
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final _datePickedDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate:
                                                    (getCurrentTimestamp ??
                                                        DateTime(1900)),
                                                lastDate: (_model.datePicked ??
                                                    DateTime(2050)),
                                                builder: (context, child) {
                                                  return wrapInMaterialDatePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    headerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Inter Tight',
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                    pickerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    pickerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    selectedDateTimeBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    selectedDateTimeForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    actionButtonForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );

                                              if (_datePickedDate != null) {
                                                safeSetState(() {
                                                  _model.datePicked = DateTime(
                                                    _datePickedDate.year,
                                                    _datePickedDate.month,
                                                    _datePickedDate.day,
                                                  );
                                                });
                                              } else if (_model.datePicked !=
                                                  null) {
                                                safeSetState(() {
                                                  _model.datePicked =
                                                      getCurrentTimestamp;
                                                });
                                              }
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'uwlfqv5j' /* Fecha de Pago del Producto */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Pagar'),
                                                            content: Text(
                                                                '¿Su cliente le ha pagado? Todos sus productos fiados se borrarán.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Confirm'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                _model.queryPaga =
                                                    await queryClientesRecordOnce(
                                                  queryBuilder:
                                                      (clientesRecord) =>
                                                          clientesRecord.where(
                                                    'cliente.cedula',
                                                    isEqualTo: widget.cedula,
                                                  ),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                _model.tempCount = _model
                                                        .queryPaga!
                                                        .cliente
                                                        .producto
                                                        .length -
                                                    1;
                                                safeSetState(() {});
                                                while (_model.queryPaga!.cliente
                                                        .producto.length >=
                                                    1) {
                                                  _model.addToDtProdToHistorial(
                                                      _model.queryPaga!.cliente
                                                          .producto
                                                          .elementAtOrNull(_model
                                                              .tempCount!)!);
                                                  safeSetState(() {});

                                                  await widget.idCliente!.update(
                                                      createClientesRecordData(
                                                    cliente:
                                                        createDataTypeClienteStruct(
                                                      fieldValues: {
                                                        'producto': FieldValue
                                                            .arrayRemove([
                                                          getDataTypeProductosFirestoreData(
                                                            createDataTypeProductosStruct(
                                                              nombreProd: (_model
                                                                      .queryPaga
                                                                      ?.cliente
                                                                      .producto
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .tempCount!))
                                                                  ?.nombreProd,
                                                              valorProd: (_model
                                                                      .queryPaga
                                                                      ?.cliente
                                                                      .producto
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .tempCount!))
                                                                  ?.valorProd,
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                            true,
                                                          )
                                                        ]),
                                                        'historialProd':
                                                            FieldValue
                                                                .arrayUnion([
                                                          getDataTypeProductoHistorialFirestoreData(
                                                            createDataTypeProductoHistorialStruct(
                                                              nombreProd: (_model
                                                                      .queryPaga
                                                                      ?.cliente
                                                                      .producto
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .tempCount!))
                                                                  ?.nombreProd,
                                                              valorProd: (_model
                                                                      .queryPaga
                                                                      ?.cliente
                                                                      .producto
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .tempCount!))
                                                                  ?.valorProd,
                                                              diaPagado:
                                                                  getCurrentTimestamp,
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                            true,
                                                          )
                                                        ]),
                                                      },
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));
                                                  _model.tempCount =
                                                      _model.tempCount! + -1;
                                                  safeSetState(() {});
                                                }
                                                _model.dateDTProdToHistorial =
                                                    getCurrentTimestamp;
                                                safeSetState(() {});
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Productos pagados.',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'cs2ofbsh' /* Pagar */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.queryHistorial =
                                              await queryClientesRecordOnce(
                                            queryBuilder: (clientesRecord) =>
                                                clientesRecord.where(
                                              'cliente.cedula',
                                              isEqualTo: widget.cedula,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);

                                          context.pushNamed(
                                            HistorialPagosWidget.routeName,
                                            queryParameters: {
                                              'dtPassed': serializeParam(
                                                _model.queryHistorial?.cliente
                                                    .historialProd,
                                                ParamType.DataStruct,
                                                isList: true,
                                              ),
                                            }.withoutNulls,
                                          );

                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '3upxvyh0' /* Historial */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 2.0,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          hoverBorderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          hoverTextColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 700.0,
                    maxHeight: 65.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.tempCount = 0;
                        _model.tempSum1 = 0.0;
                        safeSetState(() {});
                        _model.finalQuery =
                            await ClientesRecord.getDocumentOnce(
                                widget.idCliente!);
                        while (_model.tempCount! <
                            _model.finalQuery!.cliente.producto.length) {
                          _model.tempSum1 = (double var1, double var2) {
                            return var2 += var1;
                          }(
                              _model.finalQuery!.cliente.producto
                                  .elementAtOrNull(_model.tempCount!)!
                                  .valorProd,
                              _model.tempSum1!);
                          _model.tempCount = _model.tempCount! + 1;
                          safeSetState(() {});
                        }

                        await widget.idCliente!
                            .update(createClientesRecordData(
                          cliente: createDataTypeClienteStruct(
                            total: _model.tempSum1,
                            clearUnsetFields: false,
                          ),
                        ));
                        await Future.delayed(const Duration(milliseconds: 500));
                        if (!(_model.finalQuery!.cliente.producto.isNotEmpty)) {
                          await widget.idCliente!
                              .update(createClientesRecordData(
                            cliente: createDataTypeClienteStruct(
                              isFiando: false,
                              clearUnsetFields: false,
                            ),
                          ));
                        } else {
                          await widget.idCliente!
                              .update(createClientesRecordData(
                            cliente: createDataTypeClienteStruct(
                              isFiando: true,
                              fechaPago: _model.datePicked,
                              clearUnsetFields: false,
                            ),
                          ));
                        }

                        context.pushNamed(
                          ListaProdClienWidget.routeName,
                          queryParameters: {
                            'tenderoRef': serializeParam(
                              widget.tenderoRef,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'ioedc5d2' /* Enviar */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
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
