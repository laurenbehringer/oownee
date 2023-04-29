import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/presentation/bloc/owner_view/owner_view_bloc.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/cached_network_image.dart';
import 'package:oownee/presentation/shared_widgets/other.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  void initState() {
    loadProfile();
    super.initState();
  }

  void loadProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('userID');

    BlocProvider.of<OwnerViewBloc>(context)
        .add(LoadOwnerEvent(ownerID: uid.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: BlocBuilder<OwnerViewBloc, OwnerViewState>(
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
                          'My Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Expanded(flex: 1, child: Container())
                    ],
                  ),
                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      child: Container(
                          height: 116,
                          width: 116,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffd0d0d0),
                          ),
                          child: CustomNetworkImage(
                            url: state.ownerData.data[0].image,
                          )),
                    ),
                  ),
                  const SizedBox(height: 25),
                  OtherShared()
                      .showData(controller: name, icon: Icons.person_outline),
                  const SizedBox(height: 20),
                  OtherShared()
                      .showData(controller: country, icon: Icons.language),
                  const SizedBox(height: 20),
                  OtherShared().showData(
                      icon: Icons.location_on_outlined, controller: address),
                  const SizedBox(height: 20),
                  OtherShared()
                      .showData(icon: Icons.alternate_email, controller: email),
                  const SizedBox(height: 20),
                  OtherShared()
                      .showData(icon: Icons.phone_outlined, controller: phone),
                  const SizedBox(height: 20),
                  OtherShared()
                      .showData(icon: Icons.lock_outline, controller: password),
                  Spacer(),
                  Buttons().customElevatedButton(context, text: "Edit Profile",
                      pressed: () {
                    Navigator.pushReplacementNamed(context, editProfileScreen);
                  }),
                ],
              );
            }

            return Container(
              height: MediaQuery.of(context).size.height,
              child: const Text("Failed to get user profile data"),
            );
          }),
        ),
      ),
    );
  }
}
