import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholar_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholar_chat/models/message.dart';
import '../widgets/chatbuble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: messages.snapshots(),
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
                        itemCount:messagesList.length  ,
                        itemBuilder: ((context, index) {
                        return  ChatBuble(message: messagesList[index],);
                      })),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          messages.add({"mesages": data});
                          controller.clear();
                        },
                        style: const TextStyle(color: kPrimaryColor),
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: kPrimaryColor),
                            hintText: "Send Message",
                            suffixIcon: Icon(
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
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
