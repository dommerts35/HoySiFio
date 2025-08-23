// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> normalizarValorParaAceptacionDePago(String input) async {
  // 1. Limpieza básica (solo números, comas y puntos)
  String cleaned =
      input.replaceAll(RegExp(r'[^\d.,]'), '').replaceAll(',', '.');

  // 2. Manejo de múltiples puntos decimales
  if (cleaned.split('.').length > 2) {
    cleaned = cleaned.replaceFirst('.', '').replaceFirst('.', '.');
  }

  // 3. Conversión directa sin modificar decimales
  double valor = double.tryParse(cleaned) ?? 0.0;

  // 4. Forzar 2 decimales (opcional, para consistencia)
  return double.parse(valor.toStringAsFixed(2));
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
