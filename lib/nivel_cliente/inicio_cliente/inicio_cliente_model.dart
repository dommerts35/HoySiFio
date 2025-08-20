import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'inicio_cliente_widget.dart' show InicioClienteWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class InicioClienteModel extends FlutterFlowModel<InicioClienteWidget> {
  ///  Local state fields for this page.

  String? urImg;

  int tempSetCountCliente = 0;

  int tempItemCountHistorial = 0;

  int? tiempo;

  String? tiempoGlobalToString;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in inicioCliente widget.
  List<ClientesRecord>? queryOnLoadClientes;
  // Stores action output result for [Custom Action - retornarStringAInt] action in inicioCliente widget.
  int? tiempoResultCliente;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Alert Dialog - Custom Dialog] action in ContainerLogoff widget.
  bool? isLogoff;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
