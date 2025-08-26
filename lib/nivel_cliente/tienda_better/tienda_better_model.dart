import '/backend/backend.dart';
import '/components/nav_bar_cliente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'tienda_better_widget.dart' show TiendaBetterWidget;
import 'package:flutter/material.dart';

class TiendaBetterModel extends FlutterFlowModel<TiendaBetterWidget> {
  ///  Local state fields for this page.

  int tempSetCountCliente = 0;

  int tempItemCountHistorial = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in tiendaBetter widget.
  List<ClientesRecord>? queryOnLoadClientes;
  // Stores action output result for [Custom Action - checkInternetConnection] action in tiendaBetter widget.
  bool? isInternetGood;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in iconLogOff widget.
  bool? isLogoff;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Model for navBarCliente component.
  late NavBarClienteModel navBarClienteModel;

  @override
  void initState(BuildContext context) {
    navBarClienteModel = createModel(context, () => NavBarClienteModel());
  }

  @override
  void dispose() {
    navBarClienteModel.dispose();
  }
}
