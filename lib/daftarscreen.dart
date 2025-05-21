import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/loginscreen.dart';

class DaftarScreen extends StatefulWidget {
  const DaftarScreen({super.key});

  @override
  _DaftarScreenState createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  bool _showPassword1 = false;
  bool _showPassword2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/images/icon-arrow.png'), 
          color: Colors.black, 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Daftar',
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true, // kalau ingin teks di tengah
      ),
      body: SafeArea(
        child: SingleChildScrollView(       // ⬅️ Agar konten bisa di-scroll
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min, 
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Buat Akun Baru di ',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Image.asset(
                          width: 98,
                          height: 16,
                          'assets/images/tulisan-laundrease.png', 
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Mulai kelola usaha laundry Anda dengan pencatatan yang rapi dan praktis.',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Foto profil
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/replace-photo.png'), 
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Icon edit di kanan bawah foto profil
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/icon-plus-biru.png'), // ganti path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                _buildTextField(label: "Email", 
                hintText: 'Alamat email anda'),
                _buildTextField(label: "Nama Usaha", 
                hintText: 'Masukkan nama usaha laundry Anda'),
                _buildTextField(label: "Nomor Telepon", 
                hintText: 'Masukkan nomor telepon usaha Anda'),
                _buildPasswordField(
                  label: "Kata Sandi",
                  isVisible: _showPassword1,
                  onToggle: () => setState(() => _showPassword1 = 
                  !_showPassword1),
                  hintText: 'Minimal 8 karakter'
                ),
                _buildPasswordField(
                  label: "Ulangi Kata Sandi",
                  isVisible: _showPassword2,
                  onToggle: () => setState(() => _showPassword2 = 
                  !_showPassword2),
                  hintText: 'Ulangi kata sandi Anda'
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ), 
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>
                      (Color(0xFF4778F8)), 
                      foregroundColor: WidgetStateProperty.all<Color>
                      (Colors.white), 
                      minimumSize: WidgetStateProperty.all<Size>
                      (Size(double.infinity, 48)), 
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4), 
                        ),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,          
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(  
                              borderRadius: BorderRadius.circular(20),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min, 
                                  crossAxisAlignment:
                                   CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Akun ',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Image.asset(
                                      width: 98,
                                      height: 16,
                                      'assets/images/tulisan-laundrease.png', 
                                    ),
                                  ],
                                ),
                                Text(
                                  'Berhasil dibuat!',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 60, 
                                    ),
                                    child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF4778F8), // sama seperti tombol utama
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      minimumSize: const Size.fromHeight(44),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);                   
                                      Navigator.pushReplacement(                // ganti ke halaman login
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Masuk',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  )
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Daftar Sekarang',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min, 
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah punya akun? ',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => 
                              const LoginScreen()),
                            );
                          },
                          child: Text(
                            'Masuk',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF4778F8),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, String? hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFC0BDBD)), // border saat tidak fokus
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFC0BDBD)), // border saat fokus
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
  required String label,
  required bool isVisible,
  required VoidCallback onToggle,
  String? hintText
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            obscureText: !isVisible,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12,
               vertical: 12),
               hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFC0BDBD)),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFC0BDBD)),
                borderRadius: BorderRadius.circular(6),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: onToggle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
