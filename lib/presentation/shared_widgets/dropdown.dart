import 'package:flutter/material.dart';
import 'package:oownee/data/static_data.dart';

class DropDown {
  Container DefDropDown(
    BuildContext context, {
    // required Function pressed,
    required Function changed,
    required String value,
    required List<String> itemList,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfff8f8f8),
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
        ),
        value: value, //dropdownValue
        items: itemList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (val) => changed(val),
      ),
    );
  }
}
