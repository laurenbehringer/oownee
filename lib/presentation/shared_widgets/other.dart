import 'package:flutter/material.dart';
import 'package:oownee/presentation/shared_widgets/euro_dollar_choose.dart';

void defFunc() {}

class OtherShared {
  Container showData({
    required IconData icon,
    required TextEditingController controller,
    bool isEdit = false,
    String text = "",
    Function changed = defFunc,
  }) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(width: 20),
          !isEdit
              ? Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Color(0xffebecef)),
                      ),
                    ),
                    child: Text(
                      controller.text,
                      style: const TextStyle(fontSize: 21, color: Colors.grey),
                    ),
                  ),
                )
              : Expanded(
                  child: TextFormField(
                    controller: controller,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  Container editProfileWithIcon(
    BuildContext context, {
    required Widget widget,
    required TextEditingController controller,
  }) {
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
              child: TextFormField(
                controller: controller,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: InputBorder.none,
                ),
              ),
            ),
            widget,
          ],
        ));
  }

  Container editProfile({
    required TextEditingController controller,
    bool isMoney = false,
  }) {
    return isMoney
        ? Container(
            width: 170,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffebeaeb),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                EuroDollar(controller: controller)
              ],
            ))
        : Container(
            width: 170,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffebeaeb),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: controller,
              style: const TextStyle(fontSize: 18, color: Colors.black),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: InputBorder.none,
              ),
            ));
  }
}
