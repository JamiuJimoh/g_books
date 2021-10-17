import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'landing_page.dart';
import 'services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'Google Books App',
        theme: ThemeData(
          primaryColor: Colors.lightBlue[300],
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0.5,
            iconTheme: IconThemeData(color: Colors.black54),
            color: Colors.white,
          ),
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const LandingPage(),
      ),
    );
  }
}
