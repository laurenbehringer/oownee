import 'package:flutter/material.dart';
import 'package:oownee/presentation/home_screen/home_screen.dart';
import 'package:oownee/presentation/onboarding_screen/onboarding_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context){
            return const OnboardingScreen();
          }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff023e8a),
      body: Center(
        child: Image.asset("assets/logo.png"),
      )
    );
  }
}
