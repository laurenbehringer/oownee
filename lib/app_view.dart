import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oownee/presentation/routes/routes.dart';
import 'package:oownee/presentation/screens/signin_screen/signin_screen.dart';
import 'package:oownee/temp_test.dart';
import 'package:oownee/test_screen.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'oownee',
      onGenerateRoute: Routes().onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.sourceSansProTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const SignInScreen(),
    );
  }
}
