import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/daftarscreen.dart';
import 'package:laundry_app/loginscreen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  'Bantu Laundry Lebih Rapi',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center, 
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Image.asset('assets/images/landing-page.png'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 60),
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20),
                child: Text(
                  'Catat orderan, pantau keuangan, dan kelola pelanggan hanya di dalam',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center, 
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20),
                child: Text(
                  'Laundrease',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center, 
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, left: 15, right: 15), 
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => 
                      const LoginScreen()),
                    );
                  },
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
                margin: const EdgeInsets.only(top: 5, left: 15, right: 15), 
                child: TextButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>
                    (Size(double.infinity, 48)), 
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                          color: Color(0xFF4778F8), // warna border
                          width: 1, // ketebalan border
                        ), 
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => 
                      const DaftarScreen()),
                    );
                  },
                  child: Text(
                    'Daftar',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4778F8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
