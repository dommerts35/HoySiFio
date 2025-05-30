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

Future<double> calcularTotalDeuda(DocumentReference idCliente) async {
  final clienteDoc = await ClientesRecord.getDocumentOnce(idCliente);
  double sumProductos = 0.0;
  double sumHistorial = 0.0;

  if (clienteDoc?.cliente?.producto != null) {
    sumProductos = clienteDoc!.cliente.producto
        .map((p) => p.valorProd)
        .fold(0.0, (prev, curr) => prev + curr);
  }

  if (clienteDoc?.cliente?.historialPorPagarProd != null) {
    sumHistorial = clienteDoc!.cliente.historialPorPagarProd
        .map((h) => h.totalPorPagar)
        .fold(0.0, (prev, curr) => prev + curr);
  }

  return sumProductos + sumHistorial;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
