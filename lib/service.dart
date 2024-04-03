import 'package:http/http.dart' as http;

class FunctionService {
  String output = '';
  Future<void> getAllData({required String number}) async {
    final response = await http.get(Uri.parse('http://numbersapi.com/41'));
    if (response.statusCode == 200) {
      print(response.body);
      output = response.body;
    }
  }
}
