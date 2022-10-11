import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:vege_food/list_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    PageController pageController = PageController();
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Column(
        children: [
          Container(
            height: height * 0.89,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(height * 0.025),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: height * 0.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(height * 0.025),
                        ),
                      ),
                      child: PageView(
                        onPageChanged: (value) {
                          setState(
                            () {
                              select = value;
                            },
                          );
                        },
                        controller: pageController,
                        physics: BouncingScrollPhysics(),
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/fruits.png',
                              height: height * 0.3,
                              width: height * 0.3,
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              'assets/images/fruits.png',
                              height: height * 0.3,
                              width: height * 0.3,
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              'assets/images/fruits.png',
                              height: height * 0.3,
                              width: height * 0.3,
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              'assets/images/fruits.png',
                              height: height * 0.3,
                              width: height * 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.05, vertical: height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkResponse(
                              onTap: () {
                                setState(
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                              ),
                            ),
                            CircleAvatar(
                              radius: height * 0.03,
                              backgroundColor: Colors.white,
                              child: Center(
                                child: FavoriteButton(
                                  iconSize: height * 0.05,
                                  valueChanged: (_isFavorite) {
                                    print('Is Favorite $_isFavorite)');
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: height * 0.04,
                        left: width * 0.0,
                        right: width * 0.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              child: GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      select = index;
                                    },
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundColor: select == index
                                      ? Colors.orange
                                      : Colors.orange.shade200,
                                  radius: height * 0.005,
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Veggie Stuffed Shells',
                        style: TextStyle(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Text(
                        'Creata a lighter, healthier version of stuffed\n'
                        'shells, the standard whole milk ricotta\n'
                        'cheese filling is replaced with frozen leaf\n'
                        'spinach and lowfat cottage cheese or part-\n'
                        'skim ricotta, which cuts down the fat\n'
                        'without sacrifing creaminess',
                        style: TextStyle(
                          height: height * 0.0022,
                          color: Colors.grey,
                          fontSize: height * 0.022,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$12',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.04,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListPage(),
                          ),
                        );
                      },
                    );
                  },
                  height: height * 0.067,
                  minWidth: height * 0.27,
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(height * 0.1),
                  ),
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.025),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
