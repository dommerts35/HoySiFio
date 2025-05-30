import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'check_cuentas_comp_model.dart';
export 'check_cuentas_comp_model.dart';

class CheckCuentasCompWidget extends StatefulWidget {
  const CheckCuentasCompWidget({
    super.key,
    this.idCliente,
    this.indexFromhPP,
  });

  final DocumentReference? idCliente;
  final int? indexFromhPP;

  @override
  State<CheckCuentasCompWidget> createState() => _CheckCuentasCompWidgetState();
}

class _CheckCuentasCompWidgetState extends State<CheckCuentasCompWidget> {
  late CheckCuentasCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckCuentasCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        shape: BoxShape.rectangle,
      ),
      child: Align(
        alignment: AlignmentDirectional(1.0, 0.0),
        child: StreamBuilder<ClientesRecord>(
          stream: ClientesRecord.getDocument(widget.idCliente!),
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

            final checkboxClientesRecord = snapshot.data!;

            return Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: CircleBorder(),
                ),
                unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
              ),
              child: Checkbox(
                value: _model.checkboxValue ??= false,
                onChanged: (newValue) async {
                  safeSetState(() => _model.checkboxValue = newValue!);
                  if (newValue!) {
                    _model.dtHP = checkboxClientesRecord
                        .cliente.historialPorPagarProd
                        .elementAtOrNull(widget.indexFromhPP!);
                    safeSetState(() {});

                    await widget.idCliente!.update(createClientesRecordData(
                      cliente: createDataTypeClienteStruct(
                        fieldValues: {
                          'historialPorPagarSelectedList':
                              FieldValue.arrayUnion([
                            getDataTypeHistorialPagoFirestoreData(
                              updateDataTypeHistorialPagoStruct(
                                _model.dtHP,
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
                    await widget.idCliente!.update(createClientesRecordData(
                      cliente: createDataTypeClienteStruct(
                        fieldValues: {
                          'historialPorPagarSelectedList':
                              FieldValue.arrayRemove([
                            getDataTypeHistorialPagoFirestoreData(
                              updateDataTypeHistorialPagoStruct(
                                _model.dtHP,
                                clearUnsetFields: false,
                              ),
                              true,
                            )
                          ]),
                        },
                        clearUnsetFields: false,
                      ),
                    ));
                    _model.dtHP = null;
                    safeSetState(() {});
                  }
                },
                side: (FlutterFlowTheme.of(context).alternate != null)
                    ? BorderSide(
                        width: 2,
                        color: FlutterFlowTheme.of(context).alternate,
                      )
                    : null,
                activeColor: FlutterFlowTheme.of(context).primary,
                checkColor: FlutterFlowTheme.of(context).info,
              ),
            );
          },
        ),
      ),
    );
  }
}
