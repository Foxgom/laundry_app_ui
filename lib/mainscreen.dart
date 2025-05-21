import 'package:flutter/material.dart';
import 'package:laundry_app/homescreen.dart';
import 'package:laundry_app/orderan/orderanscreen.dart';
import 'package:laundry_app/produkscreen.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  final int? produkTabIndex; // tambahan untuk tab produk

  const MainScreen({
    super.key,
    this.initialIndex = 0,
    this.produkTabIndex,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  // Gunakan getter agar bisa akses widget.produkTabIndex
  List<Widget> get _pages => [
        const HomeScreen(),
        ProdukScreen(initialTabIndex: widget.produkTabIndex ?? 0),
        const OrderanScreen(),
      
      ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBarItem({
    required String iconPath,
    required String activeIconPath,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isActive ? activeIconPath : iconPath,
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: const Color(0xFF4778F8),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBarItem(
                  iconPath: 'assets/images/icon-home.png',
                  activeIconPath: 'assets/images/icon-home-active.png',
                  isActive: _selectedIndex == 0,
                  onTap: () => _onItemTapped(0),
                ),
                _buildBarItem(
                  iconPath: 'assets/images/icon-produk.png',
                  activeIconPath: 'assets/images/icon-produk-active.png',
                  isActive: _selectedIndex == 1,
                  onTap: () => _onItemTapped(1),
                ),
                _buildBarItem(
                  iconPath: 'assets/images/icon-orderan.png',
                  activeIconPath: 'assets/images/icon-orderan-active.png',
                  isActive: _selectedIndex == 2,
                  onTap: () => _onItemTapped(2),
                ),
                _buildBarItem(
                  iconPath: 'assets/images/icon-keuangan.png',
                  activeIconPath: 'assets/images/icon-keuangan-active.png',
                  isActive: _selectedIndex == 3,
                  onTap: () => _onItemTapped(3),
                ),
                _buildBarItem(
                  iconPath: 'assets/images/icon-profile.png',
                  activeIconPath: 'assets/images/icon-profile-active.png',
                  isActive: _selectedIndex == 4,
                  onTap: () => _onItemTapped(4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
