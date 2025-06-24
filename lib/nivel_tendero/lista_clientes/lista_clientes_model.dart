import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lista_clientes_widget.dart' show ListaClientesWidget;
import 'package:flutter/material.dart';

class ListaClientesModel extends FlutterFlowModel<ListaClientesWidget> {
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

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
