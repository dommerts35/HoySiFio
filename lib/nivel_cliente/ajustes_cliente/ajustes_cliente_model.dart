import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ajustes_cliente_widget.dart' show AjustesClienteWidget;
import 'package:flutter/material.dart';

class AjustesClienteModel extends FlutterFlowModel<AjustesClienteWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ajustesCliente widget.
  ClientesRecord? queryClienteAjustes;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in ContainerLogoff widget.
  bool? isLogoff;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
