import 'package:flutter/material.dart';

Widget cardMainMenu({
  required String title,
  required String inSubtitle,
  required String subtitle,
}) {
  return Row(children: [
    Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 116,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 3,
              width: 3,
            ),
            SizedBox(
              width: 10,
              child: Text(
                inSubtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Expanded(
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )),
  ]);
}