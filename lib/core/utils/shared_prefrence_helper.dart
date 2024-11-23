import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class SharedPrefHelper {
  static SharedPreferences? sharedPreferences;
  static const String _usersKey = "users";

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static dynamic getData(String key) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);

    if (value is int) return await sharedPreferences!.setInt(key, value);

    if (value is double) return await sharedPreferences!.setDouble(key, value);

    return await sharedPreferences!.setBool(key, value);
  }

  static Future<bool> removeData(key) async {
    return await sharedPreferences!.remove(key);
  }

  static Future<bool> clearData() async {
    return await sharedPreferences!.clear();
  }

  // Save the list of users
  static Future<bool> saveUsers(List<UserModel> users) async {
    final usersJson = users.map((user) => user.toJson()).toList();
    return await sharedPreferences!
        .setString(_usersKey, json.encode(usersJson));
  }

  static List<UserModel> getUsers() {
    final usersJson = sharedPreferences!.getString(_usersKey);

    // If no users are saved, return an empty list
    if (usersJson == null || usersJson.isEmpty) {
      return [];
    }

    // Decode the JSON and return the list of UserModel
    try {
      final List<dynamic> usersList = json.decode(usersJson);
      return usersList.map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      // If there's an error decoding, return an empty list
      return [];
    }
  }

  // Add a single user to the list
  static Future<bool> addUser(UserModel user) async {
    // Fetch existing users or initialize an empty list
    final users = getUsers();

    // Add the new user
    users.add(user);

    // Save the updated list
    return await saveUsers(users);
  }

// Check if a user with the given email exists
  static bool userExists(String email) {
    final users = getUsers();
    return users.any((user) => user.email == email);
  }
}
