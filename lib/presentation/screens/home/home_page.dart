import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(height: 15.0),
              Text(
                'Explore thousands of books on the go',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
