import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/welcome_model.dart';

class TopCard extends StatefulWidget {
  final Welcome data;
  final int index;
  TopCard({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  _TopCardState createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(
                      "${widget.data.results[widget.index].picture.medium}"),
                  backgroundColor: Colors.transparent,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.data.results[widget.index].name.title} ${widget.data.results[widget.index].name.first} ${widget.data.results[widget.index].name.last}',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.data.results[widget.index].location.postcode} ${widget.data.results[widget.index].location.city} ${widget.data.results[widget.index].location.state}',
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
                Text(
                  '${widget.data.results[widget.index].location.timezone.offset} ${widget.data.results[widget.index].location.state} ${widget.data.results[widget.index].location.street.name}',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
