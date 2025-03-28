import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth_signing_in_widget.dart' show AuthSigningInWidget;
import 'package:flutter/material.dart';

class AuthSigningInModel extends FlutterFlowModel<AuthSigningInWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for tabInicioSesion widget.
  TabController? tabInicioSesionController;
  int get tabInicioSesionCurrentIndex =>
      tabInicioSesionController != null ? tabInicioSesionController!.index : 0;

  // State field(s) for emailAddress_Tendero widget.
  FocusNode? emailAddressTenderoFocusNode;
  TextEditingController? emailAddressTenderoTextController;
  String? Function(BuildContext, String?)?
      emailAddressTenderoTextControllerValidator;
  // State field(s) for password_Tendero widget.
  FocusNode? passwordTenderoFocusNode;
  TextEditingController? passwordTenderoTextController;
  late bool passwordTenderoVisibility;
  String? Function(BuildContext, String?)?
      passwordTenderoTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_tendero widget.
  TenderosRecord? queryInicioTendero;
  // State field(s) for nombreCompleto_Cliente widget.
  FocusNode? nombreCompletoClienteFocusNode;
  TextEditingController? nombreCompletoClienteTextController;
  String? Function(BuildContext, String?)?
      nombreCompletoClienteTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_cliente widget.
  List<ClientesRecord>? query;

  @override
  void initState(BuildContext context) {
    passwordTenderoVisibility = false;
  }

  @override
  void dispose() {
    tabInicioSesionController?.dispose();
    emailAddressTenderoFocusNode?.dispose();
    emailAddressTenderoTextController?.dispose();

    passwordTenderoFocusNode?.dispose();
    passwordTenderoTextController?.dispose();

    nombreCompletoClienteFocusNode?.dispose();
    nombreCompletoClienteTextController?.dispose();
  }
}
