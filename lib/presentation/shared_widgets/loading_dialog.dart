import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  final BuildContext context;

  LoadingDialog({required this.context});

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(width: 20),
          Text("Loading..."),
        ],
      ),
    );
  }
}
