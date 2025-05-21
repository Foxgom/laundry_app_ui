import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/daftarscreen.dart';
import 'package:laundry_app/mainscreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword1 = false;

  // ✅ Tambahkan controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ✅ Fungsi login ke Supabase
  Future<void> handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email dan password wajib diisi')),
      );
      return;
    }

    try {
      final res = await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);

      if (res.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainScreen()),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login gagal: $error')),
      );
    }
  }

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
          'Masuk',
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Selamat Datang Kembali di ',
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Masuk untuk melanjutkan pencatatan order dan keuangan laundry Anda.',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  label: "Email",
                  hintText: 'Alamat email anda',
                  controller: emailController,
                ),
                _buildPasswordField(
                  label: "Kata Sandi",
                  isVisible: _showPassword1,
                  onToggle: () => setState(() => _showPassword1 = !_showPassword1),
                  hintText: 'Masukkan kata sandi Anda',
                  controller: passwordController,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Lupa kata sandi?',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF4778F8),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Color(0xFF4778F8)),
                      foregroundColor:
                          WidgetStateProperty.all<Color>(Colors.white),
                      minimumSize: WidgetStateProperty.all<Size>(
                          Size(double.infinity, 48)),
                      shape:
                          WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    onPressed: handleLogin, // ✅ Panggil fungsi login
                    child: Text(
                      'Masuk',
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
                          'Belum punya akun? ',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DaftarScreen()),
                            );
                          },
                          child: Text(
                            'Daftar',
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

  Widget _buildTextField({
    required String label,
    String? hintText,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFC0BDBD)),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFC0BDBD)),
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
    String? hintText,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            obscureText: !isVisible,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
