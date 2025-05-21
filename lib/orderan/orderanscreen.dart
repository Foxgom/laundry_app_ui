import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/mainscreen.dart';
import 'package:laundry_app/orderan/cetakorderan.dart';
import 'package:laundry_app/orderan/layanan.dart';
import 'package:laundry_app/orderan/tambahorderanscreen.dart';
import 'package:laundry_app/testing/testing.dart';
import 'package:intl/intl.dart';

class OrderanScreen extends StatefulWidget {
  const OrderanScreen({super.key});

  @override
  _OrderanScreenState createState() => _OrderanScreenState();
}

class _OrderanScreenState extends State<OrderanScreen> {
  List<Layanan> layananDipilih = [];
  int count = 1;
  int countSeprei = 1;

  void _tambahQty(int index) {
    setState(() => layananDipilih[index].qty++);
  }

  void _kurangiQty(int index) {
    setState(() {
      if (layananDipilih[index].qty > 1) {
        layananDipilih[index].qty--;
      } else {
        // Jika qty 1 lalu dikurangi, hapus item
        layananDipilih.removeAt(index);
      }
    });
  }
  
  String? selectedValue;
  String? selectedValuePembayaran;
  final List<String> options = ['1 Hari', '3 Hari'];
  final List<String> optionsPembayaran = ['Tunai', 'QRIS'];

  DateTime? selectedDate;
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('id', 'ID'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.black, // Warna header dan tombol OK/CANCEL
              onPrimary: Colors.white, // Warna teks di atas warna primary
              onSurface: Colors.black, // Warna teks di kalender
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // Warna teks tombol
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
        _controller.text = DateFormat('dd MMMM yyyy', 'id_ID').format(date);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Buat Orderan',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
            child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(label: "Nama", hintText: 'Masukkan nama pelanggan'),
                  _buildTextField(label: "Alamat", hintText: 'Masukkan alamat pelanggan'),
                  _buildTextField(label: "Nomor Telepon", hintText: '08**********'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Estimasi Hari',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          value: selectedValue,
                          hint: Text('Pilih durasi'),
                          items: options.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Estimasi Pengambilan',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _pickDate(context),
                          child: AbsorbPointer(
                            child: TextField(
                            controller: _controller,
                            readOnly: true, // agar user tidak bisa ketik manual
                            onTap: () => _pickDate(context), // buka date picker saat diklik
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFFC0BDBD)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFFC0BDBD)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              suffixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.grey[600],
                                size: 20,
                              ),
                              hintText: 'DD/MM/YYYY',
                            ),
                          )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Orderan',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFC0BDBD), // warna border
                        width: 1, // ketebalan border
                      ),
                      borderRadius: BorderRadius.circular(4), // radius 4
                    ),
                    child: Column(
                        children: [
                          ...layananDipilih.asMap().entries.map((entry) {
                            final index = entry.key;
                            final item = entry.value;
                            return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.nama,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      'Rp ${item.harga}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.satuan,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  Container(
                                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2), 
                                      decoration: BoxDecoration(
                                        color: Color(0xffEAEAEA), // Warna background
                                        borderRadius: BorderRadius.circular(4), // Rounded corner
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => _kurangiQty(index),
                                            child: Image.asset(
                                              'assets/images/kiri.png',
                                              width: 5,
                                              height: 8,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '${item.qty}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: () => _tambahQty(index),
                                            child: Image.asset(
                                              'assets/images/kanan.png',
                                              width: 5,
                                              height: 8,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                          }).toList(),                       
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                WidgetStateProperty.all<Color>
                              (Color(0xFFC8D7FD)), 
                              foregroundColor:
                                WidgetStateProperty.all<Color>
                              (Colors.white), 
                              minimumSize: WidgetStateProperty.all<Size>
                              (Size(double.infinity, 48)), 
                              shape: WidgetStateProperty.all<
                                RoundedRectangleBorder
                              >
                              (
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4), 
                                ),
                              ),
                            ),
                            onPressed: () async {
                              final hasil = await Navigator.push<List<Layanan>>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TambahOrderanScreen(layananDipilih),
                                ),
                              );

                              if (hasil != null) {
                                setState(() => layananDipilih = hasil);
                              }
                            },
                            child: Text(
                              'Tambah',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Metode Pembayaran',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          value: selectedValuePembayaran,
                          hint: Text('Pilih Metode Pembayaran'),
                          items: optionsPembayaran.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedValuePembayaran = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                  ),
                  _buildTextField(label: "Catatan (opsional)", hintText: 'Masukkan catatan'),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CetakOrderanScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Buat',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ],
              ),
            ],
          ),
        )
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

}