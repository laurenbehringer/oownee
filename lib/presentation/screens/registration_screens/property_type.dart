import 'package:flutter/material.dart';
import 'package:oownee/data/models/property_type.dart';
import 'package:oownee/data/parameters/register_parameters.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/screens/registration_screens/pricing.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/navigator_extension.dart';

class PropertyTypeScreen extends StatefulWidget {
  final RegisterParameter param;

  const PropertyTypeScreen({Key? key, required this.param}) : super(key: key);

  @override
  State<PropertyTypeScreen> createState() => _PropertyTypeScreenState();
}

class _PropertyTypeScreenState extends State<PropertyTypeScreen> {
  int selectedIndex = 0;

  List<PropertyType> propertyTypes = [
    PropertyType(
        assets: "assets/property_type/house.png",
        color: const Color(0xff1e1e1e),
        title: "My\nHouse",
        type: "House"),
    PropertyType(
        assets: "assets/property_type/apartment.png",
        color: const Color(0xfffcefef),
        title: "My\nApartment",
        type: "Apartment"),
    PropertyType(
        assets: "assets/property_type/studio.png",
        color: const Color(0xffe6fcfe),
        title: "My\nStudio",
        type: "Studio"),
    PropertyType(
        assets: "assets/property_type/condo.png",
        color: const Color(0xfff9effc),
        title: "My\nCondo",
        type: "Condo"),
    PropertyType(
        assets: "assets/property_type/other.png",
        color: const Color(0xffe6feeb),
        title: "Other",
        type: "Other")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 90),
          Align(
              alignment: Alignment.center,
              child: Image.asset("assets/logo_inverted.png")),
          const SizedBox(height: 40),
          const Text("Property Type",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text("Select the type of property you have available to rent",
              style: TextStyle(fontSize: 14)),
          const SizedBox(height: 45),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items per row
                childAspectRatio: (4 / 5.5), //left
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ),
              itemCount: propertyTypes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.param.propertyType =
                          propertyTypes[index].type.toString();
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: propertyTypes[index].color,
                    ),
                    padding: const EdgeInsets.only(left: 20, top: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        selectedIndex == index
                            ? const SizedBox(
                                height: 20,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(height: 20),
                        SizedBox(height: 10),
                        Image.asset(propertyTypes[index].assets),
                        const SizedBox(height: 15),
                        Text(
                          propertyTypes[index].title,
                          style: TextStyle(
                              fontSize: 15,
                              color: index == 0 ? Colors.white : Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Buttons().customElevatedButton(context, text: "Continue",
              pressed: () {
            if (widget.param.propertyType.isEmpty) {
              widget.param.propertyType = "house";
            }
            print(widget.param.propertyType);

            // Navigator.pushNamed(context, pricingScreen);
            context.pushScreen(PricingScreen(param: widget.param));
          }),
          const SizedBox(height: 10),
          Buttons().customElevatedButton(context,
              text: "Back", textColor: Colors.black, pressed: () {
            Navigator.pop(context);
          }, color: const Color(0xfff8f8f8)),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}
