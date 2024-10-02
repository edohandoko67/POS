import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PusatBantuan extends StatelessWidget {
  const PusatBantuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F8CE2),
        title: Text('Pusat Bantuan', style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Colors.white
        ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pusat Bantuan Aplikasi', style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('Selamat datang di Pusat Bantuan Aplikasi! Kami di sini untuk membantu Anda.'
                    'Temukan jawaban atas pertanyaan Anda dan panduan untuk memaksimalkan penggunaan aplikasi ini.',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10
                ),),
                SizedBox(height: 7,),
                Text('1. Pertanyaan Umum (FAQ)', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('- Bagaimana cara masuk ke aplikasi? Untuk masuk, masukkan nama pengguna dan kata sandi Anda di layar login.'
                    'Jika Anda lupa kata sandi, gunakan opsi Lupa Kata Sandi untuk meresetnya.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                Text('- Bagaimana cara mengubah informasi pribadi saya? Buka menu Profil dan pilih Ubah Informasi untuk memperbarui data pribadi Anda.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                Text('- Bagaimana cara melihat pesanan yang telah saya buat? Pergi ke menu Pesanan Saya untuk melihat daftar pesanan yang telah Anda buat dan statusnya.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('2. Panduan Penggunaan', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('- Modul Absensi Sales dan Driver. Lihat panduan untuk mencatat kehadiran dan jam kerja Anda dengan tepat.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                Text('- Modul Sales Order. Pelajari cara membuat, mengelola, dan melacak pesanan penjualan.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                Text('- Modul Target Sales. Ketahui cara menetapkan dan memantau target penjualan Anda.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                Text('- Modul Data Sales. Pelajari cara mengakses dan menganalisis data penjualan Anda.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('3. Tips dan Trik', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('- Optimalkan Penggunaan Aplikasi. Ikuti tips ini untuk menggunakan aplikasi dengan lebih efisien dan produktif.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                Text('- Peningkatan Keamanan. Pelajari cara menjaga keamanan akun Anda dengan kata sandi yang kuat dan autentikasi dua faktor.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('4. Solusi Masalah Teknis', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('- Aplikasi Tidak Bisa Dibuka. Pastikan perangkat Anda terhubung ke internet dan coba restart aplikasi. Jika masalah berlanjut, hubungi dukungan teknis kami.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                Text('- Data Tidak Terupdate. Periksa koneksi internet Anda dan pastikan aplikasi dalam versi terbaru.'
                    'Coba sinkronisasi ulang data melalui menu Pengaturan.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('5. Hubungi Kami', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('Jika Anda membutuhkan bantuan lebih lanjut atau memiliki pertanyaan yang tidak terjawab di sini, silakan hubungi tim dukungan kami:'
                    '\nEmail: support@perusahaan.com'
                    '\nTelepon: +62-XXX-XXXX-XXXX'
                    '\nJam Operasional: Senin - Jumat, 09:00 - 17:00 WIB',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('6. Feedback dan Saran', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('Kami selalu berusaha untuk meningkatkan layanan kami. Jika Anda memiliki feedback atau saran,'
                    'silakan kirimkan melalui email atau formulir feedback di aplikasi.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                Text('\nTerima kasih telah menggunakan aplikasi kami! Kami berharap Pusat Bantuan ini dapat membantu Anda.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
