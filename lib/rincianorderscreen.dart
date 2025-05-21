import 'package:flutter/material.dart';
import 'package:laundry_app/cetakrincianorderanscreen.dart';
import 'package:laundry_app/ubahorderanscreen.dart';

class Rincianorderscreen extends StatelessWidget {

  const Rincianorderscreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/icon-arrow.png'),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Rincian Orderan',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff4778F8),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4),), // Sudut melengkung 12px
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            'Informasi Pelanggan',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffffffff)
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4),), 
                        ),
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fitri Dwi Lestari',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, color: Colors.black, size: 16),
                                SizedBox(width: 4),
                                Expanded(child: Text(
                                  'Jl. Tp. Sriwijaya | Lrg. SDN 150 Kel. Beliung Kec. Kota Baru Kota Jambi',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                                )
                                
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.phone_outlined, color: Colors.black, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  '(+62)812-7172-7112',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4,),
                Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4),), // Sudut melengkung 12px
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Cuci Kering',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13
                                      ),
                                    )
                                  ),
                                  Text(
                                    'x5',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '/Kg',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10
                                      ),
                                    )
                                  ),
                                  Text(
                                    'Rp 25.000',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Sprei',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13
                                      ),
                                    )
                                  ),
                                  Text(
                                    'x1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '/Pc',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10
                                      ),
                                    )
                                  ),
                                  Text(
                                    'Rp 15.000',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffC8D7FD),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4),), 
                        ),
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Total Pesanan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13
                                    ),
                                  )
                                ),
                                Text(
                                  'Rp 40.000',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start, 
                              children: [
                                Expanded(
                                  child: Text(
                                    'Catatan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align( 
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'Sprei merah motif manchester united',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.right, // Opsional tambahan
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4,),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.all(Radius.circular(4)), 
                        ),
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'No. Pesanan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10
                                    ),
                                  )
                                ),
                                Text(
                                  '#605',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Metode Pembayaran',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10
                                    ),
                                  )
                                ),
                                Text(
                                  'Tunai',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Tanggal Order',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10
                                    ),
                                  )
                                ),
                                Text(
                                  '10 Mei 2025',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Estimasi Pengambilan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10
                                    ),
                                  )
                                ),
                                Text(
                                  '14 Mei 2025',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Tanggal Pengambilan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10
                                    ),
                                  )
                                ),
                                Text(
                                  'Belum diambil',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10
                                  ),
                                )
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                      SizedBox(height: 16,),
                      Column(
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0xFFFFFFFF),
                                ),
                                foregroundColor: WidgetStateProperty.all<Color>(
                                  const Color(0xff4778F8),
                                ),
                                minimumSize: WidgetStateProperty.all<Size>(
                                  const Size(double.infinity, 48),
                                ),
                                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide( 
                                      color: Color(0xff4778F8),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CetakRincianOrderanScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Cetak Struk',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff4778F8), // pastikan warnanya cocok
                                ),
                              ),
                            ),
                            SizedBox(height: 4,),
                            TextButton(
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
                                  MaterialPageRoute(builder: (_) => 
                                  const UbahOrderanScreen()),
                                );
                              },
                              child: Text(
                                'Ubah Orderan',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
      )
    );
  }
}
