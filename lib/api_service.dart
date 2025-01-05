import 'package:flutter/material.dart';
import 'package:getx/models.dart';
import 'package:http/http.dart' as http;

// In this file we will be doing network call for fetching and using data in our app

class ApiService {

  Future<List<UserModel>> fetchUserData() async {
    var response = await http.get(Uri.parse('https://api.restful-api.dev/objects'));

    if(response.statusCode == 200)
      {
        return userModelFromJson(response.body);
      } else
        {
          throw Exception("Network error");
        }

  }
}