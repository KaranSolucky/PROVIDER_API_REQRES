import 'dart:convert';
import 'package:flutter/material.dart';

import '../model/userlist_data_model.dart';
import 'package:http/http.dart' as http;

class UserListDataProvider with ChangeNotifier {
  UserDataModel? userDataModel;
  UserListDataProvider();
  Future<dynamic> getdata(BuildContext context) async {
    var response =
        await http.get(Uri.parse("https://reqres.in/api/user?page=2"));

    userDataModel = UserDataModel.fromJson(json.decode(response.body));

    return userDataModel;
  }

  setModelData(UserDataModel userDataModel) {
    userDataModel = userDataModel;

    notifyListeners();
  }

  UserDataModel? getModelData() {
    return userDataModel;
  }
}
