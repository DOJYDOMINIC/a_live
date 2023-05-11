import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/api_model.dart';

class ProviderOne with ChangeNotifier {

  int _selectedIndex = 0;
  List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  int get selectedIndex => _selectedIndex;

  List<String> get items => _items;

  void setSelectedIndex(int index, BuildContext context) {

    _selectedIndex = index;
    // Perform any additional actions when the selected index changes
    // For example, you can show/hide different content based on the selected index
    // or trigger other updates in your app's state.

    // Call notifyListeners to notify all listeners that the state has changed.
    notifyListeners();
  }

  //--------------------------------------------------


  //PostData//

  Future<void> postData(String first, last, email) async {
    var url = Uri.parse(
        'https://reqres.in/api/users'); // Replace with your API endpoint URL

    // Create the request body using the Welcome class
    var welcome = Welcome(
      page: 1,
      perPage: 10,
      total: 100,
      totalPages: 10,
      data: [
        Datum(
          id: 1,
          email: email,
          firstName: first,
          lastName: last,
          avatar: 'avathar',
        ),
      ],
      support: Support(
        url: 'https://reqres.in/api/users',
        text: 'Support text',
      ),
    );

    var body = welcomeToJson(welcome);

    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 201) {
        print(response.body);
      } else {
        throw Exception(
            'POST request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error sending POST request: $e');
    }
  }

// ------------------------------

  // TextField Validation//


  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  String? validateSecondName(String value) {
    if (value.isEmpty) {
      return 'Please enter a second name';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter an email';
    } else if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

//  ------------------------------------------

  //Fetch Data//

  List<dynamic> _data = [];

  List<dynamic> get data => _data;

  Future<void> fetchData() async {
    var url = Uri.parse('https://reqres.in/api/users?page=2');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        _data = json.decode(response.body)['data'];
        notifyListeners();
      } else {
        throw Exception('GET request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error sending GET request: $e');
    }
  }
//  ---------------------------------------

  Future<http.Response> updateUser(int userId, String newEmail, String newFirstName, String newLastName, String newAvatar) async {
    final String apiUrl = 'https://reqres.in/api/users/2/$userId';

    final payload = {
      'email': newEmail,
      'first_name': newFirstName,
      'last_name': newLastName,
      'avatar': newAvatar
    };

    final response = await http.put(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(payload),
    );

    return response;
  }



}
