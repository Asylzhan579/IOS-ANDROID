import 'package:shared_preferences/shared_preferences.dart';

import '../models/note_item.dart';

class StorageService {
  static const keyDarkMode = 'app_theme_dark_mode';
  static const keyUserName = 'user_display_name';
  static const keyNotes = 'saved_notes_json';

  final SharedPreferences _prefs;
  StorageService._(this._prefs);

  static Future<StorageService> init() async =>
      StorageService._(await SharedPreferences.getInstance());

  bool get isDarkMode => _prefs.getBool(keyDarkMode) ?? false;
  Future<void> setDarkMode(bool value) => _prefs.setBool(keyDarkMode, value);

  String get userName => _prefs.getString(keyUserName) ?? 'Guest User';
  Future<void> setUserName(String value) =>
      _prefs.setString(keyUserName, value);

  List<NoteItem> loadNotes() =>
      NoteItem.decodeList(_prefs.getString(keyNotes));
  Future<void> saveNotes(List<NoteItem> notes) =>
      _prefs.setString(keyNotes, NoteItem.encodeList(notes));
}
