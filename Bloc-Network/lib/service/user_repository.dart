import 'package:bloc_network/service/user_api.dart';

import '../model/user.dart';

class UserRepository {
  final UserApi _userApi = UserApi();
  Future<List<User>> getAllUsers() => _userApi.getUsers();
}