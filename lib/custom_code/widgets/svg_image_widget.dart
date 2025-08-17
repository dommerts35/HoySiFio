// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import "package:animated_text_library_sk2998/backend/schema/enums/enums.dart"
    as animated_text_library_sk2998_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/rendering.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SvgImageWidget extends StatefulWidget {
  const SvgImageWidget({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
  });

  final double? width;
  final double? height;
  final String imageUrl;

  @override
  State<SvgImageWidget> createState() => _SvgImageWidgetState();
}

class _SvgImageWidgetState extends State<SvgImageWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: SvgPicture.network(
          widget.imageUrl,
          width: widget.width,
          height: widget.height,
        ));
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
