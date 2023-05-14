import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Wallet"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    tileMode: TileMode.repeated,
                    colors: [
                      Colors.black,
                      Colors.black54,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      FontAwesomeIcons.wallet,
                      size: 70,
                      color: Colors.white,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Your Balance",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Text("2500000 S.P",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    color: Colors.black,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {},
                    child: Text(
                      "Add Money",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    color: Colors.black,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {},
                    child: Text(
                      "WithDraw",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              alignment: Alignment.centerLeft,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Last Payments",
                        textAlign: TextAlign.justify,
                      ),
                      Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "Payment Status : Balance Added",
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: Text(
                              "+50000 S.P",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "Payment Status : Balance Added",
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: Text(
                              "+50000 S.P",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "Payment Status : Balance Added",
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: Text(
                              "+50000 S.P",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "Payment Status : Balance Added",
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: Text(
                              "+50000 S.P",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "Payment Status : Balance Added",
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: Text(
                              "+50000 S.P",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
