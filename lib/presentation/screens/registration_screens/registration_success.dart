import 'package:flutter/material.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';

class RegistrationSucessScreen extends StatefulWidget {
  const RegistrationSucessScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationSucessScreen> createState() =>
      _RegistrationSucessScreenState();
}

class _RegistrationSucessScreenState extends State<RegistrationSucessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          const SizedBox(height: 90),
          Align(
              alignment: Alignment.center,
              child: Image.asset("assets/logo_inverted.png")),
          const SizedBox(height: 70),
          Image.asset("assets/regist_success.png"),
          const SizedBox(height: 42),
          const Text("Registration Successful",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text(
            "You can now continue",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          const Icon(
            Icons.check,
            color: Colors.green,
            size: 50,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Buttons().customElevatedButton(context, text: "Continue",
                pressed: () {
              Navigator.pushNamed(context, firstPropertyprofileScreen);
            }),
          )
        ]));
  }
}
