import 'dart:convert';
import 'package:http/http.dart' as http;

class JokeService {
  static const String baseApiUrl = 'https://official-joke-api.appspot.com/jokes/';

  static Future<List<String>> fetchJokes({required String category}) async {
    try {
      final apiUrl = '$baseApiUrl$category/ten';
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List jokes = json.decode(response.body);
        return jokes.map((j) => "${j['setup']} - ${j['punchline']}").toList();
      } else {
        throw Exception("Failed to fetch jokes");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
