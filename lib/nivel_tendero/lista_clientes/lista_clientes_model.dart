import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
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

  int? tiempo;

  String? tiempoGlobalToString;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in listaClientes widget.
  TenderosRecord? tenderoReadLoad;
  // Stores action output result for [Custom Action - retornarStringAInt] action in listaClientes widget.
  int? tiempoResult;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in iconBack widget.
  bool? isLogoff;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navBarModel.dispose();
  }
}
