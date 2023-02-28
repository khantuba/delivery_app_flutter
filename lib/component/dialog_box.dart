import 'package:delivery_app/response/users./user_response.dart';
import 'package:flutter/material.dart';

/// This class returns a Dailog Box Widget
class DialogBox extends StatelessWidget {
  final UserResponse response;

  const DialogBox({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(response.respMsg),
      content: Text(response.message),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
