import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/data/models/dashboard_response_model.dart';
import 'package:oownee/presentation/bloc/dashboard/dashboard_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  DashboardResponseModel? result;
  List<Tenant> listDataItem = [];

  @override
  void initState() {
    BlocProvider.of<DashboardBloc>(context).add(LoadDashboardEvent(uid: "5"));
    super.initState();
  }

  var dataDum = {
    "status": true,
    "owner": {
      "owner_name": "Sharjeel Stevens",
      "owner_image": "https://app.oownee.com/owners/5/owner_image/6097380_",
      "properties": 1,
      "tenants": 1,
      "monthly_rent_income": 2400,
      "yearly_rent_income": 10000
    },
    "property_details": [
      {
        "property_id": "5",
        "property_name": "city",
        "number_of_tenants": "20",
        "property_iamge": "https://app.oownee.com/property_images/5/",
        "tenants": [
          {
            "tenant_id": "3",
            "tenant_name": "asdf",
            "phone_number": "2987789",
            "tenant_rent": "899",
            "tenant_birthdate": "232",
            "tenant_doc": "6770045_1212.PNG",
            "tenant_image": "9683922_1212.PNG",
            "tenant_country": "jn",
            "property_id": "5",
            "date": "0000-00-00"
          }
        ]
      },
      {
        "property_id": "5",
        "property_name": "ridge condos",
        "number_of_tenants": "20",
        "property_iamge": "https://app.oownee.com/property_images/5/",
        "tenants": [
          {
            "tenant_id": "3",
            "tenant_name": "jojo duke",
            "phone_number": "2987789",
            "tenant_rent": "899",
            "tenant_birthdate": "232",
            "tenant_doc": "6770045_1212.PNG",
            "tenant_image": "9683922_1212.PNG",
            "tenant_country": "jn",
            "property_id": "5",
            "date": "0000-00-00"
          },
          {
            "tenant_id": "3",
            "tenant_name": "ashdkjahsd",
            "phone_number": "2987789",
            "tenant_rent": "899",
            "tenant_birthdate": "232",
            "tenant_doc": "6770045_1212.PNG",
            "tenant_image": "9683922_1212.PNG",
            "tenant_country": "jn",
            "property_id": "5",
            "date": "0000-00-00"
          },
          {
            "tenant_id": "3",
            "tenant_name": "ashdkjahsd",
            "phone_number": "2987789",
            "tenant_rent": "899",
            "tenant_birthdate": "232",
            "tenant_doc": "6770045_1212.PNG",
            "tenant_image": "9683922_1212.PNG",
            "tenant_country": "jn",
            "property_id": "5",
            "date": "0000-00-00"
          },
        ]
      }
    ],
    "code": 200
  };

  Future fungsi() async {
    result = await dashboardResponseModelFromJson(jsonEncode(dataDum));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                if (state is DashboardSuccessState) {
                  var items = state.dashboardData.propertyDetails;
                  for (var i = 0;
                      i < state.dashboardData.propertyDetails.length;
                      i++) {
                    for (var j = 0;
                        j <
                            state.dashboardData.propertyDetails[i].tenants
                                .length;
                        j++) {
                      listDataItem.add(Tenant(
                          tenantId: items[i].tenants[j].tenantId,
                          tenantName: items[i].tenants[j].tenantName,
                          phoneNumber: items[i].tenants[j].phoneNumber,
                          tenantRent: items[i].tenants[j].tenantRent,
                          tenantBirthdate: items[i].tenants[j].tenantBirthdate,
                          tenantDoc: items[i].tenants[j].tenantDoc,
                          tenantImage: items[i].tenants[j].tenantImage,
                          tenantCountry: items[i].tenants[j].tenantCountry,
                          propertyId: items[i].tenants[j].propertyId,
                          propertyName: items[i].tenants[j].propertyName,
                          date: items[i].tenants[j].date));
                    }
                  }
                  return ListView.builder(
                      itemCount: listDataItem.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Column(
                            children: [
                              Text(items![index].propertyName),
                            ],
                          ),
                        );
                      });
                }

                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
