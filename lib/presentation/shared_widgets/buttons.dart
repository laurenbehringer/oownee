import 'package:flutter/material.dart';

class Buttons {
  Container customElevatedButton(
    BuildContext context, {
    required Function pressed,
    Color color = const Color(0xff0065ff),
    double radius = 10,
    double vertical = 10,
    String text = 'Login',
    Color textColor = Colors.white,
    double textSize = 12,
    FontWeight textWeight = FontWeight.normal,
  }) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: () => pressed(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: vertical),
          child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Text(
                text,
                style: TextStyle(color: textColor),
              )),
        ),
      ),
    );
  }

  Container iconButton(
    BuildContext context, {
    required Function pressed,
    Color color = const Color(0xfff8f8f8),
    double radius = 10,
    double vertical = 10,
    String text = 'Login',
    Color textColor = Colors.black,
    double textSize = 12,
    FontWeight textWeight = FontWeight.normal,
    String img = "assets/camera.png",
    IconData icon = Icons.account_box_outlined,
    bool isImg = true,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () => pressed(),
          child: Row(
            children: [
              isImg
                  ? Image.asset(
                      img,
                    )
                  : Icon(icon),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 32.0),
                  child: Text(
                    text,
                    style: TextStyle(color: textColor, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
