import 'package:flutter/material.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/dialogs.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/onboarding.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Align(
                    alignment: Alignment.center,
                    child: Text("oownee",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                const SizedBox(height: 280),
                const Text("Welcome",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const Text(
                      "manage properties, rentals and tenants at the comfort of your own home",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                SizedBox(height: 35),
                Buttons().customElevatedButton(context, pressed: () {
                  Navigator.pushNamed(context, signinScreen);
                }),
                const SizedBox(height: 10),
                Buttons().iconButton(context,
                    pressed: () {},
                    text: "Join with Google",
                    img: "assets/google.png",
                    color: Colors.white),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        Dialogs().forgotPasswordDialog(context);
                      },
                      child: const Text(
                        "Change Language",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
