import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oownee/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:oownee/presentation/myprofile_screen/edit_profile.dart';
import 'package:oownee/presentation/myprofile_screen/my_profile_screen.dart';
import 'package:oownee/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:oownee/presentation/registration_screens/explanation_page.dart';
import 'package:oownee/presentation/registration_screens/first_tenant_profile.dart';
import 'package:oownee/presentation/routes/routes.dart';
import 'package:oownee/presentation/signin_screen/signin_screen.dart';
import 'package:oownee/presentation/welcome_screen/welcome_screen.dart';
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
      home: LoginIn(),
    );
  }
}
