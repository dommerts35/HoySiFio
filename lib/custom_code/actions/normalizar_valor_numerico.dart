// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double> normalizarValorNumerico(String input) async {
  // Elimina espacios y caracteres no numéricos (excepto , y .)
  String cleaned = input.replaceAll(RegExp(r'[^\d.,]'), '');

  // Reemplaza todas las comas por puntos para estandarizar
  cleaned = cleaned.replaceAll(',', '.');

  // Maneja casos donde hay múltiples puntos decimales
  if (cleaned.split('.').length > 2) {
    // Conserva solo el primer punto como decimal
    cleaned = cleaned.replaceFirst('.', '');
    cleaned = cleaned.replaceFirst('.', '.');
  }

  // Convierte a double
  final valor = double.tryParse(cleaned);

  if (valor == null || valor.isNaN) {
    // Devuelve 0.0 en lugar de lanzar excepción para mejor manejo en FlutterFlow
    return 0.0;
  }

  // Redondea a 2 decimales para consistencia
  return double.parse(valor.toStringAsFixed(2));
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
