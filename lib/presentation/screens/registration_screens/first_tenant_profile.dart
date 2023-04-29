import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oownee/data/static_data.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/dropdown.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';

class TenantProfileScreen extends StatefulWidget {
  const TenantProfileScreen({Key? key}) : super(key: key);

  @override
  State<TenantProfileScreen> createState() => _TenantProfileScreenState();
}

class _TenantProfileScreenState extends State<TenantProfileScreen> {
  String propertyName = "",
      fullname = "",
      phone = "",
      email = "",
      birthdayDate = "";

  String dropdownValue = StaticData().propertyNames.first;
  int propertyRentPrice = 0;
  bool isEuro = false;

  final ImagePicker _picker = ImagePicker();
  XFile? tenantdocumentPhoto, tenantprofilePhoto;

  void PickFromGallery(XFile? photo) async {
    photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      tenantprofilePhoto = photo;
    });
  }

  String day = "21", month = "05", year = "23";

  DateTime? _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now()
          .subtract(Duration(days: 365)), // set the first date to one year ago
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
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
              const Text("Your First Tenant Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    PickFromGallery(tenantprofilePhoto);
                  },
                  child: Container(
                    height: 190,
                    width: 190,
                    child: Stack(
                      children: [
                        Container(
                            height: 172,
                            width: 172,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: tenantprofilePhoto == null
                                ? Image.asset(
                                    "assets/tenant_profile.png",
                                    fit: BoxFit.fill,
                                  )
                                : Image.file(
                                    File(tenantprofilePhoto!.path),
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
              const SizedBox(height: 40),
              const Text("Property Name ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              DropDown().DefDropDown(context, changed: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              }, value: dropdownValue, itemList: StaticData().propertyNames),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Property Rent Price",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xfff8f8f8),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
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
                              color: isEuro
                                  ? Colors.white
                                  : const Color(0xff0065ff),
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
                              color: isEuro
                                  ? const Color(0xff0065ff)
                                  : Colors.white,
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
                ],
              ),
              const SizedBox(height: 20),
              const Text("Full Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SharedTextField().defTextfield(context, changed: (val) {
                propertyName = val;
              }, text: "Enter your first and last name"),
              const SizedBox(height: 20),
              const Text("Phone",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SharedTextField().IconTextfield(context,
                  text: "Enter Phone Number",
                  widget: Row(
                    children: [
                      const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.phone_outlined,
                            color: Colors.black,
                            size: 15,
                          )),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset("assets/whatsapp.png"),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset("assets/telegram.png"),
                      ),
                    ],
                  ), changed: (val) {
                phone = val;
              }),
              const SizedBox(height: 20),
              const Text("Email",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SharedTextField().IconTextfield(context,
                  text: "Enter your email address",
                  widget: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                        size: 15,
                      )), changed: (val) {
                phone = val;
              }),
              const SizedBox(height: 20),
              const Text("Birthday Date",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print("show calendar");
                  _selectDate(context);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xfff8f8f8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month_outlined,
                          color: Color(0xff0065ff)),
                      SizedBox(width: 10),
                      Text(
                        _selectedDate == null
                            ? "Select Birth Date"
                            : "${_selectedDate!.day} / ${_selectedDate!.month} / ${_selectedDate!.year} ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text("Upload your property documents",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: tenantdocumentPhoto == null
                    ? Image.asset("assets/id.png", fit: BoxFit.fill)
                    : Image.file(File(tenantdocumentPhoto!.path),
                        fit: BoxFit.cover),
              ),
              const SizedBox(height: 15),
              const Text(
                  "** You can upload ID, passport, drivers license, rental contract or other document. **",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15)),
              const SizedBox(height: 50),
              Buttons().iconButton(context, pressed: () async {
                tenantdocumentPhoto =
                    await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  tenantdocumentPhoto;
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
              }, text: "Take Photo"),
              const SizedBox(height: 70),
              Buttons().customElevatedButton(context, pressed: () {
                Navigator.pushNamed(context, tenantregisteredsuccessScreen);
              },
                  text: "Save",
                  textColor: Colors.white,
                  color: const Color(0xff0065ff)),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
