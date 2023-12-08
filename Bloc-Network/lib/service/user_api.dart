import 'dart:convert';

import 'package:bloc_network/model/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<List<User>> getUsers() async{
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.org/users')
    );

    if (response.statusCode==200) {
      final List<dynamic> userJson = json.decode(response.body);
      print(userJson.map((json) => User.fromJson(json)).toList());
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error occured');
    }

  }
}