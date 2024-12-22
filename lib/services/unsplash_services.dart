
import 'package:http/http.dart' as http;
import 'dart:convert';

class UnsplashService {
  static const String apiKey = '_tXCZ0SPPb_dG4I0WmeClIQLaO8dC6GG9nPXyXdwlxk';

  static Future<String> getRandomImage(String query) async {
    final response = await http.get(
      Uri.parse(
        'https://api.unsplash.com/photos/random?client_id=$apiKey&query=$query',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['urls']['regular'];
    }

    throw Exception('Failed to load image');
  }
}
