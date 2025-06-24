// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Importaciones del paquete
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroSliderWidget extends StatelessWidget {
  const IntroSliderWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final List<Slide> slides = [
      Slide(
        title: "Bienvenido",
        description: "Esta es la primera pantalla de introducción",
        pathImage: "assets/images/slide1.png",
        backgroundColor: Colors.blue,
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        descriptionStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      Slide(
        title: "Características",
        description: "Descubre todas las funciones de la app",
        pathImage: "assets/images/slide2.png",
        backgroundColor: Colors.green,
      ),
    ];

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? MediaQuery.of(context).size.height,
      child: IntroSlider(
        slides: slides,
        onDonePress: () => Navigator.of(context).pop(),
        // Personalización adicional
        skipButtonStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        nextButtonStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white24),
        ),
        doneButtonStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
