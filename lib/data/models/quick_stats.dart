import 'package:flutter/material.dart';

class QuickStats {
  String icon, subheading, heading;
  double percentage;

  QuickStats(this.icon, this.subheading, this.percentage, this.heading);
}

class QuickStatsWidget extends StatefulWidget {
  String heading, subheading, icon;
  double percentage;
  QuickStatsWidget(
      {Key? key,
      required this.icon,
      required this.heading,
      required this.subheading,
      required this.percentage})
      : super(key: key);

  @override
  State<QuickStatsWidget> createState() => _QuickStatsWidgetState();
}

class _QuickStatsWidgetState extends State<QuickStatsWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xfff8f8f8),
                child: Image.asset(widget.icon),
              ),
              SizedBox(height: 5),
              Text(
                widget.heading,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3),
              Text(widget.subheading),
              SizedBox(height: 10),
              DefaultTextStyle.merge(
                style: TextStyle(
                    color: widget.percentage > 0 ? Colors.green : Colors.red),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Text(widget.percentage > 0 ? "+" : ""),
                    Text(" ${widget.percentage} %")
                  ],
                ),
              )
            ],
          )),
    );
  }
}
