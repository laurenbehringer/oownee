import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/presentation/bloc/view_property/property_view_bloc.dart';
import 'package:oownee/presentation/screens/add_tenant_screen/add_tenant_screen.dart';
import 'package:oownee/presentation/screens/view_property/edit_property.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/cached_network_image.dart';
import 'package:oownee/presentation/shared_widgets/dialogs.dart';

class ViewPropertyScreen extends StatefulWidget {
  final propertyID;

  const ViewPropertyScreen({Key? key, required this.propertyID})
      : super(key: key);

  @override
  State<ViewPropertyScreen> createState() => _ViewPropertyScreenState();
}

class _ViewPropertyScreenState extends State<ViewPropertyScreen> {
  @override
  void initState() {
    BlocProvider.of<PropertyViewBloc>(context)
        .add(LoadPropertyViewEvent(propertyID: widget.propertyID));
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
            BlocBuilder<PropertyViewBloc, PropertyViewState>(
                builder: (context, state) {
              if (state is PropertyViewLoadState) {
                return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(child: CircularProgressIndicator()));
              }

              if (state is PropertyViewSuccessState) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Property Profile",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditPropertyScreen(
                                        property:
                                            state.propertyData.property[0])));
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
                            url: state.propertyData.property[0].propertyImage,
                          )),
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
                        Text(state.propertyData.property[0].propertyName,
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
                        Text(state.propertyData.property[0].propertyType,
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
                        Text(state.propertyData.property[0].propertyAddress,
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
                        Text(state.propertyData.property[0].monthlyRent,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Number of Tenants",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(state.propertyData.tenants.length.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Tenants",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Dialogs.confirmDialog(context, fun: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddTenantScren(
                                              propertyID: widget.propertyID)));
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff0065ff),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                child: const Text(
                                  "Add New Tenant",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => TenantListScreen(
                                //           allTenants: allTenants,
                                //         )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                child: const Text(
                                  "Tenant List",
                                  style: TextStyle(color: Color(0xff0065ff)),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 75,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.propertyData.tenants.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 200,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 70,
                                      child: CustomNetworkImage(
                                          url: state.propertyData.tenants[index]
                                              .tenantImage),
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.propertyData.tenants[index]
                                              .tenantName,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/dashboard/location_icon.png"),
                                            SizedBox(width: 5),
                                            Text(
                                              state.propertyData.property[0]
                                                  .propertyName,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "€ ${state.propertyData.tenants[index].tenantRent}",
                                          style: TextStyle(color: Colors.green),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: 50),
                    Buttons().customElevatedButton(context, text: "Done",
                        pressed: () {
                      Navigator.pop(context);
                    }),
                    const SizedBox(height: 10),
                    Buttons().iconButton(context,
                        text: "Download Property Documents",
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
                        text: "Upload Property Documents",
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
                    SizedBox(height: 50),
                  ],
                );
              }
              return Container();
            }),
          ],
        ),
      ),
    ));
  }
}
