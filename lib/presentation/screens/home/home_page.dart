import 'package:flutter/material.dart';

import '../../../models/book.dart';
import '../book_details/book_details_page.dart';
import 'widgets/book_container.dart';
import 'widgets/search_bar_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    return const HomePage();
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
                BookContainer(
                  author: _createBook().authors[0],
                  title: _createBook().title,
                  rating: _createBook().ratings.toString(),
                  category: _createBook().category,
                  thumbnail: _createBook().thumbnail,
                  onTap: () =>
                      BookDetailsPage.show(context, book: _createBook()),
                ),
                const SizedBox(height: 28.0),
                // BookContainer(onTap: () => BookDetailsPage.show(context)),
                // const SizedBox(height: 28.0),
                // BookContainer(onTap: () => BookDetailsPage.show(context)),
                // const SizedBox(height: 28.0),
                // BookContainer(onTap: () => BookDetailsPage.show(context)),
                // const SizedBox(height: 28.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Book _createBook() {
    return Book(
      bookId: 'bookId',
      authors: ['Joshua Becker'],
      title: 'The More of Less',
      publishedDate: '2015-10',
      description:
          'Lorem ipsum a ojejfs  lksiolekn lfds laljldko eoj. L sdjl s fdf dfld djsd  sdf sdf d a dfdkl;a.ada.d jldjld;f d fld f df dfl; ad f;dlf jd sdf',
      thumbnail:
          'https://books.google.com/books/content?id=bzekBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
      pageCount: 369,
      category: 'Computer',
      ratings: 3.5,
    );
  }
}
