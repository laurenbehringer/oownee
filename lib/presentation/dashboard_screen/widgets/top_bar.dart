import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oownee/presentation/bloc/owner_view/owner_view_bloc.dart';
import 'package:oownee/presentation/routes/routes_const.dart';
import 'package:oownee/presentation/shared_widgets/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopBarDashboard extends StatefulWidget {
  String image, name;
  TopBarDashboard({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  State<TopBarDashboard> createState() => _TopBarDashboardState();
}

class _TopBarDashboardState extends State<TopBarDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, myprofileScreen);
            },
            child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(5),
                child: CustomNetworkImage(url: widget.image)),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 2,
            child: Wrap(
              direction: Axis.vertical,
              children: [
                const Text(
                  "Good Morning",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${widget.name}",
                  style:
                      const TextStyle(color: Color(0xff0065ff), fontSize: 18),
                )
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: const Color(0xFFEEEEEE),
            child: Stack(
              children: const [
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
                Positioned(
                    right: 3,
                    top: 1,
                    child: Icon(
                      Icons.circle_rounded,
                      color: Colors.red,
                      size: 8,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
