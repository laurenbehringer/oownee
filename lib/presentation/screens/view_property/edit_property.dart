import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oownee/data/models/property_view_model/property_view_response_model.dart';
import 'package:oownee/data/static_data.dart';
import 'package:oownee/presentation/bloc/view_property/property_view_bloc.dart';
import 'package:oownee/presentation/bloc/view_tenant/view_tenant_bloc.dart';
import 'package:oownee/presentation/screens/view_property/view_property.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/cached_network_image.dart';
import 'package:oownee/presentation/shared_widgets/other.dart';

class EditPropertyScreen extends StatefulWidget {
  final Property property;

  const EditPropertyScreen({Key? key, required this.property})
      : super(key: key);

  @override
  State<EditPropertyScreen> createState() => _EditPropertyScreenState();
}

class _EditPropertyScreenState extends State<EditPropertyScreen> {
  XFile? propertyPhoto, propertydocumentPhoto;
  final ImagePicker _picker = ImagePicker();
  String dropdownValue = StaticData().dropdownItems.first;
  String? base64String;

  void PickFromGallery() async {
    final photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        propertyPhoto = photo;
      });
      final bytes = await photo.readAsBytes();
      base64String = base64Encode(bytes);
      print("base64 = $base64String");
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController name =
        TextEditingController(text: widget.property.propertyName);
    TextEditingController propertyType =
        TextEditingController(text: widget.property.propertyType);
    TextEditingController propertyAddress =
        TextEditingController(text: widget.property.propertyAddress);
    TextEditingController monthlyRent =
        TextEditingController(text: widget.property.monthlyRent);
    TextEditingController numberOfTenants =
        TextEditingController(text: widget.property.numberOfTenants);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<PropertyViewBloc, PropertyViewState>(
            listener: (context, state) {
              if (state is PropertyEditSuccessState) {
                print("fanny lol");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewPropertyScreen(
                              propertyID: widget.property.id,
                            )));
              }
            },
            builder: (context, state) {
              if (state is PropertyViewLoadState) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Column(
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
                      const Text("Edit Property Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {},
                        child: const Text("Save",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff0065ff))),
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
                                  child: CustomNetworkImage(
                                    url: widget.property.propertyImage,
                                  ),
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
                                PickFromGallery();
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
                  // OtherShared().editProfileWithIcon(context,
                  //     widget: Container(), controller: propertyType),
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
                  SizedBox(height: 20),
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
                    "Number of Tenants",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  OtherShared().editProfileWithIcon(context,
                      widget: Container(), controller: numberOfTenants),
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
                    propertydocumentPhoto =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      propertydocumentPhoto;
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
                    print("NO");
                    print("bruh $base64String");

                    BlocProvider.of<PropertyViewBloc>(context)
                        .add(LoadPropertyEditEvent(
                      property_id: widget.property.id,
                      property_name: name.text,
                      property_type: dropdownValue,
                      property_address: propertyAddress.text,
                      monthly_rent: monthlyRent.text,
                      image: base64String!,
                    ));
                  },
                      text: "Done",
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
              );
            },
          ),
        ),
      ),
    );
  }
}
