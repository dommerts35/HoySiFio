import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {
  static final Connectivity _connectivity = Connectivity();
  static BuildContext? _currentContext;

  // Método para inicializar con el contexto
  static void setContext(BuildContext context) {
    _currentContext = context;
  }

  static Future<void> initializeInternetChecker() async {
    if (_currentContext == null) {
      print('Contexto no establecido. Llama a setContext() primero.');
      return;
    }

    // Verificar conexión inicial
    _checkConnection();

    // Escuchar cambios en la conexión
    _connectivity.onConnectivityChanged.listen((result) {
      _handleConnectionChange(result);
    });
  }

  static Future<void> _checkConnection() async {
    final result = await _connectivity.checkConnectivity();
    _handleConnectionChange(result);
  }

  static void _handleConnectionChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none && _currentContext != null) {
      _showNoInternetDialog(_currentContext!);
    }
  }

  static void _showNoInternetDialog(BuildContext context) {
    // Verificar si el contexto está montado antes de mostrar el diálogo
    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Sin conexión'),
        content: const Text(
            'No hay conexión a internet. Volviendo a la página principal.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navegar a la página principal - IMPORTANTE para FlutterFlow
              _navigateToHome(context);
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  // Método específico para navegación en FlutterFlow
  static void _navigateToHome(BuildContext context) {
    try {
      // Intenta usar la navegación de FlutterFlow
      // En FlutterFlow, la navegación suele manejarse con:
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } catch (e) {
      print('Error en navegación: $e');
      // Fallback: intentar pop hasta la primera ruta
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  // Método para limpiar el contexto cuando ya no se necesite
  static void dispose() {
    _currentContext = null;
  }
}
