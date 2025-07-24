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
    String nombreCliente,
    String montoComprobante,
    String metodoPago) async {
  final String oneSignalAppId = "fc0f984a-a2c3-4fdb-b633-ac1517360e8e";
  final String oneSignalRestApiKey =
      "os_v2_app_7qhzqsvcynh5xnrtvqkronqory7h3fci6sxunx4yd64ecbnxx7sutv3nhvqcfvpfqrhmbqqs2u7qbyvcklyymchv6z5smpppcbmkfey";

  // 1. Template HTML con variables dinámicas
  final htmlContent = """
  <!DOCTYPE html>
  <html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nuevo Comprobante Recibido - HoySíFio</title>
  </head>
  <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333; margin: 0; padding: 0;">
    <!-- Header con logo -->
    <table width="100%" cellpadding="0" cellspacing="0" style="background-color: #286181;">
      <tr>
        <td align="center" style="padding: 20px;">
          <img src="https://firebasestorage.googleapis.com/v0/b/hoy-si-fio-7c5yyn.firebasestorage.app/o/email-assets%2FsmallHsf.png?alt=media&token=cff4ab55-fc89-40d5-995a-150af3fa5505" alt="Logo de HoySíFio" width="400" height="120" style="max-width: 100%; height: auto; padding: 0 0 0 15px;">
          <h1 style="color: white; margin: 10px 0 0 0; font-size: 24px;">¡Nuevo comprobante recibido!</h1>
        </td>
      </tr>
    </table>

    <!-- Contenido principal -->
    <table width="100%" cellpadding="0" cellspacing="0" style="max-width: 600px; margin: 30px auto; background-color: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 10px rgba(0,0,0,0.05);">
      <tr>
        <td style="padding: 25px;">
          <p style="margin: 0 0 16px 0; font-size: 16px;">Estimado tendero,</p>
          <p style="margin: 0 0 20px 0; font-size: 16px;">El cliente <strong style="color: #286181;">$nombreCliente</strong> ha enviado un comprobante de pago a tu tienda <strong>$nombreTienda</strong>.</p>
        
          <!-- Detalles del comprobante -->
          <table width="100%" cellpadding="0" cellspacing="0" style="margin: 25px 0; background-color: #f8f8f8; border-left: 4px solid #4CAF50; padding: 15px;">
            <tr>
              <td>
                <p style="margin: 5px 0; font-weight: bold; color: #286181;">Monto del comprobante:</p>
                <p style="margin: 5px 0;">&#36;$montoComprobante</p>
                <p style="margin: 15px 0 5px 0; font-weight: bold; color: #286181;">Método de pago:</p>
                <p style="margin: 5px 0;">$metodoPago</p>
              </td>
            </tr>
          </table>

          <p style="margin: 20px 0 10px 0; font-size: 15px;">
            Por favor revise el comprobante en su cuenta y confirme si es válido.
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
