import 'package:flutter/material.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';

class PasswordResetSuccess extends StatefulWidget {
  const PasswordResetSuccess({Key? key}) : super(key: key);

  @override
  State<PasswordResetSuccess> createState() => _PasswordResetSuccessState();
}

class _PasswordResetSuccessState extends State<PasswordResetSuccess> {
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
          Image.asset("assets/password_reset.png"),
          const SizedBox(height: 42),
          const Text("Password Reset Successful",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const Text(
            "Enter your email address to set new password",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          Icon(
            Icons.check,
            color: Colors.green,
            size: 50,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Buttons().customElevatedButton(context, pressed: () {
              Navigator.pushNamed(context, signinScreen);
            }),
          )
        ]));
  }
}
