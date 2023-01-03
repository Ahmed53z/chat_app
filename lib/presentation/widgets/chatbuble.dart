import 'package:flutter/material.dart';

import '../../constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric( horizontal: 16 , vertical: 8),
        padding: const EdgeInsets.only(left: 16 , top: 24 , bottom: 24 , right: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child: const Text(
          "i am a new user ",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
