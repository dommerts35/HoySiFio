import '/components/nav_bar_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nav_bar_cliente_widget.dart' show NavBarClienteWidget;
import 'package:flutter/material.dart';

class NavBarClienteModel extends FlutterFlowModel<NavBarClienteWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for navBarItem component.
  late NavBarItemModel navBarItemModel1;
  // Model for navBarItem component.
  late NavBarItemModel navBarItemModel2;
  // Model for navBarItem component.
  late NavBarItemModel navBarItemModel3;

  @override
  void initState(BuildContext context) {
    navBarItemModel1 = createModel(context, () => NavBarItemModel());
    navBarItemModel2 = createModel(context, () => NavBarItemModel());
    navBarItemModel3 = createModel(context, () => NavBarItemModel());
  }

  @override
  void dispose() {
    navBarItemModel1.dispose();
    navBarItemModel2.dispose();
    navBarItemModel3.dispose();
  }
}
