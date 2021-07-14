import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ui/home/Home/component/home_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SubCategoriesScreenState();
  }
}
class SubCategoriesScreenState extends State<SubCategoriesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeToolBar(),
          Container(
            margin: EdgeInsets.only(top: 120.h),
            child: SingleChildScrollView(
              child: Column(
                children: [


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
