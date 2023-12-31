import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartScreen(),
      theme: ThemeData(
        primaryColor: Colors.white38,
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class Item {
  int productPrice;
  int counter = 0;

  Item(this.productPrice, this.counter);
}

class _CartScreenState extends State<CartScreen> {
  List<Item> items = [
    Item(51, 1),
    Item(30, 1),
    Item(43, 1),
  ];

  int totalAmount = 0;

  _CartScreenState() {
    updateTotalAmount();
  }

  void updateTotalAmount() {
    totalAmount = 0;
    for (Item item in items) {
      totalAmount += item.productPrice * item.counter;
    }
  }

  void checkout() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations!'),
      ),
    );
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
            // Adjust the padding as needed
            child: Icon(
              size: 30.0,
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Wrap(
              children: [
                Text(
                  'My Bag',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontFamily: 'Sans-Serif',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0.0,
                  top: 0.0,
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn.fashionbizapps.nz/honeybee/products/management/data/talent/WP916M_Talent_FrenchBlue_00.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150.0,
                  top: 0.0,
                  right: 0.0,
                  child: Card(
                    elevation: 8.0,
                    child: Container(
                      height: 130,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pullover',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Color: ',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Black',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Size: ',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'L',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 18.0,
                    top: 10.0,
                    child: Icon(Icons.more_vert, color: Colors.black45)),
                Positioned(
                  left: 70.0,
                  top: 73.0,
                  right: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (items[0].counter > 1) {
                              items[0].counter--;
                            }
                            updateTotalAmount();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.white,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(12),
                        ),
                        child: Icon(Icons.remove,
                            size: 23, color: Colors.black54), //
                      ),
                      SizedBox(width: 5),
                      Text(
                        items[0].counter.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            items[0].counter++;
                            updateTotalAmount();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.white,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(12),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 23,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20.0,
                  top: 88.0,
                  child: Text(
                    "${items[0].productPrice.toString()}\$",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0.0,
                  top: 0.0,
                  child: Card(
                    elevation: 8.0,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://contents.mediadecathlon.com/p2014174/495fbfd5eabbd253be4ab8323e098e5a/p2014174.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150.0,
                  top: 0.0,
                  right: 0.0,
                  child: Card(
                    elevation: 8.0,
                    child: Container(
                      height: 130,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'T-Shirt',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Color: ',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Gray',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Size: ',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'L',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 18.0,
                    top: 10.0,
                    child: Icon(Icons.more_vert, color: Colors.black45)),
                Positioned(
                  left: 70.0,
                  top: 73.0,
                  right: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (items[1].counter > 1) {
                              items[1].counter--;
                            }
                            updateTotalAmount();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.white,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(12),
                        ),
                        child: Icon(Icons.remove,
                            size: 23, color: Colors.black54), //
                      ),
                      SizedBox(width: 5),
                      Text(
                        items[1].counter.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            items[1].counter++;
                            updateTotalAmount();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.white,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(12),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 23,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20.0,
                  top: 88.0,
                  child: Text(
                    "${items[1].productPrice.toString()}\$",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0.0,
                  top: 0.0,
                  child: Card(
                    elevation: 8.0,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://img3.junaroad.com/uiproducts/19454545/pri_175_p-1677758647.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150.0,
                  top: 0.0,
                  right: 0.0,
                  child: Card(
                    elevation: 8.0,
                    child: Container(
                      height: 130,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sports Dress',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Color: ',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Black',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Size: ',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'M',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 18.0,
                    top: 10.0,
                    child: Icon(Icons.more_vert, color: Colors.black45)),
                Positioned(
                  left: 70.0,
                  top: 73.0,
                  right: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (items[2].counter > 1) {
                              items[2].counter--;
                            }
                            updateTotalAmount();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.white,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(12),
                        ),
                        child: Icon(Icons.remove,
                            size: 23, color: Colors.black54), //
                      ),
                      SizedBox(width: 5),
                      Text(
                        items[2].counter.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            items[2].counter++;
                            updateTotalAmount();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.white,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(12),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 23,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20.0,
                  top: 88.0,
                  child: Text(
                    "${items[2].productPrice.toString()}\$",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),

          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          'Total amount : ',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '\$$totalAmount',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis, // Handle overflow
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: 550,
                child: TextButton(
                  onPressed: checkout,
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(16.0),
                  ),
                  child: Text(
                    'CHECK OUT',
                    style: TextStyle(
                      fontFamily: 'Sans-Serif',
                      color: Colors.white,
                      fontSize: 20.0,

                    ),
                  ),

                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}