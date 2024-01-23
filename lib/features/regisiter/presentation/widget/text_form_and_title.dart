import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/shared/default_form_field.dart';

Widget buildTextFormAndTitle(context,{String? fristText,TextEditingController?textEditingControllerFrist,})=>   Column(crossAxisAlignment:
CrossAxisAlignment.start ,children: [
  Text(
    fristText!,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: AppSize.s16,
      color: AppColors.colorPrimaryDark,
    ),
  ),
  Container(width: MediaQuery.of(context).size.width /
      AppResponsiveWidth.w150,
    height:
    MediaQuery.of(context)
        .size
        .height /
        AppResponsiveHeigh.h40
    ,clipBehavior: Clip.antiAliasWithSaveLayer,decoration: BoxDecoration(color:AppColors.white, borderRadius: BorderRadius.circular(AppSize.s10), ),
    child: defaultFormField(
      context: context,
      onTap: () {},
      prefix: null,
      prefixIsImage: false,
      textStyle: Theme.of(context)
          .textTheme
          .titleLarge,
      iconSize: MediaQuery.of(context)
          .size
          .height /
          AppResponsiveHeigh.h10,
      isEnabled: true,hintText: 'Enter your ${fristText}',
      isError: true,
      isFocusBorder: true,
      controller: textEditingControllerFrist!,
      type: TextInputType.emailAddress,
      validate: (value) {
        if (value!.isEmpty) {

        }
        return null;
      },
    ),
  ),
],);