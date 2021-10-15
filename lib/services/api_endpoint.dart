class APIEndpoint {
  static const String _googleBooksHost = 'www.googleapis.com';

  Uri moviesEndpointUri(String? searchTerm) => Uri(
        scheme: 'https',
        host: _googleBooksHost,
        path: 'books/v1/volumes',
        queryParameters: {
          'q': searchTerm ?? 'peace',
        },
      );

  static String book(String uid, String bookId) => '/users/$uid/books/$bookId';

  static String books(String uid) => '/users/$uid/books';
}
