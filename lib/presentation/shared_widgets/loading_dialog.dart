import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  final BuildContext context;
  final String txt;

  LoadingDialog({required this.context, required this.txt});

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 20),
          Text(widget.txt),
        ],
      ),
    );
  }
}
