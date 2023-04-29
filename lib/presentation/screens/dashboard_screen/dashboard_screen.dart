import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/data/models/quick_stats.dart';
import 'package:oownee/data/services/api_connection.dart';
import 'package:oownee/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/screens/dashboard_screen/widgets/my_properties.dart';
import 'package:oownee/presentation/screens/dashboard_screen/widgets/my_tenants.dart';
import 'package:oownee/presentation/screens/dashboard_screen/widgets/top_bar.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/quick_stats.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String searchQuery = "";

  @override
  void initState() {
    loadDashboard();
    super.initState();
  }

  Future<void> loadDashboard() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('userID');
    BlocProvider.of<DashboardBloc>(context)
        .add(LoadDashboardEvent(uid: uid.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      body: RefreshIndicator(
        onRefresh: loadDashboard,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  if (state is DashboardLoadingState) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state is DashboardSuccessState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopBarDashboard(
                          image: state.dashboardData.owner.ownerImage,
                          name: state.dashboardData.owner.ownerName,
                        ),
                        const SizedBox(height: 25),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Quick Stats",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 15),
                        QuickStatsContainer(ownerList: state.dashboardData),
                        const SizedBox(height: 45),
                        // TextButton(
                        //   onPressed: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) =>
                        //                 ViewTenantProfile(tenantID: "3")));
                        //   },
                        //   child: Text("Burron"),
                        // ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Manage your tenants\n& properties",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w200),
                          ),
                        ),
                        const SizedBox(height: 15),
                        MyProperties(
                            propertyList: state.dashboardData.propertyDetails),
                        const SizedBox(height: 25),
                        MyTenants(
                          propertydetailList:
                              state.dashboardData.propertyDetails,
                        ),
                        const SizedBox(height: 50),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff0065ff),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, infoScreen);
                              },
                              child: const Text("More Info"),
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return Column(
                    children: [
                      const Text("Dashboard Screen"),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.yellowAccent,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
