import 'package:flutter/material.dart';

class AppBarCommon extends StatefulWidget {
  const AppBarCommon({Key? key}) : super(key: key);

  @override
  State<AppBar> createState() => _AppBarState();

}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Trash Coin",
      ),
      centerTitle: true,
      backgroundColor: Colors.lightGreen,
    );
  }

  Widget AppBarCommon(){
    return AppBar(
      title: Text(
        "Trash Coin",
      ),
      centerTitle: true,
      backgroundColor: Colors.lightGreen,
    );
  }
}
