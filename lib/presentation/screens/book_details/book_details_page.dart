import 'package:flutter/material.dart';
import '../../../models/book.dart';
import '../../custom_widgets/image_container.dart';
import 'widgets/add_to_fav_button.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({Key? key, required this.book}) : super(key: key);
  final Book book;

  static Future<void> show(BuildContext context, {required Book book}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookDetailsPage(book: book),
      ),
    );
  }

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  late double _height;

  static const _padVal = 20.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _height = MediaQuery.of(context).size.height * 0.4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
        child: AddToFavButton(onPressed: () => print('object')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 50.0, left: _padVal, right: _padVal),
                  height: _height,
                  width: double.infinity,
                  color: const Color(0xFFDDE8ED),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: Navigator.of(context).pop,
                        child: const Icon(Icons.chevron_left, size: 35),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: _padVal),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.book.title,
                                    style: const TextStyle(
                                      color: Color(0xFF3F3F3F),
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    'by ${widget.book.authors}',
                                    style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -(_height / 7),
                  right: _padVal,
                  child: ImageContainer(
                    thumbnail: widget.book.thumbnail,
                    height: 230.0,
                    width: 150.0,
                  ),
                ),
              ],
            ),

            // !=============================
            const SizedBox(height: 45.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: _padVal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._bookInfo(),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Synopsis',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.book.description,
                    style: const TextStyle(
                      color: Color(0xFF3F3F3F),

                      fontSize: 18.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _bookInfo() {
    const subStyle = TextStyle(
      fontSize: 14.0,
    );
    return [
      if (widget.book.category.isNotEmpty)
        Row(
          children: [
            const Icon(Icons.category),
            const SizedBox(width: 6.0),
            Text(widget.book.category, style: subStyle),
            const SizedBox(width: 4.0),
          ],
        ),
      const SizedBox(height: 6.0),
      Row(
        children: [
          const Icon(Icons.star, color: Colors.amber),
          const SizedBox(width: 6.0),
          Text(widget.book.ratings.toString(), style: subStyle),
          const SizedBox(width: 4.0),
          const Text('Ratings', style: subStyle),
        ],
      ),
      const SizedBox(height: 6.0),
      Row(
        children: [
          const Icon(Icons.book_online),
          const SizedBox(width: 6.0),
          Text(widget.book.pageCount.toString(), style: subStyle),
          const SizedBox(width: 4.0),
          const Text('Pages', style: subStyle),
        ],
      ),
    ];
  }
}
