import 'dart:convert';

import 'package:http/http.dart' as http;

class GoogleBooksService {
  GoogleBooksService._();

  static final instance = GoogleBooksService._();

  Future<List<T>> getEndpointData<T>(
      {required Uri url,
      required T Function(Map<String, dynamic> dat) builder}) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['items'].map<T>((books) => builder(books)).toList();
    } else {
      throw response;
    }
  }
}
