import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthroughs/wt_cliente_tienda_list_data/wt_cliente_tienda_list_data_widget.dart';
import '/walkthroughs/wt_cliente_tienda_list/wt_cliente_tienda_list_widget.dart';

// Focus widget keys for this walkthrough
final columnA8g7q99j = GlobalKey();
final listView22ndqvkr = GlobalKey();

/// ClienteTiendasList
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: columnA8g7q99j,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtClienteTiendaListDataWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: listView22ndqvkr,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtClienteTiendaListWidget(),
          ),
        ],
      ),
    ];
