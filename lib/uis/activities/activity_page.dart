import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activities"),
        backgroundColor: Colors.green,
        centerTitle: false,
      ),
      backgroundColor: Colors.greenAccent,
      body: Container(
        decoration: _boxDecoBackground(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                height: 100,
                width: 500,
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Processing",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                            child: Text("0", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "You haven't had any order yet",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: Row(
                  children: [
                    Text(
                      "Finished",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 5,),
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                      child: Text("4", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 150,
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "07/20/2022 | 20:48",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.location_on),
                            SizedBox(
                              width: 10,
                            ),
                            Text("140 Nguyen Xien, Thanh Xuan, Hanoi"),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.person),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Nguyen Thi Anh")
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.money),
                            SizedBox(
                              width: 10,
                            ),
                            Text("3.7 \$")
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.factory),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Dong Da Trash Company")
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 150,
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "05/22/2022 | 10:41",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.location_on),
                            SizedBox(
                              width: 10,
                            ),
                            Text("140 Nguyen Xien, Thanh Xuan, Hanoi"),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.person),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Nguyen Van Binh")
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.money),
                            SizedBox(
                              width: 10,
                            ),
                            Text("7.6 \$")
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.factory),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Dong Da Trash Company")
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 150,
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "02/01/2022 | 21:37",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.location_on),
                            SizedBox(
                              width: 10,
                            ),
                            Text("140 Nguyen Xien, Thanh Xuan, Hanoi"),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.person),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Le Van Cuong")
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.money),
                            SizedBox(
                              width: 10,
                            ),
                            Text("2.5 \$")
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.factory),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Dong Da Trash Company")
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 150,
                  width: 350,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "08/07/2021 | 11:09",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.location_on),
                            SizedBox(
                              width: 10,
                            ),
                            Text("140 Nguyen Xien, Thanh Xuan, Hanoi"),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.person),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Hoang Minh Trung")
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.money),
                            SizedBox(
                              width: 10,
                            ),
                            Text("4.2 \$")
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.factory),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Dong Da Trash Company")
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoBackground() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromRGBO(95, 158, 160, 0.9),
        Color.fromRGBO(170, 255, 0, 0.8),
      ],
    ));
  }
}
