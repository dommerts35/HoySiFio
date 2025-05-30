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

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<String?> getFCMToken() async {
  await Firebase.initializeApp(); // ✅ Inicializa Firebase primero
  String? token = await FirebaseMessaging.instance.getToken();
  debugPrint("Token FCM: $token"); // Verifica en la consola
  return token;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
