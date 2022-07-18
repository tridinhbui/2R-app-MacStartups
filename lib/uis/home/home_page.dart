import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trash_coin/uis/log_in/log_in_page.dart';
import 'package:trash_coin/utils/app_size.dart';

import '../order/order_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<_HomePageState> _refreshInicatorKey = GlobalKey<_HomePageState>();
  late AppSize appSize;
  TextEditingController searchTextEditingController = TextEditingController();
  StreamController<bool> buttonClearController = StreamController<bool>();
  String _textSearch = "";
  int _selectedIndex = 0;
  bool _isSigningOut = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    appSize = AppSize(context);
    return Scaffold(
      // bottomNavigationBar: _buildBottomNavigationBar(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          _logOutButton(),
        ],
      ),
      drawer: _drawer(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              return Future<void>.delayed(const Duration(seconds: 1));
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: appSize.height * 0.35,
                    width: double.infinity,
                    decoration: _boxDecoBackground(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _spaceCommon(10),
                        _greeting(),
                        _searchBar(),
                        _spaceCommon(10),
                        _askLocation(),
                      ],
                    ),
                  ),
                  _spaceCommon(30),
                  _orderExecute("Sell scrap now"),
                  _spaceCommon(20),
                  _sellScrapList(),
                  _spaceCommon(20),
                  _orderExecute("Refill now"),
                  _spaceCommon(20),
                  _refillList(),
                ],
              ),
            ),
          ),
          Visibility(
            child: _loadingWidget(),
            visible: _isSigningOut,
          ),
        ],
      ),
    );
  }

  Widget _sellScrapList() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: GridView.count(
          primary: true,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 2,
          mainAxisSpacing: 30,
          crossAxisCount: 3,
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: [
                GestureDetector(
                  onTap: _AlumInformationScreen,
                  child: Container(
                    child: Image.asset("assets/icons/metal.png"),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text("Alum"),
                Text("215.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: _CopperInformationScreen,
                  child: Container(
                    child: Image.asset(
                      "assets/icons/metal.png",
                      fit: BoxFit.contain,
                    ),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text("Copper"),
                Text("115.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: _IronInformationScreen,
                  child: CircleAvatar(
                    child: Image.asset(
                      "assets/icons/iron_icon.png",
                      height: 45,
                      width: 40,
                    ),
                    radius: 30,
                    backgroundColor: Colors.orange,
                  ),
                ),
                Text("Iron"),
                Text("215.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/alloys_icon.png",
                    height: 45,
                    width: 55,
                  ),
                  radius: 30,
                  backgroundColor: Colors.orange,
                ),
                Text("Alloys"),
                Text("51.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/bronze_icon.png",
                    height: 40,
                    width: 40,
                  ),
                  radius: 30,
                  backgroundColor: Colors.orange,
                ),
                Text("Lead"),
                Text("15.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/bronze_icon.png",
                    height: 45,
                    width: 45,
                  ),
                  radius: 30,
                  backgroundColor: Colors.orange,
                ),
                Text("Silver"),
                Text("215.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/bronze_icon.png",
                    height: 40,
                    width: 40,
                  ),
                  radius: 30,
                  backgroundColor: Colors.orange,
                ),
                Text("Bronze"),
                Text("15.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/metal.png",
                    height: 55,
                    width: 55,
                  ),
                  radius: 30,
                  backgroundColor: Colors.orange,
                ),
                Text("Steel"),
                Text("215.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/fe_icon.png",
                    height: 55,
                    width: 55,
                  ),
                  radius: 30,
                  backgroundColor: Colors.orange,
                ),
                Text("Zinc"),
                Text("215.000 VND/kg"),
              ],
            ),
          ],
        ));
  }

  Widget _refillList() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: GridView.count(
          primary: true,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 2,
          mainAxisSpacing: 30,
          crossAxisCount: 3,
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/drinking_water_icon.png",
                    height: 45,
                    width: 40,
                  ),
                  radius: 30,
                  backgroundColor: Colors.yellow,
                ),
                Text("Drinking water"),
                Text("15.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/hand_washing.png",
                    height: 42,
                    width: 42,
                  ),
                  radius: 30,
                  backgroundColor: Colors.yellow,
                ),
                Text("Handwashing"),
                Text("25.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/dish_washing_icon.png",
                    height: 35,
                    width: 35,
                  ),
                  radius: 30,
                  backgroundColor: Colors.yellow,
                ),
                Text("Dishwashing"),
                Text("215.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/glass_washing.png",
                    height: 40,
                    width: 40,
                  ),
                  radius: 30,
                  backgroundColor: Colors.yellow,
                ),
                Text("Glass washing"),
                Text("215.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/floor_washing_icon.png",
                    height: 41,
                    width: 41,
                  ),
                  radius: 30,
                  backgroundColor: Colors.yellow,
                ),
                Text("Floorwashing"),
                Text("215.000 VND/kg"),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    "assets/icons/sanitizer_icon.png",
                    height: 45,
                    width: 45,
                  ),
                  radius: 30,
                  backgroundColor: Colors.yellow,
                ),
                Text("Hand sanitizer"),
                Text("215.000 VND/kg"),
              ],
            ),
          ],
        ));
  }

  Widget _textStyle(String text, {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  Widget _spaceCommon(double num) {
    return SizedBox(
      height: num,
    );
  }

  Widget _orderExecute(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(flex: 7, child: _textStyle(text, fontSize: 23, fontWeight: FontWeight.bold)),
          Expanded(
              child: IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage())),
            icon: Icon(Icons.navigate_next),
          ))
        ],
      ),
    );
  }

  BoxDecoration _boxDecoBackground() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        Color.fromRGBO(95, 158, 160, 0.9),
        Color.fromRGBO(170, 255, 0, 0.8),
      ],
    ));
  }

  BoxDecoration _boxDecoBackground2() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        Color.fromRGBO(252, 245, 95, 0.8),
        Color.fromRGBO(255, 215, 0, 0.8),
      ],
    ));
  }

  Widget _askLocation() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        height: 100,
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
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
                _deployLocationField(),
              ],
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(left: 15),
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                      height: 25,
                      width: 230,
                      child: Text(
                        "1600 Grand Avenue, St Paul, MN ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                      height: 25,
                      width: 230,
                      child: Text(
                        "140 Nguyen Xien, Thanh Xuan ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                      height: 25,
                      width: 230,
                      child: Text(
                        "No 1 Hoang Minh Giam, Cau Giay ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                      height: 25,
                      width: 230,
                      child: Text(
                        "1600 Grand Avenue, St Paul, MN ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _deployLocationField() {
    return Container(
      margin: const EdgeInsets.only(),
      width: 200,
      height: 35,
      child: TextFormField(
        controller: userNameController,
        decoration: const InputDecoration(
          hintText: 'Enter your location',
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.only(top: 10),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Account Information'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage()));
            },
          ),
          ListTile(
            title: const Text('FAQ'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _greeting() {
    return Row(
      children: [
        CircleAvatar(radius: 35, backgroundImage: AssetImage('assets/images/Tri.jpeg')),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Tri,",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "How are you today?",
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ],
        )
      ],
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: appSize.height * 0.02),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        height: appSize.height * 0.05,
        width: appSize.width * 0.95,
        child: Row(
          children: [
            SizedBox(
              width: appSize.width * 0.03,
            ),
            const Icon(Icons.person_search),
            SizedBox(
              width: appSize.width * 0.03,
            ),
            Expanded(
              child: TextFormField(
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration.collapsed(
                  hintText: "search your order",
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                controller: searchTextEditingController,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    buttonClearController.add(true);
                    setState(() {
                      _textSearch = value;
                    });
                  } else {
                    buttonClearController.add(false);
                    setState(() {
                      _textSearch = "";
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _logOutButton() {
    return IconButton(
        onPressed: () async {
          setState(() {
            _isSigningOut = true;
          });
          Future.delayed(Duration(seconds: 10)).then((value) {
            setState(() {
              _isSigningOut = false;
            });
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LogInPage()));
          });
        },
        icon: Icon(Icons.logout));
  }

  Widget _loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<void> _AlumInformationScreen() async {
    return showDialog<void>(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 150,
                decoration: _boxDecoBackground(),
                child: Text(
                  'Aluminum Price',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 150,
                decoration: _boxDecoBackground2(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ha Dong Scrap Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$ 3.47 ',
                      style: TextStyle(fontSize: 35, color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ba Dinh Scrap Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.47 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Dong Da Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.41 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Thanh Xuan Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.39 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Nguyen Khuyen Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.39 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Travi Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.37 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "VinGroup",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.35 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "SunGroup Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.33 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Minh Khai Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.32 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                     color: Colors.grey,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "Go back",
                        style: TextStyle(color: Colors.white),
                      ))),
              SizedBox(
                height: 45,
              )
            ]),
          ),
        );
      },
    );
  }

  Future<void> _CopperInformationScreen() async {
    return showDialog<void>(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 150,
                decoration: _boxDecoBackground(),
                child: Text(
                  'Aluminum Price',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 150,
                decoration: _boxDecoBackground2(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ha Dong Scrap Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$ 3.47 ',
                      style: TextStyle(fontSize: 35, color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ba Dinh Scrap Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.47 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Dong Da Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.41 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Thanh Xuan Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.39 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Nguyen Khuyen Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.39 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Travi Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.37 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "VinGroup",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.35 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "SunGroup Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.33 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Minh Khai Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.32 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "Go back",
                        style: TextStyle(color: Colors.white),
                      ))),
              SizedBox(
                height: 45,
              )
            ]),
          ),
        );
      },
    );
  }

  Future<void> _IronInformationScreen() async {
    return showDialog<void>(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 150,
                decoration: _boxDecoBackground(),
                child: Text(
                  'Aluminum Price',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 150,
                decoration: _boxDecoBackground2(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ha Dong Scrap Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$ 3.47 ',
                      style: TextStyle(fontSize: 35, color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ba Dinh Scrap Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.47 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Dong Da Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.41 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Thanh Xuan Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.39 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Nguyen Khuyen Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.39 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Travi Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.37 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "VinGroup",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.35 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "SunGroup Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.33 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Minh Khai Inc Trash Company",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '\$ 3.32 ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "Go back",
                        style: TextStyle(color: Colors.white),
                      ))),
              SizedBox(
                height: 45,
              )
            ]),
          ),
        );
      },
    );
  }
}
