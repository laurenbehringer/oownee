import 'package:flutter/material.dart';
import 'package:oownee/presentation/shared_widgets/buttons.dart';

void fun() {}

class Dialogs {
  smallDialog(
    BuildContext context, {
    String text = "Text Here",
    Color color = Colors.green,
    IconData icon = Icons.check_circle_outline,
    int duration = 1,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: duration),
      backgroundColor: color,
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 5),
          Text(text),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 200,
          right: 20,
          left: 20),
    ));
  }

  static Future<void> showMylanguageDialog(context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            insetPadding: const EdgeInsets.all(10),
            content: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/language.png"),
                  const SizedBox(height: 15),
                  const Text(
                    "Select Language",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          Image.asset("assets/languages/english.png"),
                          const SizedBox(width: 5),
                          const Text("English"),
                        ],
                      ),
                      const Icon(Icons.check_circle_outline,
                          color: Colors.green),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          Image.asset("assets/languages/french.png"),
                          const SizedBox(width: 5),
                          const Text("Francais"),
                        ],
                      ),
                      const Text("Coming soon")
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          Image.asset("assets/languages/spanish.png"),
                          const SizedBox(width: 5),
                          const Text("Espanol"),
                        ],
                      ),
                      const Text("Coming soon")
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          Image.asset("assets/languages/hindi.png"),
                          const SizedBox(width: 5),
                          const Text("Hindi"),
                        ],
                      ),
                      const Text("Coming soon")
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          Image.asset("assets/languages/arabic.png"),
                          const SizedBox(width: 5),
                          const Text("Arabic"),
                        ],
                      ),
                      const Text("Coming soon")
                    ],
                  ),
                  const SizedBox(height: 42),
                  Buttons().customElevatedButton(context,
                      pressed: () {}, text: "Confirm"),
                ],
              ),
            ));
      },
    );
  }

  static Future<void> confirmDialog(
    context, {
    bool isDelete = false,
    Function fun = fun,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            insetPadding: const EdgeInsets.all(10),
            content: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: isDelete
                        ? Color(0xffff1919).withOpacity(0.2)
                        : Colors.green.withOpacity(0.2),
                    child: Icon(
                      isDelete ? Icons.delete : Icons.add,
                      color: isDelete ? Colors.red : Colors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    isDelete ? "Delete Confirmation" : "Add Confirmation",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    isDelete
                        ? "Are you sure you want to delete this?"
                        : "Are you sure you want to add this?",
                    style: const TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Buttons().customElevatedButton(context,
                            pressed: () {
                          fun();
                        }, text: "Confirm"),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 150,
                        child: Buttons().customElevatedButton(context,
                            pressed: () {
                          Navigator.pop(context);
                          print("popp");
                        }, text: "Cancel", color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
