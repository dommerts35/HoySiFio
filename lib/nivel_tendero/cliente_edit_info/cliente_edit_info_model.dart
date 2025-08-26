import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cliente_edit_info_widget.dart' show ClienteEditInfoWidget;
import 'package:flutter/material.dart';

class ClienteEditInfoModel extends FlutterFlowModel<ClienteEditInfoWidget> {
  ///  Local state fields for this page.

  bool isVivAlq = false;

  bool isVivProp = false;

  String? correoNew;

  bool? isCustomLimit;

  int? limitStringToInt;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - checkInternetConnection] action in clienteEditInfo widget.
  bool? isInternetGood;
  // State field(s) for fullNameEdit widget.
  FocusNode? fullNameEditFocusNode;
  TextEditingController? fullNameEditTextController;
  String? Function(BuildContext, String?)? fullNameEditTextControllerValidator;
  String? _fullNameEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese los nombres del cliente.';
    }

    if (val.length < 3) {
      return 'Ingrese el nombre con más de 3 carácteres';
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
      return 'Ingrese los apellidos del cliente.';
    }

    if (val.length < 3) {
      return 'Ingrese el apellido con más de 3 carácteres';
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

  // State field(s) for phoneNumberEdit widget.
  FocusNode? phoneNumberEditFocusNode;
  TextEditingController? phoneNumberEditTextController;
  String? Function(BuildContext, String?)?
      phoneNumberEditTextControllerValidator;
  String? _phoneNumberEditTextControllerValidator(
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

  // State field(s) for direccionEdit widget.
  FocusNode? direccionEditFocusNode;
  TextEditingController? direccionEditTextController;
  String? Function(BuildContext, String?)? direccionEditTextControllerValidator;
  String? _direccionEditTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese la dirección del cliente';
    }

    return null;
  }

  // State field(s) for emailEdit widget.
  FocusNode? emailEditFocusNode;
  TextEditingController? emailEditTextController;
  String? Function(BuildContext, String?)? emailEditTextControllerValidator;
  String? _emailEditTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese el email del cliente';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  bool isDataUploading_uploadDataPfse2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataPfse2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataPfse2 = '';

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for customLimitEdit widget.
  FocusNode? customLimitEditFocusNode;
  TextEditingController? customLimitEditTextController;
  String? Function(BuildContext, String?)?
      customLimitEditTextControllerValidator;
  // Stores action output result for [Validate Form] action in enviarButton widget.
  bool? validacionEdit;
  // Stores action output result for [Backend Call - Read Document] action in enviarButton widget.
  TenderosRecord? tenderoReadOnEditClient;

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

    customLimitEditFocusNode?.dispose();
    customLimitEditTextController?.dispose();
  }
}
