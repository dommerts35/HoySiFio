import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'historial_pagos_widget.dart' show HistorialPagosWidget;
import 'package:flutter/material.dart';

class HistorialPagosModel extends FlutterFlowModel<HistorialPagosWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in historialPagos widget.
  bool? isInternetGood;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in iconLogOff widget.
  bool? isLogoff;
  // State field(s) for Checkbox widget.
  Map<DataTypeHistorialPagoStruct, bool> checkboxValueMap1 = {};
  List<DataTypeHistorialPagoStruct> get checkboxCheckedItems1 =>
      checkboxValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.
  Map<DataTypeHistorialPagoStruct, bool> checkboxValueMap2 = {};
  List<DataTypeHistorialPagoStruct> get checkboxCheckedItems2 =>
      checkboxValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
