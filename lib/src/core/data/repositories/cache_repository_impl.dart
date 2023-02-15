import 'package:flutter_boilerplate_code/src/core/domain/interfaces/interface_cache_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CacheRepositoryImpl implements ICacheRepository{
  final SharedPreferences sharedPreference;
  CacheRepositoryImpl({required this.sharedPreference});

  @override
  String? fetchToken() {
    return sharedPreference.getString('key_app_session_token');
  }

  @override
  Future<void> saveToken(String token) async{
    await sharedPreference.setString('key_app_session_token', token);
  }

  @override
  int? fetchCurrentUserId() {
    return sharedPreference.getInt("key_current_user_id");
  }

  @override
  Future<void>? saveCurrentUserId(int? id) async{
    await sharedPreference.setInt('key_current_user_id', id??-1);
  }

  @override
  void logout() async{
    await sharedPreference.setInt('key_current_user_id', -1);
    await sharedPreference.setString('key_app_session_token', '');
  }

}