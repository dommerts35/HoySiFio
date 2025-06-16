import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthroughs/wt_info_edit_data/wt_info_edit_data_widget.dart';
import '/walkthroughs/wt_info_edit_button_edit/wt_info_edit_button_edit_widget.dart';
import '/walkthroughs/wt_info_edit_button_delete/wt_info_edit_button_delete_widget.dart';
import '/walkthroughs/wt_info_edit_button_read/wt_info_edit_button_read_widget.dart';
import '/walkthroughs/wt_info_edit_cuentas/wt_info_edit_cuentas_widget.dart';
import '/walkthroughs/wt_info_edit_cuentas_historial_row/wt_info_edit_cuentas_historial_row_widget.dart';
import '/walkthroughs/wt_info_edit_comprobante/wt_info_edit_comprobante_widget.dart';
import '/walkthroughs/wt_info_edit_fiado/wt_info_edit_fiado_widget.dart';
import '/walkthroughs/wt_info_edit_prods_cantidad/wt_info_edit_prods_cantidad_widget.dart';
import '/walkthroughs/wt_info_edit_prods_nombre/wt_info_edit_prods_nombre_widget.dart';
import '/walkthroughs/wt_info_edit_prods_valor/wt_info_edit_prods_valor_widget.dart';
import '/walkthroughs/wt_info_edit_prods_anadir/wt_info_edit_prods_anadir_widget.dart';

// Focus widget keys for this walkthrough
final rowNzxu284f = GlobalKey();
final iconButton84oxlft0 = GlobalKey();
final iconButtonZwyz2l9o = GlobalKey();
final iconButtonXjfzyogm = GlobalKey();
final columnF5wlylrs = GlobalKey();
final rowL0vfsgti = GlobalKey();
final stackSh8miu7t = GlobalKey();
final columnNhblu9cp = GlobalKey();
final textFieldRz0u7lkw = GlobalKey();
final textFieldNwk9jlpz = GlobalKey();
final textFieldOejhq5lq = GlobalKey();
final button88ci7uwn = GlobalKey();

/// TenderoICPdeCliente
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: rowNzxu284f,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtInfoEditDataWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: iconButton84oxlft0,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtInfoEditButtonEditWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: iconButtonZwyz2l9o,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtInfoEditButtonDeleteWidget(),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: iconButtonXjfzyogm,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtInfoEditButtonReadWidget(),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: columnF5wlylrs,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtInfoEditCuentasWidget(),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: rowL0vfsgti,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtInfoEditCuentasHistorialRowWidget(),
          ),
        ],
      ),

      /// Step 7
      TargetFocus(
        keyTarget: stackSh8miu7t,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtInfoEditComprobanteWidget(),
          ),
        ],
      ),

      /// Step 8
      TargetFocus(
        keyTarget: columnNhblu9cp,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtInfoEditFiadoWidget(),
          ),
        ],
      ),

      /// Step 9
      TargetFocus(
        keyTarget: textFieldRz0u7lkw,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtInfoEditProdsCantidadWidget(),
          ),
        ],
      ),

      /// Step 10
      TargetFocus(
        keyTarget: textFieldNwk9jlpz,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtInfoEditProdsNombreWidget(),
          ),
        ],
      ),

      /// Step 11
      TargetFocus(
        keyTarget: textFieldOejhq5lq,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtInfoEditProdsValorWidget(),
          ),
        ],
      ),

      /// Step 12
      TargetFocus(
        keyTarget: button88ci7uwn,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtInfoEditProdsAnadirWidget(),
          ),
        ],
      ),
    ];
