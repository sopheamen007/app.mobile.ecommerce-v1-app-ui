import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app/dummy/order_json.dart';
import 'package:ecommerce_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Orders",
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

  Widget getBody() {
   
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          getTabs(),
          SizedBox(height: 30,),
          pageIndex == 0 ? getListCurrentOrders() : getListPastOrders()
        ],
      ),
    );
  }
  Widget getTabs(){
     var size = MediaQuery.of(context).size;
    return Container(
            width: size.width,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: secondary.withOpacity(0.05)),
            child: Row(
              children: [
              pageIndex == 0
                  ? Flexible(
                      child: ElasticIn(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              pageIndex = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: (size.width - 45) / 2,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: secondary.withOpacity(0.15),
                                        blurRadius: 5,
                                        offset: Offset(0, 5))
                                  ]),
                              child: Center(
                                child: Text(
                                  "Current Orders",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Flexible(
                      child: GestureDetector(
                        onTap: (){
                           setState(() {
                            pageIndex = 0;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: (size.width - 45) / 2,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Current Orders",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: secondary.withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              pageIndex == 1
                  ? Flexible(
                      child: ElasticIn(
                        child: GestureDetector(
                          onTap: (){
                             setState(() {
                              pageIndex = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: (size.width - 45) / 2,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: secondary.withOpacity(0.15),
                                        blurRadius: 5,
                                        offset: Offset(0, 5))
                                  ]),
                              child: Center(
                                child: Text(
                                  "Past Orders",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Flexible(
                      child: GestureDetector(
                        onTap: (){
                           setState(() {
                            pageIndex = 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: (size.width - 45) / 2,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Past Orders",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: secondary.withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ]),
          );
  }
  Widget getListCurrentOrders(){
     var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(currentOrderList.length, (index) {
        return FadeIn(
           duration: Duration(milliseconds: 1000 * index),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: secondary.withOpacity(0.05)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(currentOrderList[index]['date'],style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),),
                          Text("Delivery Processing",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.orangeAccent
                          ),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.6,
                           
                            child: Row(
                              children: [
                                Container(
                          width: 90,
                          height: 90,
                          child: Stack(
                            children: [
                             
                              Positioned(
                                top: 10,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: secondary.withOpacity(0.1)),
                                      color: white
                                      ),
                                ),
                              ),
                               Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(currentOrderList[index]['image']),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Flexible(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentOrderList[index]['name'],
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
                                      currentOrderList[index]['price'],
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                        ),
                              ],
                            ),
                          ),
                          Flexible(child: Row(
                            children: [
                              Container(
                                width: 1,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: secondary.withOpacity(0.15)
                                ),
                              ),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Items: 1",style: TextStyle(
                                    fontSize: 13
                                  ),),
                                  Text(currentOrderList[index]['time'],style: TextStyle(
                                    fontSize: 12,
                                    color: secondary.withOpacity(0.5)
                                  ),)
                                ],
                              )
                            ],
                          ))
                          
                        
                        ],
                      )
                    ],
                  ),
                ),
              ),
          ),
        );
      }),
    );
  }
   Widget getListPastOrders(){
     var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(pastOrderList.length, (index) {
        return FadeIn(
           duration: Duration(milliseconds: 1000 * index),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: secondary.withOpacity(0.05)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(pastOrderList[index]['date'],style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),),
                          Text("Delivered",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.orangeAccent
                          ),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.6,
                           
                            child: Row(
                              children: [
                                Container(
                          width: 90,
                          height: 90,
                          child: Stack(
                            children: [
                             
                              Positioned(
                                top: 10,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: secondary.withOpacity(0.1)),
                                      color: white
                                      ),
                                ),
                              ),
                               Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(pastOrderList[index]['image']),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Flexible(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                 pastOrderList[index]['name'],
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
                                      pastOrderList[index]['price'],
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                        ),
                              ],
                            ),
                          ),
                          Flexible(child: Row(
                            children: [
                              Container(
                                width: 1,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: secondary.withOpacity(0.15)
                                ),
                              ),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Items: 1",style: TextStyle(
                                    fontSize: 13
                                  ),),
                                  Text(pastOrderList[index]['time'],style: TextStyle(
                                    fontSize: 12,
                                    color: secondary.withOpacity(0.5)
                                  ),)
                                ],
                              )
                            ],
                          ))
                          
                        
                        ],
                      )
                    ],
                  ),
                ),
              ),
          ),
        );
      }),
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
            "Reorder",
            style: TextStyle(
                color: white, fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
