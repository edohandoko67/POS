# SALES FORCE NATUSI

Sebuah proyek Flutter baru.

## permulaan

Proyek ini adalah titik awal untuk aplikasi Flutter. Beberapa sumber daya untuk membantu Anda memulai jika ini adalah proyek Flutter pertama Anda:

- [Lab: Tulis aplikasi Flutter pertama Anda](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Contoh Flutter yang berguna](https://docs.flutter.dev/cookbook)

Untuk memulai bantuan pengembangan Flutter, lihat [dokumentasi bold](https://docs.flutter.dev/), yang menawarkan tutorial, contoh, panduan tentang pengembangan seluler, dan referensi API lengkap.

## Gambar

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contoh Gambar'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/gambar1.png', 
                  width: 150, 
                  height: 100, 
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10), 
                Image.asset(
                  'assets/images/gambar2.png', 
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 20), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/gambar3.png', 
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10), 
                Image.asset(
                  'assets/images/gambar5.png', 
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 20), 
            Image.asset(
                  'assets/images/gambar6.png', 
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
          ],
        ),
      ),
    );
  }
}
