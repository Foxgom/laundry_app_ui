import 'package:flutter/material.dart';
import 'package:laundry_app/rincianorderscreen.dart';
import 'package:laundry_app/statuspesananscreen.dart';

class CucianDiambilScreen extends StatelessWidget {
  const CucianDiambilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Fitri Dwi Lestari',
        'datetime': '10 Mei 2025  19.52',
        'price': 'Rp 50.000',
        'ukuran': '/Kg'
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
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Rincianorderscreen(),
                      ),
                    );
                  },
                  child: Container(
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
                        Image.asset(
                          'assets/images/orderan-diambil.png',
                          width: 43,
                          height: 43,
                        ),
                        SizedBox(width: 4,),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order #657',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                item['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                item['price'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                              ManualStatusDropdown()
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                );
                
                
                
                
              },
            ),
          ),
        ],
      ),
    );
  }
}