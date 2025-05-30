import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthroughs/wt_lista_clientes_welcome/wt_lista_clientes_welcome_widget.dart';
import '/walkthroughs/wt_lista_clientes_for_tendero_barra/wt_lista_clientes_for_tendero_barra_widget.dart';
import '/walkthroughs/wt_lista_clientes_for_tendero_barra_num_clientes/wt_lista_clientes_for_tendero_barra_num_clientes_widget.dart';
import '/walkthroughs/wt_lista_clientes_log_out/wt_lista_clientes_log_out_widget.dart';
import '/walkthroughs/wt_lista_clientes_add_client/wt_lista_clientes_add_client_widget.dart';
import '/walkthroughs/wt_lista_clientes_settings/wt_lista_clientes_settings_widget.dart';
import '/walkthroughs/wt_lista_clientes_tab_list_all/wt_lista_clientes_tab_list_all_widget.dart';
import '/walkthroughs/wt_lista_clientes_tab_list_fiando/wt_lista_clientes_tab_list_fiando_widget.dart';
import '/walkthroughs/wt_lista_clientes_tab_list_sin_fiar/wt_lista_clientes_tab_list_sin_fiar_widget.dart';

// Focus widget keys for this walkthrough
final row03zsxhnr = GlobalKey();
final columnMmwga8cw = GlobalKey();
final containerIigiurjt = GlobalKey();
final iconButtonRqsreyzl = GlobalKey();
final iconButtonX1ydnyk3 = GlobalKey();
final iconButtonMhshrn88 = GlobalKey();
final tabDwsgnflt = GlobalKey();
final tabEb8iw7p0 = GlobalKey();
final tabFokde3ki = GlobalKey();

/// TenderoListaDeClientes
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: row03zsxhnr,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtListaClientesWelcomeWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: columnMmwga8cw,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtListaClientesForTenderoBarraWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: containerIigiurjt,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) =>
                WtListaClientesForTenderoBarraNumClientesWidget(),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: iconButtonRqsreyzl,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtListaClientesLogOutWidget(),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: iconButtonX1ydnyk3,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtListaClientesAddClientWidget(),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: iconButtonMhshrn88,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomLeft,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WtListaClientesSettingsWidget(),
          ),
        ],
      ),

      /// Step 7
      TargetFocus(
        keyTarget: tabDwsgnflt,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtListaClientesTabListAllWidget(),
          ),
        ],
      ),

      /// Step 8
      TargetFocus(
        keyTarget: tabEb8iw7p0,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtListaClientesTabListFiandoWidget(),
          ),
        ],
      ),

      /// Step 9
      TargetFocus(
        keyTarget: tabFokde3ki,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WtListaClientesTabListSinFiarWidget(),
          ),
        ],
      ),
    ];
