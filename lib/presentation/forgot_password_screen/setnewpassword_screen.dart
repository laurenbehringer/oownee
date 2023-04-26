import 'package:flutter/material.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  String newPassword = "";
  String reenterPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 90),
            Align(
                alignment: Alignment.center,
                child: Image.asset("assets/logo_inverted.png")),
            const SizedBox(height: 90),
            const Text(
              "Set New\nPassword",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const Text(
              "You can now set a new password for your account",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            SharedTextField().customTextfield(changed: (val) {
              newPassword = val.toString();
            }, context, text: "New Password", icons: Icons.lock_outline),
            SizedBox(height: 25),
            SharedTextField().customTextfield(changed: (val) {
              newPassword = val.toString();
            }, context,
                text: "Re-enter New Password", icons: Icons.lock_outline),
            const Spacer(),
            Buttons().customElevatedButton(context, text: "Reset Password",
                pressed: () {
              Navigator.pushNamed(context, passwordResetSuccessfullScreen);
            }),
            SizedBox(height: 10),
            Buttons().customElevatedButton(context,
                color: Color(0xfff8f8f8),
                text: "Back",
                textColor: Colors.black, pressed: () {
              Navigator.pushNamed(context, passwordResetSuccessfullScreen);
            }),
            SizedBox(height: 30),
          ]),
    ));
  }
}
