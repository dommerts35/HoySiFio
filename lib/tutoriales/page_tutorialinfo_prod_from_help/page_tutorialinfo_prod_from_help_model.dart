import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'page_tutorialinfo_prod_from_help_widget.dart'
    show PageTutorialinfoProdFromHelpWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class PageTutorialinfoProdFromHelpModel
    extends FlutterFlowModel<PageTutorialinfoProdFromHelpWidget> {
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

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}
