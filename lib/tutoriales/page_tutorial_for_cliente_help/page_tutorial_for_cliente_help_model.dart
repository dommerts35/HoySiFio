import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'page_tutorial_for_cliente_help_widget.dart'
    show PageTutorialForClienteHelpWidget;
import 'package:flutter/material.dart';

class PageTutorialForClienteHelpModel
    extends FlutterFlowModel<PageTutorialForClienteHelpWidget> {
  ///  Local state fields for this page.

  List<DataTypeHistorialPagoStruct> emptyDTHistorialPagoPorPagar = [];
  void addToEmptyDTHistorialPagoPorPagar(DataTypeHistorialPagoStruct item) =>
      emptyDTHistorialPagoPorPagar.add(item);
  void removeFromEmptyDTHistorialPagoPorPagar(
          DataTypeHistorialPagoStruct item) =>
      emptyDTHistorialPagoPorPagar.remove(item);
  void removeAtIndexFromEmptyDTHistorialPagoPorPagar(int index) =>
      emptyDTHistorialPagoPorPagar.removeAt(index);
  void insertAtIndexInEmptyDTHistorialPagoPorPagar(
          int index, DataTypeHistorialPagoStruct item) =>
      emptyDTHistorialPagoPorPagar.insert(index, item);
  void updateEmptyDTHistorialPagoPorPagarAtIndex(
          int index, Function(DataTypeHistorialPagoStruct) updateFn) =>
      emptyDTHistorialPagoPorPagar[index] =
          updateFn(emptyDTHistorialPagoPorPagar[index]);

  String? searchQuery;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
