import 'package:flutter/material.dart';
import 'package:oownee/data/models/property_view_model/property_view_response_model.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';
import 'package:oownee/presentation/shared_widgets/cached_network_image.dart';

class TenantListScreen2 extends StatefulWidget {
  final List<Tenant> tenant;
  final String propertyName;
  const TenantListScreen2(
      {Key? key, required this.tenant, required this.propertyName})
      : super(key: key);

  @override
  State<TenantListScreen2> createState() => _TenantListScreen2State();
}

class _TenantListScreen2State extends State<TenantListScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 90),
            Align(
                alignment: Alignment.center,
                child: Image.asset("assets/logo_inverted.png")),
            const SizedBox(height: 35),
            const Text("Select Tenants",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: widget.tenant.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        padding: const EdgeInsets.only(
                            left: 10, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xfff8f8f8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 80,
                                width: 70,
                                child: CustomNetworkImage(
                                  url: widget.tenant[index].tenantImage,
                                )),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.tenant[index].tenantName,
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "${widget.propertyName}",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                               const  SizedBox(height: 5),
                                Text(
                                  "${widget.tenant[index].tenantRent}€ income",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.green),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.remove_red_eye_outlined),
                           const SizedBox(width: 10),
                            const Icon(Icons.edit_outlined),
                            const SizedBox(width: 10),
                           const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      );
                    })),
            Align(
              alignment: Alignment.bottomCenter,
              child: Buttons().customElevatedButton(context, text: "Create New",
                  pressed: () {
                // Navigator.pushNamed(context, editProfileScreen);
              }),
            ),
            SizedBox(height: 15),
            Buttons().customElevatedButton(context,
                text: "Back",
                color: Color(0xfff8f8f8),
                textColor: Colors.black, pressed: () {
              // Navigator.pushNamed(context, editProfileScreen);
            }),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
