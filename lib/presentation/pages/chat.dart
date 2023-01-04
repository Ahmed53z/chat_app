// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/models/message.dart';

import '../widgets/chatbuble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({
    Key? key,
    this.email, String? arguments,
  }) : super(key: key);
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  final String? email;
  @override
  Widget build(BuildContext context) {
  var email =  ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy("createdAt", descending: true).snapshots(),
        builder: (context, snapshot) {
          snapshot.data;
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: kPrimaryColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        kLogo,
                        height: 40,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        " Chat",
                        style: GoogleFonts.acme(),
                      ),
                    ],
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemCount: messagesList.length,
                          itemBuilder: ((context, index) {
                            return messagesList[index].id == email? ChatBuble(
                              message: messagesList[index],
                            ) : ChatBubleForFriend(message: messagesList[index]);
                          })),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          messages.add({
                            kMessage: data,
                            "createdAt": DateTime.now(),
                            "id": email
                          });
                          controller.clear();
                          _controller.animateTo(0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn);
                        },
                        style: const TextStyle(color: kPrimaryColor),
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: kPrimaryColor),
                            hintText: "Send Message",
                            suffixIcon: const Icon(
                              Icons.send,
                              color: kPrimaryColor,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: kPrimaryColor))),
                      ),
                    ),
                  ],
                ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
