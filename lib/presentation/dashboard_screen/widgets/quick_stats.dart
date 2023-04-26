import 'package:flutter/material.dart';
import 'package:oownee/data/models/quick_stats.dart';
import '../../../data/models/dashboard_response_model.dart';

class QuickStatsContainer extends StatefulWidget {
  DashboardResponseModel ownerList;
  QuickStatsContainer({Key? key, required this.ownerList}) : super(key: key);

  @override
  State<QuickStatsContainer> createState() => _QuickStatsContainerState();
}

class _QuickStatsContainerState extends State<QuickStatsContainer> {
  @override
  Widget build(BuildContext context) {
    List<QuickStats> quickstatsList = [
      QuickStats("assets/dashboard/no_properties.png", "Number of Properties",
          212.8, widget.ownerList.owner.properties.toString()),
      QuickStats("assets/dashboard/no_tenants.png", "Number of Tenants", -12.8,
          widget.ownerList.owner.tenants.toString()),
      QuickStats("assets/dashboard/no_rentincome.png", "Monthly Rent Income",
          12.8, widget.ownerList.owner.monthlyRentIncome.toString()),
      QuickStats("assets/dashboard/no_rentincome.png", "Yearly Rent Income",
          2.8, widget.ownerList.owner.yearlyRentIncome.toString()),
    ];

    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(width: 20),
              QuickStatsWidget(
                icon: quickstatsList[index].icon,
                heading: quickstatsList[index].heading,
                subheading: quickstatsList[index].subheading,
                percentage: quickstatsList[index].percentage,
              ),
            ],
          );
        },
      ),
    );
  }
}
