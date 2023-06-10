import 'dart:convert';

import 'package:httpmethod/Model/SingleUserResponse.dart';

import '../Model/CreateUser.dart';
import '../Model/UpdateUser.dart';
import '../Model/UserListResponse.dart';
import 'package:http/http.dart' as http;

//Get Single User

Future<SingleUserResponse> fetchSingleUsers(String page) async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users/12'));
  if (response.statusCode == 200) {
    return SingleUserResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Get user list');
  }
}

//Get Connection

Future<UserListResponse> fetchUsers(String page) async {
  final response =
      await http.get(Uri.parse('https://reqres.in/api/users?page=$page'));
  if (response.statusCode == 200) {
    return UserListResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Get user list');
  }
}

//Post Connection

Future<UserCreateResponse> createUser(UserCreateBody user) async {
  var body = user.toJson();
  final response =
      await http.post(Uri.parse('https://reqres.in/api/users'), body: body);
  if (response.statusCode == 201) {
    return UserCreateResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Create user list');
  }
}

//Put Method

Future<UpdateDetail> updateAlbum(String id, UpdateDetail updateDetail) async {
  var body = updateDetail.toJson();
  final response =
      await http.put(Uri.parse('https://reqres.in/api/users/$id'), body: body);

  if (response.statusCode == 200) {
    return UpdateDetail.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to update album.');
  }
}

//Delete Method
