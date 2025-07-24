import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cliente_config_widget.dart' show ClienteConfigWidget;
import 'package:flutter/material.dart';

class ClienteConfigModel extends FlutterFlowModel<ClienteConfigWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ClientesRecord>? queryConfigEmailCliente;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
