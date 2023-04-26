import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/data/models/dashboard_response_model.dart';
import 'package:oownee/presentation/bloc/view_tenant/view_tenant_bloc.dart';
import 'package:oownee/presentation/dashboard_screen/tenant_screen/view_tenant_profile.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/tenant_list_screen/tenant_list_screen.dart';

class MyTenants extends StatefulWidget {
  List<PropertyDetail> propertydetailList;
  MyTenants({Key? key, required this.propertydetailList}) : super(key: key);

  @override
  State<MyTenants> createState() => _MyTenantsState();
}

class _MyTenantsState extends State<MyTenants> {
  List<Tenant> allTenants = [];

  @override
  void initState() {
    widget.propertydetailList
        .forEach((property) => allTenants.addAll(property.tenants));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My Tenants",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TenantListScreen(
                                    allTenants: allTenants,
                                  )));
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
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: const Text(
                      "Add New Tenant",
                      style: const TextStyle(color: Color(0xff0065ff)),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 75,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allTenants.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<ViewTenantBloc>(context).add(
                          LoadTenantViewEvent(
                              tenantID: allTenants[index].tenantId));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewTenantProfile(),
                          ));
                    },
                    child: Container(
                      height: 200,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            height: 200,
                            child: Image.asset(
                              "assets/dashboard/tenant_def.png",
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                allTenants[index].tenantName,
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Image.asset(
                                      "assets/dashboard/location_icon.png"),
                                  SizedBox(width: 5),
                                  Text(
                                    allTenants[index].propertyName,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                "€ ${allTenants[index].tenantRent}",
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
        ],
      ),
    );
  }
}
