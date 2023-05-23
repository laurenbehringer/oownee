import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oownee/data/parameters/register_parameters.dart';
import 'package:oownee/data/static_data.dart';
import 'package:oownee/presentation/bloc/add_new_property_tenant/add_new_bloc.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/screens/registration_screens/property_registered.dart';
import 'package:oownee/presentation/screens/registration_screens/tenant_register_success.dart';
import 'package:oownee/presentation/screens/signin_screen/signin_screen.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/dialogs.dart';
import 'package:oownee/presentation/shared_widgets/dropdown.dart';
import 'package:oownee/presentation/shared_widgets/loading_dialog.dart';
import 'package:oownee/presentation/shared_widgets/navigator_extension.dart';
import 'package:oownee/presentation/shared_widgets/other.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';

class TenantProfileScreen extends StatefulWidget {
  final RegisterParameter param;
  const TenantProfileScreen({Key? key, required this.param}) : super(key: key);

  @override
  State<TenantProfileScreen> createState() => _TenantProfileScreenState();
}

class _TenantProfileScreenState extends State<TenantProfileScreen> {
  String dropdownValue = StaticData().propertyNames.first;
  int propertyRentPrice = 0;
  bool isEuro = false;
  String? uid, base64StringTenant, base64StringDocument, phone, email;

  final ImagePicker _picker = ImagePicker();
  XFile? tenantdocPhoto, tenantPhoto;

  void PickTenantPhoto() async {
    final photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        tenantPhoto = photo;
      });
      final bytes = await photo.readAsBytes();
      base64StringTenant = base64Encode(bytes);
      // print("base64 in class = $base64StringProperty");
    }
  }

  void PickDocumentPhoto(bool source) async {
    final photo = await _picker.pickImage(
        source: source ? ImageSource.gallery : ImageSource.camera);
    if (photo != null) {
      setState(() {
        tenantdocPhoto = photo;
      });
      final bytes = await photo.readAsBytes();
      base64StringDocument = base64Encode(bytes);
      // print("base64 in class = $base64StringDocument");
    }
  }

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController name =
        TextEditingController(text: widget.param.propertyName);

    TextEditingController rentPrice =
        TextEditingController(text: widget.param.rentPrice);

    TextEditingController fullName =
        TextEditingController(text: widget.param.tenantName);

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
                      context: context, txt: "Registering Tenant");
                },
              );
            }

            if (state is AddNewSuccessState) {
              context.pushReplacementScreen(TenantRegisterSuccess());
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
                  const Text("Your First Tenant Profile",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        PickTenantPhoto();
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
                                child: tenantPhoto == null
                                    ? Image.asset(
                                        "assets/tenant_profile.png",
                                        fit: BoxFit.fill,
                                      )
                                    : Image.file(
                                        File(tenantPhoto!.path),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  OtherShared().editProfileWithIcon(context,
                      widget: Container(), controller: name),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Property Rent Price",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffebeaeb),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              child: OtherShared().editProfileWithIcon(context,
                                  widget: Container(), controller: rentPrice),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  OtherShared().editProfileWithIcon(context,
                      widget: Container(), controller: fullName),
                  const SizedBox(height: 20),
                  const Text("Phone",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                    email = val;
                  }),
                  const SizedBox(height: 20),
                  const Text("Birthday Date",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffebeaeb),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month_outlined,
                              color: Color(0xff0065ff)),
                          SizedBox(width: 10),
                          Text(
                            _selectedDate == null
                                ? "select Birth Date"
                                : "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text("Upload your property documents",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: tenantdocPhoto == null
                        ? Image.asset("assets/id.png", fit: BoxFit.fill)
                        : Image.file(File(tenantdocPhoto!.path),
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
                  const SizedBox(height: 70),
                  Buttons().customElevatedButton(context, pressed: () {
                    if (name.text.isNotEmpty &&
                        rentPrice.text.isNotEmpty &&
                        fullName.text.isNotEmpty &&
                        phone!.isNotEmpty &&
                        email!.isNotEmpty &&
                        _selectedDate != null &&
                        base64StringTenant != "" &&
                        base64StringDocument != "" &&
                        widget.param.propertyID.isNotEmpty) {
                      BlocProvider.of<AddNewBloc>(context)
                          .add(LoadAddNewTenantEvent(
                        propertyID: widget.param.propertyID,
                        tenant_doc: base64StringDocument!,
                        tenant_image: base64StringTenant!,
                        rentPrice: rentPrice.text,
                        phone: phone!,
                        email: email!,
                        bankaccNo: "",
                        country: widget.param.country,
                        birthDate:
                            "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}",
                        date:
                            "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}",
                        tenant_name: name.text,
                      ));

                      print("base64 property : $base64StringTenant");
                      print("base64 document : $base64StringDocument");
                      print(widget.param.propertyID);
                    } else {
                      Dialogs().smallDialog(context,
                          color: Colors.red,
                          text: "Complete all required fields!");
                    }
                  },
                      text: "Save",
                      textColor: Colors.white,
                      color: const Color(0xff0065ff)),
                  const SizedBox(height: 50),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
