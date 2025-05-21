import 'dart:io';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/orderan/ubahcatatanscreen.dart';
import 'package:laundry_app/produkscreen.dart';
import 'dart:typed_data';

class CetakOrderanScreen extends StatefulWidget {
  final File? mobileImage;
  final Uint8List? webImage;

  const CetakOrderanScreen({
    super.key,
    this.mobileImage,
    this.webImage,
  });

  @override
  _CetakOrderanScreenState createState() => _CetakOrderanScreenState();
}

class _CetakOrderanScreenState extends State<CetakOrderanScreen> {

  @override
  Widget build(BuildContext context) {
    Widget? imageWidget;

    if (kIsWeb && widget.webImage != null) {
      imageWidget = Image.memory(widget.webImage!, height: 200);
    } else if (!kIsWeb && widget.mobileImage != null) {
      imageWidget = Image.file(widget.mobileImage!, height: 200);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
          'Cetak Orderan',
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true, // kalau ingin teks di tengah
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        width: 88,
                        height: 80,
                        'assets/images/logo-struk.png'
                      ),
                      SizedBox(height: 8,),
                      Text(
                        'Laundry Layla',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14
                        ),
                      ),
                      Text(
                        'Jl.  Lintas Sumatra, Kec. Mendalo',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                        ),
                      ),
                      Text(
                        'Darat, Muaro Jambi',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                        ),
                      ),
                      Text(
                        'Telp. 081234567890',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                        ),
                      ),
                      SizedBox(height: 8,),
                      const DottedLine(
                        direction: Axis.horizontal, // bisa juga Axis.vertical
                        lineLength: double.infinity,
                        lineThickness: 2.0,
                        dashLength: 6.0,
                        dashGapLength: 4.0,
                      ),
                      SizedBox(height: 8,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'No. Pesanan #605',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '10/05/2025',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                          Text(
                            '12:06:32',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nama Pelanggan',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                          Text(
                            'Fitri Dwi Lestari',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No. Telepon',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                          Text(
                            '081271727112',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Estimasi',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                          Text(
                            '14/05/2025',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      const DottedLine(
                        direction: Axis.horizontal, // bisa juga Axis.vertical
                        lineLength: double.infinity,
                        lineThickness: 2.0,
                        dashLength: 6.0,
                        dashGapLength: 4.0,
                      ),
                      SizedBox(height: 8,),
                      Align(
                        alignment: Alignment.centerLeft,
                          child: Text(
                          'Cuci Kering',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '5 x 5,000',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                          Text(
                            'Rp 25,000',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                          child: Text(
                          'Seprei',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1 x 15,000',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                          Text(
                            'Rp 15,000',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      const DottedLine(
                        direction: Axis.horizontal, // bisa juga Axis.vertical
                        lineLength: double.infinity,
                        lineThickness: 2.0,
                        dashLength: 6.0,
                        dashGapLength: 4.0,
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                          Text(
                            'Rp 40,000',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Metode',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                            ),
                          ),
                          Text(
                            (kIsWeb && widget.webImage != null) || (!kIsWeb && widget.mobileImage != null)
                                ? 'QRIS'
                                : 'Tunai',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      const DottedLine(
                        direction: Axis.horizontal, // bisa juga Axis.vertical
                        lineLength: double.infinity,
                        lineThickness: 2.0,
                        dashLength: 6.0,
                        dashGapLength: 4.0,
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: imageWidget ?? const SizedBox.shrink(),
                      ),
                      Text(
                        '“Perubahan dilakukan dalam 1 x 24 jam”',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          fontStyle: FontStyle.italic, // ini membuat teks miring
                        ),
                      ),
                      Text(
                        '“Jika tidak mengambil orderan dalam waktu 1 bulan,',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          fontStyle: FontStyle.italic, // ini membuat teks miring
                        ),
                      ),
                      Text(
                        'pakaian akan kami sumbangkan”',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          fontStyle: FontStyle.italic, // ini membuat teks miring
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        'Terima Kasih',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      const Color(0xFFFFFFFF),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      const Color(0xff4778F8),
                    ),
                    minimumSize: WidgetStateProperty.all<Size>(
                      const Size(double.infinity, 48),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide( 
                          color: Color(0xff4778F8),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UbahCatatanScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Ubah Catatan',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff4778F8), // pastikan warnanya cocok
                    ),
                  ),
                ),
                SizedBox(height: 4,),
                TextButton(
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
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (_) => 
                    //   const MainScreen()),
                    // );
                  },
                  child: Text(
                    'Bagikan',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
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
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          TextField(
            style: TextStyle(
              fontSize: 13, 
              fontWeight: FontWeight.w400
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: 
              EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              hintText: hintText,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
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
