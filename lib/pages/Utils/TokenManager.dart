

import 'package:shared_preferences/shared_preferences.dart';

import '../../constans/index.dart';

class Tokenmanager {
  // 获取存储的实例
  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  // 存储token
  void setToken(String token) async {
    final instance = await _getInstance(); // 获取实例对象
    instance.setString(GlobalVariable.TOKEN_KEY, token);
  }

  // 获取token
  Future<String> getToken() async {
    final instance = await _getInstance(); // 获取实例对象
    return instance.getString(GlobalVariable.TOKEN_KEY) ?? "";
  }

  // 删除token
  void removeToken() async {
    final instance = await _getInstance(); // 获取实例对象
    instance.remove(GlobalVariable.TOKEN_KEY);
  }
}

final tokenManager = Tokenmanager();
