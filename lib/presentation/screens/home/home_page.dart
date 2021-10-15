import 'package:flutter/material.dart';
import 'package:g_books/services/api_endpoint.dart';
import 'package:provider/provider.dart';

import '../../../models/book.dart';
import '../../../services/database.dart';
import '../book_details/book_details_page.dart';
import 'widgets/book_container.dart';
import 'widgets/search_bar_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.database}) : super(key: key);
  final Database database;

  static Widget create(BuildContext context, {required APIEndpoint api}) {
    return Provider<Database>(
      create: (context) => APIDatabase(api: api),
      child: Consumer<Database>(
        builder: (_, database, __) {
          return HomePage(database: database);
        },
      ),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  // Future<void> _signOut(BuildContext context) async {
  //   try {
  //     final auth = Provider.of<AuthBase>(context, listen: false);
  //     await auth.signOut();
  //   } on FirebaseAuthException catch (e) {
  //     showExceptionAlertDialog(
  //       context,
  //       title: 'Operation Failed',
  //       exception: e,
  //     );
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     IconButton(
        //       onPressed: () => _signOut(context),
        //       icon: const Icon(
        //         Icons.exit_to_app,
        //       ),
        //     )
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15.0),
                Text(
                  'Explore thousands of books on the go',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 30.0),
                SearchBarTextField(
                  prefixIcon: const Icon(Icons.search),
                  controller: _textController,
                  hintText: 'Search for books...',
                  onChanged: print,
                ),
                const SizedBox(height: 26.0),
                Text(
                  'Famous Books',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 16.0),
                FutureBuilder<List<Book>>(
                    future: widget.database.getBooks(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        final books = snapshot.data!;
                        if (books.isNotEmpty) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: books.length,
                            itemBuilder: (_, i) => BookContainer(
                              author: books[i].authors,
                              title: books[i].title,
                              rating: books[i].ratings,
                              category: books[i].category,
                              thumbnail: books[i].thumbnail,
                              onTap: () =>
                                  BookDetailsPage.show(context, book: books[i]),
                            ),
                          );
                        }
                      }
                      if (snapshot.hasError) {
                        print('==============');
                        print(snapshot.error);
                      }
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(color: Colors.black),
                      ));
                    }),
                const SizedBox(height: 28.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
