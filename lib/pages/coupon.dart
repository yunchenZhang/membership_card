import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CouponPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CouponPageState();
  }
}

class CouponPageState extends State with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Coupon",
            style: TextStyle(color: Theme
                .of(context)
                .primaryColor),
          ),
          backgroundColor: Colors.white),
      body: SafeArea(
        child: Flex(direction: Axis.vertical, children: <Widget>[
          Container(
            child: Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2.0,
                          blurRadius: 2.0,
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image(
                      image: AssetImage("assets/coupon/green.png"),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.245,
                  margin: EdgeInsets.symmetric(horizontal: 32.0),
                  alignment: Alignment(-1, -0.7),
                  child: Text(
                    "Dukes Coffee Roaster",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                        fontSize: 14.0),
                  ),
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.245,
                  margin: EdgeInsets.symmetric(horizontal: 32.0),
                  alignment: Alignment(-1, -0.4),
                  child: Text(
                    "Add: 123 Collins Street, 3000\n"
                        "Tel: 03 9847 8372",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
                  ),
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.245,
                  margin: EdgeInsets.symmetric(horizontal: 32.0),
                  alignment: Alignment(-1, 0.3),
                  child: Text(
                    "Free Coffee Size Upgrade\n"
                        "Enjoy the extra",
                    style: TextStyle(
                        color: Color.fromARGB(255, 59, 157, 9),
                        fontSize: 14.0),
                  ),
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.245,
                  margin: EdgeInsets.symmetric(horizontal: 32.0),
                  alignment: Alignment(1, 0.8),
                  child: Text(
                    "Offer expires 31/12/2019",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
                  ),
                ),
                Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.245,
                    alignment: Alignment(0.6, 0),
                    child: Image(
                      image: AssetImage("assets/coupon/coffee.png"),
                    ))
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.16,
                    image: AssetImage("assets/coupon/staffFig.png"),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      "Show this to staff in the shop, "
                          "who can tap on the button below"
                          "and redeem this coupon for you",
                      style: TextStyle(
                          fontSize: 16.0
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: MaterialButton(

                minWidth: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
                onPressed: () {
                  showDialog(context: context, builder: (_) =>
                      AlertDialog(
                        title: Text("Use this Coupon?"),
                        content: Text(
                            "Do you want to redeem this coupon and make "
                                "it as used?"),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel", style: TextStyle(color: Theme
                                .of(context)
                                .primaryColor),),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).popUntil(ModalRoute.withName("/cardinfo"));
                            },
                            child: Text(
                                "Redeem Now", style: TextStyle(color: Theme
                                .of(context)
                                .primaryColor)),
                          )
                        ],
                      ));
                },
                child: Text(
                  "Redeem",
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            ),
          )
        ]),
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: <Widget>[
          Hero(
            tag: 'tab one',
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.066,
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage("assets/backgrounds/tabCard.png"),
              ),
            ),
          ),
          Hero(
            tag: 'tab two',
            child: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.topCenter,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.066,
              child: Image(
                image: AssetImage("assets/backgrounds/tabUser.png"),
              ),
            ),
          )
        ],
      ),
    );
  }
}