import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oownee/data/models/dashboard_response_model.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';

class TenantListScreen extends StatefulWidget {
  final List<Tenant> allTenants;
  const TenantListScreen({Key? key, required this.allTenants})
      : super(key: key);

  @override
  State<TenantListScreen> createState() => _TenantListScreenState();
}

class _TenantListScreenState extends State<TenantListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        // height: MediaQuery.of(context).size.height,
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
                      return SizedBox(height: 10);
                    },
                    itemCount: widget.allTenants.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        padding: EdgeInsets.only(
                            left: 10, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xfff8f8f8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              child: Image.asset(
                                "assets/dashboard/tenant_def.png",
                                fit: BoxFit.fill,
                              ),
                              /*CachedNetworkImage(
                                imageUrl: widget.allTenants[index].tenantImage,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: imageProvider,
                                    ),
                                  ),
                                ),
                                fit: BoxFit.fitHeight,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),*/
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.allTenants[index].tenantName,
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "${widget.allTenants[index].propertyName}",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${widget.allTenants[index].tenantRent}€ income",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.green),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.remove_red_eye_outlined),
                            SizedBox(width: 10),
                            Icon(Icons.edit_outlined),
                            SizedBox(width: 10),
                            Icon(
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
