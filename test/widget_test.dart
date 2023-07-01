import 'package:http/http.dart' as http;

import 'package:book_times/app/models/book_model.dart';

final List<Book> _list = [];

var apiKey = 'ZNaUkPnTc6FqAUswO3aRmcqPrTJAgseG';
var genres = 'hardcover-fiction';

Future fetchData() async {
  var response = await http.get(Uri.parse(
      'https://api.nytimes.com/svc/books/v3/lists/current/$genres.json?api-key=$apiKey'));

  print(response.body);
}

void main() {
  fetchData();
}
