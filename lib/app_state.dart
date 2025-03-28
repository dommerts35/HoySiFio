import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _dataTypeClientes = prefs
              .getStringList('ff_dataTypeClientes')
              ?.map((x) {
                try {
                  return DataTypeClienteStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dataTypeClientes;
    });
    _safeInit(() {
      _dataTypeTenderos = prefs
              .getStringList('ff_dataTypeTenderos')
              ?.map((x) {
                try {
                  return DataTypeTenderoStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dataTypeTenderos;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DataTypeClienteStruct> _dataTypeClientes = [];
  List<DataTypeClienteStruct> get dataTypeClientes => _dataTypeClientes;
  set dataTypeClientes(List<DataTypeClienteStruct> value) {
    _dataTypeClientes = value;
    prefs.setStringList(
        'ff_dataTypeClientes', value.map((x) => x.serialize()).toList());
  }

  void addToDataTypeClientes(DataTypeClienteStruct value) {
    dataTypeClientes.add(value);
    prefs.setStringList('ff_dataTypeClientes',
        _dataTypeClientes.map((x) => x.serialize()).toList());
  }

  void removeFromDataTypeClientes(DataTypeClienteStruct value) {
    dataTypeClientes.remove(value);
    prefs.setStringList('ff_dataTypeClientes',
        _dataTypeClientes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDataTypeClientes(int index) {
    dataTypeClientes.removeAt(index);
    prefs.setStringList('ff_dataTypeClientes',
        _dataTypeClientes.map((x) => x.serialize()).toList());
  }

  void updateDataTypeClientesAtIndex(
    int index,
    DataTypeClienteStruct Function(DataTypeClienteStruct) updateFn,
  ) {
    dataTypeClientes[index] = updateFn(_dataTypeClientes[index]);
    prefs.setStringList('ff_dataTypeClientes',
        _dataTypeClientes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDataTypeClientes(int index, DataTypeClienteStruct value) {
    dataTypeClientes.insert(index, value);
    prefs.setStringList('ff_dataTypeClientes',
        _dataTypeClientes.map((x) => x.serialize()).toList());
  }

  List<DataTypeTenderoStruct> _dataTypeTenderos = [];
  List<DataTypeTenderoStruct> get dataTypeTenderos => _dataTypeTenderos;
  set dataTypeTenderos(List<DataTypeTenderoStruct> value) {
    _dataTypeTenderos = value;
    prefs.setStringList(
        'ff_dataTypeTenderos', value.map((x) => x.serialize()).toList());
  }

  void addToDataTypeTenderos(DataTypeTenderoStruct value) {
    dataTypeTenderos.add(value);
    prefs.setStringList('ff_dataTypeTenderos',
        _dataTypeTenderos.map((x) => x.serialize()).toList());
  }

  void removeFromDataTypeTenderos(DataTypeTenderoStruct value) {
    dataTypeTenderos.remove(value);
    prefs.setStringList('ff_dataTypeTenderos',
        _dataTypeTenderos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDataTypeTenderos(int index) {
    dataTypeTenderos.removeAt(index);
    prefs.setStringList('ff_dataTypeTenderos',
        _dataTypeTenderos.map((x) => x.serialize()).toList());
  }

  void updateDataTypeTenderosAtIndex(
    int index,
    DataTypeTenderoStruct Function(DataTypeTenderoStruct) updateFn,
  ) {
    dataTypeTenderos[index] = updateFn(_dataTypeTenderos[index]);
    prefs.setStringList('ff_dataTypeTenderos',
        _dataTypeTenderos.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDataTypeTenderos(int index, DataTypeTenderoStruct value) {
    dataTypeTenderos.insert(index, value);
    prefs.setStringList('ff_dataTypeTenderos',
        _dataTypeTenderos.map((x) => x.serialize()).toList());
  }

  bool _esDiaDePago = false;
  bool get esDiaDePago => _esDiaDePago;
  set esDiaDePago(bool value) {
    _esDiaDePago = value;
  }

  /// cuenta
  int _count = 0;
  int get count => _count;
  set count(int value) {
    _count = value;
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
