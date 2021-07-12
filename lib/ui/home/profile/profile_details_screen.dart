import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../tool_bar_widget.dart';

class ProfileDetailsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              ToolBar(
                name: 'Profile',
              ),
              Container(
                margin: EdgeInsets.only(top:127.h),

              )
            ]
        )
    );
  }
}