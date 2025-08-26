import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'terms_of_service_login_widget.dart' show TermsOfServiceLoginWidget;
import 'package:flutter/material.dart';

class TermsOfServiceLoginModel
    extends FlutterFlowModel<TermsOfServiceLoginWidget> {
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
  // Stores action output result for [Custom Action - checkInternetConnection] action in termsOfServiceLogin widget.
  bool? isInternetGood;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
