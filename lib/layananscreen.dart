import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/tambahlayananscreen.dart';

class LayananScreen extends StatelessWidget {
  const LayananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Cuci Kering',
        'datetime': 'Satuan',
        'price': 'Rp 5.000',
        'ukuran': '/Kg'
      },
      {
        'title': 'Cuci Gosok',
        'datetime': 'Satuan',
        'price': 'Rp 7.000',
        'ukuran': '/Kg'
      },
      {
        'title': 'Cuci Instan 1 hari',
        'datetime': 'Satuan',
        'price': 'Rp 9.000',
        'ukuran': '/Kg'
      },
      {
        'title': 'Sepatu',
        'datetime': 'Satuan',
        'price': 'Rp 15.000',
        'ukuran': '/Pc'
      },
      {
        'title': 'Boneka Besar',
        'datetime': 'Satuan',
        'price': 'Rp 25.000',
        'ukuran': '/Pc'
      },
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // 💡 Ubah warna background di sini
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
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFC0BDBD), width: 2
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              item['datetime'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            item['price'],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            item['ukuran'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      Column(
                        children: [
                          Image.asset(
                            width: 14,
                            height: 15,
                            'assets/images/edit-biru.png'
                          ),
                          SizedBox(height: 4),
                          Image.asset(
                            width: 13,
                            height: 13,
                            'assets/images/delete-orange.png'
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => 
                  const TambahLayananScreen()),
                );
              },
              child: Text(
                'Tambah Layanan',
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
