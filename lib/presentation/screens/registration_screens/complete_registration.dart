import 'package:flutter/material.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';

class CompleteRegistrationScreen extends StatefulWidget {
  const CompleteRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<CompleteRegistrationScreen> createState() =>
      _CompleteRegistrationScreenState();
}

class _CompleteRegistrationScreenState
    extends State<CompleteRegistrationScreen> {
  String fullname = "",
      country = "",
      address = "",
      email = "",
      phoneNum = "",
      password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 90),
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/logo_inverted.png")),
                    const SizedBox(height: 40),
                    const Text("Complete your registration",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text(
                        "Finalize the registration to access the next step",
                        style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 50),
                    SharedTextField().customTextfield(changed: (val) {
                      fullname = val.toString();
                    }, context,
                        text: "Full Name", icons: Icons.account_box_outlined),
                    const SizedBox(height: 15),
                    SharedTextField().customTextfield(changed: (val) {
                      fullname = val.toString();
                    }, context, text: "Country", icons: const IconData(0xf68d)),
                    const SizedBox(height: 15),
                    SharedTextField().customTextfield(changed: (val) {
                      fullname = val.toString();
                    }, context,
                        text: "Address", icons: Icons.location_on_outlined),
                    const SizedBox(height: 15),
                    SharedTextField().customTextfield(changed: (val) {
                      fullname = val.toString();
                    }, context,
                        text: "Email Address", icons: Icons.alternate_email),
                    const SizedBox(height: 15),
                    SharedTextField().customTextfield(changed: (val) {
                      fullname = val.toString();
                    }, context,
                        text: "Phone Number", icons: Icons.phone_outlined),
                    const SizedBox(height: 15),
                    SharedTextField().customTextfield(changed: (val) {
                      fullname = val.toString();
                    }, context, text: " Password", icons: Icons.lock_outline),
                    const SizedBox(height: 70),
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                            "🛡️ All of your information is confidential")),
                    SizedBox(height: 20),
                    Buttons().customElevatedButton(context, text: "Continue",
                        pressed: () {
                      Navigator.pushNamed(context, registrationSuccessScreen);
                    }),
                  ])),
        ));
  }
}
