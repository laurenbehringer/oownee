import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oownee/data/parameters/register_parameters.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/screens/registration_screens/complete_registration.dart';
import 'package:oownee/presentation/screens/registration_screens/first_tenant_profile.dart';
import 'package:oownee/presentation/screens/registration_screens/registration_success.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/navigator_extension.dart';

class PricingScreen extends StatefulWidget {
  final RegisterParameter param;
  const PricingScreen({Key? key, required this.param}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  bool hasPrice = false;
  bool isEuro = false;
  int rentalPrice = 0;
  int maintenanceFee = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 90),
            Align(
                alignment: Alignment.center,
                child: Image.asset("assets/logo_inverted.png")),
            const SizedBox(height: 40),
            const Text("Pricing",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("Enter the monthly rental price for your property",
                style: TextStyle(fontSize: 14)),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xfff8f8f8),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (val) {
                        setState(() {
                          rentalPrice = int.parse(val);
                          widget.param.rentPrice = val;
                        });
                      },
                      decoration: const InputDecoration.collapsed(
                          hintText: "Monthly Rental Price"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEuro = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isEuro ? Colors.white : Color(0xff0065ff),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.attach_money,
                        color: isEuro ? Colors.grey : Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEuro = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isEuro ? Color(0xff0065ff) : Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.euro,
                        color: isEuro ? Colors.white : Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            rentalPrice == 0
                ? const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Charges will show when you enter a monthly\nrental price",
                      textAlign: TextAlign.center,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Charge",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      const Text(
                          "Enter the monthly maintenance fee. (All expenses of your property cost monthly)",
                          style: TextStyle(fontSize: 14)),
                      const SizedBox(height: 20),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color(0xfff8f8f8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (val) {
                                  setState(() {
                                    maintenanceFee = int.parse(val);
                                    widget.param.maintenanceFee = val;
                                  });
                                },
                                decoration: const InputDecoration.collapsed(
                                    hintText: "Monthly Maintenance Fee"),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEuro = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      isEuro ? Colors.white : Color(0xff0065ff),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                  ),
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  Icons.attach_money,
                                  color: isEuro ? Colors.grey : Colors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEuro = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      isEuro ? Color(0xff0065ff) : Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Icon(Icons.euro,
                                    color: isEuro ? Colors.white : Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [Text("Rental Income")]),
                          Row(children: [
                            Text("$rentalPrice"),
                          ]),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [Text("Rental Maintenance Fee")]),
                          Row(children: [
                            Text("- $maintenanceFee"),
                          ]),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [Text("Total Income")]),
                          Row(children: [
                            Text("${rentalPrice - maintenanceFee}"),
                          ]),
                        ],
                      ),
                    ],
                  ),
            SizedBox(height: 20),
            // const Spacer(),
            Buttons().customElevatedButton(context, text: "Continue",
                pressed: () {
              context
                  .pushScreen(CompleteRegistrationScreen(param: widget.param));
              // context.pushScreen(TenantProfileScreen(param: widget.param));
              // context.pushScreen(RegistrationSucessScreen(param: widget.param));
            }),
            const SizedBox(height: 10),
            Buttons().customElevatedButton(context,
                text: "Back",
                pressed: () {},
                color: Color(0xfff8f8f8),
                textColor: Colors.black),
            const SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }
}
