import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trash_coin/uis/main/main_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/authentication.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String? _selectedLocation;
  int index_1 = 0;
  String? selected = null;
  bool _isSigningIn = false;
  List<Map<String, String>> language = [
    {
      "lang": "en",
      "image": "assets/icons/flag_usa.webp ",
    },
    {
      "lang": "vie",
      "image": "assets/icons/flag_vn.png ",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        decoration: _boxDecoBackground(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(
                height: 35,
              ),
              _welcomeLine(),
              const SizedBox(
                height: 100,
              ),
              _tabBar(),
              DropdownButton<String>(
                hint: Text('Please choose a location'), // Not necessary for Option 1
                value: _selectedLocation,
                onChanged: (newValue) {
                  // setState(() {
                  //   _selectedLocation = newValue;
                  // });
                },
                items: _locations.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 60,
              ),
              _userNameField(),
              const SizedBox(
                height: 30,
              ),
              _passwordField(),
              _forgotPassword(),
              _logInButton(),
              const SizedBox(
                height: 30,
              ),
              _signUp(),
              FutureBuilder(
                future: Authentication.initializeFirebase(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _GoogleSignInButton();
                  }
                  return const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.orange,
                    ),
                  );
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _signUp() {
    return Row(children: const <Widget>[
      Expanded(
          child: Divider(
        color: Colors.black,
        endIndent: 10,
        indent: 60,
      )),
      Text("Log in with"),
      Expanded(
          child: Divider(
        color: Colors.black,
        endIndent: 40,
        indent: 10,
      )),
    ]);
  }

  Widget _GoogleSignInButton() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            _isSigningIn = true;
          });

          User? user = await Authentication.signInWithGoogle(context: context);

          setState(() {
            _isSigningIn = false;
          });

          if (user != null) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
          }
        },
        child: Container(
          height: 40,
          width: 40,
          child: Image.asset("assets/icons/google_icon.png", ),
        ),
      ),
    );
  }

  Widget _logInButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 330.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.deepPurple,
      ),
      child: const Center(
        child: Text(
          'Log In',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.white,
            height: 0,
          ),
        ),
      ),
    );
  }

  Widget _forgotPassword() {
    return Row(
      children: [
        const Expanded(
          child: SizedBox(),
          flex: 5,
        ),
        Expanded(
          flex: 4,
          child: GestureDetector(
            onTap: () async {
              final Uri toLaunch = Uri.parse('https://www.facebook.com/tribuidinh0901/');
              if (!await launchUrl(
                toLaunch,
                mode: LaunchMode.externalApplication,
              )) {
                throw 'Could not launch $toLaunch';
              }
            },
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _passwordField() {
    return Container(
      margin: const EdgeInsets.only(),
      width: 330,
      height: 50,
      child: TextFormField(
        controller: passwordController,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Enter your password',
        ),
      ),
    );
  }

  Widget _userNameField() {
    return Container(
      margin: const EdgeInsets.only(),
      width: 330,
      height: 50,
      child: TextFormField(
        controller: userNameController,
        decoration: const InputDecoration(
          hintText: 'Enter your username',
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }

  Widget _welcomeLine() {
    return Container(
      padding: const EdgeInsets.only(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Login Account",
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    Container(margin: const EdgeInsets.only(left: 10), height: 20, width: 20, child: Icon(Icons.person))
                  ],
                ),
                const Text("Hello, welcome to 2R!",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Container(
        margin: EdgeInsets.only(),
        height: 90,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
          color: Colors.white,
        ),
        child: DefaultTabController(
          length: 2,
          child: TabBar(
            onTap: (index) {
              setState(() {
                index_1 = index;
              });
            },
            unselectedLabelStyle: TextStyle(color: Colors.black),
            indicator: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(10),
            ),
            tabs: [
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: index_1 == 0 ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Phone Number",
                    style: TextStyle(
                      color: index_1 == 1 ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
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
}
