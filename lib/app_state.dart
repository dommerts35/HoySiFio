import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isFirstTimeTenderoList =
          prefs.getBool('ff_isFirstTimeTenderoList') ?? _isFirstTimeTenderoList;
    });
    _safeInit(() {
      _isFirstTimeInfoEdit =
          prefs.getBool('ff_isFirstTimeInfoEdit') ?? _isFirstTimeInfoEdit;
    });
    _safeInit(() {
      _isFirstTimeCPP = prefs.getBool('ff_isFirstTimeCPP') ?? _isFirstTimeCPP;
    });
    _safeInit(() {
      _isFirstTimeClienteTiendaList =
          prefs.getBool('ff_isFirstTimeClienteTiendaList') ??
              _isFirstTimeClienteTiendaList;
    });
    _safeInit(() {
      _isFirstTimeClienteProdList =
          prefs.getBool('ff_isFirstTimeClienteProdList') ??
              _isFirstTimeClienteProdList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isHPSelected = false;
  bool get isHPSelected => _isHPSelected;
  set isHPSelected(bool value) {
    _isHPSelected = value;
  }

  bool _isFirstTimeTenderoList = true;
  bool get isFirstTimeTenderoList => _isFirstTimeTenderoList;
  set isFirstTimeTenderoList(bool value) {
    _isFirstTimeTenderoList = value;
    prefs.setBool('ff_isFirstTimeTenderoList', value);
  }

  bool _isFirstTimeInfoEdit = true;
  bool get isFirstTimeInfoEdit => _isFirstTimeInfoEdit;
  set isFirstTimeInfoEdit(bool value) {
    _isFirstTimeInfoEdit = value;
    prefs.setBool('ff_isFirstTimeInfoEdit', value);
  }

  bool _isFirstTimeCPP = true;
  bool get isFirstTimeCPP => _isFirstTimeCPP;
  set isFirstTimeCPP(bool value) {
    _isFirstTimeCPP = value;
    prefs.setBool('ff_isFirstTimeCPP', value);
  }

  bool _isFirstTimeClienteTiendaList = true;
  bool get isFirstTimeClienteTiendaList => _isFirstTimeClienteTiendaList;
  set isFirstTimeClienteTiendaList(bool value) {
    _isFirstTimeClienteTiendaList = value;
    prefs.setBool('ff_isFirstTimeClienteTiendaList', value);
  }

  bool _isFirstTimeClienteProdList = true;
  bool get isFirstTimeClienteProdList => _isFirstTimeClienteProdList;
  set isFirstTimeClienteProdList(bool value) {
    _isFirstTimeClienteProdList = value;
    prefs.setBool('ff_isFirstTimeClienteProdList', value);
  }

  /// token
  String _playerId = '';
  String get playerId => _playerId;
  set playerId(String value) {
    _playerId = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
