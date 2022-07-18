import 'package:flutter/material.dart';

import '../../commons/app_colors.dart';
import '../../commons/app_text_styles.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;

  MenuItemWidget({this.title='', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.bookmark_outline_rounded,
                    color: AppColors.main,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyle.blackS14,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
