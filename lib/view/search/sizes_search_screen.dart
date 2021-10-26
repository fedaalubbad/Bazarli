import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/ViewModel/get_attribute_filter_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/view/home/tool_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'component/apply_btn_widget.dart';
class SizesSearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
          return SizesSearchScreenState();
  }

}
class SizesSearchScreenState extends State<SizesSearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        ToolBar(
          name: 'Sizes',
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
                          return CircularProgressIndicator();
                          } else {
                        return GridView.builder(
                          itemCount: response.length,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 10.w,
                            childAspectRatio: 1.h,
                          ),
                          itemBuilder: (context, index) {
                           // return buildSizeWidget('oneSize',);
                            response.map((e) => e.isSelected=false).toList();

                            return
                              InkWell(
                                onTap: (){
                             Provider.of<ProductProvider>(context,listen: false).selectSize(response[index]);

                            },
                            child:
                            buildSizeWidget(response[index])
                            );
                          });
                      }
                      }, selector: (context, provider) {
                        return provider.sizesList;
                      }),
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

  buildSizeWidget(RadioModel _item) {
    return  Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
            color: _item==Provider.of<ProductProvider>(context).selectedSizeResponse?GrayColor:GrayLiteColor,
            border: Border.all(color: _item==Provider.of<ProductProvider>(context).selectedSizeResponse?PrimaryColor:GrayColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _item.attribute,
              style: TextLabelStyle,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
             _item.count.toString(),
              style: TextLabelStyle,
            ),
          ],
        ),
     );
  }
  //
//   radio(_item) {
//     return Container(
//         margin: new EdgeInsets.all(15.0),
//         child: new Row(
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             new Container(
//               height: 50.0,
//               width: 50.0,
//               child: new Center(
//                 child:
//                 new Text(_item,
//                     style: new
//                     TextStyle(
//                         color:
//                         // _item.isSelected ?
//                         Colors.white,
//                             // : Colors.black,
//                         //fontWeight: FontWeight.bold,
//                         fontSize: 18.0)),
//               ),
//               decoration: new BoxDecoration(
//                 color:
//                     // _item.isSelected ?
//                     Colors.blueAccent
//                         // : Colors.transparent
//                   ,
//                 border: new Border.all(
//                     width: 1.0,
//                     color:
//                     // _item.isSelected ?
//                     Colors.blueAccent
//                         // : Colors.grey
//                 ),
//                 borderRadius:
//                     const BorderRadius.all(const Radius.circular(2.0)),
//               ),
//             ),
//             // new Container(
//             //   margin: new EdgeInsets.only(left: 10.0),
//             //   child: new Text(_item),
//             // )
//           ],
//         ));
//   }
//
}
class RadioModel {
  int id;
  bool isSelected;
  String attribute;
  int count;
  String clorCode;

  RadioModel({this.id,this.isSelected, this.attribute,this.count,this.clorCode});
}