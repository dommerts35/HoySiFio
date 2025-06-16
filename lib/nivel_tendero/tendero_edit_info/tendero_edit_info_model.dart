import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tendero_edit_info_widget.dart' show TenderoEditInfoWidget;
import 'package:flutter/material.dart';

class TenderoEditInfoModel extends FlutterFlowModel<TenderoEditInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tiendaNameEdit widget.
  FocusNode? tiendaNameEditFocusNode;
  TextEditingController? tiendaNameEditTextController;
  String? Function(BuildContext, String?)?
      tiendaNameEditTextControllerValidator;
  String? _tiendaNameEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese el nombre de su tienda';
    }

    if (val.length < 2) {
      return 'Ingrese el nombre de su tienda con al menos 2 carácteres';
    }
    if (val.length > 20) {
      return 'Ingrese el nombre de su tienda con  menos de 20 carácteres';
    }

    return null;
  }

  // State field(s) for emailEdit widget.
  FocusNode? emailEditFocusNode;
  TextEditingController? emailEditTextController;
  String? Function(BuildContext, String?)? emailEditTextControllerValidator;
  String? _emailEditTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su email';
    }

    if (val.length < 10) {
      return 'Ingrese un email válido';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingrese un email válido';
    }
    return null;
  }

  // State field(s) for numCuentaEdit widget.
  FocusNode? numCuentaEditFocusNode;
  TextEditingController? numCuentaEditTextController;
  String? Function(BuildContext, String?)? numCuentaEditTextControllerValidator;
  String? _numCuentaEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su número de cuenta';
    }

    if (val.length < 8) {
      return 'Ingrese su número de cuenta.';
    }

    return null;
  }

  // State field(s) for nombreBancoEdit widget.
  FocusNode? nombreBancoEditFocusNode;
  TextEditingController? nombreBancoEditTextController;
  String? Function(BuildContext, String?)?
      nombreBancoEditTextControllerValidator;
  String? _nombreBancoEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese el nombre de su banco';
    }

    if (val.length < 3) {
      return 'Ingrese un banco válido';
    }

    return null;
  }

  // State field(s) for CheckboxListCC widget.
  bool? checkboxListCCValue;
  // State field(s) for CheckboxListCA widget.
  bool? checkboxListCAValue;
  // Stores action output result for [Firestore Query - Query a collection] action in borrarButton widget.
  int? count;
  // Stores action output result for [Firestore Query - Query a collection] action in borrarButton widget.
  List<ClientesRecord>? queryToDelete1;
  // Stores action output result for [Firestore Query - Query a collection] action in borrarButton widget.
  List<ClientesRecord>? queryToDelete2;
  // Stores action output result for [Validate Form] action in enviarButton widget.
  bool? validacionEdit;
  // Stores action output result for [Firestore Query - Query a collection] action in enviarButton widget.
  TenderosRecord? queryForComparisonNameTienda;

  @override
  void initState(BuildContext context) {
    tiendaNameEditTextControllerValidator =
        _tiendaNameEditTextControllerValidator;
    emailEditTextControllerValidator = _emailEditTextControllerValidator;
    numCuentaEditTextControllerValidator =
        _numCuentaEditTextControllerValidator;
    nombreBancoEditTextControllerValidator =
        _nombreBancoEditTextControllerValidator;
  }

  @override
  void dispose() {
    tiendaNameEditFocusNode?.dispose();
    tiendaNameEditTextController?.dispose();

    emailEditFocusNode?.dispose();
    emailEditTextController?.dispose();

    numCuentaEditFocusNode?.dispose();
    numCuentaEditTextController?.dispose();

    nombreBancoEditFocusNode?.dispose();
    nombreBancoEditTextController?.dispose();
  }
}
