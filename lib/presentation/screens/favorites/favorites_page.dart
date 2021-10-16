import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_books/presentation/shared_widgets/show_exception_alert_dialog.dart';
import 'package:provider/provider.dart';

import '../../../models/book.dart';
import '../../../services/database.dart';
import '../../shared_widgets/book_container.dart';
import '../book_details/book_details_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key, required this.database}) : super(key: key);
  final Database database;

  static Future<void> show(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => FavoritesPage(database: database),
    ));
  }

  Future<void> _delete(BuildContext context, Book book) async {
    try {
      await database.deleteBook(book);
    } on FirebaseFirestore catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Operation failed',
        exception: Exception(e),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Books',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: StreamBuilder<List<Book>>(
            stream: database.booksStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                final books = snapshot.data!;
                if (books.isNotEmpty) {
                  return ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (_, i) => Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      background: Container(
                          margin: const EdgeInsets.only(bottom: 33.0),
                          color: Colors.red,
                          child: const Align(
                              child: Padding(
                                padding: EdgeInsets.only(right: 20.0),
                                child: Icon(Icons.delete,
                                    size: 40.0, color: Colors.white),
                              ),
                              alignment: Alignment.centerRight)),
                      onDismissed: (_) => _delete(context, books[i]),
                      child: BookContainer(
                        id: books[i].bookId,
                        author: books[i].authors,
                        title: books[i].title,
                        rating: books[i].ratings,
                        category: books[i].category,
                        thumbnail: books[i].thumbnail,
                        onTap: () {
                          BookDetailsPage.show(
                            context,
                            book: books[i],
                            database: database,
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'No Favorites Yet!',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Find books you like and add to your favorites collection',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Something went wrong',
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
