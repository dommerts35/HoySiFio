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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendCustomEmailForTenderoEmailChange(
    String recipientEmail,
    String recipientName,
    String emailSubject,
    String nombreTienda,
    String correoAnterior,
    String correoNuevo,
    String fechaCambio) async {
  final String oneSignalAppId = "fc0f984a-a2c3-4fdb-b633-ac1517360e8e";
  final String oneSignalRestApiKey =
      "os_v2_app_7qhzqsvcynh5xnrtvqkronqory7h3fci6sxunx4yd64ecbnxx7sutv3nhvqcfvpfqrhmbqqs2u7qbyvcklyymchv6z5smpppcbmkfey";

  // 1. Template HTML con variables dinámicas
  final htmlContent = """
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Cambio de correo electrónico - HoySíFio</title>
    </head>
    <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333; margin: 0; padding: 0;">
    <!-- Header con logo -->
      <table width="100%" cellpadding="0" cellspacing="0" style="background-color: #286181;">
        <tr>
          <td align="center" style="padding: 20px;">
            <img src="https://firebasestorage.googleapis.com/v0/b/hoy-si-fio-7c5yyn.firebasestorage.app/o/email-assets%2FsmallHsf.png?alt=media&token=cff4ab55-fc89-40d5-995a-150af3fa5505" alt="Logo de HoySíFio" width="400" height="120" style="max-width: 50%; height: auto; padding: 0 0 0 15px;">
            <h1 style="color: white; margin: 10px 0 0 0;">Cambio de correo electrónico</h1>
          </td>
        </tr>
      </table>

    <!-- Contenido principal -->
      <table width="100%" cellpadding="0" cellspacing="0" style="max-width: 600px; margin: auto; padding: 20px;">
      <tr>
        <td style="padding-bottom: 20px;">
          <p style="margin: 0 0 15px 0;">¡Hola, $recipientName!</p>
          <p style="margin: 0 0 15px 0;">
          Le informamos que el correo electrónico asociado a su cuenta de tendero de la tienda <strong>$nombreTienda</strong> ha sido actualizado.
          </p>
          <p style="margin: 0 0 15px 0;">
          <strong>Correo anterior:</strong> $correoAnterior<br>
          <strong>Nuevo correo:</strong> $correoNuevo<br>
          <strong>Fecha del cambio:</strong> $fechaCambio
          </p>
          <p style="margin: 0 0 15px 0;">
          Si usted no autorizó este cambio, por favor comuníquese a través del e-mail: hoysifioapp@outlook.com
          </p>
        </td>
      </tr>
    </table>

  <!-- Footer -->
    <table width="100%" cellpadding="0" cellspacing="0" style="background-color: #f8f8f8;">
      <tr>
        <td align="center" style="padding: 20px; font-size: 12px; color: #777;">
          <p style="margin: 0;">© 2025 HoySíFio. Todos los derechos reservados.</p>
          <p style="margin: 0;">Este es un mensaje automatizado, por favor no responder.</p>
        </td>
      </tr>
    </table>
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
