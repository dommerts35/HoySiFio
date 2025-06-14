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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';

Future<void> sendCustomVerificationEmail() async {
  try {
    // 1. Obtener usuario actual
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.email == null) {
      throw Exception('Usuario no autenticado o sin email');
    }

    // 2. Llamar a la Cloud Function
    final functions = FirebaseFunctions.instance;
    final callable = functions.httpsCallable(
      'sendCustomVerificationEmail',
      options: HttpsCallableOptions(
        timeout: const Duration(seconds: 10),
      ),
    );

    // 3. Ejecutar la llamada
    final response = await callable.call({
      'email': user.email,
      'displayName': user.displayName ?? 'Usuario',
    });

    debugPrint('Email enviado: ${response.data}');
  } catch (e) {
    debugPrint('Error en sendCustomVerificationEmail: $e');
    rethrow;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
