import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Syarat extends StatelessWidget {
  const Syarat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F8CE2),
        title: Text('Syarat dan Ketentuan', style: GoogleFonts.poppins(
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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Syarat dan Ketentuan Penggunaan Aplikasi Sales', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('1. Penerimaan Syarat dan Ketentuan', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('Dengan mengunduh dan menggunakan aplikasi ini, Anda setuju untuk mematuhi syarat dan ketentuan berikut.'
                    'Jika Anda tidak setuju dengan salah satu dari syarat dan ketentuan ini, harap jangan menggunakan aplikasi ini.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('2. Penggunaan Aplikasi', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('Aplikasi ini disediakan untuk digunakan oleh tim sales yang ditunjuk oleh perusahaan kami.'
                    'Pengguna bertanggung jawab untuk menjaga kerahasiaan informasi login dan tidak membagikannya kepada pihak ketiga.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('3. Hak dan Kewajiban Pengguna', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('- Kewajiban Pengguna: Pengguna wajib menggunakan aplikasi ini sesuai dengan tujuan yang telah ditentukan, yakni untuk mendukung kegiatan penjualan dan manajemen sales.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                Text('- Kepatuhan: Pengguna harus mematuhi semua kebijakan dan prosedur perusahaan yang berlaku saat menggunakan aplikasi ini.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                Text('- Pembaruan Informasi: Pengguna bertanggung jawab untuk memperbarui informasi pribadi dan profesional yang diberikan dalam aplikasi ini.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('4. Hak Kekayaan Intelektual', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('Seluruh konten, desain, logo, dan fitur aplikasi ini merupakan hak kekayaan intelektual dari perusahaan kami.'
                    'Pengguna tidak diperkenankan untuk menyalin, memodifikasi, atau mendistribusikan bagian mana pun dari aplikasi tanpa izin tertulis dari perusahaan.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('5. Keamanan dan Privasi', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('- Keamanan Data: Kami berkomitmen untuk melindungi data pengguna dengan menggunakan standar keamanan yang tinggi. Namun,'
                    'kami tidak dapat menjamin keamanan penuh terhadap semua ancaman dan serangan cyber.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                Text('- Privasi: Informasi pribadi yang diberikan oleh pengguna akan digunakan sesuai dengan kebijakan privasi kami.'
                    'Pengguna setuju bahwa informasi yang diberikan dapat digunakan untuk keperluan operasional dan administratif perusahaan.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('6. Pembatasan Tanggung Jawab', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('Kami tidak bertanggung jawab atas kerugian atau kerusakan yang timbul akibat penggunaan aplikasi ini,'
                    'termasuk tetapi tidak terbatas pada kesalahan teknis, kehilangan data, atau gangguan operasional.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('7. Perubahan pada Syarat dan Ketentuan', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('Kami berhak untuk mengubah syarat dan ketentuan ini sewaktu-waktu tanpa pemberitahuan terlebih dahulu.'
                    'Perubahan akan berlaku segera setelah syarat dan ketentuan yang diperbarui dipublikasikan dalam aplikasi.'
                    'Pengguna disarankan untuk secara berkala meninjau syarat dan ketentuan ini.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('8. Pengakhiran Penggunaan', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('Kami berhak untuk menghentikan akses pengguna ke aplikasi ini tanpa pemberitahuan sebelumnya'
                    'jika ditemukan pelanggaran terhadap syarat dan ketentuan ini atau kebijakan perusahaan lainnya.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('9. Hukum yang Berlaku', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('Syarat dan ketentuan ini diatur dan ditafsirkan sesuai dengan hukum yang berlaku di negara tempat perusahaan kami beroperasi.',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10
                  ),),
                SizedBox(height: 7,),
                Text('10. Kontak', style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 7,),
                Text('Untuk pertanyaan atau masalah terkait syarat dan ketentuan ini,'
                    'silakan hubungi departemen dukungan kami melalui email: support@perusahaan.com atau telepon: +62-XXX-XXXX-XXXX.',
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
