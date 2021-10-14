class APIEndpoint {
  static const String _googleBooksHost = 'www.googleapis.com';

  Uri get moviesEndpointUri => Uri(
        scheme: 'https',
        host: _googleBooksHost,
        path: 'books/v1/volumes',
        queryParameters: {
          'q': 'peace',
        },
      );
}
