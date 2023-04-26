import 'package:flutter/material.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/onboarding.png",
              height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                const Align(
                    alignment: Alignment.center,
                    child: Text("oownee", style: TextStyle(color: Colors.white, fontSize: 40))),
                const SizedBox(height: 190),
                const Text("Enjoy your vacations with us", style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: const Text("manage properties, rentals and tenants at the comfort of your own home", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                SizedBox(height: 50),
                Buttons().customElevatedButton(context, pressed: (){
                  Navigator.pushNamed(context, welcomeScreen);
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
