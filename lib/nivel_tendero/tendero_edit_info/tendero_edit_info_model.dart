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
    if (val.length > 30) {
      return 'Ingrese el nombre de su tienda con  menos de 30 carácteres';
    }

    return null;
  }

  // State field(s) for tenderoNameEdit widget.
  FocusNode? tenderoNameEditFocusNode;
  TextEditingController? tenderoNameEditTextController;
  String? Function(BuildContext, String?)?
      tenderoNameEditTextControllerValidator;
  String? _tenderoNameEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su nombre';
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

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingrese un email válido';
    }
    return null;
  }

  // State field(s) for ciEdit widget.
  FocusNode? ciEditFocusNode;
  TextEditingController? ciEditTextController;
  String? Function(BuildContext, String?)? ciEditTextControllerValidator;
  String? _ciEditTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su cédula';
    }

    if (val.length < 10) {
      return 'Ingrese una cédula válida';
    }
    if (val.length > 10) {
      return 'Ingrese una cédula válida';
    }

    return null;
  }

  // State field(s) for numTelfEdit widget.
  FocusNode? numTelfEditFocusNode;
  TextEditingController? numTelfEditTextController;
  String? Function(BuildContext, String?)? numTelfEditTextControllerValidator;
  String? _numTelfEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su número de teléfono';
    }

    if (val.length < 10) {
      return 'Ingrese un número válido';
    }
    if (val.length > 10) {
      return 'Ingrese un número válido';
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

    return null;
  }

  // State field(s) for nombreTitularBancoEdit widget.
  FocusNode? nombreTitularBancoEditFocusNode;
  TextEditingController? nombreTitularBancoEditTextController;
  String? Function(BuildContext, String?)?
      nombreTitularBancoEditTextControllerValidator;
  String? _nombreTitularBancoEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese el nombre del titular de la cuenta bancaria';
    }

    return null;
  }

  // State field(s) for CheckboxListCC widget.
  bool? checkboxListCCValue;
  // State field(s) for CheckboxListCA widget.
  bool? checkboxListCAValue;
  // Stores action output result for [Firestore Query - Query a collection] action in borrarButton widget.
  int? count;
  // Stores action output result for [Validate Form] action in enviarButton widget.
  bool? validacionEdit;
  // Stores action output result for [Firestore Query - Query a collection] action in enviarButton widget.
  TenderosRecord? queryForComparisonNameTienda;

  @override
  void initState(BuildContext context) {
    tiendaNameEditTextControllerValidator =
        _tiendaNameEditTextControllerValidator;
    tenderoNameEditTextControllerValidator =
        _tenderoNameEditTextControllerValidator;
    emailEditTextControllerValidator = _emailEditTextControllerValidator;
    ciEditTextControllerValidator = _ciEditTextControllerValidator;
    numTelfEditTextControllerValidator = _numTelfEditTextControllerValidator;
    numCuentaEditTextControllerValidator =
        _numCuentaEditTextControllerValidator;
    nombreBancoEditTextControllerValidator =
        _nombreBancoEditTextControllerValidator;
    nombreTitularBancoEditTextControllerValidator =
        _nombreTitularBancoEditTextControllerValidator;
  }

  @override
  void dispose() {
    tiendaNameEditFocusNode?.dispose();
    tiendaNameEditTextController?.dispose();

    tenderoNameEditFocusNode?.dispose();
    tenderoNameEditTextController?.dispose();

    emailEditFocusNode?.dispose();
    emailEditTextController?.dispose();

    ciEditFocusNode?.dispose();
    ciEditTextController?.dispose();

    numTelfEditFocusNode?.dispose();
    numTelfEditTextController?.dispose();

    numCuentaEditFocusNode?.dispose();
    numCuentaEditTextController?.dispose();

    nombreBancoEditFocusNode?.dispose();
    nombreBancoEditTextController?.dispose();

    nombreTitularBancoEditFocusNode?.dispose();
    nombreTitularBancoEditTextController?.dispose();
  }
}
