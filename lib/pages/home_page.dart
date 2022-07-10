import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app/dummy/ads_json.dart';
import 'package:ecommerce_app/dummy/home_json.dart';
import 'package:ecommerce_app/pages/product_detail_page.dart';
import 'package:ecommerce_app/pages/side_menu_page.dart';
import 'package:ecommerce_app/theme/colors.dart';
import 'package:ecommerce_app/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer:SideMenuPage(),
      backgroundColor: primary,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(AntDesign.menuunfold,color: secondary,),
        onPressed: () {
           scaffoldKey.currentState?.openDrawer();
        },
      ),
      elevation: 0,
      backgroundColor: primary,
      actions: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: secondary.withOpacity(0.5))),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                  color: secondary),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  Widget getBody() {
   
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Hello Sopheamen,",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Text(
            "Let's get something",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomSlider(
            items: adsJson,
          ),
          SizedBox(
            height: 20,
          ),
          getCategorySection(),
          SizedBox(
            height: 20,
          ),
          getItemLists()
        ],
      ),
    );
  }

  Widget getCategorySection() {
    var size = MediaQuery.of(context).size;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: (size.width - 30) * 0.7,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categoryItems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            pageIndex = index;
                          });
                        },
                        child: Container(
                          height: 30,
                          decoration: pageIndex == index
                              ? BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: secondary, width: 1.5)))
                              : BoxDecoration(),
                          child: Text(categoryItems[index]['title'],
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: pageIndex == index
                                      ? secondary
                                      : secondary.withOpacity(0.5))),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    color: secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(12),
                        topLeft: Radius.circular(4))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      AntDesign.search1,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Search...",
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget getItemLists() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: List.generate(homeJson.length, (index) {
        return Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(
                  name: homeJson[index]['name'],
                  img: homeJson[index]['image'],
                  price: homeJson[index]['price'],
                  rate: homeJson[index]['rate'],
                  colors: homeJson[index]['colors'],
                )));
              },
              child: FadeIn(
                duration: Duration(milliseconds: 1000 * index),
                child: Container(
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
                              color: secondary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, right: 15, left: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      LineIcons.star,
                                      size: 18,
                                      color: secondary,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      homeJson[index]['rate'],
                                      style: TextStyle(fontWeight: FontWeight.w500),
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
                                            color: secondary.withOpacity(0.15),
                                            blurRadius: 5,
                                            offset: Offset(0, 5))
                                      ]),
                                  child: Center(
                                    child: Icon(
                                     LineIcons.shoppingBag,
                                      size: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -5,
                        child: Container(
                            width: (size.width - 50) / 2,
                            height: 180,
                            decoration: BoxDecoration(
                                // color: Colors.red
                                ),
                            child: Image.asset(homeJson[index]['image'])),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  width:  (size.width-60)/2,
                  child: Text(
              homeJson[index]['name'],
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
                ),
            
            Container(
              width: (size.width-60)/2,
             
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                        "\$",
                        style: TextStyle(fontSize: 13, 
                        color:red,
                        fontWeight: FontWeight.w500),
                      ),
                  ),
                  SizedBox(width: 1,),
                  Text(
                      homeJson[index]['price'],
                      style: TextStyle(fontSize: 20, 
                      color: secondary.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                    ),
                ],
              ),
            )
              ],
            )
          ],
        );
      }),
    );
  }
}
