import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EuroDollar extends StatefulWidget {
  final TextEditingController controller;

  const EuroDollar({Key? key, required this.controller}) : super(key: key);

  @override
  State<EuroDollar> createState() => _EuroDollarState();
}

class _EuroDollarState extends State<EuroDollar> {
  int propertyRentPrice = 0;
  bool isEuro = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isEuro = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isEuro ? Colors.white : const Color(0xff0065ff),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
              ),
            ),
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.attach_money,
              color: isEuro ? Colors.grey : Colors.white,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isEuro = true;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isEuro ? const Color(0xff0065ff) : Colors.white,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.euro,
              color: isEuro ? Colors.white : Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
