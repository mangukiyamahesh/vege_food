import 'package:flutter/material.dart';
import 'package:vege_food/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> list = [
    {'image': 'assets/images/soup.png', 'name': 'Soup'},
    {'image': 'assets/images/salad (5).png', 'name': 'Vege'},
    {'image': 'assets/images/chicken-leg.png', 'name': 'Chicken'},
    {'image': 'assets/images/poinsettia (2).png', 'name': 'Drink'},
    {'image': 'assets/images/fruits.png', 'name': 'Fruit'},
  ];
  List<Map<String, dynamic>> list1 = [
    {
      'image': 'assets/images/salad (5).png',
      'name': 'Veggie Stuffed Shells',
      'price': '\$12',
      'color': Colors.orange.shade50,
      'colors': Colors.orange,
    },
    {
      'image': 'assets/images/salad (5).png',
      'name': 'Veggie Stuffed Shells',
      'price': '\$12',
      'color': Colors.pink.shade50,
      'colors': Colors.pink,
    },
    {
      'image': 'assets/images/salad (5).png',
      'name': 'Veggie Stuffed Shells',
      'price': '\$12',
      'color': Colors.yellow.shade50,
      'colors': Colors.yellow,
    },
  ];
  int select = 0;
  int selectcolor = 0;
  int fav = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi, Mina!',
                    style: TextStyle(
                        fontSize: height * 0.03, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: height * 0.055,
                    width: height * 0.055,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(height * 0.01),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Yash And Radhika Welcomes A Baby Boy - Social News XYZ.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search foods ',
                  hintStyle: TextStyle(overflow: TextOverflow.ellipsis),
                  suffixIcon: Icon(Icons.keyboard_voice),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: height * 0.023, horizontal: width * 0.005),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.01),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.002),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            SizedBox(
              height: height * 0.16,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: width * 0.06),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                select = index;
                              },
                            );
                          },
                          child: Container(
                            height: height * 0.1,
                            width: height * 0.1,
                            margin: EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.015),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(height * 0.02),
                              boxShadow: [
                                BoxShadow(
                                  color: index == select
                                      ? Colors.orange.shade100
                                      : Colors.transparent,
                                  blurRadius: height * 0.05,
                                  spreadRadius: height * 0.002,
                                  offset: Offset(0, height * 0.003),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                list[index]['image'],
                                color: select == index
                                    ? Colors.orange
                                    : Colors.grey,
                                height: height * 0.05,
                                width: height * 0.05,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: height * 0.035,
                        // ),
                        Text(
                          list[index]['name'],
                          style: TextStyle(
                              color:
                                  select == index ? Colors.black : Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Expanded(
              // height: height * 0.50,
              // width: height * 0.45,
              child: ListView.builder(
                itemCount: 3,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: height * 0.45,
                          width: height * 0.3,
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.02),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: list1[index]['color'],
                                spreadRadius: height * 0.002,
                                blurRadius: height * 0.05,
                                offset: Offset(height * 0.001, height * 0.001),
                              ),
                            ],
                            color: list1[index]['color'],
                            borderRadius: BorderRadius.circular(height * 0.02),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: height * 0.06,
                              ),
                              Image.asset(
                                list1[index]['image'],
                                height: height * 0.13,
                                width: height * 0.13,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text(
                                list1[index]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: height * 0.025,
                                  color: list1[index]['colors'],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text(
                                list1[index]['price'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: height * 0.03,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.05),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          fav = index;
                                        },
                                      );
                                    },
                                    child: CircleAvatar(
                                      radius: height * 0.028,
                                      backgroundColor: Colors.white,
                                      child: fav == index
                                          ? Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )
                                          : Icon(
                                              Icons.favorite_outline,
                                              color: Colors.red,
                                            ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
