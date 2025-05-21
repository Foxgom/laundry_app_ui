import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/mainscreen.dart';
import 'package:laundry_app/orderan/cetakorderan.dart';
import 'package:laundry_app/orderan/layanan.dart';
import 'package:laundry_app/orderan/tambahorderanscreen.dart';
import 'package:laundry_app/rincianorderscreen.dart';
import 'package:laundry_app/testing/testing.dart';
import 'package:intl/intl.dart';

class UbahOrderanScreen extends StatefulWidget {
  const UbahOrderanScreen({super.key});

  @override
  _UbahOrderanScreenState createState() => _UbahOrderanScreenState();
}

class _UbahOrderanScreenState extends State<UbahOrderanScreen> {
  List<Layanan> layananDipilih = [
    Layanan('Cuci Kering', 'Satuan', 5000, '/Kg'),
    Layanan('Sprei', 'Satuan', 5000, '/Pc'),
  ];
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
  String? selectedValuePembayaran = 'Tunai';
  final List<String> options = ['1 Hari', '3 Hari'];
  final List<String> optionsPembayaran = ['Tunai', 'QRIS'];

  DateTime? selectedDate;
  final TextEditingController _controllerTanggalOrder = TextEditingController(text: '10/05/2025');
  final TextEditingController _controllerEstimasiPengambilan = TextEditingController(text: '14/05/2025');

  Future<void> _pickDate(BuildContext context, TextEditingController _controller) async {
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

  final TextEditingController _namaController = TextEditingController(text: 'Fitri Dwi Lestari');
  final TextEditingController _alamatController = TextEditingController(text: 'Jl. Tp. Sriwijaya | Lrg. SDN 150 Kel. Beliung Kec. Kota Baru Kota Jambi ');
  final TextEditingController _noTelpController = TextEditingController(text: '081234567890');
  final TextEditingController _catatanController = TextEditingController(text: 'Sprei merah motif manchester united');

  @override
  void dispose() {
    _namaController.dispose();
    _alamatController.dispose();
    _noTelpController.dispose();
    _catatanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/icon-arrow.png'),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Ubah Orderan',
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
                  _buildTextField(
                    label: "Nama", 
                    hintText: 'Masukkan nama pelanggan', 
                    controller: _namaController
                  ),
                  _buildTextField(
                    label: "Alamat", 
                    hintText: 'Masukkan alamat pelanggan', 
                    controller: _alamatController
                  ),
                  _buildTextField(
                    label: "Nomor Telepon", 
                    hintText: '08**********', 
                    controller: _noTelpController
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tanggal Order',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _pickDate(context, _controllerTanggalOrder),
                          child: AbsorbPointer(
                            child: TextField(
                            controller: _controllerTanggalOrder,
                            readOnly: true, // agar user tidak bisa ketik manual
                            onTap: () => _pickDate(context, _controllerTanggalOrder), 
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
                          onTap: () => _pickDate(context, _controllerEstimasiPengambilan),
                          child: AbsorbPointer(
                            child: TextField(
                            controller: _controllerEstimasiPengambilan,
                            readOnly: true, // agar user tidak bisa ketik manual
                            onTap: () => _pickDate(context, _controllerEstimasiPengambilan), 
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
                  _buildTextField(label: "Catatan (opsional)", hintText: 'Masukkan catatan', controller: _catatanController),
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Rincianorderscreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Simpan Perubahan',
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
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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


}