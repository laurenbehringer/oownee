import 'package:flutter/material.dart';

class SharedTextField {
  TextField defTextfield(
    BuildContext context, {
    // required Function pressed,
    required Function changed,
    String text = 'Text Here',
    Color textColor = Colors.black,
    double textSize = 12,
    FontWeight textWeight = FontWeight.normal,
  }) {
    return TextField(
      onChanged: (val) => changed(val),
      // style: const TextStyle(fontSize: 16.0),
      decoration: InputDecoration(
        filled: true,
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Row customTextfield(
    BuildContext context, {
    // required Function pressed,
    required Function changed,
    String text = 'Text Here',
    Color textColor = Colors.black,
    double textSize = 12,
    FontWeight textWeight = FontWeight.normal,
    IconData icons = Icons.home_outlined,
  }) {
    return Row(
      children: [
        Icon(
          icons,
          color: Colors.grey,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            onChanged: (val) => changed(val),
            decoration: InputDecoration(
              hintText: text,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container IconTextfield(BuildContext context,
      {
      // required Function pressed,
      required Function changed,
      required Widget widget,
      Color textColor = Colors.black,
      double textSize = 12,
      FontWeight textWeight = FontWeight.normal,
      IconData icons = Icons.home_outlined,
      bool isPhone = false,
      String text = "Enter here."}) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffebeaeb),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (val) => changed(val),
                decoration: InputDecoration(
                  hintText: text,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
            widget,
          ],
        ));
  }

  TextField searchTextfield(
    BuildContext context, {
    // required Function pressed,
    required Function changed,
    String text = 'Text Here',
    Color textColor = Colors.black,
    double textSize = 12,
    FontWeight textWeight = FontWeight.normal,
  }) {
    return TextField(
      onChanged: (val) => changed(val),
      textAlignVertical: TextAlignVertical.center,
      // style: const TextStyle(fontSize: 16.0),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        filled: true,
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
