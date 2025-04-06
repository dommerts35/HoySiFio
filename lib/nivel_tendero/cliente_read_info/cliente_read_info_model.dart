import '/flutter_flow/flutter_flow_util.dart';
import 'cliente_read_info_widget.dart' show ClienteReadInfoWidget;
import 'package:flutter/material.dart';

class ClienteReadInfoModel extends FlutterFlowModel<ClienteReadInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullNameRead widget.
  FocusNode? fullNameReadFocusNode;
  TextEditingController? fullNameReadTextController;
  String? Function(BuildContext, String?)? fullNameReadTextControllerValidator;
  String? _fullNameReadTextControllerValidator(
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

  // State field(s) for secondNameRead widget.
  FocusNode? secondNameReadFocusNode;
  TextEditingController? secondNameReadTextController;
  String? Function(BuildContext, String?)?
      secondNameReadTextControllerValidator;
  String? _secondNameReadTextControllerValidator(
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

  // State field(s) for ceduRead widget.
  FocusNode? ceduReadFocusNode;
  TextEditingController? ceduReadTextController;
  String? Function(BuildContext, String?)? ceduReadTextControllerValidator;
  String? _ceduReadTextControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for phoneNumberRead widget.
  FocusNode? phoneNumberReadFocusNode;
  TextEditingController? phoneNumberReadTextController;
  String? Function(BuildContext, String?)?
      phoneNumberReadTextControllerValidator;
  String? _phoneNumberReadTextControllerValidator(
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

  // State field(s) for direccionRead widget.
  FocusNode? direccionReadFocusNode;
  TextEditingController? direccionReadTextController;
  String? Function(BuildContext, String?)? direccionReadTextControllerValidator;
  String? _direccionReadTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '31ex3eos' /* Ingrese la dirección del clien... */,
      );
    }

    return null;
  }

  // State field(s) for emailRead widget.
  FocusNode? emailReadFocusNode;
  TextEditingController? emailReadTextController;
  String? Function(BuildContext, String?)? emailReadTextControllerValidator;
  String? _emailReadTextControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for viviendaRead widget.
  FocusNode? viviendaReadFocusNode;
  TextEditingController? viviendaReadTextController;
  String? Function(BuildContext, String?)? viviendaReadTextControllerValidator;

  @override
  void initState(BuildContext context) {
    fullNameReadTextControllerValidator = _fullNameReadTextControllerValidator;
    secondNameReadTextControllerValidator =
        _secondNameReadTextControllerValidator;
    ceduReadTextControllerValidator = _ceduReadTextControllerValidator;
    phoneNumberReadTextControllerValidator =
        _phoneNumberReadTextControllerValidator;
    direccionReadTextControllerValidator =
        _direccionReadTextControllerValidator;
    emailReadTextControllerValidator = _emailReadTextControllerValidator;
  }

  @override
  void dispose() {
    fullNameReadFocusNode?.dispose();
    fullNameReadTextController?.dispose();

    secondNameReadFocusNode?.dispose();
    secondNameReadTextController?.dispose();

    ceduReadFocusNode?.dispose();
    ceduReadTextController?.dispose();

    phoneNumberReadFocusNode?.dispose();
    phoneNumberReadTextController?.dispose();

    direccionReadFocusNode?.dispose();
    direccionReadTextController?.dispose();

    emailReadFocusNode?.dispose();
    emailReadTextController?.dispose();

    viviendaReadFocusNode?.dispose();
    viviendaReadTextController?.dispose();
  }
}
