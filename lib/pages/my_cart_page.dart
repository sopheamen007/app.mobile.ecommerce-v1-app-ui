import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app/dummy/my_cart_json.dart';
import 'package:ecommerce_app/theme/colors.dart';
import 'package:ecommerce_app/widgets/line_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:line_icons/line_icons.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "My Cart",
        style: TextStyle(
            color: secondary, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              border: Border.all(color: secondary.withOpacity(0.2))),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: secondary,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
      backgroundColor: primary,
      actions: [
        Container(
          width: 35,
          height: 35,
          decoration:
              BoxDecoration(color: white, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: secondary.withOpacity(0.15),
                blurRadius: 5,
                offset: Offset(0, 5))
          ]),
          child: Center(
            child: Icon(
               LineIcons.shoppingBag,
              size: 20,
              color: secondary,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            color: secondary, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            "Proceed to checkout",
            style: TextStyle(
                color: white, fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          getCartLits(),
          SizedBox(
            height: 20,
          ),
          getPromoteCode(),
          SizedBox(
            height: 40,
          ),
          getSummary()
        ],
      ),
    );
  }

  Widget getCartLits() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(myCartJson.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: FadeIn(
             duration: Duration(milliseconds: 1000 * index),
            child: Row(
              children: [
                Container(
                  width: (size.width - 30) * 0.7,
                  height: 80,
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        child: Stack(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(myCartJson[index]['image']),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                              top: 10,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: secondary.withOpacity(0.02)),
                                    color: secondary.withOpacity(0.1)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myCartJson[index]['name'],
                              style: TextStyle(fontSize: 16),
                              maxLines: 2,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$",
                                  style: TextStyle(
                                      color: red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  myCartJson[index]['price'],
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        // color: secondary
                        ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.close,
                                size: 15,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(LineIcons.minusSquare),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "01",
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(LineIcons.plusSquare)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget getPromoteCode() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: secondary.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
          color: secondary.withOpacity(0.05)),
      child: Row(
        children: [
          Container(
            width: (size.width - 30) * 0.7,
            height: 55,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                cursorColor: secondary,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Promo Code"),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: secondary),
                child: Center(
                  child: Text(
                    "Apply",
                    style: TextStyle(color: white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Subtotal",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "(3 items)",
              style: TextStyle(
                color: secondary,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
                child: Dash(
                    length: 155,
                    direction: Axis.horizontal,
                    dashLength: 10,
                    dashColor: secondary.withOpacity(0.5))),
            SizedBox(
              width: 5,
            ),
            Text(
              "\$600",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 30,),
        Row(
          children: [
            Text(
              "Delivery charge",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(
              width: 5,
            ),
            Flexible(
                child: Dash(
                    length: 175,
                    direction: Axis.horizontal,
                    dashLength: 10,
                    dashColor: secondary.withOpacity(0.5))),
            SizedBox(
              width: 5,
            ),
            Text(
              "Free",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 30,),
        Row(
          children: [
            Text(
              "Total",
              style: TextStyle(
                  color: secondary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            
            SizedBox(
              width: 5,
            ),
            Flexible(
                child: Dash(
                    length: 260,
                    direction: Axis.horizontal,
                    dashLength: 10,
                    dashColor: secondary.withOpacity(0.5))),
            SizedBox(
              width: 5,
            ),
            Text(
              "\$600",
              style: TextStyle(
                  color: red, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
