import '/flutter_flow/flutter_flow_util.dart';
import 'cliente_read_info_widget.dart' show ClienteReadInfoWidget;
import 'package:flutter/material.dart';

class ClienteReadInfoModel extends FlutterFlowModel<ClienteReadInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullNameEdit widget.
  FocusNode? fullNameEditFocusNode;
  TextEditingController? fullNameEditTextController;
  String? Function(BuildContext, String?)? fullNameEditTextControllerValidator;
  String? _fullNameEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '687r2v4n' /* Ingrese los nombres del client... */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        '8v4is5pg' /* Ingrese el nombre con más de 5... */,
      );
    }

    return null;
  }

  // State field(s) for secondNameEdit widget.
  FocusNode? secondNameEditFocusNode;
  TextEditingController? secondNameEditTextController;
  String? Function(BuildContext, String?)?
      secondNameEditTextControllerValidator;
  String? _secondNameEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8xyeg780' /* Ingrese los apellidos del clie... */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        '3efsdt5q' /* Ingrese el apellido con más de... */,
      );
    }

    return null;
  }

  // State field(s) for cedulaEdit widget.
  FocusNode? cedulaEditFocusNode;
  TextEditingController? cedulaEditTextController;
  String? Function(BuildContext, String?)? cedulaEditTextControllerValidator;
  String? _cedulaEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jgt2mo47' /* Ingrese la cédula del cliente */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'e2cxain9' /* Ingrese la cédula completa. */,
      );
    }
    if (val.length > 10) {
      return FFLocalizations.of(context).getText(
        'qa6nupq8' /* Ingrese la cédula. */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumberEdit widget.
  FocusNode? phoneNumberEditFocusNode;
  TextEditingController? phoneNumberEditTextController;
  String? Function(BuildContext, String?)?
      phoneNumberEditTextControllerValidator;
  String? _phoneNumberEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fkdxt2wn' /* Ingrese el número de teléfono ... */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'bbwwn6in' /* Ingrese el número de teléfono ... */,
      );
    }
    if (val.length > 10) {
      return FFLocalizations.of(context).getText(
        '5o7yk9ps' /* Ingrese el número de teléfono. */,
      );
    }

    return null;
  }

  // State field(s) for direccionEdit widget.
  FocusNode? direccionEditFocusNode;
  TextEditingController? direccionEditTextController;
  String? Function(BuildContext, String?)? direccionEditTextControllerValidator;
  String? _direccionEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '31ex3eos' /* Ingrese la dirección del clien... */,
      );
    }

    return null;
  }

  // State field(s) for emailEdit widget.
  FocusNode? emailEditFocusNode;
  TextEditingController? emailEditTextController;
  String? Function(BuildContext, String?)? emailEditTextControllerValidator;
  String? _emailEditTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dc4mgfzk' /* Ingrese el email del cliente */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'pvjylei9' /* Ese Email no existe */,
      );
    }
    return null;
  }

  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    fullNameEditTextControllerValidator = _fullNameEditTextControllerValidator;
    secondNameEditTextControllerValidator =
        _secondNameEditTextControllerValidator;
    cedulaEditTextControllerValidator = _cedulaEditTextControllerValidator;
    phoneNumberEditTextControllerValidator =
        _phoneNumberEditTextControllerValidator;
    direccionEditTextControllerValidator =
        _direccionEditTextControllerValidator;
    emailEditTextControllerValidator = _emailEditTextControllerValidator;
  }

  @override
  void dispose() {
    fullNameEditFocusNode?.dispose();
    fullNameEditTextController?.dispose();

    secondNameEditFocusNode?.dispose();
    secondNameEditTextController?.dispose();

    cedulaEditFocusNode?.dispose();
    cedulaEditTextController?.dispose();

    phoneNumberEditFocusNode?.dispose();
    phoneNumberEditTextController?.dispose();

    direccionEditFocusNode?.dispose();
    direccionEditTextController?.dispose();

    emailEditFocusNode?.dispose();
    emailEditTextController?.dispose();
  }
}
