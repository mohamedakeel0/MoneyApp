

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

Widget defaultFormField({
  TextEditingController? controller,
  TextInputType? type,
  EdgeInsetsGeometry? contentPadding,
  TextStyle? textStyle,
  int? max = 1,
  int? min = 1,
  TextStyle errorStyle =
      const TextStyle(fontSize: FontSize.s14, color: AppColors.red),
  TextStyle? labelStyle,
  bool isEnabled = false,
  bool isFocusBorder = false,
  bool isError = false,
  InputBorder? enabledBorder,
  bool isPassword = false,
  bool readOnly = false,
  Widget? beforeText,
  ValueChanged? change,
  ValueChanged? onSaved,
  VoidCallback? suffixPressed,
  required FormFieldValidator validate,
  String? label,
  double? iconSize,
  InputBorder? errorBorder,
  var prefix,
  bool prefixIsImage = true,
  bool? suffixIsImage = false,
  bool? isLine = true,
  String? hintText,
  OutlineInputBorder? myfocusborder,
  ValueChanged? onSubmit,
  GestureTapCallback? onTap,
  var suffix,
  bool isClickable = true,
  TextAlign textAlign = TextAlign.start,
  BuildContext? context,
}) =>
    TextFormField(    inputFormatters: [
      FilteringTextInputFormatter.deny(
          RegExp(r'\s')),
    ],
      readOnly: readOnly,
      textAlign: textAlign,
      maxLines: max,
      minLines: min,
      controller: controller,
      style: textStyle,
      onTap: onTap,
      keyboardType: type,
      obscureText: isPassword,
      obscuringCharacter: '●',
      validator: validate,
      enabled: isClickable,
      onChanged: change,
      onSaved: onSaved,
      onFieldSubmitted: onSubmit,

      decoration: InputDecoration(
        icon: beforeText,prefixStyle: const TextStyle(
          fontSize: FontSize.s15,
          color: AppColors.black,

          fontWeight: FontWeight.w400,
          fontFamily: 'DancingScript'),suffixStyle: const TextStyle(
          fontSize: FontSize.s15,
          color: AppColors.black,

          fontWeight: FontWeight.w400,
          fontFamily: 'DancingScript'),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: FontSize.s15,
            color: AppColors.grayMedium2,

            fontWeight: FontWeight.w300,
            fontFamily: 'DancingScript'),
        enabledBorder: isEnabled
            ? enabledBorder
            : isEnabled
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s35),
                    borderSide: BorderSide(
                        color: AppColors.grayMedium, width: AppSize.s1_5))
                : OutlineInputBorder(borderSide: BorderSide.none),
        labelText: label,
        labelStyle: labelStyle,
        focusedBorder: isFocusBorder
            ? myfocusborder
            : isFocusBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s35),
                    borderSide:
                        BorderSide(width: 5, color: AppColors.grayMedium),
                  )
                : OutlineInputBorder(borderSide: BorderSide.none,),
        contentPadding: contentPadding,
        errorStyle: errorStyle,
        errorBorder: isError
            ? errorBorder
            : isError
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s35),
                  )
                : OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: prefix != null
            ? prefixIsImage == false
                ? Icon(
                    prefix,
                    color: AppColors.gray2.withOpacity(0.6),
                    size: 30,
                  )
                : Padding(
                    padding: EdgeInsets.all(iconSize!),
                    child: Image(
                      image: AssetImage(
                        prefix!,
                      ),
                      height: 5,
                      width: 5,
                    ),
                  )
            : null,
        suffixIcon: suffix != null
            ? InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: suffixPressed,
                child: suffixIsImage == false
                    ? Icon(
                        suffix,
                      )
                    : SizedBox(width: MediaQuery.of(context!).size.width / AppResponsiveWidth.w20,
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   if( isLine==true)  Container(height: double.infinity,width:MediaQuery.of(context).size.width / AppResponsiveWidth.w2 ,
                        color: AppColors.grayMedium2,),
                        Padding(
                          padding:isLine==true? const EdgeInsets.all(10.0):EdgeInsets.all(13.0),
                          child: Image.asset(
                            suffix,
                            height: 20,
                            width: 20,
                          ),
                        ),

                      ],

                      ),
                    ),
              )
            : null,
        border: InputBorder.none,
      ),
    );
