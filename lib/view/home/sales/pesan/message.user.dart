import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesforce/view/home/home.controller.dart';

class MessageUser extends GetView<HomeController> {
  const MessageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.messageList.isEmpty) {
            return Center(
              child: Text(
                'No message',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: controller.messageList.length,
                itemBuilder: (context, index) {
                  final item = controller.messageList[index];
                  return Card(
                    elevation: 3.0, // Memberikan efek bayangan pada card
                    margin: const EdgeInsets.all(8.0), // Margin antara card
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(
                        "${item.judulText}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text(
                        '${item.text}',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  );
                });
          }
        }),
      ),
    );
  }
}
