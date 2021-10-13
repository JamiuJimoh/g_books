import 'dart:convert';

class Book {
  final String bookId;
  final List<String> authors;
  final String title;
  final String publishedDate;
  final String description;
  final String thumbnail;
  final int pageCount;
  final String category;
  final double ratings;

  Book({
    required this.bookId,
    required this.authors,
    required this.title,
    required this.publishedDate,
    required this.description,
    required this.thumbnail,
    required this.pageCount,
    required this.category,
    required this.ratings,
  });

  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'authors': authors,
      'title': title,
      'publishedDate': publishedDate,
      'description': description,
      'thumbnail': thumbnail,
      'pageCount': pageCount,
      'category': category,
      'ratings': ratings,
    };
  }

  factory Book.fromMap(Map<String, dynamic> data) {
    return Book(
      bookId: data['items'].id,
      authors: List<String>.from(data['items'].volumeInfo.authors),
      title: data['items'].volumeInfo.title,
      publishedDate: data['items'].volumeInfo['publishedDate'],
      description: data['items'].volumeInfo['description'],
      thumbnail: data['items'].volumeInfo['imageLinks']['thumbnail'],
      pageCount: data['items'].volumeInfo['pageCount'],
      category: data['items'].volumeInfo['categories'],
      ratings: data['items'].volumeInfo['averageRating'],
    );
  }
  
  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));
}
