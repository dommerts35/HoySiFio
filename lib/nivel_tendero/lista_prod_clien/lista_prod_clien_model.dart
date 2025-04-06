import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lista_prod_clien_widget.dart' show ListaProdClienWidget;
import 'package:flutter/material.dart';

class ListaProdClienModel extends FlutterFlowModel<ListaProdClienWidget> {
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

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
