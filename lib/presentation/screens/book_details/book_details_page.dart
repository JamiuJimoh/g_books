import 'package:flutter/material.dart';
import 'package:g_books/models/book.dart';
import 'package:g_books/presentation/custom_widgets/custom_elevated_button.dart';
import 'package:g_books/presentation/custom_widgets/image_container.dart';

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
      bottomNavigationBar: const CustomElevatedButton(
        child: Text('Add to Favorites'),
        height: 50.0,
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       pinned: true,
      //       expandedHeight: _height,
      //       flexibleSpace: Stack(
      //         clipBehavior: Clip.none,
      //         children: [
      //           Positioned(
      //             child: Container(
      //               color: Colors.red,
      //               height: 100.0,
      //               width: 100.0,
      //             ),
      //             bottom: -50.0,
      //           ),
      //           FlexibleSpaceBar(
      //             title: Text(widget.book.title),
      //           ),
      //         ],
      //       ),
      // flexibleSpace: FlexibleSpaceBar(
      //   title: Text(widget.book.title),
      //   centerTitle: true,
      //   background: Container(
      //     decoration: BoxDecoration(
      //       borderRadius: const BorderRadius.only(
      //         bottomLeft: Radius.circular(35.0),
      //         bottomRight: Radius.circular(35.0),
      //       ),
      //       image: DecorationImage(
      //         image: NetworkImage(widget.book.thumbnail),
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //     // child: Image.network(
      //     //   widget.book.thumbnail,
      //     //   fit: BoxFit.cover,
      //     // ),
      //   ),
      // ),
      // ),
      // const SliverToBoxAdapter(child: SizedBox(height: padVal)),
      // SliverPadding(
      //   padding:
      //       const EdgeInsets.symmetric(vertical: 10.0, horizontal: padVal),
      //   sliver: SliverToBoxAdapter(child: _bookInfo()),
      // ),
      // const SliverToBoxAdapter(child: SizedBox(height: 200.0)),
      // const SliverToBoxAdapter(child: SizedBox(height: 200.0)),
      // const SliverToBoxAdapter(child: SizedBox(height: 200.0)),
      // const SliverToBoxAdapter(child: SizedBox(height: 200.0)),
      // const SliverToBoxAdapter(child: SizedBox(height: 200.0)),
      //     ],
      //   ),
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
                                    'by ${widget.book.authors[0]}',
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
                children: [
                  ..._bookInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _bookInfo() {
    const style = TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
    );
    const subStyle = TextStyle(
      fontSize: 14.0,
    );
    return [
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
      const SizedBox(height: 6.0),
      Row(
        children: [
          const Text('Category', style: style),
          const SizedBox(width: 5.0),
          Text(widget.book.category, style: style),
        ],
      ),
    ];
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.grey[200],
    //     borderRadius: const BorderRadius.all(Radius.circular(7.0)),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         Row(
    //           children: [
    //             const Icon(Icons.star, color: Colors.amber),
    //             const SizedBox(width: 5.0),
    //             Text(widget.book.ratings.toString(), style: style),
    //           ],
    //         ),
    //         Text(widget.book.category, style: style),
    //         Row(
    //           children: [
    //             Text('${widget.book.pageCount}', style: style),
    //             const SizedBox(width: 5.0),
    //             const Text('pages', style: subStyle),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),

    //   // appBar: AppBar(
    //   //   flexibleSpace: ,
    //   // ),
    // );
  }
}
