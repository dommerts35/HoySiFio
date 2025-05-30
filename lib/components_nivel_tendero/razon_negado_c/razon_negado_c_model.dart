import '/flutter_flow/flutter_flow_util.dart';
import 'razon_negado_c_widget.dart' show RazonNegadoCWidget;
import 'package:flutter/material.dart';

class RazonNegadoCModel extends FlutterFlowModel<RazonNegadoCWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for razonNegado widget.
  FocusNode? razonNegadoFocusNode;
  TextEditingController? razonNegadoTextController;
  String? Function(BuildContext, String?)? razonNegadoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    razonNegadoFocusNode?.dispose();
    razonNegadoTextController?.dispose();
  }
}
