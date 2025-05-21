import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/cucianselesaiscreen.dart';
import 'package:laundry_app/mainscreen.dart';
import 'package:laundry_app/statuspesananscreen.dart';

/// HomeScreen menampilkan profil singkat di bagian atas
/// dan empat menu shortcut di bawahnya.
class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Pesanan Laundry',
        'datetime': '10 Mei 2025  19.52',
        'price': 'Rp 50.000',
        'icon': 'assets/images/map_laundry.png',
      },
      {
        'title': 'Pesanan Laundry',
        'datetime': '10 Mei 2025  19.52',
        'price': 'Rp 50.000',
        'icon': 'assets/images/map_laundry.png',
      },
      {
        'title': 'Beli Pewangi',
        'datetime': '10 Mei 2025  19.52',
        'price': '-Rp 50.000',
        'icon': 'assets/images/icon-park-solid_buy.png',
      },
      {
        'title': 'Bayar Gaji Karyawan',
        'datetime': '10 Mei 2025  19.52',
        'price': '-Rp 1.000.000',
        'icon': 'assets/images/icon-park-solid_buy.png',
      },
      // Tambah data lainnya
    ];


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 47,
                    height: 47,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 4), // arah bayangan (x, y)
                          blurRadius: 6, // seberapa blur
                          spreadRadius: 1, // seberapa besar sebaran
                        ),
                      ],
                      shape: BoxShape.circle,
                        image: const DecorationImage(
                        image: AssetImage('assets/images/replace-photo.png'), 
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  
                  // Nama, alamat, dan no. HP di kanan
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama
                        Text(
                          'Selamat Datang, Admin',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            height: 1, // <--- kontrol jarak vertikal
                          ),
                        ),
                        Text(
                          'Laundry Laila',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF4778F8),
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            height: 1, // <--- optional, biar lebih rapat juga
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(initialIndex: 1), // tab Produk
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Text(
                            'Atur Produk',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF4778F8),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(initialIndex: 1, produkTabIndex: 1), 
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(4) 
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12), 
                        child: Center(
                          child: Text(
                            'Atur Stok',
                            style: GoogleFonts.poppins(
                              color: Color(0xFF4778F8),
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(initialIndex: 4,), 
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(4) 
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12), 
                        child: Center(
                          child: Image.asset(
                              width: 24,
                              height: 24,
                              'assets/images/ri_user-settings-fill.png', 
                            ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Status Pesanan',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _MenuItem(
                    icon: 'assets/images/fluent_form-new-20-filled.png',
                    label: 'Orderan Baru',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => 
                        const StatusPesananScreen(initialIndex: 0)),
                      );
                    },
                    color: 0x0FF4778F8,
                    qty: '12'),
                    
                  _MenuItem(
                    icon: 'assets/images/map_laundry-1.png',
                    label: 'Diproses',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => 
                        const StatusPesananScreen(initialIndex: 1)),
                      );
                    },
                    color: 0x0FF66D2F5,
                    qty: '20'),
                  _MenuItem(
                    icon: 'assets/images/ion_checkmark-done-circle.png', 
                    label: 'Selesai',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => 
                        const StatusPesananScreen(initialIndex: 2)),
                      );
                    },
                    color: 0x0FF848AF5,
                    qty: '99+'),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Keuangan',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 8),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Pendapatan Hari ini',
                              style: TextStyle(
                                fontWeight: FontWeight.w500, 
                                fontSize: 12
                              ),
                            ),
                          Text(
                            'Rp 400.000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: 32
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(initialIndex: 3), // tab Produk
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/material-symbols_read-more-rounded.png',
                        width: 35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                  'Riwayat Transaksi',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(children: [
                  Text(
                    'Selengkapnya',
                    style: GoogleFonts.poppins(
                      color: Color(0x0FF555555),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Image.asset(
                    'assets/images/panah-selengkapnya.png',
                    width: 6,   // Ganti sesuai kebutuhan
                    height: 3,  // Ganti sesuai kebutuhan
                  ),
                ],)
              ],
              ),
              Container(
                height: 200, 
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index]; 
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFC0BDBD),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  item['icon'], // dinamis
                                  width: 26,
                                  height: 26,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'], // dinamis
                                      style: TextStyle(
                                        height: 1,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      item['datetime'], // dinamis
                                      style: const TextStyle(
                                        height: 1,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            item['price'], // dinamis
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),

              ),
            ],
          ),
        ),
        )
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  final int color;
  final String qty;

  const _MenuItem({required this.icon, required this.label, required this.onTap, required this.color, required this.qty,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // warna bayangan
                  offset: const Offset(0, 4), // arah bayangan (x, y)
                  blurRadius: 6, // seberapa blur
                  spreadRadius: 1, // seberapa besar sebaran
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                icon,
                width: 40,   // Ganti sesuai kebutuhan
                height: 40,  // Ganti sesuai kebutuhan
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 12, 
            fontWeight: FontWeight.w500, height: 1),
          ),
          Text(
            qty,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 12, 
            fontWeight: FontWeight.w400, height: 1, 
            color: Color(0xFFFE7A15)),
          ),
        ],
      ),
    );
  }

}
