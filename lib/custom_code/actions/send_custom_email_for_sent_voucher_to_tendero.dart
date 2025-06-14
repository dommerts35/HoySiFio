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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendCustomEmailForSentVoucherToTendero(
    String recipientEmail,
    String recipientName,
    String emailSubject,
    String nombreTienda,
    String nombreCliente) async {
  final String oneSignalAppId = "fc0f984a-a2c3-4fdb-b633-ac1517360e8e";
  final String oneSignalRestApiKey =
      "os_v2_app_7qhzqsvcynh5xnrtvqkronqory7h3fci6sxunx4yd64ecbnxx7sutv3nhvqcfvpfqrhmbqqs2u7qbyvcklyymchv6z5smpppcbmkfey";

  // 1. Template HTML con variables dinámicas
  final htmlContent = """
  <!DOCTYPE html>
    <html>
    <head>
      <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .header { background-color: #4CAF50; color: white; padding: 20px; text-align: center; }
        .button { 
          background-color: #FF5722; 
          color: white !important; 
          padding: 12px 24px; 
          text-decoration: none; 
          border-radius: 4px; 
          display: inline-block;
        }
      </style>
    </head>
    <body>
      <div class="header">
        <h1>¡Hola $recipientName!</h1>
      </div>
      <div style="padding: 20px;">
        <p>El cliente: '$nombreCliente' ha enviado un comprobante a su tienda: '$nombreTienda'</p>
      </div>
    </body>
    </html>
  """;

  // 2. Configurar petición a OneSignal
  final response = await http.post(
    Uri.parse('https://onesignal.com/api/v1/notifications'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Key $oneSignalRestApiKey',
    },
    body: jsonEncode({
      'app_id': oneSignalAppId,
      'email_subject': emailSubject,
      'email_body': htmlContent,
      'email_from_name': 'HoySíFio', // Personalizable
      'email_from_address': 'hoysifioapp@hoysifio.org',
      'include_email_tokens': [recipientEmail],
    }),
  );

  // 3. Manejar errores
  if (response.statusCode != 200) {
    throw Exception('''
      Error al enviar email: 
      Status: ${response.statusCode}
      Respuesta: ${response.body}
    ''');
  }
}
// End custom action code
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
