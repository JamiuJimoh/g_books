import '../models/book.dart';
import 'api_endpoint.dart';
import 'firestore_service.dart';
import 'google_books_service.dart';

abstract class Database {
  Future<List<Book>> getBooks(String? searchTerm);
  Stream<List<Book>> booksStream();
  Future<void> setBook(Book book);
}

class APIDatabase implements Database {
  APIDatabase({required this.uid});
  // final APIEndpoint api;
  final String uid;

  final api = APIEndpoint();

  final _googleBooksService = GoogleBooksService.instance;
  final _firestoreService = FirestoreService.instance;

  @override
  Future<List<Book>> getBooks(String? searchTerm) async {
    return await _googleBooksService.getEndpointData<Book>(
      url: api.moviesEndpointUri(searchTerm),
      builder: (data) => Book.fromMap(data),
    );
  }

  @override
  Stream<List<Book>> booksStream() => _firestoreService.collectionStream<Book>(
      uid: uid,
      path: APIEndpoint.books(uid),
      builder: (data) => Book.fromFirestoreMap(data));

  @override
  Future<void> setBook(Book book) async => await _firestoreService.setData(
        path: APIEndpoint.book(uid, book.bookId),
        data: book.toMap(),
      );
}
