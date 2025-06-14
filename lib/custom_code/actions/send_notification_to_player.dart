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

Future<void> sendNotificationToPlayer(String playerId, String message) async {
  final String oneSignalAppId = "fc0f984a-a2c3-4fdb-b633-ac1517360e8e";
  final String oneSignalRestApiKey =
      "os_v2_app_7qhzqsvcynh5xnrtvqkronqory7h3fci6sxunx4yd64ecbnxx7sutv3nhvqcfvpfqrhmbqqs2u7qbyvcklyymchv6z5smpppcbmkfey";

  final response = await http.post(
    Uri.parse('https://onesignal.com/api/v1/notifications'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Key $oneSignalRestApiKey',
    },
    body: jsonEncode({
      'app_id': oneSignalAppId,
      'contents': {'en': message},
      'include_player_ids': [playerId], // Usa el parámetro recibido
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Error: ${response.statusCode} - ${response.body}');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
