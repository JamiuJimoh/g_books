// import 'dart:convert';

class Book {
  final String bookId;
  final String authors;
  final String title;
  final String publishedDate;
  final String description;
  final String thumbnail;
  final int pageCount;
  final String category;
  final String ratings;

  Book({
    required this.bookId,
    required this.authors,
    required this.title,
    required this.thumbnail,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.category,
    required this.ratings,
  });

  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'authors': authors,
      'title': title,
      'thumbnail': thumbnail,
      'publishedDate': publishedDate,
      'description': description,
      'category': category,
      'pageCount': pageCount,
      'ratings': ratings,
    };
  }

  factory Book.fromMap(Map<String, dynamic> data) {
    late String category;
    if (data['volumeInfo']['categories'] == null) {
      category = '';
    } else {
      category = data['volumeInfo']['categories'].isEmpty
          ? ''
          : data['volumeInfo']['categories'][0];
    }
    late String thumbnail;
    if (data['volumeInfo']['imageLinks'] == null) {
      thumbnail = '';
    } else {
      thumbnail = data['volumeInfo']['imageLinks'].isEmpty
          ? ''
          : data['volumeInfo']['imageLinks']['thumbnail'];
    }
    return Book(
      bookId: data['id'],
      authors: data['volumeInfo']['authors'][0],
      title: data['volumeInfo']['title'] ?? '',
      thumbnail: thumbnail,
      publishedDate: data['volumeInfo']['publishedDate'] ?? '',
      description: data['volumeInfo']['description'] ?? '',
      pageCount: data['volumeInfo']['pageCount'] ?? 0,
      category: category,
      ratings: (data['volumeInfo']['averageRating'] ?? 0.0).toString(),
    );
  }

  T _validatePath<T>(Map<String, dynamic> data, pathName) {
    late T pathData;
    if (data['volumeInfo']['$pathName'] == null) {
      pathData = '' as T;
    } else {
      pathData = data['volumeInfo']['$pathName'].isEmpty
          ? ''
          : data['volumeInfo']['$pathName'][0];
    }
    return pathData;
  }

  // String toJson() => json.encode(toMap());

  // factory Book.fromJson(String source) => Book.fromMap(json.decode(source));
}
