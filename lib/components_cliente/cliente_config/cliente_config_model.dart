import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cliente_config_widget.dart' show ClienteConfigWidget;
import 'package:flutter/material.dart';

class ClienteConfigModel extends FlutterFlowModel<ClienteConfigWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for pinTf widget.
  FocusNode? pinTfFocusNode;
  TextEditingController? pinTfTextController;
  String? Function(BuildContext, String?)? pinTfTextControllerValidator;
  String? _pinTfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese un PIN';
    }

    if (val.length < 4) {
      return 'Ingrese un PIN de 4 dígitos';
    }
    if (val.length > 4) {
      return 'Ingrese un PIN de 4 dígitos';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in buttonPIN widget.
  List<ClientesRecord>? queryConfigPINCliente;
  // State field(s) for contrasenaTf widget.
  FocusNode? contrasenaTfFocusNode;
  TextEditingController? contrasenaTfTextController;
  String? Function(BuildContext, String?)? contrasenaTfTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in buttonPswrd widget.
  List<ClientesRecord>? queryConfigContrasenaCliente;

  @override
  void initState(BuildContext context) {
    pinTfTextControllerValidator = _pinTfTextControllerValidator;
  }

  @override
  void dispose() {
    pinTfFocusNode?.dispose();
    pinTfTextController?.dispose();

    contrasenaTfFocusNode?.dispose();
    contrasenaTfTextController?.dispose();
  }
}
