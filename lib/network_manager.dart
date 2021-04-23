import 'package:http/http.dart' as http;

class NetworkManager {
  String baseUrl = "https://localhost:8080/";

  void postSymptoms() async {
    var response = await http.post(
      Uri.parse(baseUrl),
      body: (<String,dynamic>{
        "symptons" : {
          "vomiting" : 3,
          "fatigue" : 1,
        },
        "user-id" : 123,
      }),
    );

  }

}