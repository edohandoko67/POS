import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesforce/res/colors/app_colors.dart';

class InternetExceptions extends StatelessWidget {
  const InternetExceptions({super.key});

  @override
  Widget build(BuildContext context) {
    final VoidCallback onpressed;
    return Column(
      children: [
        const SizedBox(height: 10,),
        const Icon(Icons.cloud_off, color: AppColor.redColor,),
        const SizedBox(height: 15,),
        Text('internet_exceptions'.tr, textAlign: TextAlign.center,),
        Container(
          width: 140,
          height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(40),
          ),
          child: const Text('Retry', style: TextStyle(fontSize: 18, color: Colors.white),),
        ),
      ],
    );
  }
}
