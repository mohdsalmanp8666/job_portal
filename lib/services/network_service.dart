import 'package:http/http.dart' as http;

class NetworkService {
  static const baseURL = 'https://jsonplaceholder.typicode.com/albums/1/photos';

  Future<http.Response> get({String endpoint = ""}) async {
    final response = await http.get(Uri.parse('$baseURL/$endpoint'));
    return response;
  }
}
