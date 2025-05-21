import 'package:flutter/material.dart';
import 'package:laundry_app/cucianbatalscreen.dart';
import 'package:laundry_app/cuciandiambilscreen.dart';
import 'package:laundry_app/cucianmasukscreen.dart';
import 'package:laundry_app/cucianselesaiscreen.dart';

class StatusPesananScreen extends StatelessWidget {   // <-- Stateless cukup
  final int initialIndex;                // ← tambahkan

  const StatusPesananScreen({
    super.key,
    this.initialIndex = 0,               // default: tab pertama
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(                      // <—— tambahkan ini
      length: 4,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/images/icon-arrow.png'),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Penjualan Saya',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          centerTitle: true,
          bottom: const TabBar(                       // controller tak perlu!
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFF4778F8),
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Center(
                  child: Text(
                    'Orderan Baru',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
              ),
              Tab(text: 'Selesai'),
              Tab(text: 'Diambil'),
              Tab(text: 'Batal'),
            ],
          ),
        ),
        body: const TabBarView(                       // controller tak perlu!
          children: [
            CucianMasukScreen(),
            CucianSelesaiScreen(),
            CucianDiambilScreen(),
            CucianBatalScreen(),
          ],
        ),
      ),
    );
  }
}


class ManualStatusDropdown extends StatefulWidget {
  const ManualStatusDropdown({super.key});

  @override
  State<ManualStatusDropdown> createState() => _ManualStatusDropdownState();
}

class _ManualStatusDropdownState extends State<ManualStatusDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  static const Map<String, Color> _colors = {
    'Orderan Baru': Color(0xff4778F8),
    'Selesai': Color(0xff66D2F5),
    'Diambil': Color(0xff848AF5),
    'Batal': Color(0xffD41900),
  };

  late final List<String> _labels = _colors.keys.toList();
  String _selected = 'Orderan Baru';
  TabController? _tabController;

  /* ---------- sinkronisasi TAB → BADGE ---------- */
  void _handleTabChange() {
    if (_tabController!.indexIsChanging) return;
    setState(() => _selected = _labels[_tabController!.index]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ctrl = DefaultTabController.of(context);
    if (ctrl != _tabController) {
      _tabController?.removeListener(_handleTabChange);
      _tabController = ctrl;
      _tabController?.addListener(_handleTabChange);

      if (_tabController != null) {
        _selected = _labels[_tabController!.index];
      }
    }
  }

  /* ---------- item dropdown tergantung tab aktif ---------- */
  List<String> get _currentDropdownItems {
    final currentIdx = _tabController?.index ?? 0;
    final currentLabel = _labels[currentIdx];
    return _labels.where((label) => label != currentLabel).toList();
  }

  /* ---------- toggle overlay ---------- */
  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlay();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlay() {
    final renderBox = context.findRenderObject() as RenderBox;
    final pos = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    return OverlayEntry(
      builder: (_) => Positioned(
        left: pos.dx,
        top: pos.dy + size.height + 4,
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 4),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _currentDropdownItems.map((label) => InkWell(
                onTap: () {
                  _overlayEntry?.remove();
                  _overlayEntry = null;

                  setState(() => _selected = label);
                  final idx = _labels.indexOf(label);
                  _tabController?.animateTo(idx);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                  color: _colors[label],
                  alignment: Alignment.centerLeft,
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              )).toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController?.removeListener(_handleTabChange);
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
          color: _colors[_selected],
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _selected,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              Image.asset('assets/images/arrow_down.png', width: 9, height: 9),
            ],
          ),
        ),
      ),
    );
  }
}
