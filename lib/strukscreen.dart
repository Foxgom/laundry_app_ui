import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/mainscreen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:laundry_app/orderan/orderanscreen.dart';

class StrukScreen extends StatefulWidget {
  const StrukScreen({super.key});

  @override
  _StrukScreenState createState() => _StrukScreenState();
}

class _StrukScreenState extends State<StrukScreen> {
  int count = 1;
  int countSeprei = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4778F8), // Atur sesuai kebutuhan
        leading: IconButton(
        icon: Image.asset('assets/images/icon-arrow.png'),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => 
            const MainScreen(initialIndex: 0)),
          );
        },
      ),
      ),

      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            color: const Color(0xFF4778F8),
            alignment: Alignment.topCenter, 
            child: Text(
              'Struk',
              style: GoogleFonts.instrumentSans(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 20, 
                    left: 30, 
                    right: 30,
                    bottom: 20
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xFFD9D9D9), // warna border
                      width: 3,                 // tebal border 3 px
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        'LAUNDRY LEO GEMES',
                        textAlign: TextAlign.center, // tengah
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      child: Text(
                        'EXPRESS1HARI3',
                        textAlign: TextAlign.end, // kanan
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      children: [
                        Text(
                          'DAFFA',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'RECEIPT DATE 30/04/2025',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const DottedLine(
                      direction: Axis.horizontal, // bisa juga Axis.vertical
                      lineLength: double.infinity,
                      lineThickness: 2.0,
                      dashLength: 6.0,
                      dashGapLength: 4.0,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12), // geser ke kanan 8 px
                                child: Text(
                                  'QTY',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  'ITEMS',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  'PRICE',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const DottedLine(
                      direction: Axis.horizontal, // bisa juga Axis.vertical
                      lineLength: double.infinity,
                      lineThickness: 2.0,
                      dashLength: 6.0,
                      dashGapLength: 4.0,
                    ),
                    const SizedBox(height: 10),
                    Table(
                      columnWidths: {
                        0: FixedColumnWidth(50),
                        1: FixedColumnWidth(155),
                      },
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12), // geser ke kanan 8 px
                                child: Text(
                                  '01',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  'CUCI LIPAT SETRIKA',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  '3KG',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12, top: 20), 
                                child: Text(
                                  '02',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, top: 20),
                                child: Text(
                                  'SEPREI',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30, top: 20),
                                child: Text(
                                  '1PCS',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12, top: 20), 
                                child: Text(
                                  'KET',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, top: 20),
                                child: Text(
                                  'Baju putih dipisah',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, top: 20),
                                child: Text(
                                  '',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                      const SizedBox(height: 10),
                      const DottedLine(
                        direction: Axis.horizontal, 
                        lineLength: double.infinity,
                        lineThickness: 2.0,
                        dashLength: 6.0,
                        dashGapLength: 4.0,
                      ),
                      const SizedBox(height: 10),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12), // geser ke kanan 8 px
                                child: Text(
                                  'PEMBAYARAN',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  'Pas pengambilan',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const DottedLine(
                        direction: Axis.horizontal, 
                        lineLength: double.infinity,
                        lineThickness: 2.0,
                        dashLength: 6.0,
                        dashGapLength: 4.0,
                      ),
                      const SizedBox(height: 10),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 50),
                                child: Text(
                                  'TOTAL',
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  '25.000',
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      const DottedLine(
                        direction: Axis.horizontal, 
                        lineLength: double.infinity,
                        lineThickness: 2.0,
                        dashLength: 6.0,
                        dashGapLength: 4.0,
                      ),
                      const SizedBox(height: 10),
                      BarcodeWidget(
                        barcode: Barcode.code128(), // Pilih tipe barcode
                        data: '1234567890', // Data yang akan diencode
                        width: 150,
                        height: 30,
                        drawText: false,
                      ),
                      const SizedBox(height: 10),
                  ],
                ),


                ),
                
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9), // Warna latar belakang tombol
                        shape: BoxShape.circle,  // Bulat
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/icon-download.png', // Ganti sesuai path gambar kamu
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                           OrderanScreen()),
                        );
                      },
                      child: Center(
                        child: Image.asset(
                          'assets/images/icon-edit-struk.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => 
                        const MainScreen(initialIndex: 0)),
                      );
                    },
                    style: ButtonStyle(
                    backgroundColor: 
                      WidgetStateProperty.all(Color(0xFF4778F8)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), 
                        ),
                      ),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 8), 
                      ),
                    ),
                    child: Text(
                      'Selesai',
                      style: GoogleFonts.inter(
                        fontSize: 35
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
      )
    );
  }

  Widget _buildTextField({
  required String label,
  String? imagePath,
  String? hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF4778F8)),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF4778F8)),
                borderRadius: BorderRadius.circular(6),
              ),
              suffixIcon: imagePath != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset(
                        imagePath,
                        width: 24,
                        height: 24,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

}