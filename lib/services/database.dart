import '../models/book.dart';
import 'api_endpoint.dart';

import 'google_books_service.dart';

abstract class Database {
  Future<List<Book>> getBooks();
}

class APIDatabase implements Database {
  APIDatabase({required this.api});
  final APIEndpoint api;

  final _googleBooksService = GoogleBooksService.instance;

  @override
  Future<List<Book>> getBooks() async {
    return await _googleBooksService.getEndpointData<Book>(
      url: api.moviesEndpointUri,
      builder: (data) => Book.fromMap(data),
    );
  }
}
