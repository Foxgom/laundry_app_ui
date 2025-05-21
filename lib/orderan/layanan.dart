class Layanan {
  final String nama;
  final String jenis;
  final int harga;
  final String satuan;
  int qty;

  Layanan(this.nama, this.jenis, this.harga, this.satuan, {this.qty = 1});

  // Helper untuk membuat salinan baru (agar qty terpisah)
  Layanan copyWith({int? qty}) => Layanan(nama, jenis, harga, satuan, qty: qty ?? this.qty);
}