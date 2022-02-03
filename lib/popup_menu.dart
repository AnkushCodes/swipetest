import 'package:flutter/material.dart';

class PopMenu extends StatefulWidget {
  @override
  _PopMenuState createState() => _PopMenuState();
}

class _PopMenuState extends State<PopMenu> {
  GlobalKey _key = LabeledGlobalKey("button_icon");
  late List<dynamic> icons;
  late OverlayEntry _overlayEntry;
  late Offset? _buttonPosition;
  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    icons = [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: IconButton(
              padding: EdgeInsets.all(2),
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 10,
              ),
              onPressed: () {
                _isMenuOpen ? _closeMenu() : _openMenu();
              },
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(Icons.cabin),
          SizedBox(
            width: 20,
          ),
          Text(
            'Product',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(Icons.person),
          SizedBox(
            width: 20,
          ),
          Text(
            'Download',
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(Icons.person),
          SizedBox(
            width: 20,
          ),
          Text(
            'Pricing',
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    ];
  }

  void _findButton() {
    RenderBox? renderBox =
        _key.currentContext?.findRenderObject() as RenderBox?;
    _buttonPosition = renderBox?.localToGlobal(Offset.zero);
  }

  void _openMenu() {
    _findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)?.insert(_overlayEntry);
    _isMenuOpen = !_isMenuOpen;
  }

  void _closeMenu() {
    _overlayEntry.remove();
    _isMenuOpen = !_isMenuOpen;
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 80,
          right: (20),
          width: 200,
          child: _popMenu(),
        );
      },
    );
  }

  Widget _popMenu() {
    return Container(
      width: 200,
      height: 210,
      child: Material(
        child: Card(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                icons.length,
                (index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 300,
                      height: index == 0 ? 20 : 50,
                      child: icons[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      color: Colors.white,
      onPressed: () {
        _isMenuOpen ? _closeMenu() : _openMenu();
      },
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
