import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/data/parameters/register_parameters.dart';
import 'package:oownee/data/static_data.dart';
import 'package:oownee/presentation/bloc/add_new_property_tenant/add_new_bloc.dart';
import 'package:oownee/presentation/bloc/register/register_bloc.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/screens/registration_screens/property_registered.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/dialogs.dart';
import 'package:oownee/presentation/shared_widgets/loading_dialog.dart';
import 'package:oownee/presentation/shared_widgets/navigator_extension.dart';
import 'package:oownee/presentation/shared_widgets/other.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';

class FirstPropertyProfileScreen extends StatefulWidget {
  final RegisterParameter param;
  const FirstPropertyProfileScreen({Key? key, required this.param})
      : super(key: key);

  @override
  State<FirstPropertyProfileScreen> createState() =>
      _FirstPropertyProfileScreenState();
}

class _FirstPropertyProfileScreenState
    extends State<FirstPropertyProfileScreen> {
  bool isEuro = false;

  String dropdownValue = StaticData().dropdownItems.first;

  final ImagePicker _picker = ImagePicker();
  XFile? documentPhoto, propertyPhoto;
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
        documentPhoto = photo;
      });
      final bytes = await photo.readAsBytes();
      base64StringDocument = base64Encode(bytes);
      // print("base64 in class = $base64StringDocument");
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController name =
        TextEditingController(text: widget.param.propertyName);

    TextEditingController address =
        TextEditingController(text: widget.param.address);

    TextEditingController monthlyRent =
        TextEditingController(text: widget.param.rentPrice);

    TextEditingController tenantsNo = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocConsumer<AddNewBloc, AddNewState>(
          listener: (context, state) {
            if (state is AddNewLoadState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return LoadingDialog(
                      context: context, txt: "Registering Property");
                },
              );
            }

            if (state is AddNewFailedState) {
              Navigator.pop(context);
              Dialogs().smallDialog(context,
                  color: Colors.red, text: state.response.message);
            }

            if (state is AddNewFailedUnexpectedState) {
              Navigator.pop(context);
              Dialogs()
                  .smallDialog(context, color: Colors.red, text: state.msg);
            }

            if (state is AddPropertySuccessState) {
              Navigator.pop(context);
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return LoadingDialog(
                      context: context, txt: "Uploading Property Images..");
                },
              );
              BlocProvider.of<AddNewBloc>(context)
                  .add(LoadUploadPropertyImgEvent(
                propertyId: state.response.propertyId.toString(),
                propertyImg: base64StringProperty!,
                propertyDoc: base64StringDocument!,
              ));
            }

            if (state is AddPropertyImageSuccessState) {
              Navigator.pop(context);
              context.pushScreen(PropertyRegisteredScreen(param: widget.param));
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                    if (state is RegisterSuccessState) {
                      uid = state.response.ownerId.toString();
                    }
                    return Container();
                  }),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset("assets/logo_inverted.png")),
                  const SizedBox(height: 40),
                  const Text("Your First Property Profile",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        PickPropertyPhoto();
                      },
                      child: Container(
                        height: 190,
                        width: 190,
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
                                    child: Image.asset(
                                      "assets/property_profile.png",
                                      fit: BoxFit.fill,
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
                  const Text("Property Name ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  OtherShared().editProfileWithIcon(context,
                      widget: Container(), controller: name),
                  const SizedBox(height: 25),
                  const Text("Property Type",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                      value: widget.param.propertyType.toString(),
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
                          widget.param.propertyType = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text("Property Address",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  OtherShared().editProfileWithIcon(context,
                      widget: Container(), controller: address),
                  const SizedBox(height: 25),
                  const Text("Property Rent Price",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  OtherShared().editProfileWithIcon(context,
                      widget: Container(), controller: monthlyRent),
                  const SizedBox(height: 25),
                  const Text("Number of tenants",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  OtherShared().editProfileWithIcon(context,
                      widget: Container(), controller: tenantsNo),
                  const SizedBox(height: 25),
                  const Text("Upload your first documents",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: documentPhoto == null
                        ? Image.asset("assets/id.png", fit: BoxFit.fill)
                        : Image.file(File(documentPhoto!.path),
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
                  const SizedBox(height: 35),
                  const Text("Create your first tenant",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Buttons().iconButton(context, pressed: () {
                    print("base64 property : $base64StringProperty");
                    print("base64 document : $base64StringDocument");

                    print("address: ${address.text}");
                    print("user id: ${uid}");

                    if (name.text.isNotEmpty &&
                        widget.param.propertyType.isNotEmpty &&
                        address.text.isNotEmpty &&
                        base64StringDocument!.isNotEmpty &&
                        base64StringProperty!.isNotEmpty &&
                        monthlyRent.text.isNotEmpty) {
                      BlocProvider.of<AddNewBloc>(context)
                          .add(LoadAddNewPropertyEvent(
                        propertyName: name.text,
                        numberofTenants: "1",
                        propertyType: widget.param.propertyType,
                        address: address.text,
                        monthlyRent: monthlyRent.text,
                        maintenance_charge: widget.param.maintenanceFee,
                        userId: "2",
                      ));
                    } else {
                      Dialogs().smallDialog(context,
                          color: Colors.red,
                          text: "Complete all required fields!");
                    }
                  },
                      img: "assets/create_tenant.png",
                      text: "Continue",
                      textColor: Colors.white,
                      color: const Color(0xff0065ff)),
                  const SizedBox(height: 65),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
