import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oownee/data/static_data.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';

class FirstPropertyProfileScreen extends StatefulWidget {
  const FirstPropertyProfileScreen({Key? key}) : super(key: key);

  @override
  State<FirstPropertyProfileScreen> createState() =>
      _FirstPropertyProfileScreenState();
}

class _FirstPropertyProfileScreenState
    extends State<FirstPropertyProfileScreen> {
  String propertyName = "", propertyAddress = "", noTenants = "";

  int propertyRentPrice = 0;
  bool isEuro = false;

  String dropdownValue = StaticData().dropdownItems.first;

  final ImagePicker _picker = ImagePicker();
  XFile? documentPhoto, propertyPhoto;

  void PickFromGallery(XFile? photo) async {
    photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      propertyPhoto = photo;
    });
  }

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
              const Text("Your First Property Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    PickFromGallery(propertyPhoto);
                  },
                  child: Container(
                    height: 190,
                    width: 190,
                    child: Stack(
                      children: [
                        Container(
                            height: 172,
                            width: 172,
                            child: propertyPhoto == null
                                ? Image.asset(
                                    "assets/property_profile.png",
                                    fit: BoxFit.fill,
                                  )
                                : Image.file(
                                    File(propertyPhoto!.path),
                                    fit: BoxFit.fill,
                                  )),
                        Positioned(
                          bottom: 1,
                          right: 1,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffd9e8ff),
                            ),
                            child: Image.asset(
                              "assets/camera.png",
                              color: const Color(0xff0065ff),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              const SizedBox(height: 25),
              const Text("Property Name ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SharedTextField().defTextfield(context, changed: (val) {
                propertyName = val;
              }, text: "Enter Property Name"),
              const SizedBox(height: 25),
              const Text("Property Type",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff8f8f8),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                  ),
                  value: dropdownValue,
                  items: StaticData()
                      .dropdownItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 25),
              const Text("Property Address",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SharedTextField().defTextfield(context, changed: (val) {
                propertyName = val;
              }, text: "Enter Property Address"),
              const SizedBox(height: 25),
              const Text("Property Rent Price",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xfff8f8f8),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 60,
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
                            propertyRentPrice = int.parse(val);
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
                          color:
                              isEuro ? Colors.white : const Color(0xff0065ff),
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
                              isEuro ? const Color(0xff0065ff) : Colors.white,
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
              const SizedBox(height: 25),
              const Text("Number of tenants",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SharedTextField().defTextfield(context, changed: (val) {
                propertyName = val;
              }, text: "Enter Number of tenants"),
              const SizedBox(height: 25),
              const Text("Upload your first documents",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: documentPhoto == null
                    ? Image.asset("assets/id.png", fit: BoxFit.fill)
                    : Image.file(File(documentPhoto!.path), fit: BoxFit.cover),
              ),
              const SizedBox(height: 15),
              const Text(
                  "** You can upload ID, passport, drivers license, rental contract or other document. **",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15)),
              const SizedBox(height: 50),
              Buttons().iconButton(context, pressed: () async {
                documentPhoto =
                    await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  documentPhoto;
                });
              },
                  isImg: false,
                  icon: Icons.upload_file,
                  text: "Upload Document",
                  textColor: Colors.white,
                  color: const Color(0xff0065ff)),
              const SizedBox(height: 10),
              Buttons().iconButton(context, pressed: () async {
                XFile? photo =
                    await _picker.pickImage(source: ImageSource.camera);
                setState(() {
                  propertyPhoto = photo;
                });
              }, text: "Take Photo"),
              const SizedBox(height: 35),
              const Text("Create your first tenant",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Buttons().iconButton(context, pressed: () {
                Navigator.pushNamed(context, propertyRegisteredScreen);
              },
                  img: "assets/create_tenant.png",
                  text: "Continue",
                  textColor: Colors.white,
                  color: const Color(0xff0065ff)),
              const SizedBox(height: 65),
            ],
          ),
        ),
      ),
    );
  }
}
