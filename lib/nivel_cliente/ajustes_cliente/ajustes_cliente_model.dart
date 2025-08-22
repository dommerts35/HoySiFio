import '/backend/backend.dart';
import '/components/nav_bar_cliente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ajustes_cliente_widget.dart' show AjustesClienteWidget;
import 'package:flutter/material.dart';

class AjustesClienteModel extends FlutterFlowModel<AjustesClienteWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ajustesCliente widget.
  ClientesRecord? queryClienteAjustes;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in iconLogOff widget.
  bool? isLogoff;
  // Model for navBarCliente component.
  late NavBarClienteModel navBarClienteModel;

  @override
  void initState(BuildContext context) {
    navBarClienteModel = createModel(context, () => NavBarClienteModel());
  }

  @override
  void dispose() {
    navBarClienteModel.dispose();
  }
}
