import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cliente_first_login_widget.dart' show ClienteFirstLoginWidget;
import 'package:flutter/material.dart';

class ClienteFirstLoginModel extends FlutterFlowModel<ClienteFirstLoginWidget> {
  ///  Local state fields for this page.

  int tempCountLoginCliente = 0;

  List<DocumentReference> idsTenderos = [];
  void addToIdsTenderos(DocumentReference item) => idsTenderos.add(item);
  void removeFromIdsTenderos(DocumentReference item) =>
      idsTenderos.remove(item);
  void removeAtIndexFromIdsTenderos(int index) => idsTenderos.removeAt(index);
  void insertAtIndexInIdsTenderos(int index, DocumentReference item) =>
      idsTenderos.insert(index, item);
  void updateIdsTenderosAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      idsTenderos[index] = updateFn(idsTenderos[index]);

  bool isCuentaDeAhorros = false;

  bool isCuentaCorriente = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for codigoFirstLogin_Cliente widget.
  FocusNode? codigoFirstLoginClienteFocusNode;
  TextEditingController? codigoFirstLoginClienteTextController;
  late bool codigoFirstLoginClienteVisibility;
  String? Function(BuildContext, String?)?
      codigoFirstLoginClienteTextControllerValidator;
  // State field(s) for password_Cliente widget.
  FocusNode? passwordClienteFocusNode;
  TextEditingController? passwordClienteTextController;
  late bool passwordClienteVisibility;
  String? Function(BuildContext, String?)?
      passwordClienteTextControllerValidator;
  String? _passwordClienteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '06rlamw2' /* Ingrese su contraseña */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'jl0qoc3w' /* Mínimo 8 carácteres */,
      );
    }
    if (val.length > 16) {
      return FFLocalizations.of(context).getText(
        'uaafkw79' /* Máximo 16 carácteres */,
      );
    }
    if (!RegExp(
            '^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*()_+{}\\[\\]:;<>,.?\\~]).{8,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'x1veccke' /* Ingrese una mayúscula, un núme... */,
      );
    }
    return null;
  }

  // State field(s) for passwordC_Cliente widget.
  FocusNode? passwordCClienteFocusNode;
  TextEditingController? passwordCClienteTextController;
  late bool passwordCClienteVisibility;
  String? Function(BuildContext, String?)?
      passwordCClienteTextControllerValidator;
  String? _passwordCClienteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hw3ytojw' /* Confirme su contraseña */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        '5owoirex' /* Mínimo 8 carácteres */,
      );
    }
    if (val.length > 16) {
      return FFLocalizations.of(context).getText(
        'x0ujj1uc' /* Máximo 16 carácteres */,
      );
    }
    if (!RegExp(
            '^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*()_+{}\\[\\]:;<>,.?\\~]).{8,}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '8g685mox' /* Ingrese una mayúscula, un núme... */,
      );
    }
    return null;
  }

  // State field(s) for pin_Cliente widget.
  FocusNode? pinClienteFocusNode;
  TextEditingController? pinClienteTextController;
  late bool pinClienteVisibility;
  String? Function(BuildContext, String?)? pinClienteTextControllerValidator;
  String? _pinClienteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v83h7x56' /* Ingrese su PIN */,
      );
    }

    if (val.length < 4) {
      return FFLocalizations.of(context).getText(
        'v8ggdksr' /* Ingrese su PIN */,
      );
    }
    if (val.length > 4) {
      return FFLocalizations.of(context).getText(
        'mxedvuzv' /* Ingrese su PIN */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in btn_clienteFirstLogin widget.
  bool? validarFirstLoginCliente;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_clienteFirstLogin widget.
  List<ClientesRecord>? queryForIdsTenderos;

  @override
  void initState(BuildContext context) {
    codigoFirstLoginClienteVisibility = false;
    passwordClienteVisibility = false;
    passwordClienteTextControllerValidator =
        _passwordClienteTextControllerValidator;
    passwordCClienteVisibility = false;
    passwordCClienteTextControllerValidator =
        _passwordCClienteTextControllerValidator;
    pinClienteVisibility = false;
    pinClienteTextControllerValidator = _pinClienteTextControllerValidator;
  }

  @override
  void dispose() {
    codigoFirstLoginClienteFocusNode?.dispose();
    codigoFirstLoginClienteTextController?.dispose();

    passwordClienteFocusNode?.dispose();
    passwordClienteTextController?.dispose();

    passwordCClienteFocusNode?.dispose();
    passwordCClienteTextController?.dispose();

    pinClienteFocusNode?.dispose();
    pinClienteTextController?.dispose();
  }
}
