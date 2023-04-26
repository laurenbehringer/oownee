import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/dialogs.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset("assets/logo_inverted.png")),
                  const SizedBox(height: 50),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset("assets/forgot_password.png")),
                  SizedBox(height: 10),
                  const Text("Forgot\nPassword",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                  const Text("Enter your email address to set new password",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 25),
                  SharedTextField().customTextfield(changed: (val) {
                    email = val.toString();
                  }, context,
                      text: "Email Address",
                      icons: Icons.alternate_email_outlined),
                  SizedBox(height: 100),
                  BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                      listener: (context, state) {
                    if (state is ForgotPasswordFailedState) {
                      Dialogs().forgotPasswordDialog(context,
                          color: Colors.red,
                          text: "This email does not exist. Try Again",
                          icon: Icons.info_outline);
                    }

                    if (state is ForgotPasswordSuccessState) {
                      Dialogs().forgotPasswordDialog(context,
                          color: Colors.green,
                          text: "Successful! Check your mail box",
                          icon: Icons.check_circle_outline);
                    }
                  }, builder: (context, state) {
                    if (state is ForgotPasswordSuccessState) {
                      return Buttons().customElevatedButton(context,
                          pressed: () {
                        Navigator.pushNamed(context, setNewPasswordScreen);
                      }, text: "Set New Password");
                    }

                    if (state is ForgotPasswordFailedState) {
                      return Buttons().customElevatedButton(context,
                          pressed: () {
                        BlocProvider.of<ForgotPasswordBloc>(context)
                            .add(TryForgotPasswordEvent(email: email));
                      }, text: "Retry");
                    }

                    return Buttons().customElevatedButton(context, pressed: () {
                      BlocProvider.of<ForgotPasswordBloc>(context)
                          .add(TryForgotPasswordEvent(email: email));
                    }, text: "Send Instructions");
                  }),
                  SizedBox(height: 10),
                  Buttons().customElevatedButton(context,
                      pressed: () {},
                      text: "Back",
                      textColor: Colors.black,
                      color: Color(0xfff8f8f8)),
                ])));
  }
}
