import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oownee/presentation/bloc/owner_view/owner_view_bloc.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/cached_network_image.dart';
import 'package:oownee/presentation/shared_widgets/other.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  XFile? ownerPhoto;
  final ImagePicker _picker = ImagePicker();

  void PickFromGallery() async {
    final photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      ownerPhoto = photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: BlocConsumer<OwnerViewBloc, OwnerViewState>(
              listener: (context, state) {
                if (state is OwnerEditSuccessState) {
                  Navigator.pushReplacementNamed(context, myprofileScreen);
                }
              },
              builder: (context, state) {
                if (state is OwnerLoadingState) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is OwnerSuccessState) {
                  TextEditingController name = TextEditingController(
                          text: state.ownerData.data[0].fullName),
                      country = TextEditingController(
                          text: state.ownerData.data[0].country),
                      address = TextEditingController(
                        text: state.ownerData.data[0].address,
                      ),
                      email = TextEditingController(
                          text: state.ownerData.data[0].email),
                      phone = TextEditingController(
                          text: state.ownerData.data[0].phoneNumber),
                      password = TextEditingController(
                          text: state.ownerData.data[0].password);

                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const CircleAvatar(
                                backgroundColor: Color(0xFFEEEEEE),
                                child: Icon(Icons.chevron_left),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 8,
                            child: Text(
                              'Edit My Profile',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Expanded(flex: 1, child: Container())
                        ],
                      ),
                      const SizedBox(height: 60),
                      Container(
                        height: 140,
                        width: 130,
                        child: Stack(
                          children: [
                            ownerPhoto == null
                                ? Container(
                                    height: 116,
                                    width: 116,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffd0d0d0),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: CustomNetworkImage(
                                      url: state.ownerData.data[0].image,
                                    ),
                                  )
                                : Container(
                                    height: 116,
                                    width: 116,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffd0d0d0),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Image.file(
                                      File(ownerPhoto!.path),
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
                      const SizedBox(height: 20),
                      OtherShared().showData(
                        isEdit: true,
                        icon: Icons.person_outline,
                        controller: name,
                      ),
                      const SizedBox(height: 20),
                      OtherShared().showData(
                        isEdit: true,
                        icon: Icons.language,
                        controller: country,
                      ),
                      const SizedBox(height: 20),
                      OtherShared().showData(
                        isEdit: true,
                        icon: Icons.location_on_outlined,
                        controller: address,
                      ),
                      const SizedBox(height: 20),
                      OtherShared().showData(
                        isEdit: true,
                        icon: Icons.alternate_email,
                        controller: email,
                      ),
                      const SizedBox(height: 20),
                      OtherShared().showData(
                        isEdit: true,
                        icon: Icons.phone_outlined,
                        controller: phone,
                      ),
                      const SizedBox(height: 20),
                      OtherShared().showData(
                        isEdit: true,
                        icon: Icons.lock_outline,
                        controller: password,
                      ),
                      const SizedBox(height: 80),
                      Buttons().customElevatedButton(context, text: "Save",
                          pressed: () async {
                        print(
                            "name = ${name.text}, country = ${country.text}, address = ${address.text}, email = ${email.text}, phonenum = ${phone.text}, address = ${address.text}");

                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String? uid = prefs.getString('userID');

                        BlocProvider.of<OwnerViewBloc>(context)
                            .add(LoadOwnerEditEvent(
                          ownerId: uid!,
                          name: name.text,
                          country: country.text,
                          email: email.text,
                          phoneNum: phone.text,
                          address: address.text,
                          // image: ownerPhoto!,
                        ));
                      }),
                    ],
                  );
                }

                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
