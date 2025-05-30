import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'check_cuentas_comp_widget.dart' show CheckCuentasCompWidget;
import 'package:flutter/material.dart';

class CheckCuentasCompModel extends FlutterFlowModel<CheckCuentasCompWidget> {
  ///  Local state fields for this component.

  DataTypeHistorialPagoStruct? dtHP;
  void updateDtHPStruct(Function(DataTypeHistorialPagoStruct) updateFn) {
    updateFn(dtHP ??= DataTypeHistorialPagoStruct());
  }

  int? indexFromhPP;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
