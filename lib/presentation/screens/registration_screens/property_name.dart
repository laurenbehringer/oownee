import 'package:flutter/material.dart';
import 'package:oownee/data/parameters/register_parameters.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/screens/registration_screens/property_type.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/dialogs.dart';
import 'package:oownee/presentation/shared_widgets/navigator_extension.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';

class PropertyNameScreen extends StatefulWidget {
  const PropertyNameScreen({Key? key}) : super(key: key);

  @override
  State<PropertyNameScreen> createState() => _PropertyNameScreenState();
}

class _PropertyNameScreenState extends State<PropertyNameScreen> {
  RegisterParameter param = RegisterParameter();

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
              const SizedBox(height: 80),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/logo_inverted.png")),
              const SizedBox(height: 40),
              const Text("Property Name",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SharedTextField().defTextfield(context, changed: (val) {
                param.propertyName = val;
              }, text: "Enter Property Name"),
              const SizedBox(height: 25),
              const Text("Tenants",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SharedTextField().defTextfield(
                context,
                text: "Enter name of tenant",
                changed: (val) {
                  param.tenantName = val;
                },
              ),
              const SizedBox(height: 40),
              const Text("Start with your first property & first Tenant "),
              const SizedBox(
                height: 50,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/property_name.png")),
              const SizedBox(
                height: 40,
              ),
              Buttons().customElevatedButton(context, text: "Continue",
                  pressed: () {
                if (param.tenantName.isNotEmpty &&
                    param.propertyName.isNotEmpty) {
                  context.pushScreen(PropertyTypeScreen(param: param));
                } else {
                  print("empty");
                  Dialogs().smallDialog(context,
                      color: Colors.red, text: "Fill all queries");
                }
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Sign in"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
