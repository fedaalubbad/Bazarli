import 'dart:math';
import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/ViewModel/get_attribute_filter_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/get_attribute_filter/get_attribute_filter.dart';
import 'package:bazarli/view/Product/component/getColors.dart';
import 'package:bazarli/view/home/tool_bar_widget.dart';
import 'package:bazarli/view/search/sizes_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'component/apply_btn_widget.dart';
class ColorsSearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return ColorsSearchScreenState();
  }

}
class ColorsSearchScreenState extends State<ColorsSearchScreen> {
  int _groupValue = -1;
@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(children: [
      ToolBar(
          name: 'Colors',
      ),
      Stack(
          children: [
            Container(
              height: ScreenUtil.defaultSize.height.h,
              padding: EdgeInsets.only(bottom: 60.h),
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 117.h),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                  Selector<AttributeFilterProvider, List<RadioModel>>(
                      builder: (context, response, widget) {
                        if (response == null) {
                          return Center(child: CircularProgressIndicator());
                        } else if (response.length == 0) {
                          return Container(height: 0,);
                        } else {
                          return   GridView.builder(
                              itemCount: response.length,
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:4,
                                mainAxisSpacing:10.h,
                                crossAxisSpacing: 10.w,
                                childAspectRatio:0.8.h,
                              ),
                              itemBuilder: (context, index) {
                                response.map((e) => e.isSelected=false).toList();
                                return
                                  InkWell(
                                    onTap: (){
                                  Provider.of<ProductProvider>(context,listen: false).selectcolor(response[index]);

                                },
                                child:buildColorWidget(response[index])
                                  );
                              }
                          );
                        }
                      }, selector: (context, provider) {
                    return provider.colorsList;
                  })

                    ]),
              ),
            ),
            ApplyButtonWidget(onPressed: (){
              Navigator.pop(context);
            },),
          ],
      ),
    ]),
        ));
  }

  buildColorWidget(RadioModel model){
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
          color: WhiteColor,
          border: Border.all(color:model==Provider.of<ProductProvider>(context).selectedColorResponse?PrimaryColor:WhiteColor)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 40.h,
              color:HexColor.fromHex(model.clorCode)),
          SizedBox(height: 10.h,),
          Text(model.attribute,style: TextLabelStyle,)
        ],
      ),
    );
  }
}
