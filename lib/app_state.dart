import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _email = prefs.getString('ff_email') ?? _email;
    });
    _safeInit(() {
      _ClientID = prefs.getString('ff_ClientID') ?? _ClientID;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _email = 'Email';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    prefs.setString('ff_email', _value);
  }

  String _ClientID = 'ClientID';
  String get ClientID => _ClientID;
  set ClientID(String _value) {
    _ClientID = _value;
    prefs.setString('ff_ClientID', _value);
  }

  String _Calories = 'Calories';
  String get Calories => _Calories;
  set Calories(String _value) {
    _Calories = _value;
  }

  String _Ingredients = 'Ingredients';
  String get Ingredients => _Ingredients;
  set Ingredients(String _value) {
    _Ingredients = _value;
  }

  String _Portions = 'Portions';
  String get Portions => _Portions;
  set Portions(String _value) {
    _Portions = _value;
  }

  String _Vitamins = 'Vitamins';
  String get Vitamins => _Vitamins;
  set Vitamins(String _value) {
    _Vitamins = _value;
  }

  String _Calcium = 'Calcium';
  String get Calcium => _Calcium;
  set Calcium(String _value) {
    _Calcium = _value;
  }

  String _Iron = 'Iron';
  String get Iron => _Iron;
  set Iron(String _value) {
    _Iron = _value;
  }

  String _Description = 'Description';
  String get Description => _Description;
  set Description(String _value) {
    _Description = _value;
  }

  String _PortionSize = 'Portion Size';
  String get PortionSize => _PortionSize;
  set PortionSize(String _value) {
    _PortionSize = _value;
  }

  String _Energy = 'Energy';
  String get Energy => _Energy;
  set Energy(String _value) {
    _Energy = _value;
  }

  String _Fat = 'Fat';
  String get Fat => _Fat;
  set Fat(String _value) {
    _Fat = _value;
  }

  String _Sodium = 'Sodium';
  String get Sodium => _Sodium;
  set Sodium(String _value) {
    _Sodium = _value;
  }

  String _Carbs = 'Carbs';
  String get Carbs => _Carbs;
  set Carbs(String _value) {
    _Carbs = _value;
  }

  String _Protein = 'Proteins';
  String get Protein => _Protein;
  set Protein(String _value) {
    _Protein = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
