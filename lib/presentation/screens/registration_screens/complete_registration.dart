import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/data/parameters/register_parameters.dart';
import 'package:oownee/presentation/bloc/register/register_bloc.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/screens/registration_screens/registration_success.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/dialogs.dart';
import 'package:oownee/presentation/shared_widgets/loading_dialog.dart';
import 'package:oownee/presentation/shared_widgets/navigator_extension.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';

class CompleteRegistrationScreen extends StatefulWidget {
  final RegisterParameter param;
  const CompleteRegistrationScreen({Key? key, required this.param})
      : super(key: key);

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
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoadingState) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return LoadingDialog(
                      context: context,
                      txt: "Completing Registration..",
                    );
                  },
                );
              }

              if (state is RegisterSuccessState) {
                print("response =: ${state.response}");
                print(
                    "ownerinfo =: ${state.response.ownerId} ... ${state.response.ownerEmail}");

                context
                    .pushScreen(RegistrationSucessScreen(param: widget.param));
              }
              if (state is RegisterFailedUnexpectedState) {
                Dialogs()
                    .smallDialog(context, color: Colors.red, text: state.msg);
              }
              if (state is RegisterFailedState) {
                Dialogs().smallDialog(context,
                    color: Colors.red, text: state.response.message);
              }
            },
            builder: (context, state) {
              return Container(
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
                            text: "Full Name",
                            icons: Icons.account_box_outlined),
                        const SizedBox(height: 15),
                        SharedTextField().customTextfield(changed: (val) {
                          country = val.toString();
                        }, context,
                            text: "Country", icons: const IconData(0xf68d)),
                        const SizedBox(height: 15),
                        SharedTextField().customTextfield(changed: (val) {
                          address = val.toString();
                        }, context,
                            text: "Address", icons: Icons.location_on_outlined),
                        const SizedBox(height: 15),
                        SharedTextField().customTextfield(changed: (val) {
                          email = val.toString();
                        }, context,
                            text: "Email Address",
                            icons: Icons.alternate_email),
                        const SizedBox(height: 15),
                        SharedTextField().customTextfield(changed: (val) {
                          phoneNum = val.toString();
                        }, context,
                            text: "Phone Number", icons: Icons.phone_outlined),
                        const SizedBox(height: 15),
                        SharedTextField().customTextfield(changed: (val) {
                          password = val.toString();
                        }, context,
                            text: " Password", icons: Icons.lock_outline),
                        const SizedBox(height: 70),
                        const Align(
                            alignment: Alignment.center,
                            child: Text(
                                "🛡️ All of your information is confidential")),
                        SizedBox(height: 20),
                        Buttons().customElevatedButton(context,
                            text: "Continue", pressed: () {
                          if (fullname.isNotEmpty &&
                              country.isNotEmpty &&
                              email.isNotEmpty &&
                              address.isNotEmpty &&
                              password.isNotEmpty &&
                              phoneNum.isNotEmpty) {
                            BlocProvider.of<RegisterBloc>(context).add(
                                LoadRegisterEvent(
                                    name: fullname,
                                    country: country,
                                    address: address,
                                    email: email,
                                    phone: phoneNum,
                                    password: password));
                          } else {
                            Dialogs().smallDialog(context,
                                color: Colors.red, text: "Fill all queries");
                          }
                        }),
                      ]));
            },
          ),
        ));
  }
}
