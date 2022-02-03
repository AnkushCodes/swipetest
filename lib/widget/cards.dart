import 'package:flutter/material.dart';
import 'package:task/welcome_model.dart';

class Cards extends StatefulWidget {
  final Welcome data;
  final int index;
  final int selectedIndex;
  Cards(
      {Key? key,
      required this.data,
      required this.index,
      required this.selectedIndex})
      : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  List<Color> normalTheme = [Colors.white, Colors.purple.shade300];
  List<Color> seletectedTheme = [Colors.black, Colors.white];
  late List<Color> setColor;
  @override
  void initState() {
    setColor = [...normalTheme];
    super.initState();
  }

  setTheme(bool set) {
    if (set) {
      setColor = [...seletectedTheme];
    } else {
      setColor = [...normalTheme];
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.index == widget.selectedIndex ? setTheme(false) : setTheme(true);
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      child: Card(
        elevation: 5,
        color: setColor[1],
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '${widget.data.results[widget.index].gender}   ${widget.data.results[widget.index].location.city}',
                    style: TextStyle(
                      color: setColor[0],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    '${widget.data.results[widget.index].name.title} ${widget.data.results[widget.index].name.first} ${widget.data.results[widget.index].name.last}',
                    style: TextStyle(fontSize: 18, color: setColor[0]),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'FemaleNl@example.com',
                    style: TextStyle(fontSize: 15, color: setColor[0]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
