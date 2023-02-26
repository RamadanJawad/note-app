import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:note_app/core/database/api/api_helper.dart';
import 'package:note_app/core/database/api/api_setting.dart';
import 'package:note_app/core/function/save_data.dart';
import 'package:note_app/model/task.dart';
import 'package:note_app/model/user.dart';

class ApiController with ApiHelper {
  Future<User?> login({required String email, required String password}) async {
    var response = await http.post(Uri.parse(ApiSetting.login),
        body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['object'];
      User user = User.fromJson(jsonResponse);
      return user;
    }
    return null;
  }

  Future<String> createTask({required String title}) async {
    var response = await http.post(Uri.parse(ApiSetting.createTask),
        body: {"title": title}, headers: headers);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return "Post created successfully!";
    } else {
      return 'Failed created task!';
    }
  }

  Future<List<Task>> readTask() async {
    var response = await http.get(Uri.parse(ApiSetting.createTask), headers: {
      HttpHeaders.authorizationHeader: AppPreferences().token,
    });
    if (response.statusCode == 201 || response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray.map((e) => Task.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<String> updateTask(int id, String title) async {
    var response =
        await http.put(Uri.parse(ApiSetting.updateTaskUrl(id)), headers: {
      HttpHeaders.authorizationHeader: AppPreferences().token,
    }, body: {
      "title": title
    });
    if (response.statusCode == 201 || response.statusCode == 200) {
      return "Updated task successfully!";
    } else {
      return 'Failed update task!';
    }
  }

  Future<String> deleteTask(int id) async {
    var response =
        await http.delete(Uri.parse(ApiSetting.updateTaskUrl(id)), headers: {
      HttpHeaders.authorizationHeader: AppPreferences().token,
    });
    if (response.statusCode == 201 || response.statusCode == 200) {
      return "Delete task successfully!";
    } else {
      return 'Failed delete task!';
    }
  }
}
