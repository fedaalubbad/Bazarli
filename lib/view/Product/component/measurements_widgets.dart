import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
class MeasurementsWidgets extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MeasurementsWidgetsState();
  }
}

class MeasurementsWidgetsState extends State<MeasurementsWidgets>{
  List<bool> isSelected;
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('ItemMeasurements',style: ProductTitleStyle,).tr(),
          SizedBox(height: 10.h,),
          buildMeasurementButton(context),
          // buildMeasurementTable( context)
          table2()

        ],
      );

  }
buildMeasurementButton(BuildContext context){
    return  Container(
      // margin: EdgeInsets.symmetric(horizontal: 20.w),
      alignment: Alignment.center,
      height: 50.h,
      width: ScreenUtil.defaultSize.width,
      decoration: BoxDecoration(
          color: PrimaryColor,
          borderRadius:
          BorderRadius.circular(ScreenUtil().radius(5))),
      child: ToggleButtons(
        children: [
          togglebtun(0,'CM'),

          togglebtun(1, 'INCH')

        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
          });
        },
        isSelected: isSelected,
      ),


    );
}

  togglebtun(int index,String text){
    return  isSelected[index] ?
    Container(
      margin:context.locale.toString()=='ar'? EdgeInsets.only(left:4):EdgeInsets.only(right: 4),
      height: 40.h,
      width: 0.4.sw,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color:HomeBackgroundColor,
          borderRadius:
          BorderRadius.circular(ScreenUtil().radius(5))),
      child: Text(
        text, style: TabsTextStyle,).tr(),
    )
   : Container(
      alignment: Alignment.center,
      width: 0.4.sw,
      child: Text(text,style: WhiteButtonStyle,).tr(),
    );
  }


table2(){
    return Table(
      columnWidths: {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(3),
        3: FlexColumnWidth(3),
      },
      border: TableBorder.all(color: BorderColor),
      children: [
        TableRow(
        children: [
          fieldWidget('Size'),
          fieldWidget('Waist(cm)'),
          fieldWidget('Hip(cm)'),
          fieldWidget('Length(cm)'),

        ]),

        TableRow( children: [
          fieldWidget('M'),
          fieldWidget('1'),
          fieldWidget('1'),
          fieldWidget('1'),
        ]),

        TableRow( children: [
          fieldWidget('L'),
          fieldWidget('2.5'),
          fieldWidget('2.5'),
          fieldWidget('2.5'),
        ]),

        TableRow( children: [
          fieldWidget('XL'),
          fieldWidget('3'),
          fieldWidget('3'),
          fieldWidget('3'),
        ]),

        TableRow( children: [
          fieldWidget('2XL'),
          fieldWidget('2.5'),
          fieldWidget('2.5'),
          fieldWidget('2.5'),
        ]),
        TableRow( children: [
          fieldWidget('3XL'),
          fieldWidget('2.5'),
          fieldWidget('2.5'),
          fieldWidget('2.5'),
        ]),
        TableRow( children: [
          fieldWidget('4XL'),
          fieldWidget('2.5'),
          fieldWidget('2.5'),
          fieldWidget('2.5'),
        ]),
      ],
  );
}

fieldWidget(String text){
    return Container(
      color:white2Color,
      height: 50.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
        text,
        style:TableTextlStyle,
      ).tr()
  ]
  ),
    );
}




//////////////////////////////////////////////////
//   buildMeasurementTable(BuildContext context){
//     return DataTable(
//       showBottomBorder: true,
//       columnSpacing: 18.w,
//       dividerThickness: 2,
//       // decoration: BoxDecoration(
//       //   border:
//       // ),
//       columns: const <DataColumn>[
//         DataColumn(
//           label: Text(
//             'Size',
//             style: TextStyle(color:TextLabelColor,fontWeight: FontWeight.w400,fontSize: 16,fontStyle: FontStyle.normal),
//           ),
//         ),
//         DataColumn(
//           label: Text(
//             'Waist(cm)',
//             style: TextStyle(color:TextLabelColor,fontWeight: FontWeight.w400,fontSize: 16,fontStyle: FontStyle.normal),
//           ),
//         ),
//         DataColumn(
//           label: Text(
//             'Hip(cm)',
//             style: TextStyle(color:TextLabelColor,fontWeight: FontWeight.w400,fontSize: 16,fontStyle: FontStyle.normal),
//           ),
//         ),
//         DataColumn(
//           label: Text(
//             'Length(cm)',
//             style: TextStyle(color:TextLabelColor,fontWeight: FontWeight.w400,fontSize: 16,fontStyle: FontStyle.normal),
//           ),
//         ),
//       ],
//       rows: const <DataRow>[
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('M', style: TextStyle(color:TextLabelColor,fontWeight: FontWeight.w400,fontSize: 16,fontStyle: FontStyle.normal),
//             ),),
//             DataCell(Text('1')),
//             DataCell(Text('1')),
//             DataCell(Text('1 ')),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('L', style: TextStyle(color:TextLabelColor,fontWeight: FontWeight.w400,fontSize: 16,fontStyle: FontStyle.normal),
//             ),),
//             DataCell(Text('2.5')),
//             DataCell(Text('2.5')),
//             DataCell(Text('2.5')),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('XL', style: TextStyle(color:TextLabelColor,fontWeight: FontWeight.w400,fontSize: 16,fontStyle: FontStyle.normal),
//             ),),
//             DataCell(Text('3')),
//             DataCell(Text('3 ')),
//             DataCell(Text('3 ')),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('2XL', style: TextStyle(color:TextLabelColor,fontWeight: FontWeight.w400,fontSize: 16,fontStyle: FontStyle.normal),
//             ),),
//             DataCell(Text('4')),
//             DataCell(Text('4 ')),
//             DataCell(Text('4 ')),
//           ],
//         ),
//       ],
//     );
//   }
}