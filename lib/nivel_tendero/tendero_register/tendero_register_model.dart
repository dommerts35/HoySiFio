import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tendero_register_widget.dart' show TenderoRegisterWidget;
import 'package:flutter/material.dart';

class TenderoRegisterModel extends FlutterFlowModel<TenderoRegisterWidget> {
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
  // State field(s) for tiendaNombre_Tendero widget.
  FocusNode? tiendaNombreTenderoFocusNode;
  TextEditingController? tiendaNombreTenderoTextController;
  String? Function(BuildContext, String?)?
      tiendaNombreTenderoTextControllerValidator;
  String? _tiendaNombreTenderoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese el nombre de su tienda';
    }

    return null;
  }

  // State field(s) for nombre_Tendero widget.
  FocusNode? nombreTenderoFocusNode;
  TextEditingController? nombreTenderoTextController;
  String? Function(BuildContext, String?)? nombreTenderoTextControllerValidator;
  // State field(s) for emailAddress_Tendero widget.
  FocusNode? emailAddressTenderoFocusNode;
  TextEditingController? emailAddressTenderoTextController;
  String? Function(BuildContext, String?)?
      emailAddressTenderoTextControllerValidator;
  String? _emailAddressTenderoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingrese un email válido';
    }
    return null;
  }

  // State field(s) for phoneNumber_Tendero widget.
  FocusNode? phoneNumberTenderoFocusNode;
  TextEditingController? phoneNumberTenderoTextController;
  String? Function(BuildContext, String?)?
      phoneNumberTenderoTextControllerValidator;
  String? _phoneNumberTenderoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su número de teléfono';
    }

    if (val.length < 10) {
      return 'Ingrese un número de teléfono válido';
    }
    if (val.length > 10) {
      return 'Ingrese un número de teléfono válido';
    }

    return null;
  }

  // State field(s) for NumCuenta_tendero widget.
  FocusNode? numCuentaTenderoFocusNode;
  TextEditingController? numCuentaTenderoTextController;
  String? Function(BuildContext, String?)?
      numCuentaTenderoTextControllerValidator;
  String? _numCuentaTenderoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su número de cuenta';
    }

    return null;
  }

  // State field(s) for Banco_tendero widget.
  FocusNode? bancoTenderoFocusNode;
  TextEditingController? bancoTenderoTextController;
  String? Function(BuildContext, String?)? bancoTenderoTextControllerValidator;
  String? _bancoTenderoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su banco';
    }

    return null;
  }

  // State field(s) for duenoBanco_tendero widget.
  FocusNode? duenoBancoTenderoFocusNode;
  TextEditingController? duenoBancoTenderoTextController;
  String? Function(BuildContext, String?)?
      duenoBancoTenderoTextControllerValidator;
  // State field(s) for password_Tendero widget.
  FocusNode? passwordTenderoFocusNode;
  TextEditingController? passwordTenderoTextController;
  late bool passwordTenderoVisibility;
  String? Function(BuildContext, String?)?
      passwordTenderoTextControllerValidator;
  String? _passwordTenderoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su contraseña';
    }

    if (val.length < 8) {
      return 'Mínimo 8 carácteres';
    }
    if (val.length > 16) {
      return 'Máximo 16 carácteres';
    }
    if (!RegExp(
            '^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*()_+{}\\[\\]:;<>,.?\\~]).{8,}\$')
        .hasMatch(val)) {
      return 'La contraseña no cumple los requisitos.';
    }
    return null;
  }

  // State field(s) for passwordC_Tendero widget.
  FocusNode? passwordCTenderoFocusNode;
  TextEditingController? passwordCTenderoTextController;
  late bool passwordCTenderoVisibility;
  String? Function(BuildContext, String?)?
      passwordCTenderoTextControllerValidator;
  String? _passwordCTenderoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirme su contraseña';
    }

    if (val.length < 8) {
      return 'Mínimo 8 carácteres';
    }
    if (val.length > 16) {
      return 'Máximo 16 carácteres';
    }
    if (!RegExp(
            '^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#\$%^&*()_+{}\\[\\]:;<>,.?\\~]).{8,}\$')
        .hasMatch(val)) {
      return 'La contraseña no cumple los requisitos.';
    }
    return null;
  }

  // State field(s) for pin_Tendero widget.
  FocusNode? pinTenderoFocusNode;
  TextEditingController? pinTenderoTextController;
  late bool pinTenderoVisibility;
  String? Function(BuildContext, String?)? pinTenderoTextControllerValidator;
  String? _pinTenderoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese su PIN';
    }

    if (val.length < 4) {
      return 'Ingrese su PIN';
    }
    if (val.length > 4) {
      return 'Ingrese su PIN';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in btn_tenderoReg widget.
  bool? validarReg;
  // Stores action output result for [Custom Action - validateEmail] action in btn_tenderoReg widget.
  bool? validationEmail;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_tenderoReg widget.
  TenderosRecord? queryForMail;
  // Stores action output result for [Firestore Query - Query a collection] action in btn_tenderoReg widget.
  TenderosRecord? queryForNombreTienda;

  @override
  void initState(BuildContext context) {
    tiendaNombreTenderoTextControllerValidator =
        _tiendaNombreTenderoTextControllerValidator;
    emailAddressTenderoTextControllerValidator =
        _emailAddressTenderoTextControllerValidator;
    phoneNumberTenderoTextControllerValidator =
        _phoneNumberTenderoTextControllerValidator;
    numCuentaTenderoTextControllerValidator =
        _numCuentaTenderoTextControllerValidator;
    bancoTenderoTextControllerValidator = _bancoTenderoTextControllerValidator;
    passwordTenderoVisibility = false;
    passwordTenderoTextControllerValidator =
        _passwordTenderoTextControllerValidator;
    passwordCTenderoVisibility = false;
    passwordCTenderoTextControllerValidator =
        _passwordCTenderoTextControllerValidator;
    pinTenderoVisibility = false;
    pinTenderoTextControllerValidator = _pinTenderoTextControllerValidator;
  }

  @override
  void dispose() {
    tiendaNombreTenderoFocusNode?.dispose();
    tiendaNombreTenderoTextController?.dispose();

    nombreTenderoFocusNode?.dispose();
    nombreTenderoTextController?.dispose();

    emailAddressTenderoFocusNode?.dispose();
    emailAddressTenderoTextController?.dispose();

    phoneNumberTenderoFocusNode?.dispose();
    phoneNumberTenderoTextController?.dispose();

    numCuentaTenderoFocusNode?.dispose();
    numCuentaTenderoTextController?.dispose();

    bancoTenderoFocusNode?.dispose();
    bancoTenderoTextController?.dispose();

    duenoBancoTenderoFocusNode?.dispose();
    duenoBancoTenderoTextController?.dispose();

    passwordTenderoFocusNode?.dispose();
    passwordTenderoTextController?.dispose();

    passwordCTenderoFocusNode?.dispose();
    passwordCTenderoTextController?.dispose();

    pinTenderoFocusNode?.dispose();
    pinTenderoTextController?.dispose();
  }
}
