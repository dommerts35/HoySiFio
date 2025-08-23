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

import 'package:email_validator/email_validator.dart';

Future<bool> validateEmail(String email) async {
  if (email.isEmpty) {
    return false; // Email vacío
  }
  return EmailValidator.validate(email); // Valida el formato
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
