import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/tambahstokscreen.dart';

class StokScreen extends StatefulWidget {
  const StokScreen({super.key});

  _StokScreenState createState() => _StokScreenState();
}
class _StokScreenState extends State<StokScreen> {
  List<Map<String, dynamic>> items = [
      {
        'title': 'Pewangi',
        'datetime': 'Satuan',
        'price': 'Rp 5.000',
        'ukuran': '/Pc',
        'jumlah': 1,
      },
      {
        'title': 'Plastik Cuci',
        'datetime': 'Satuan',
        'price': 'Rp 2.000',
        'ukuran': '/Pc',
        'jumlah': 100,
      },
      {
        'title': 'Deterjen',
        'datetime': 'Satuan',
        'price': 'Rp 15.000',
        'ukuran': '/Kg',
        'jumlah': 10,
      },
    ];

    void _incrementJumlah(int index) {
      setState(() {
        items[index]['jumlah']++;
      });
    }

    void _decrementJumlah(int index) {
      setState(() {
        if (items[index]['jumlah'] > 0) {
          items[index]['jumlah']--;
        }
      });
    }

  @override
  Widget build(BuildContext context) {
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
            child: MyListView(
              items: items,
              onIncrement: _incrementJumlah,
              onDecrement: _decrementJumlah,
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
                  const TambahStokScreen()),
                );
              },
              child: Text(
                'Tambah Stok',
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

class MyListView extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final void Function(int) onIncrement;
  final void Function(int) onDecrement;

  MyListView({
    required this.items,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFC0BDBD), width: 2),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['title'], style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                    Text(item['datetime'], style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10)),
                    Text('Jumlah', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(item['price'], style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13)),
                  Text(item['ukuran'], style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10)),
                  Container(
                    color: Color(0xffEAEAEA),
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => onDecrement(index),
                          child: Image.asset('assets/images/kiri.png', width: 5, height: 8),
                        ),
                        SizedBox(width: 10),
                        Text('${item['jumlah']}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10)),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => onIncrement(index),
                          child: Image.asset('assets/images/kanan.png', width: 5, height: 8),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8),
              Column(
                children: [
                  Image.asset('assets/images/edit-biru.png', width: 14, height: 15),
                  SizedBox(height: 4),
                  Image.asset('assets/images/delete-orange.png', width: 13, height: 13),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

