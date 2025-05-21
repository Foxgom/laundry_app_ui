import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/orderan/layanan.dart';

class TambahOrderanScreen extends StatefulWidget {
  final List<Layanan> layananAwal;
  TambahOrderanScreen(this.layananAwal);

  _TambahOrderanScreenState createState() => _TambahOrderanScreenState();
}

class _TambahOrderanScreenState extends State<TambahOrderanScreen> {
  final List<Layanan> daftarLayanan = [
    Layanan('Cuci Kering', 'Satuan', 5000, '/Kg'),
    Layanan('Cuci Gosok', 'Satuan', 7000, '/Kg'),
    Layanan('Cuci Instan 1 Hari', 'Satuan', 9000, '/Kg'),
    Layanan('Sepatu', 'Satuan', 15000, '/Pc'),
    Layanan('Boneka Besar', 'Satuan', 25000, '/Pc'),
    Layanan('Sprei', 'Satuan', 5000, '/Pc'),
  ];

  late List<bool> ceklis;

  @override
  void initState() {
    super.initState();
    ceklis = daftarLayanan
        .map((item) => widget.layananAwal.any((e) => e.nama == item.nama))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), 
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
          'Tambah Orderan',
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true, // kalau ingin teks di tengah
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                hintText: 'Cari di sini...',
                hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF555555)),
                suffixIcon: const Icon(Icons.search, size: 20, color: Colors.grey),
                filled: true,
                fillColor: Color(0xFFEAEAEA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                hintText: 'Urutkan menurut',
                hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF555555)),
                suffixIcon: Image.asset(
                  height: 18,
                  'assets/images/icon-urutkan.png',
                ),
                filled: true,
                fillColor: Color(0xFFEAEAEA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Divider(
            color: Colors.grey,     // Warna garis
            thickness: 1,           // Ketebalan garis
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daftarLayanan.length,
              itemBuilder: (context, index) {
                final item = daftarLayanan[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color.fromRGBO(192, 189, 189, 1), width: 2),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.nama, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                            Text('Satuan', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10)),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Rp ${item.harga}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13)),
                          Text(item.satuan, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10)),
                        ],
                      ),
                      SizedBox(width: 8),
                      Checkbox(
                        value: ceklis[index],
                        onChanged: (value) => setState(() => ceklis[index] = value!),
                        checkColor: Colors.white,
                        fillColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) return Colors.black;
                          return Colors.grey.shade300;
                        }),
                      ),
                    ],
                  ),
                );
              },
            )
          ),
          Padding(
            padding: const EdgeInsets.all(16), // margin atas dan bawah
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF4778F8)),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                minimumSize: WidgetStateProperty.all<Size>(Size(double.infinity, 48)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              onPressed: () {
                final hasil = <Layanan>[];
                for (int i = 0; i < daftarLayanan.length; i++) {
                  if (ceklis[i]) hasil.add(daftarLayanan[i].copyWith());
                }
                Navigator.pop(context, hasil);
              },
              child: Text(
                'Selesai',
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
    );
  }
}