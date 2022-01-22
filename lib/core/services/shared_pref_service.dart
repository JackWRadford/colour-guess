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

  ///set played date
  Future<void> setPlayedToday() async {
    if (_prefs != null) {
      await _prefs!.setString('playeddate', _getNow().toIso8601String());
    }
  }

  ///get played today or not
  Future<bool> getPlayedToday() async {
    if (_prefs != null) {
      String? dateStr = _prefs!.getString('playeddate');
      if (dateStr != null) {
        DateTime date = DateTime.parse(dateStr);
        // DateTime day = DateTime(date.year, date.month, date.day);
        return (_getNow() == date);
      }
    }
    return false;
  }

  ///get dateTime for now (only year, month, day)
  DateTime _getNow() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}
