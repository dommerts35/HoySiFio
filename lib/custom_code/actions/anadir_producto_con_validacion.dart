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

Future<String> anadirProductoConValidacion(
  DocumentReference idCliente,
  String nombreProd,
  String valorText,
  bool viviendaProp,
  double deudaActual,
) async {
  final valor = double.tryParse(valorText) ?? 0.0;

  if (!validarLimiteCredito(deudaActual, valor, viviendaProp)) {
    return "No puede superar el límite de crédito.";
  }

  await idCliente.update({
    'cliente.producto': FieldValue.arrayUnion([
      {
        'nombreProd': nombreProd,
        'valorProd': valor,
      }
    ]),
  });

  return "Producto añadido correctamente.";
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
