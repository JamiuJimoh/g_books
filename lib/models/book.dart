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

    late String authors;
    if (data['volumeInfo']['authors'] == null) {
      authors = '';
    } else {
      authors = data['volumeInfo']['authors'].isEmpty
          ? ''
          : data['volumeInfo']['authors'][0];
    }
    return Book(
      bookId: data['id'],
      authors: authors,
      title: data['volumeInfo']['title'] ?? '',
      thumbnail: thumbnail,
      publishedDate: data['volumeInfo']['publishedDate'] ?? '',
      description: data['volumeInfo']['description'] ?? '',
      pageCount: data['volumeInfo']['pageCount'] ?? 0,
      category: category,
      ratings: (data['volumeInfo']['averageRating'] ?? 0.0).toString(),
    );
  }

  factory Book.fromFirestoreMap(Map<String, dynamic> data) {
    return Book(
      bookId: data['bookId'],
      authors: data['authors'],
      title: data['title'],
      thumbnail: data['thumbnail'],
      publishedDate: data['publishedDate'],
      description: data['description'],
      pageCount: data['pageCount'],
      category: data['category'],
      ratings: data['ratings'],
    );
  }
}
