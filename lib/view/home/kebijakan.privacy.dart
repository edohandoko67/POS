import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KebijakanPrivacy extends StatelessWidget {
  const KebijakanPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F8CE2),
        title: Text('Kebijakan', style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Kebijakan Privasi\n\n',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '1. Pengumpulan Informasi\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: 'Kami mengumpulkan berbagai jenis informasi untuk memberikan dan meningkatkan layanan kami kepada Anda, termasuk:\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '- Informasi Pribadi: Nama, alamat email, nomor telepon, dan informasi kontak lainnya.\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '- Informasi Pribadi: Nama, alamat email, nomor telepon, dan informasi kontak lainnya.\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '- Informasi Lokasi: Informasi geografis yang memungkinkan kami memberikan layanan yang lebih relevan dan akurat.\n\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '2. Penggunaan Informasi\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: 'Informasi yang kami kumpulkan digunakan untuk tujuan berikut:\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '- Menyediakan dan Memelihara Layanan: Menggunakan informasi untuk menyediakan, memelihara, dan meningkatkan layanan aplikasi.\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '- Komunikasi: Menggunakan informasi kontak untuk mengirimkan pemberitahuan, pembaruan, dan informasi lainnya terkait layanan kami.\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '- Personalisasi Layanan: Menggunakan informasi untuk mempersonalisasi pengalaman pengguna di aplikasi kami.\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '- Keamanan: Menggunakan informasi untuk memantau dan meningkatkan keamanan aplikasi kami.\n\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '3. Perlindungan Informasi\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: 'Kami mengambil langkah-langkah keamanan yang wajar untuk melindungi informasi pribadi Anda dari akses, pengungkapan, perubahan, atau penghancuran yang tidak sah. Namun, tidak ada metode transmisi melalui internet atau metode penyimpanan elektronik yang 100% aman.\n\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '4. Berbagai Informasi\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: 'Kami tidak akan membagikan informasi pribadi Anda kepada pihak ketiga kecuali dalam kondisi berikut:\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '- Dengan Persetujuan Anda: Kami dapat membagikan informasi dengan pihak ketiga jika Anda memberikan persetujuan.\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '- Untuk Kepentingan Hukum: Kami dapat membagikan informasi jika diwajibkan oleh hukum atau dalam rangka mematuhi proses hukum.\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '- Dengan Penyedia Layanan: Kami dapat membagikan informasi dengan penyedia layanan yang membantu kami dalam operasional aplikasi.\n\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '5. Akses dan Kontrol Informasi\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: 'Anda memiliki hak untuk mengakses, memperbarui, dan menghapus informasi pribadi Anda yang ada dalam sistem kami. Untuk melakukan hal ini, Anda dapat menghubungi departemen dukungan kami melalui email atau telepon.\n\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '6. Perubahan Kebijakan Privasi\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: 'Kami dapat memperbarui kebijakan privasi ini dari waktu ke waktu. Kami akan memberitahukan perubahan melalui aplikasi atau melalui email. Perubahan akan berlaku segera setelah kebijakan privasi yang diperbarui dipublikasikan.\n\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '7. Hukum yang Berlaku\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: 'Kebijakan privasi ini diatur dan ditafsirkan sesuai dengan hukum yang berlaku di negara tempat perusahaan kami beroperasi.\n\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: '8. Kontak\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                      TextSpan(
                        text: 'Untuk pertanyaan atau masalah terkait kebijakan privasi ini, silakan hubungi departemen dukungan kami melalui email: support@perusahaan.com atau telepon: +62-XXX-XXXX-XXXX.\n\n',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400, // Menggunakan bobot font berbeda untuk isi teks
                        ),
                      ),
                    ],
                  ),
                )

                // Text('Kami mengumpulkan berbagai jenis informasi untuk memberikan dan meningkatkan layanan kami kepada Anda, termasuk:'),
                // Text(' - Informasi Pribadi: Nama, alamat email, nomor telepon, dan informasi kontak lainnya.'),
                // Text(' - Informasi Penggunaan: Data tentang bagaimana Anda berinteraksi dengan aplikasi kami, seperti halaman yang dikunjungi, waktu penggunaan, dan aktivitas lainnya.'),
                // Text(' - Informasi Lokasi: Informasi geografis yang memungkinkan kami memberikan layanan yang lebih relevan dan akurat.'),
                // SizedBox(height: 5,),
                // Text('2. Penggunaan Informasi', style: GoogleFonts.poppins(
                //     fontSize: 12,
                //     fontWeight: FontWeight.w700
                // ),),
                // Text('Informasi yang kami kumpulkan digunakan untuk tujuan berikut:'),
                // Text('- Menyediakan dan Memelihara Layanan: Menggunakan informasi untuk menyediakan, memelihara, dan meningkatkan layanan aplikasi.'),
                // Text('- Komunikasi: Menggunakan informasi kontak untuk mengirimkan pemberitahuan, pembaruan, dan informasi lainnya terkait layanan kami.'),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
