import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:laundry_app/orderan/cetakorderan.dart';


class UbahCatatanScreen extends StatefulWidget {
  const UbahCatatanScreen({super.key});

  @override
  _UbahCatatanScreenState createState() => _UbahCatatanScreenState();
}

class _UbahCatatanScreenState extends State<UbahCatatanScreen> {
  File? _mobileImageFile;
  Uint8List? _webImageBytes;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((e) {
        final reader = html.FileReader();
        final file = uploadInput.files!.first;
        reader.readAsArrayBuffer(file);
        reader.onLoadEnd.listen((e) {
          setState(() {
            _webImageBytes = reader.result as Uint8List;
          });
        });
      });
    } else {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _mobileImageFile = File(pickedFile.path);
        });
      }
    }
  }

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
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
          'Ubah Catatan',
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(label: "Catatan", hintText: 'Masukkan catatan'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tampilkan QRIS',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Switch(
                      value: isSwitched, // boolean state, misalnya: true atau false
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeColor: Colors.grey, // warna switch saat ON
                      inactiveThumbColor: Colors.grey, // warna bulatan saat OFF
                      inactiveTrackColor: Colors.grey[300], // warna background track saat OFF
                    ),
                  ],
                ),
                Text(
                  'Upload Foto QRIS',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8), // 👈 padding di dalam container
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4), // 👈 rounded 4
                  ),
                  child: Column(
                    children: [
                      if (_webImageBytes != null || _mobileImageFile != null)
                        Container(
                          height: 300,
                          width: double.infinity,
                          child: kIsWeb
                              ? Image.memory(_webImageBytes!, fit: BoxFit.contain)
                              : Image.file(_mobileImageFile!, fit: BoxFit.contain),
                        ),
                      Container(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: _pickImage,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: const BorderSide(color: Color(0xFF4778F8)),
                          ),
                          child: const Text(
                            "Pilih Foto Baru",
                            style: TextStyle(
                              color: Color(0xFF4778F8),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CetakOrderanScreen(
                                mobileImage: _mobileImageFile,
                                webImage: _webImageBytes,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Simpan',
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
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),
          ),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              hintText: hintText,
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.circular(4), // 👈 radius 4
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.circular(4), // 👈 radius 4
              ),
            ),
          ),
        ],
      ),
    );
  }
}
