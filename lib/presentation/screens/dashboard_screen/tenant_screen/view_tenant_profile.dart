import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/presentation/bloc/view_tenant/view_tenant_bloc.dart';
import 'package:oownee/presentation/screens/dashboard_screen/tenant_screen/edit_tenant_profile.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/cached_network_image.dart';

class ViewTenantProfile extends StatefulWidget {
  final String tenantID;
  const ViewTenantProfile({Key? key, required this.tenantID}) : super(key: key);

  @override
  State<ViewTenantProfile> createState() => _ViewTenantProfileState();
}

class _ViewTenantProfileState extends State<ViewTenantProfile> {
  @override
  void initState() {
    // TODO: implement initState
    print("t id = ${widget.tenantID}");
    BlocProvider.of<ViewTenantBloc>(context)
        .add(LoadTenantViewEvent(tenantID: widget.tenantID));

    super.initState();
  }

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
            BlocBuilder<ViewTenantBloc, ViewTenantState>(
              builder: (context, state) {
                if (state is TenantViewLoadState) {
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      child: const Center(child: CircularProgressIndicator()));
                }

                if (state is TenantViewSuccessState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Tenant Profile",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditTenantProfile(
                                          tenant: state.tenantData.data)));
                            },
                            child: const Text("Edit Profile",
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
                          padding: const EdgeInsets.all(10),
                          height: 162,
                          width: 162,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CustomNetworkImage(
                            url: state.tenantData.data.tenantImage,
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
                          Text(state.tenantData.data.tenantName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Property Name:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(state.tenantData.data.propertyName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Property Type:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(state.tenantData.data.propertyType,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Property Address:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(state.tenantData.data.propertyAddress,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Property Rent Price:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(state.tenantData.data.tenantRent,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.tenantData.data.tenantEmail.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          const CircleAvatar(
                              radius: 16,
                              backgroundColor: Color(0xFFEEEEEE),
                              child: Icon(
                                Icons.phone_outlined,
                                color: Colors.black,
                                size: 15,
                              )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Phone",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.tenantData.data.phoneNumber,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Row(
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
                          )
                        ],
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Bank Account Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.tenantData.data.tenantBankAccNo,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Tenant Starting Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${state.tenantData.data.date}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 60),
                      Buttons().customElevatedButton(context, text: "Done",
                          pressed: () {
                        Navigator.pop(context);
                      }),
                      const SizedBox(height: 10),
                      Buttons().iconButton(context,
                          text: "Download Profile Documents",
                          pressed: () {},
                          isImg: true,
                          img: "assets/download_document.png"),
                      const SizedBox(height: 10),
                      Buttons().iconButton(context,
                          text: "View Profile Documents",
                          pressed: () {},
                          isImg: true,
                          img: "assets/view_document.png"),
                      const SizedBox(height: 10),
                      Buttons().iconButton(context,
                          text: "Upload Profile Documents",
                          pressed: () {},
                          isImg: true,
                          img: "assets/upload_document.png"),
                      const SizedBox(height: 30),
                      Buttons().customElevatedButton(context,
                          textColor: Colors.black,
                          color: const Color(0xfff8f8f8),
                          text: "Back", pressed: () {
                        Navigator.pop(context);
                      }),
                    ],
                  );
                }

                return Container();
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    ));
  }
}
