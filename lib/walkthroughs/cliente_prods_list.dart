import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthroughs/wt_cliente_prods_list_total/wt_cliente_prods_list_total_widget.dart';
import '/walkthroughs/wt_cliente_prods_list/wt_cliente_prods_list_widget.dart';
import '/walkthroughs/wt_cliente_prods_pago_completo/wt_cliente_prods_pago_completo_widget.dart';
import '/walkthroughs/wt_cliente_prods_voucher/wt_cliente_prods_voucher_widget.dart';

// Focus widget keys for this walkthrough
final textQhuce88l = GlobalKey();
final columnS2lj1071 = GlobalKey();
final buttonEj5u1ff9 = GlobalKey();
final buttonK9i80zuf = GlobalKey();

/// ClienteProdsList
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textQhuce88l,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtClienteProdsListTotalWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: columnS2lj1071,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtClienteProdsListWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: buttonEj5u1ff9,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtClienteProdsPagoCompletoWidget(),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: buttonK9i80zuf,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtClienteProdsVoucherWidget(),
          ),
        ],
      ),
    ];
