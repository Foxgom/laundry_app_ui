import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TambahStokScreen extends StatefulWidget {
  const TambahStokScreen({super.key});

  @override
  _TambahStokScreenState createState() => _TambahStokScreenState();
}

class _TambahStokScreenState extends State<TambahStokScreen> {
  final TextEditingController _controller = TextEditingController();
  final _formatter = NumberFormat("#,###", "id_ID");

  void _onChanged(String value) {
    String digits = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (digits.isEmpty) {
      _controller.text = '';
      return;
    }

    String formatted = _formatter.format(int.parse(digits));
    _controller.value = TextEditingValue(
      text: 'Rp. $formatted',
      selection: TextSelection.collapsed(offset: 'Rp. $formatted'.length),
    );
  }
  
  bool isChecked = false;
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
          'Tambah Stok',
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true, // kalau ingin teks di tengah
      ),
      body: SafeArea(
        child: Column(
            children: [
              Container(
                color: Color(0xFFBDCBF2), // Warna latar belakang
                padding: EdgeInsets.all(8), 
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/layanan-lonceng.png',
                      width: 20, // opsional: sesuaikan ukuran
                      height: 20,
                    ),
                    SizedBox(width: 8), // jarak antara gambar dan teks
                    Expanded(
                      child: Text(
                        'Tambahkan stok terlebih dahulu. Jumlah dan biayanya akan otomatis tercatat di laporan pengeluaran.',
                        style: TextStyle(
                          height: 1,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildTextField(
                label: 'Nama Stok', 
                hintText: 'Masukkan nama produk'
              ),
              Divider(
                color: Colors.grey,     // Warna garis
                thickness: 2,           // Ketebalan garis
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Image.asset(
                          'assets/images/layanan-harga.png',
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: 8), // Jarak antara icon dan teks
                        Text(
                          'Harga',
                          style: TextStyle(
                            height: 1,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded( // Tambahkan Expanded di sini
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: _onChanged,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        hintText: 'Atur',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,     // Warna garis
                thickness: 2,           // Ketebalan garis
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Image.asset(
                          'assets/images/layanan-satuan.png',
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: 8), // Jarak antara icon dan teks
                        Text(
                          'Satuan',
                          style: TextStyle(
                            height: 1,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded( // Tambahkan Expanded di sini
                    child: TextField(
                      style: TextStyle(
                        fontSize: 13, 
                        fontWeight: FontWeight.w400
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: 
                            EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        hintText: 'Atur',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,     // Warna garis
                thickness: 2,           // Ketebalan garis
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Image.asset(
                          'assets/images/stok-jumlah.png',
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: 8), // Jarak antara icon dan teks
                        Text(
                          'jumlah',
                          style: TextStyle(
                            height: 1,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded( // Tambahkan Expanded di sini
                    child: TextField(
                      style: TextStyle(
                        fontSize: 13, 
                        fontWeight: FontWeight.w400
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: 
                            EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        hintText: 'Atur',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,     // Warna garis
                thickness: 2,           // Ketebalan garis
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Text(
                          'Tambah ke laporan Pengeluaran',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                    activeColor: Color(0xFF4778F8),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: 
                          WidgetStateProperty.all<Color>(Color(0xFF4778F8)),
                          foregroundColor: 
                          WidgetStateProperty.all<Color>(Colors.white),
                          minimumSize: 
                          WidgetStateProperty.all<Size>(Size
                          (double.infinity, 48)),
                          shape:
                           WidgetStateProperty.all<RoundedRectangleBorder>(
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
                                    Text(
                                      'Stok\nditambah!',
                                      textAlign: TextAlign.center, 
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
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Stok',
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
                          'Simpan',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ),
            ],
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
