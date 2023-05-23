import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oownee/presentation/bloc/add_new_property_tenant/add_new_bloc.dart';
import 'package:oownee/presentation/bloc/view_tenant/view_tenant_bloc.dart';
import 'package:oownee/presentation/screens/dashboard_screen/dashboard_screen.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/cached_network_image.dart';
import 'package:oownee/presentation/shared_widgets/dialogs.dart';
import 'package:oownee/presentation/shared_widgets/other.dart';

class AddTenantScren extends StatefulWidget {
  final String propertyID;
  const AddTenantScren({Key? key, required this.propertyID}) : super(key: key);

  @override
  State<AddTenantScren> createState() => _AddTenantScrenState();
}

class _AddTenantScrenState extends State<AddTenantScren> {
  XFile? tenantPhoto, tenantdocumentPhoto;
  final ImagePicker _picker = ImagePicker();

  void PickFromGallery() async {
    final photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      tenantPhoto = photo;
    });
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

  TextEditingController name = TextEditingController();
  TextEditingController propertyName = TextEditingController();
  TextEditingController tenantRent = TextEditingController();
  TextEditingController tenantEmail = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController tenantBankAccNo = TextEditingController();
  TextEditingController birthdate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<AddNewBloc, AddNewState>(
            listener: (context, state) {
              if (state is AddNewFailedState) {
                Dialogs().smallDialog(context,
                    color: Colors.red,
                    text: "Something failed",
                    icon: Icons.check_circle_outline);
              }

              if (state is AddNewSuccessState) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()));
              }
            },
            builder: (context, state) {
              if (state is AddNewLoadState) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
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
                    Text(widget.propertyID),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Add Tenant Profile",
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
                            tenantPhoto == null
                                ? Container(
                                    height: 160,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffd0d0d0),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                        "assets/tenant_profile.png"))
                                : Container(
                                    height: 160,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffd0d0d0),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Image.file(
                                      File(tenantPhoto!.path),
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
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Tenant Name:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        OtherShared().editProfile(controller: name)
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Property Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        OtherShared().editProfile(controller: propertyName)
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Property Rent Price",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        OtherShared()
                            .editProfile(controller: tenantRent, isMoney: true)
                      ],
                    ),
                    SizedBox(height: 20),
                    const Text(
                      "Email",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    OtherShared().editProfileWithIcon(context,
                        widget: GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            backgroundColor: Color(0xffd0d0d0),
                            child: Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        controller: tenantEmail),
                    SizedBox(height: 20),
                    const Text(
                      "Phone",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    OtherShared().editProfileWithIcon(context,
                        widget: Row(
                          children: [
                            const CircleAvatar(
                                radius: 16,
                                backgroundColor: Color(0xFFEEEEEE),
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
                        ),
                        controller: phoneNumber),
                    SizedBox(height: 20),
                    const Text(
                      "Bank Account Number",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    OtherShared().editProfileWithIcon(context,
                        widget: Container(), controller: tenantBankAccNo),
                    SizedBox(height: 20),
                    const Text("Tenant Starting Date",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
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
                                  ? "0-0-0000"
                                  : "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
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
                      BlocProvider.of<AddNewBloc>(context)
                          .add(LoadAddNewTenantEvent(
                        propertyID: widget.propertyID,
                        tenant_name: name.text,
                        rentPrice: tenantRent.text,
                        email: tenantEmail.text,
                        phone: phoneNumber.text,
                        bankaccNo: tenantBankAccNo.text,
                        birthDate:
                            "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}",
                        date:
                            "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}",
                        country: '',
                        tenant_image: '',
                        tenant_doc: '',
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
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
