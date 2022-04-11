import 'package:httpz/models/albums_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<Post>?> fetchAlbum() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var json = response.body;
      
      return postFromJson(json);


      
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
