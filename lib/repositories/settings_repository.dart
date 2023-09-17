import 'package:hive/hive.dart';
import 'package:trilhaapp/model/settings.dart';

class SettingsRepository {
  static late Box _box;

  SettingsRepository._load();

  static Future<SettingsRepository> load() async {
    if (Hive.isBoxOpen('settings')) {
      _box = Hive.box('settings');
    } else {
      _box = await Hive.openBox('settings');
    }
    return SettingsRepository._load();
  }

  void save(Settings settings) {
    _box.put('settingsModel', {
      'username': settings.username,
      'height': settings.height,
      'notifyMe': settings.notifyMe,
      'isDarkMode': settings.isDarkMode,
    });
  }

  Settings getData() {
    var settings = _box.get('settingsModel');

    if (settings == null) {
      return Settings.empty();
    }

    return Settings(
      settings['username'],
      settings['height'],
      settings['notifyMe'],
      settings['isDarkMode'],
    );
  }
}
