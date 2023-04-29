import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';

class ExplanationScreen extends StatefulWidget {
  const ExplanationScreen({Key? key}) : super(key: key);

  @override
  State<ExplanationScreen> createState() => _ExplanationScreenState();
}

class _ExplanationScreenState extends State<ExplanationScreen> {
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
          Image.asset("assets/continue_dashboard.png"),
          const SizedBox(height: 42),
          const Text("Continue to dashboard",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text(
            "You have successfully added first property and first tenant.\nContinue to dashboard to add new property and new tenant",
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
            child: Buttons().customElevatedButton(context,
                text: "Go to dashboard", pressed: () {
              Navigator.pushNamed(context, signinScreen);
            }),
          )
        ]));
  }
}
