import 'package:flutter/material.dart';

class StatusTagDropdown extends StatefulWidget {
  const StatusTagDropdown({super.key});

  @override
  State<StatusTagDropdown> createState() => _StatusTagDropdownState();
}

class _StatusTagDropdownState extends State<StatusTagDropdown> {
  String _selected = 'Orderan Baru';

  static const Map<String, Color> _colors = {
    'Orderan Baru': Color(0xff4778F8),
    'Selesai': Color(0xff66D2F5),
    'Diambil': Color(0xff848AF5),
    'Batal': Color(0xffD41900),
  };

  Widget _badge(String label, {bool withArrow = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
      color: _colors[label],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          if (withArrow) ...[
            const SizedBox(width: 3),
            Image.asset('assets/images/arrow_down.png', width: 9, height: 9),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabController = DefaultTabController.of(context);

    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: _selected,
        isDense: true,
        itemHeight: null, // untuk tinggi fleksibel
        icon: const SizedBox.shrink(),
        dropdownColor: Colors.transparent,
        selectedItemBuilder: (_) =>
            _colors.keys.map((l) => _badge(l, withArrow: true)).toList(),
        onChanged: (value) {
          if (value == null) return;
          setState(() => _selected = value);
          final idx = _colors.keys.toList().indexOf(value);
          tabController.animateTo(idx);
        },
        items: _colors.keys.map((label) {
          return DropdownMenuItem<String>(
            value: label,
            child: Material( // Material biar bisa pakai shadow kalau perlu
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.zero, // hilangkan padding
                height: 22, // atur tinggi konten
                alignment: Alignment.centerLeft,
                child: _badge(label),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
