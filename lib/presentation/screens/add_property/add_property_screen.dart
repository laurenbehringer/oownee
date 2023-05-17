import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oownee/data/static_data.dart';
import 'package:oownee/presentation/bloc/add_new_property_tenant/add_new_bloc.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/cached_network_image.dart';
import 'package:oownee/presentation/shared_widgets/other.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({Key? key}) : super(key: key);

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  XFile? propertyPhoto, propertydocumentPhoto;
  final ImagePicker _picker = ImagePicker();
  String dropdownValue = StaticData().dropdownItems.first;
  String? uid, base64StringProperty, base64StringDocument;

  void PickPropertyPhoto() async {
    final photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        propertyPhoto = photo;
      });
      final bytes = await photo.readAsBytes();
      base64StringProperty = base64Encode(bytes);
      // print("base64 in class = $base64StringProperty");
    }
  }

  void PickDocumentPhoto(bool source) async {
    final photo = await _picker.pickImage(
        source: source ? ImageSource.gallery : ImageSource.camera);
    if (photo != null) {
      setState(() {
        propertydocumentPhoto = photo;
      });
      final bytes = await photo.readAsBytes();
      base64StringDocument = base64Encode(bytes);
      // print("base64 in class = $base64StringDocument");
    }
  }

  @override
  void initState() {
    loadProfile();
    super.initState();
  }

  void loadProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('userID');
  }

  TextEditingController name = TextEditingController();
  TextEditingController propertyType = TextEditingController();
  TextEditingController propertyAddress = TextEditingController();
  TextEditingController monthlyRent = TextEditingController();
  TextEditingController numberOfTenants = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 90),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/logo_inverted.png")),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Add New Property",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {},
                    child: const Text("Save",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff0065ff))),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 180,
                  width: 180,
                  child: Stack(
                    children: [
                      propertyPhoto == null
                          ? Container(
                              height: 160,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xffd0d0d0),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Image.asset("assets/property_profile.png"),
                            )
                          : Container(
                              height: 160,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xffd0d0d0),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Image.file(
                                File(propertyPhoto!.path),
                                fit: BoxFit.fill,
                              ),
                            ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: GestureDetector(
                          onTap: () async {
                            PickPropertyPhoto();
                          },
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              const Text(
                "Property Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 20),
              OtherShared().editProfileWithIcon(context,
                  widget: Container(), controller: name),
              SizedBox(height: 20),
              const Text(
                "Property Type",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffebeaeb),
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
              const Text(
                "Property Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 20),
              OtherShared().editProfileWithIcon(context,
                  widget: Container(), controller: propertyAddress),
              SizedBox(height: 20),
              const Text(
                "Property Rent Price",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 20),
              OtherShared().editProfileWithIcon(context,
                  widget: Container(), controller: monthlyRent),
              SizedBox(height: 20),
              const Text(
                "Number of tenants",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 20),
              OtherShared().editProfileWithIcon(context,
                  widget: Container(), controller: monthlyRent),
              const SizedBox(height: 50),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: propertydocumentPhoto == null
                    ? Image.asset("assets/id.png", fit: BoxFit.fill)
                    : Image.file(File(propertydocumentPhoto!.path),
                        fit: BoxFit.cover),
              ),
              const SizedBox(height: 15),
              const Text(
                  "** You can upload ID, passport, drivers license, rental contract or other document. **",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15)),
              const SizedBox(height: 50),
              Buttons().iconButton(context, pressed: () async {
                PickDocumentPhoto(true);
              },
                  isImg: false,
                  icon: Icons.upload_file,
                  text: "Upload Document",
                  textColor: Colors.white,
                  color: const Color(0xff0065ff)),
              const SizedBox(height: 10),
              Buttons().iconButton(context, pressed: () async {
                PickDocumentPhoto(false);
              }, text: "Take Photo"),
              const SizedBox(height: 90),
              Buttons().iconButton(context,
                  pressed: () {},
                  isImg: false,
                  icon: Icons.person_add_alt,
                  text: "Create Tenant",
                  textColor: Colors.white,
                  color: const Color(0xff0065ff)),
              const SizedBox(height: 10),
              Buttons().iconButton(
                context,
                pressed: () {},
                isImg: false,
                iconCol: Colors.black,
                icon: Icons.person_outline,
                text: "Select Tenant",
              ),
              SizedBox(height: 50),
              Buttons().customElevatedButton(context, pressed: () {
                BlocProvider.of<AddNewBloc>(context)
                    .add(LoadAddNewPropertyEvent(
                  propertyName: name.text,
                  numberofTenants: "1",
                  propertyType: propertyType.text,
                  monthlyRent: monthlyRent.text,
                  address: propertyAddress.text,
                  userId: uid!,
                  property_image: base64StringProperty!,
                  property_doc: base64StringProperty!,
                ));
              },
                  text: "Save",
                  textColor: Colors.white,
                  color: const Color(0xff0065ff)),
              const SizedBox(height: 20),
              Buttons().customElevatedButton(context,
                  textColor: Colors.black,
                  color: const Color(0xfff8f8f8),
                  text: "Back", pressed: () {
                Navigator.pop(context);
              }),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
