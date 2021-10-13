import 'package:flutter/material.dart';
import 'package:g_books/presentation/screens/home/widgets/image_container.dart';

class BookContainer extends StatelessWidget {
  const BookContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const ImageContainer(),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'by Joshua Becker',
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  'The More of Less',
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
                      '4.5',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const _BookCategoryChip(category: 'Computer'),
              ],
            ),
          ),
        ],
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
