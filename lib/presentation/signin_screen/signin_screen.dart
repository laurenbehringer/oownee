import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/presentation/bloc/login/login_bloc.dart';
import 'package:oownee/presentation/registration_screens/property_name.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginLoadingState) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return LoadingDialog();
                  },
                );
              }

              if (state is LoginSuccessState) {
                Navigator.pop(context);
                Navigator.pushNamed(context, dashboardScreen);
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset("assets/logo_inverted.png")),
                  const SizedBox(height: 70),
                  const Text("Sign In",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Text(
                        "manage properties, rentals and\ntenants at the comfort of your own home",
                        style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 30),
                  SharedTextField().customTextfield(context,
                      text: "Email Address",
                      icons: Icons.alternate_email_outlined, changed: (val) {
                    email = val;
                  }),
                  const SizedBox(height: 30),
                  SharedTextField().customTextfield(context,
                      text: "Password",
                      icons: Icons.lock_outline, changed: (val) {
                    password = val;
                  }),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, forgotPasswordScreen);
                    },
                    child: const Text("Forgot your password?",
                        style:
                            TextStyle(fontSize: 15, color: Colors.blueAccent)),
                  ),
                  const SizedBox(height: 20),
                  Buttons().customElevatedButton(context, pressed: () {
                    BlocProvider.of<LoginBloc>(context).add(LoadLoginEvent(
                        password = "admin@gmail.com", email = "admin"));
                  }),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Image.asset(
                          "assets/border_or.png",
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  const SizedBox(height: 20),
                  Buttons().iconButton(context,
                      pressed: () {},
                      text: "Sign in with Google",
                      img: "assets/google.png"),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("New to oownee?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, propertynameScreen);
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.indigo),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          )),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(width: 20),
          Text("Loading..."),
        ],
      ),
    );
  }
}