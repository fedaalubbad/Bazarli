import 'package:bazarli/view/home/Home/component/home_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompareScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CompareScreenState();
  }
}
class CompareScreenState extends State<CompareScreen> {

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
