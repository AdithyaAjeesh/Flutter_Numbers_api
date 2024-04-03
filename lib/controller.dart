import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FunctionProvider extends ChangeNotifier {
  final numberController = TextEditingController();
  String output = '';
  Future<void> getAllData({required String number}) async {
    final response = await http.get(Uri.parse('http://numbersapi.com/$number'));
    if (response.statusCode == 200) {
      print(response.body);
      output = response.body;
    }
    notifyListeners();
  }
}
