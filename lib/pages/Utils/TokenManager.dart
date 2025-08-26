import 'package:shared_preferences/shared_preferences.dart';

import '../../constans/index.dart';

class Tokenmanager {
  String  _token = "";
  
  // 获取存储的实例
  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }
  init() async {
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalVariable.TOKEN_KEY) ?? "";
  }

  // 存储token
  void setToken(String token) async {
    final instance = await _getInstance(); // 获取实例对象
    instance.setString(GlobalVariable.TOKEN_KEY, token);
  }

  // 获取token
  String getToken() {
    return _token;
  }

  // 删除token
  void removeToken() async {
    final instance = await _getInstance(); // 获取实例对象
    instance.remove(GlobalVariable.TOKEN_KEY);
  }
}

final tokenManager = Tokenmanager();
