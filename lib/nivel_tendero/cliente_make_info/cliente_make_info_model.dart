import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cliente_make_info_widget.dart' show ClienteMakeInfoWidget;
import 'package:flutter/material.dart';

class ClienteMakeInfoModel extends FlutterFlowModel<ClienteMakeInfoWidget> {
  ///  Local state fields for this page.

  List<DataTypeHistorialPagoStruct> historialDefault = [];
  void addToHistorialDefault(DataTypeHistorialPagoStruct item) =>
      historialDefault.add(item);
  void removeFromHistorialDefault(DataTypeHistorialPagoStruct item) =>
      historialDefault.remove(item);
  void removeAtIndexFromHistorialDefault(int index) =>
      historialDefault.removeAt(index);
  void insertAtIndexInHistorialDefault(
          int index, DataTypeHistorialPagoStruct item) =>
      historialDefault.insert(index, item);
  void updateHistorialDefaultAtIndex(
          int index, Function(DataTypeHistorialPagoStruct) updateFn) =>
      historialDefault[index] = updateFn(historialDefault[index]);

  /// productosDefault
  List<DataTypeProductosStruct> productosDefault = [];
  void addToProductosDefault(DataTypeProductosStruct item) =>
      productosDefault.add(item);
  void removeFromProductosDefault(DataTypeProductosStruct item) =>
      productosDefault.remove(item);
  void removeAtIndexFromProductosDefault(int index) =>
      productosDefault.removeAt(index);
  void insertAtIndexInProductosDefault(
          int index, DataTypeProductosStruct item) =>
      productosDefault.insert(index, item);
  void updateProductosDefaultAtIndex(
          int index, Function(DataTypeProductosStruct) updateFn) =>
      productosDefault[index] = updateFn(productosDefault[index]);

  DocumentReference? selfClienteID;

  bool isVivProp = false;

  bool isVivAlq = false;

  String randomized = 'none';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese los nombres completos del cliente.';
    }

    return null;
  }

  // State field(s) for fullSecondName widget.
  FocusNode? fullSecondNameFocusNode;
  TextEditingController? fullSecondNameTextController;
  String? Function(BuildContext, String?)?
      fullSecondNameTextControllerValidator;
  String? _fullSecondNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese los apellidos completos de su cliente';
    }

    return null;
  }

  // State field(s) for cedula widget.
  FocusNode? cedulaFocusNode;
  TextEditingController? cedulaTextController;
  String? Function(BuildContext, String?)? cedulaTextControllerValidator;
  String? _cedulaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese el número de cédula de su cliente';
    }

    if (val.length < 10) {
      return 'El número de cédula es de 10 dígitos.';
    }
    if (val.length > 10) {
      return 'El número de cédula es de 10 dígitos.';
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese el número de teléfono de su cliente';
    }

    if (val.length < 10) {
      return 'El número de teléfono es de 10 dígitos.';
    }
    if (val.length > 10) {
      return 'El número de teléfono es de 10 dígitos.';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese el email de su cliente';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingrese el email de su cliente';
    }
    return null;
  }

  bool isDataUploading_uploadDataPfs1 = false;
  FFUploadedFile uploadedLocalFile_uploadDataPfs1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataPfs1 = '';

  // State field(s) for direccion widget.
  FocusNode? direccionFocusNode;
  TextEditingController? direccionTextController;
  String? Function(BuildContext, String?)? direccionTextControllerValidator;
  String? _direccionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingrese la Dirección domiciliaria de su cliente.';
    }

    return null;
  }

  // State field(s) for politicsCheck widget.
  bool? politicsCheckValue;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in politics widget.
  bool? isAcceptedToPolitics;
  // State field(s) for termsCheck widget.
  bool? termsCheckValue;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in termsOfServ widget.
  bool? isAcceptedToTerms;
  // State field(s) for emailSendsCheck widget.
  bool? emailSendsCheckValue;
  // Stores action output result for [Backend Call - Read Document] action in enviarButton widget.
  TenderosRecord? tenderoRead;
  // Stores action output result for [Validate Form] action in enviarButton widget.
  bool? validarMake;
  // Stores action output result for [Firestore Query - Query a collection] action in enviarButton widget.
  ClientesRecord? queryValidarCedula;
  // Stores action output result for [Firestore Query - Query a collection] action in enviarButton widget.
  ClientesRecord? queryClienteInOtherTiendas;
  // Stores action output result for [Firestore Query - Query a collection] action in enviarButton widget.
  ClientesRecord? queryForIDCliente;
  // Stores action output result for [Firestore Query - Query a collection] action in enviarButton widget.
  ClientesRecord? clienteSinContrasenaQuery;
  // Stores action output result for [Backend Call - Create Document] action in enviarButton widget.
  ClientesRecord? createdCliente;
  // Model for navBar component.
  late NavBarModel navBarModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in iconLogOff widget.
  bool? isLogoff;

  @override
  void initState(BuildContext context) {
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
    fullSecondNameTextControllerValidator =
        _fullSecondNameTextControllerValidator;
    cedulaTextControllerValidator = _cedulaTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    direccionTextControllerValidator = _direccionTextControllerValidator;
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    fullSecondNameFocusNode?.dispose();
    fullSecondNameTextController?.dispose();

    cedulaFocusNode?.dispose();
    cedulaTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    direccionFocusNode?.dispose();
    direccionTextController?.dispose();

    navBarModel.dispose();
  }
}
