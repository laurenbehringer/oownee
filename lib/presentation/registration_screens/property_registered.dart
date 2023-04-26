import 'package:flutter/material.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';

class PropertyRegisteredScreen extends StatefulWidget {
  const PropertyRegisteredScreen({Key? key}) : super(key: key);

  @override
  State<PropertyRegisteredScreen> createState() =>
      _PropertyRegisteredScreenState();
}

class _PropertyRegisteredScreenState extends State<PropertyRegisteredScreen> {
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
          Image.asset("assets/property_registered.png"),
          const SizedBox(height: 42),
          const Text("Registration Successful",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text(
            "Your first property is registered",
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
              Navigator.pushNamed(context, tenantProfileScreen);
            }),
          )
        ]));
  }
}
