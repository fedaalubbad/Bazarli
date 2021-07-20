import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextfieldWidget extends StatelessWidget{
  Function validator;
  Function save;
  bool isObscure;
  bool isPassword;
  TextInputType textInputType;
  Icon icon;
  String hint;
  String label;
   bool required;
   int linesNo;
  TextEditingController contraller;

  CustomTextfieldWidget({this.isPassword ,this.isObscure, this.label, this.save, this.validator,this.icon,this.hint,
        this.textInputType,this.contraller,this.required,this.linesNo});

  @override
  Widget build(BuildContext context) {
  return TextFormField(
    maxLines: linesNo,
    controller: contraller,
         decoration: InputDecoration(
      prefixIcon: isPassword?
          IconButton(
          icon: Icon(
          isObscure
          ? Icons.visibility
              : Icons.visibility_off,color:PrimaryColor,),
          onPressed: () {
          Provider.of<AuthenticationProvider>(context,
          listen: false)
              .switchObscure();
          }):null,

          // suffixIcon: validator!=null?Icon(Icons.error,color: Colors.red,):Icon(Icons.coronavirus,color: Colors.green,),
           isDense: true,
           contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          border: InputBorder.none,
          hintText: hint,
          labelText: label,

         hintStyle:SliderTitle2Style,
          labelStyle: TextLabelStyle,

           enabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(5),
             borderSide: BorderSide(color: GrayLiteColor),
               ),
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color:PrimaryColor,
              width: 1.0,
            ),
          ),
           fillColor: TextFormFieldColor,
           filled: true,

        ),
    autofocus: false,


    obscureText:
   isPassword? Provider.of<AuthenticationProvider>(context).isObscure:false,
        // keyboardType:textInputType,
        validator: validator,
        onSaved: save,

    );
  }

}

// return TextFormField(
// decoration: InputDecoration(
// labelText:label,
// hintText: hint,
// suffixIcon: isPassword?IconButton(
// icon: Icon(
// isObscure
// ? Icons.visibility
//     : Icons.visibility_off),
// onPressed: () {
// Provider.of<AuthenticationProvider>(context,
// listen: false)
//     .switchObscure();
// }):Container(),
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(color: GrayColor),
// ),
// // labelStyle: TextLabelStyle,
// // hintStyle: DescriptionStyle,
// focusedBorder: OutlineInputBorder(
// borderSide:
// BorderSide(color:PrimaryColor),
// ),
// ),
// obscureText:
// Provider.of<AuthenticationProvider>(context).isObscure,
// keyboardType: textInputType,
// validator: validator,
// onSaved: save,
// );