import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/theme/colors.dart';
import 'package:flutter/material.dart';

class ActiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3, right: 3),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3, right: 3),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: white.withOpacity(.5),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class CustomSlider extends StatefulWidget {
  final List items;
  const CustomSlider({required this.items, Key? key}) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int activeIndex = 0;

  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlayInterval: Duration(seconds: 5),
              autoPlay: true,
              height: 180,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setActiveDot(index);
              },
            ),
            items: List.generate(
              this.widget.items.length,
              (index) {
                return Container(
                  margin: EdgeInsets.only(left: 0, right: 0),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(this.widget.items[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.items.length,
              (idx) {
                return activeIndex == idx ? ActiveDot() : InactiveDot();
              },
            ),
          ),
        ),
      ],
    );
  }
}
