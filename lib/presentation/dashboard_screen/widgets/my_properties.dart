import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/data/models/dashboard_response_model.dart';
import 'package:oownee/presentation/bloc/view_property/property_view_bloc.dart';
import 'package:oownee/presentation/property_list_screen/property_list_screen.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';
import 'package:oownee/presentation/view_property/view_property.dart';

class MyProperties extends StatefulWidget {
  List<PropertyDetail> propertyList;

  MyProperties({Key? key, required this.propertyList}) : super(key: key);

  @override
  State<MyProperties> createState() => _MyPropertiesState();
}

class _MyPropertiesState extends State<MyProperties> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child:
                    SharedTextField().searchTextfield(context, changed: (val) {
                  searchQuery = val;
                }, text: "Search"),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff0065ff).withAlpha(50),
                  ),
                  child: Image.asset("assets/dashboard/filter.png"),
                ),
              )
            ],
          ),
          const SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My Properties",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PropertyListScreen(
                                    propertyList: widget.propertyList,
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: const Text(
                        "Property List",
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
                      "Add New Property",
                      style: const TextStyle(color: Color(0xff0065ff)),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          BlocBuilder<PropertyViewBloc, PropertyViewState>(
            builder: (context, state) {
              return Container(
                height: 220,
                padding: EdgeInsets.all(3),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.propertyList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewPropertyScreen(
                                      propertyID: widget
                                          .propertyList[index].propertyId)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/dashboard/property_def.png"),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.propertyList[index].propertyName,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.person, color: Colors.blue),
                                        Text(
                                            "${widget.propertyList[index].numberOfTenants} Tenants")
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}
