import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/ViewModel/get_attribute_filter_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/arrivals_response/arrivals_response.dart';
import 'package:bazarli/view/home/tool_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'component/apply_btn_widget.dart';

class NewArrivalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewArrivalScreenState();
  }

}

class NewArrivalScreenState extends State<NewArrivalScreen> {
  @override
  void initState() {
    Provider.of<AttributeFilterProvider>(context, listen: false).getArrivals(
        context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          ToolBar(
            name: 'NewArrivals',
          ),
          Stack(
            children: [
              Container(
                height: ScreenUtil.defaultSize.height,
                padding: EdgeInsets.only(bottom: 60.h),
                margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 117),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        Selector<AttributeFilterProvider,
                            List<ArrivalsResponse>>(
                            builder: (context, response, widget) {
                              if (response == null) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (response.length == 0) {
                                return Container(height: 0,);
                              } else {
                                return ListView.builder(
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: response.length,
                                    itemBuilder: (context, index) {
                                      ArrivalsResponse arrival = response[index];
                                      // return _myCheckButton(arrival, false);
                                      return buildRadio(context, arrival);
                                    });
                                //   _myCheckButton(title: 'FOSSIL', value: 0,)
                                // ,
                                // _myCheckButton(title: 'FOSSIL', value: 1,),
                                // _myCheckButton(title: 'FOSSIL', value: 2,),
                              }
                            }, selector: (context, provider) {
                          return provider.getArrivalsList;
                        }),
                      ]),
                ),
              ),
              ApplyButtonWidget(
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),            ],
          ),
        ]));
  }

  Widget _myCheckButton(ArrivalsResponse arrival, isChecked) {
    return CheckboxListTile(
      onChanged: (val) {
        !val;
        setState(() {

        });
      },
      value: isChecked,

      title: Text(
        arrival.arriveIn,
        style: DescriptionStyle,
      ),
    );
  }

  Widget buildRadio(BuildContext context, ArrivalsResponse arrival) {
    // return Selector<ProductProvider, int>(
    //     selector: (_, provider) => provider.brandId,
    // shouldRebuild: (previous, next) => previous == next,
    // builder: (context, number, child) {
    return Row(
      children: [
        SizedBox(
          width: 12,
        ),
        Radio(
            value: arrival,
            groupValue: Provider
                .of<ProductProvider>(context,)
                .selectedArrivals,
            activeColor: PrimaryColor,
            onChanged: (val) {
              Provider.of<ProductProvider>(context, listen: false)
                  .selectArrivals(val);
            }
          // myDialog();

        ),
        SizedBox(
          width: 12,
        ),
        Text(arrival.arriveIn),
      ],
    );
  }
}
