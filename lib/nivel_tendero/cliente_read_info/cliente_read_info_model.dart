import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
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
      return 'Ingrese los nombres del cliente.';
    }

    if (val.length < 5) {
      return 'Ingrese el nombre con más de 5 carácteres';
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
      return 'Ingrese los apellidos del cliente.';
    }

    if (val.length < 5) {
      return 'Ingrese el apellido con más de 5 carácteres';
    }

    return null;
  }

  // State field(s) for ceduRead widget.
  FocusNode? ceduReadFocusNode;
  TextEditingController? ceduReadTextController;
  String? Function(BuildContext, String?)? ceduReadTextControllerValidator;
  String? _ceduReadTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese la cédula del cliente';
    }

    if (val.length < 10) {
      return 'Ingrese la cédula completa.';
    }
    if (val.length > 10) {
      return 'Ingrese la cédula.';
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
      return 'Ingrese el número de teléfono del cliente.';
    }

    if (val.length < 10) {
      return 'Ingrese el número de teléfono completo';
    }
    if (val.length > 10) {
      return 'Ingrese el número de teléfono.';
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
      return 'Ingrese la dirección del cliente';
    }

    return null;
  }

  // State field(s) for emailRead widget.
  FocusNode? emailReadFocusNode;
  TextEditingController? emailReadTextController;
  String? Function(BuildContext, String?)? emailReadTextControllerValidator;
  String? _emailReadTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese el email del cliente';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ese Email no existe';
    }
    return null;
  }

  // State field(s) for viviendaRead widget.
  FocusNode? viviendaReadFocusNode;
  TextEditingController? viviendaReadTextController;
  String? Function(BuildContext, String?)? viviendaReadTextControllerValidator;
  // State field(s) for codigoInicioSesionRead widget.
  FocusNode? codigoInicioSesionReadFocusNode;
  TextEditingController? codigoInicioSesionReadTextController;
  String? Function(BuildContext, String?)?
      codigoInicioSesionReadTextControllerValidator;

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

    codigoInicioSesionReadFocusNode?.dispose();
    codigoInicioSesionReadTextController?.dispose();
  }
}
