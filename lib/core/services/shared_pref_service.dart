import 'package:shared_preferences/shared_preferences.dart';

///shared preferences instance
SharedPreferences? _prefs;

///initialize the shared preferences instance
Future<void> initSharedPrefs() async {
  _prefs = await SharedPreferences.getInstance();
}

///service with functiond for getting and settings sharedPreferences values
class SharedPrefService {
  ///set high score
  Future<void> setBest(int value) async {
    if (_prefs != null) await _prefs!.setInt('best', value);
  }

  ///get high score
  Future<int> getBest() async {
    if (_prefs != null) {
      return _prefs!.getInt('best') ?? 1000;
    }
    return 1000;
  }
}
