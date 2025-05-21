import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Hanya import dart:html jika web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class PilihFotoBaruWidget extends StatefulWidget {
  const PilihFotoBaruWidget({Key? key}) : super(key: key);

  @override
  State<PilihFotoBaruWidget> createState() => _PilihFotoBaruWidgetState();
}

class _PilihFotoBaruWidgetState extends State<PilihFotoBaruWidget> {
  File? _mobileImageFile;
  Uint8List? _webImageBytes;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    if (kIsWeb) {
      // Flutter Web image picker
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((e) {
        final reader = html.FileReader();
        final file = uploadInput.files!.first;
        reader.readAsArrayBuffer(file);
        reader.onLoadEnd.listen((e) {
          setState(() {
            _webImageBytes = reader.result as Uint8List;
          });
        });
      });
    } else {
      // Flutter Mobile image picker
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _mobileImageFile = File(pickedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (kIsWeb && _webImageBytes != null) {
      imageWidget = Image.memory(_webImageBytes!, height: 200);
    } else if (!kIsWeb && _mobileImageFile != null) {
      imageWidget = Image.file(_mobileImageFile!, height: 200);
    } else {
      imageWidget = const Text("Belum ada gambar dipilih");
    }

    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            imageWidget,
            const SizedBox(height: 16),
            TextButton(
              onPressed: _pickImage,
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: const BorderSide(color: Color(0xFF4778F8)),
              ),
              child: const Text(
                "Pilih Foto Baru",
                style: TextStyle(
                  color: Color(0xFF4778F8),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:laundry_app/orderan/layanan.dart';


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Order Laundry',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: HalamanUtama(),
//     );
//   }
// }

// // ------------------ Halaman Utama ------------------
// class HalamanUtama extends StatefulWidget {
//   @override
//   _HalamanUtamaState createState() => _HalamanUtamaState();
// }

// class _HalamanUtamaState extends State<HalamanUtama> {
//   List<Layanan> layananDipilih = [];

//   void _tambahQty(int index) {
//     setState(() => layananDipilih[index].qty++);
//   }

//   void _kurangiQty(int index) {
//     setState(() {
//       if (layananDipilih[index].qty > 1) {
//         layananDipilih[index].qty--;
//       } else {
//         // Jika qty 1 lalu dikurangi, hapus item
//         layananDipilih.removeAt(index);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Halaman 1')),
//       body: Column(
//         children: [
//           // ---------- Daftar Order ----------
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.only(top: 16),
//               children: [
//                 if (layananDipilih.isEmpty)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 32.0),
//                     child: Center(
//                       child: Text('Belum ada order', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
//                     ),
//                   ),
//                 ...layananDipilih.asMap().entries.map((entry) {
//                   final index = entry.key;
//                   final item = entry.value;
//                   return Container(
//                     margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.blue[50],
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.blueAccent),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Deskripsi layanan
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(item.nama, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                               SizedBox(height: 4),
//                               Text('${item.jenis} - Rp ${item.harga} ${item.satuan}'),
//                             ],
//                           ),
//                         ),
//                         // Tombol qty
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: Icon(Icons.remove_circle_outline),
//                               onPressed: () => _kurangiQty(index),
//                             ),
//                             Text('${item.qty}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                             IconButton(
//                               icon: Icon(Icons.add_circle_outline),
//                               onPressed: () => _tambahQty(index),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ],
//             ),
//           ),
//           SizedBox(height: 16),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () async {
//           final hasil = await Navigator.push<List<Layanan>>(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HalamanTambahOrder(layananDipilih),
//             ),
//           );

//           if (hasil != null) {
//             setState(() => layananDipilih = hasil);
//           }
//         },
//       ),
//     );
//   }
// }

// // ------------------ Halaman Tambah Order ------------------
// class HalamanTambahOrder extends StatefulWidget {
//   final List<Layanan> layananAwal;
//   HalamanTambahOrder(this.layananAwal);

//   @override
//   _HalamanTambahOrderState createState() => _HalamanTambahOrderState();
// }

// class _HalamanTambahOrderState extends State<HalamanTambahOrder> {
//   final List<Layanan> daftarLayanan = [
//     Layanan('Cuci Kering', 'Satuan', 5000, '/kg'),
//     Layanan('Setrika', 'Satuan', 4000, '/kg'),
//     Layanan('Cuci Sepatu', 'Per Item', 15000, '/pasang'),
//   ];

//   late List<bool> ceklis;

//   @override
//   void initState() {
//     super.initState();
//     ceklis = daftarLayanan
//         .map((item) => widget.layananAwal.any((e) => e.nama == item.nama))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Halaman 2')),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.only(top: 16),
//               itemCount: daftarLayanan.length,
//               itemBuilder: (context, index) {
//                 final item = daftarLayanan[index];
//                 return Container(
//                   margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   padding: EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(item.nama, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                           SizedBox(height: 4),
//                           Text('${item.jenis} - Rp ${item.harga} ${item.satuan}'),
//                         ],
//                       ),
//                       Checkbox(
//                         value: ceklis[index],
//                         onChanged: (value) => setState(() => ceklis[index] = value!),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             child: Text('Selesai'),
//             onPressed: () {
//               final hasil = <Layanan>[];
//               for (int i = 0; i < daftarLayanan.length; i++) {
//                 if (ceklis[i]) hasil.add(daftarLayanan[i].copyWith());
//               }
//               Navigator.pop(context, hasil);
//             },
//           ),
//           SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }