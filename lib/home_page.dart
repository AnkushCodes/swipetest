import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task/welcome_model.dart';
import 'package:task/widget/cards.dart';
import 'package:task/widget/top_card.dart';

class HomePage extends StatefulWidget {
  Welcome welcome;
  HomePage({Key? key, required this.welcome}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController buttonCarouselController = CarouselController();

  late List<Widget> value = [];
  int selectedIndex = 0;
  ScrollController _controller = new ScrollController();
  GlobalKey indexKey = GlobalKey();
  late double size_of_widget;
  bool byListView = false;

  void _goToElement(int index) {
    _controller.animateTo((113.0 * index),
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  void initState() {
    super.initState();
    value = [
      ...widget.welcome.results
          .map((e) => TopCard(
              data: widget.welcome, index: widget.welcome.results.indexOf(e)))
          .toList()
    ];
    // WidgetsBinding.instance?.addPostFrameCallback((_) => getPosition());
  }

  // getPosition() {
  //   RenderBox _cardBox =
  //       indexKey.currentContext?.findRenderObject() as RenderBox;
  //   size_of_widget = _cardBox.size.height;
  //   print('--------');
  //   print('object $size_of_widget');
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              items: value,
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  onPageChanged: (index, change) {
                    if (byListView) {
                    } else {
                      // if (index == selectedIndex) {
                      _goToElement(index);
                      selectedIndex = index;
                      setState(() {});
                      // }
                    }
                  }),
            ),
            Positioned(
                top: 80,
                left: 20,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(40),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(35),
                    splashColor: Colors.black12,
                    onTap: () {
                      byListView = false;
                      buttonCarouselController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 0.5),
                          ]),
                      child: Transform.rotate(
                        angle: 1,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                )),
            Positioned(
                top: 80,
                right: 20,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(40),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(35),
                    splashColor: Colors.black26,
                    onTap: () {
                      byListView = false;
                      buttonCarouselController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 0.5),
                          ]),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                )),
          ],
        ),
        Flexible(
          child: ListView.builder(
              controller: _controller,
              itemCount: widget.welcome.results.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    // key: indexKey,
                    onTap: () {
                      byListView = true;
                      buttonCarouselController.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                      selectedIndex = index;

                      setState(() {});
                    },
                    child: Cards(
                        key: ValueKey('$index'),
                        data: widget.welcome,
                        index: index,
                        selectedIndex: selectedIndex));
              }),
        )
      ],
    );
  }
}
