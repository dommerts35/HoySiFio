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

Future<double> normalizarValorNumerico(String input) async {
  // 1. Verificación rápida para valores ya normalizados (evita reprocesar)
  if (input.contains(RegExp(r'^\d+\.\d{2}$'))) {
    return double.tryParse(input) ?? 0.0;
  }

  // 2. Limpieza del input original
  String cleaned =
      input.replaceAll(RegExp(r'[^\d.,]'), '').replaceAll(',', '.');

  // 3. Lógica de centavos (convertir "0,1" → 0.01)
  if (cleaned.split('.').length == 2) {
    String parteDecimal = cleaned.split('.')[1];
    if (parteDecimal.length == 1) {
      // Ej: "0.1"
      cleaned = '${cleaned.split('.')[0]}.0${parteDecimal}';
    }
  }

  // 4. Conversión final con protección
  return double.tryParse(cleaned) ?? 0.0;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
