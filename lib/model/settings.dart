class Settings {
  String _username = "";
  double _height = 0;
  bool _notifyMe = false;
  bool _isDarkMode = false;

  Settings.empty() {
    _username = "";
    _height = 0;
    _notifyMe = false;
    _isDarkMode = false;
  }
  Settings(this._username, this._height, this._notifyMe, this._isDarkMode);

  String get username => _username;
  double get height => _height;
  bool get notifyMe => _notifyMe;
  bool get isDarkMode => _isDarkMode;

  set username(String value) {
    _username = value;
  }

  set height(double value) {
    _height = value;
  }

  set notifyMe(bool value) {
    _notifyMe = value;
  }

  set isDarkMode(bool value) {
    _isDarkMode = value;
  }
}
