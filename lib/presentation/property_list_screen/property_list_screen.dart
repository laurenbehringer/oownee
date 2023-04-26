import 'package:flutter/material.dart';
import 'package:oownee/data/models/dashboard_response_model.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';

class PropertyListScreen extends StatefulWidget {
  List<PropertyDetail> propertyList;

  PropertyListScreen({Key? key, required this.propertyList}) : super(key: key);

  @override
  State<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            const Text("Select Property",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Expanded(
                child: ListView.builder(
                    itemCount: widget.propertyList.length,
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
                              child: Image.asset(
                                // widget.propertyList[index].propertyIamge,
                                "assets/dashboard/property_def.png",

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
                            const SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.propertyList[index].propertyName,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      // "${widget.propertyList[index].propertyName}",
                                      "Brussels",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  // "${widget.allTenants[index].tenantRent}€ income",
                                  "500.00€ monthly",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.green),
                                ),
                                const SizedBox(height: 5),
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
            const SizedBox(height: 15),
            Buttons().customElevatedButton(context,
                text: "Back",
                color: const Color(0xfff8f8f8),
                textColor: Colors.black, pressed: () {
              // Navigator.pushNamed(context, editProfileScreen);
            }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
