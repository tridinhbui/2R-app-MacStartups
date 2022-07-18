import 'package:flutter/material.dart';

import '../../commons/app_colors.dart';
import '../../commons/app_text_styles.dart';
import 'menu_header_widget.dart';
import 'menu_item_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Profile"),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          buildProfileWidget(),
          buildMenusWidget(),
          SizedBox(height: 10),
          SizedBox(height: 10),
        ],
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

  Widget buildProfileWidget() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 60,
      child: Row(
        children: [
          // AppCircleAvatar(url: state.user?.avatarUrl ?? "", size: 60),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 30, backgroundImage: AssetImage('assets/images/Tri.jpeg')),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tri Bui",
                          style: AppTextStyle.blackS18W800,
                        ),
                        Text(
                          "View profile",
                          style: AppTextStyle.blackS14,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildMenusWidget() {
    return Column(
      children: [
        MenuHeaderWidget(title: "Lists"),
        MenuItemWidget(title: "Watchlist"),
        MenuItemWidget(title: "History"),
        MenuItemWidget(title: "Collection"),
        MenuItemWidget(title: "Personal Lists"),
        MenuItemWidget(title: "Reminders"),
        MenuItemWidget(title: "Hidden Items"),
        MenuHeaderWidget(title: "Settings"),
        MenuItemWidget(title: "Go Premium"),
        MenuItemWidget(title: "Settings"),
        MenuItemWidget(title: "Help & feedback"),
        MenuItemWidget(title: "About"),
      ],
    );
  }
}
