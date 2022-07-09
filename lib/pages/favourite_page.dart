import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app/dummy/favourite_json.dart';
import 'package:ecommerce_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
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
        "Favourite",
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
              LineIcons.alternateTrash,
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
    // List items = [true, true, false, true];
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: List.generate(favouriteJson.length, (index) {
              return FadeIn(
                 duration: Duration(milliseconds: 1000 * index),
                child: Column(
                  children: [
                    Container(
                      width: (size.width - 50) / 2,
                      height: 220,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            child: Container(
                              width: (size.width - 50) / 2,
                              height: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: favouriteJson[index]['active'] ? 1.2 : 0,
                                      color: favouriteJson[index]['active']
                                          ? secondary.withOpacity(0.5)
                                          : Colors.transparent),
                                  color: secondary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 15, left: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          LineIcons.star,
                                          size: 20,
                                          color: secondary,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 3),
                                          child: Text(
                                            favouriteJson[index]['rate'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color:
                                                    secondary.withOpacity(0.15),
                                                blurRadius: 5,
                                                offset: Offset(0, 5))
                                          ]),
                                      child: Center(
                                        child: Icon(
                                          favouriteJson[index]['active']
                                              ? LineIcons.heartAlt
                                              : LineIcons.heart,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -10,
                            child: Container(
                                width: (size.width - 50) / 2,
                                height: 180,
                                decoration: BoxDecoration(
                                    ),
                                child: Image.asset(favouriteJson[index]['image'])),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          favouriteJson[index]['name'],
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: (size.width - 60) / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  "\$",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: red,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Text(
                                favouriteJson[index]['price'],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: secondary.withOpacity(0.5),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget getFooter(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: Text("Add To Cart",style: TextStyle(
            color:white,
            fontSize: 17,
            fontWeight: FontWeight.w500
          ),),
        ),
      ),
    );
  }
}
