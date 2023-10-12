import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Map userinformation;

  NetworkHelper({required this.userinformation});

  Future getUserData() async {
    Uri url = Uri.parse("https://munchy-fe050.ew.r.appspot.com//diet");// $email
    http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userinformation),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
