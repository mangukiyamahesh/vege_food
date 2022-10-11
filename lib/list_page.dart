import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Map<String, dynamic>> list = [
    {
      'image': 'assets/images/vegetable.png',
      'color': Colors.orange.shade50,
      'name': 'Vegetable',
      'price': '\$12'
    },
    {
      'image': 'assets/images/soup1.png',
      'color': Colors.pink.shade50,
      'name': 'Soup',
      'price': '\$10'
    },
    {
      'image': 'assets/images/drink.png',
      'color': Colors.green.shade50,
      'name': 'Drinks',
      'price': '\$12'
    },
  ];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Column(
        children: [
          Container(
            height: height * 0.89,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(height * 0.04),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.035),
              child: Column(
                children: [
                  SafeArea(
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
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                          size: height * 0.04,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Shopping Cart',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: height * 0.032,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.022,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        '\$34',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: height * 0.032,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.58,
                    child: ListView.builder(
                      itemCount: 3,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.15,
                              width: height * 0.13,
                              margin: EdgeInsets.only(bottom: height * 0.03),
                              decoration: BoxDecoration(
                                color: list[index]['color'],
                                borderRadius:
                                    BorderRadius.circular(height * 0.03),
                              ),
                              child: Center(
                                child: Image.asset(
                                  list[index]['image'],
                                  height: height * 0.1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    list[index]['name'],
                                    style: TextStyle(
                                        fontSize: height * 0.023,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    list[index]['price'],
                                    style: TextStyle(
                                        fontSize: height * 0.025,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            AddRemove(),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    width: height * 0.4,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height * 0.01),
                      border: RDottedLineBorder.all(
                          width: width * 0.0015, color: Colors.grey),
                    ),
                    child: Center(
                      child: Text(
                        'APPLY COUPON',
                        style: TextStyle(
                            fontSize: height * 0.022,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: height * 0.02),
                      ),
                      SizedBox(
                        width: height * 0.03,
                      ),
                      Text(
                        '\$34',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: height * 0.027),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Tax',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: height * 0.02),
                      ),
                      SizedBox(
                        width: height * 0.03,
                      ),
                      Text(
                        '\$00',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: height * 0.027),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.028,
          ),
          MaterialButton(
            onPressed: () {},
            height: height * 0.067,
            minWidth: height * 0.3,
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height * 0.1),
            ),
            child: Text(
              'Continue',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: height * 0.025),
            ),
          ),
        ],
      ),
    );
  }
}

class AddRemove extends StatefulWidget {
  const AddRemove({Key? key}) : super(key: key);

  @override
  State<AddRemove> createState() => _AddRemoveState();
}

class _AddRemoveState extends State<AddRemove> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (counter > 0) {
              setState(
                () {
                  counter--;
                },
              );
            }
          },
          child: Container(
            height: height * 0.035,
            width: height * 0.045,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(height * 0.02),
            ),
            child: Icon(
              Icons.remove,
              size: height * 0.03,
            ),
          ),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Text(
          '$counter',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: height * 0.025,
          ),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        GestureDetector(
          onTap: () {
            setState(
              () {
                counter++;
              },
            );
          },
          child: Container(
            height: height * 0.035,
            width: height * 0.045,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(height * 0.02),
            ),
            child: Icon(
              Icons.add,
              size: height * 0.03,
            ),
          ),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Icon(
          Icons.delete,
          color: Colors.grey.shade500,
        )
      ],
    );
  }
}
