import 'package:flutter/material.dart';
import 'package:oownee/presentation/shared_widgets/textfield.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 90),
            Align(
                alignment: Alignment.center,
                child: Image.asset("assets/logo_inverted.png")),
            const SizedBox(height: 30),
            const Align(
                alignment: Alignment.center, child: Text("v 1.0.0 beta")),
            const SizedBox(height: 45),
            const Align(
              alignment: Alignment.center,
              child: Text("Contact Information",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 50),
            const Text("Company",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfff8f8f8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("oownee LLC"),
                  CircleAvatar(
                    backgroundColor: Color(0xffe3e3e3),
                    child: Icon(
                      Icons.business,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Email",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfff8f8f8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("contact@oownee.com"),
                  CircleAvatar(
                    backgroundColor: Color(0xffe3e3e3),
                    child: Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Website",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xfff8f8f8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("www.oownee.com"),
                  CircleAvatar(
                    backgroundColor: Color(0xffe3e3e3),
                    child: Icon(
                      Icons.open_in_new,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff8f8f8)),
                    onPressed: () {},
                    child: const Text(
                      "Term & Conditions",
                      style: TextStyle(color: Colors.black),
                    ))),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0065ff),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back")),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
