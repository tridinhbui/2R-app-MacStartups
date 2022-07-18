import 'package:flutter/material.dart';
import 'package:trash_coin/uis/home/home_page.dart';

class PairingSuccessPage extends StatefulWidget {
  const PairingSuccessPage({Key? key}) : super(key: key);

  @override
  State<PairingSuccessPage> createState() => _PairingSuccessPageState();
}

class _PairingSuccessPageState extends State<PairingSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    ),
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "Pairing successfully done!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "The scrap collector is on the way...",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.done,
                    size: 50,
                    color: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: Container(
                      child: Row(
                        children: [
                          CircleAvatar(radius: 35, backgroundImage: AssetImage('assets/images/scrap_ava.jpeg')),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Nguyen Van Binh",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      "Distance",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Text(
                      "Estimated",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ]),
                  Expanded(child: SizedBox()),
                  Text(
                    "16 KM",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      "Waiting time",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Text(
                      "Estimated",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ]),
                  Expanded(child: SizedBox()),
                  Text(
                    "16 minutes",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      "Possible income",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Text(
                      "including VAT",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ]),
                  Expanded(child: SizedBox()),
                  Text(
                    "3.7\$",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: Divider(
                color: Colors.black,
                endIndent: 10,
                indent: 10,
              )),
              Row(
                children: [
                  Text(
                    "Refill option",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "Drinking water",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())),
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
