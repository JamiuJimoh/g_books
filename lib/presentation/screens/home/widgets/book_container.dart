import 'package:flutter/material.dart';

import '../../../custom_widgets/image_container.dart';

class BookContainer extends StatelessWidget {
  const BookContainer({
    Key? key,
    required this.onTap,
    required this.title,
    required this.author,
    required this.category,
    required this.rating,
    required this.thumbnail
  }) : super(key: key);
  final Function() onTap;
  final String title;
  final String author;
  final String category;
  final String rating;
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 180.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Row(
          children: [
            ImageContainer(thumbnail: thumbnail),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'by $author',
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18.0),
                      const SizedBox(width: 7.0),
                      Text(
                        rating,
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  _BookCategoryChip(category: category),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookCategoryChip extends StatelessWidget {
  const _BookCategoryChip({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[300],
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Text(
        category,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
              color: Colors.white,
              fontSize: 12.0,
            ),
      ),
    );
  }
}
