import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/layananscreen.dart';
import 'package:laundry_app/stokscreen.dart';

// ======== HALAMAN UTAMA DENGAN TAB ========
class ProdukScreen extends StatefulWidget {
  final int initialTabIndex;

  const ProdukScreen({super.key, this.initialTabIndex = 0});

  @override
  State<ProdukScreen> createState() => _ProdukScreenState();
}

class _ProdukScreenState extends State<ProdukScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Atur Produk Dan Stok',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          labelColor: Color(0xFF4778F8),
          unselectedLabelColor: Colors.black,
          labelStyle: GoogleFonts.poppins(
            fontSize: 15, 
            fontWeight: FontWeight.w600
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500
          ),
          tabs: const [
            Tab(text: 'Layanan'),
            Tab(text: 'Stok'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          LayananScreen(),
          StokScreen(),
        ],
      ),
    );
  }
}
