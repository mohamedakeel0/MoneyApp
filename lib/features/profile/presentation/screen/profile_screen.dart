import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
import 'package:moneyapp/features/Reporting/presentation/widgets/image_border_circle.dart';
import 'package:moneyapp/features/profile/presentation/bloc/profile_cubic.dart';
import 'package:moneyapp/features/profile/presentation/bloc/profile_state.dart';
import 'package:moneyapp/shared/default_app_bar.dart';
import 'package:moneyapp/shared/default_button.dart';
import 'package:moneyapp/shared/default_form_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubic cubic;

  @override
  void initState() {
    cubic = ProfileCubic.get(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubic.informationUser();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorPrimary,
        appBar: defaultAppBar(context,AppStrings.profileMor,color:AppColors.colorPrimary,colorText: AppColors.white ),
        body: BlocConsumer<ProfileCubic, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubic = ProfileCubic.get(context);
            return Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      imageBorderCircle(
                          context,
                          MediaQuery.of(context).size.height /
                              AppResponsiveHeigh.h140,
                          MediaQuery.of(context).size.width /
                              AppResponsiveWidth.w140,
                          isimage: true,
                          image: ImageAssets.person),
                      imageBorderCircle(
                          context,
                          MediaQuery.of(context).size.height /
                              AppResponsiveHeigh.h30,
                          MediaQuery.of(context).size.width /
                              AppResponsiveWidth.w30,
                          isborder: false,
                          color: AppColors.colorPrimary,
                          isimage: false,
                          icon: Icons.camera_alt_outlined),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height /
                        AppResponsiveHeigh.h30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 260,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppSize.s30),
                            topLeft: Radius.circular(AppSize.s30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppSize.s25, horizontal: AppSize.s30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppStrings.userName,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: AppSize.s14,
                              color: AppColors.colorPrimaryDark,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h40,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppSize.s10),
                            ),
                            child: defaultFormField(
                              context: context,
                              onTap: () {},
                              prefix: null,
                              prefixIsImage: false,
                              textStyle: Theme.of(context).textTheme.titleLarge,
                              iconSize: MediaQuery.of(context).size.height /
                                  AppResponsiveHeigh.h10,
                              isEnabled: true,
                              hintText: AppStrings.enterYourUserName,
                              isError: true,
                              isFocusBorder: true,
                              controller: cubic.userNameController,
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {}
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h10,
                          ),
                          const Text(
                            AppStrings.email,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: AppSize.s14,
                              color: AppColors.colorPrimaryDark,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h40,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppSize.s10),
                            ),
                            child: defaultFormField(
                              context: context,
                              onTap: () {},
                              prefix: null,
                              prefixIsImage: false,
                              textStyle: Theme.of(context).textTheme.titleLarge,
                              iconSize: MediaQuery.of(context).size.height /
                                  AppResponsiveHeigh.h10,
                              isEnabled: true,
                              hintText: AppStrings.enterYourEmail,
                              isError: true,
                              isFocusBorder: true,
                              controller: cubic.emailController,
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {}
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h10,
                          ),
                          const Text(
                            AppStrings.phone,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: AppSize.s14,
                              color: AppColors.colorPrimaryDark,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h40,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppSize.s10),
                            ),
                            child: defaultFormField(
                              context: context,
                              onTap: () {},
                              prefix: null,
                              prefixIsImage: false,
                              textStyle: Theme.of(context).textTheme.titleLarge,
                              iconSize: MediaQuery.of(context).size.height /
                                  AppResponsiveHeigh.h10,
                              isEnabled: true,
                              hintText: AppStrings.enterYourPhone,
                              isError: true,
                              isFocusBorder: true,
                              controller: cubic.phoneController,
                              type: TextInputType.phone,
                              validate: (value) {
                                if (value!.isEmpty) {}
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h30,
                          ),
                          Center(
                            child: defaultButton(
                                height: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h40,
                                radius: AppConstance.ten,
                                textStyle: const TextStyle(
                                  fontSize: FontSize.s18,
                                  fontFamily: 'DancingScript',
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                shape: false,
                                width:
                                (MediaQuery.of(context).size.width - 25) / 2,
                                background: AppColors.orangeLight,
                                context: context,
                                function: () {
                                  Navigator.pushNamed(context, Routes.changePasswordRoute,arguments: true);
                                },
                                text: AppStrings.changePassword,
                                isUpperCase: false),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height /
                                AppResponsiveHeigh.h20,
                          ),
                          Center(
                            child: defaultButton(
                                height: MediaQuery.of(context).size.height /
                                    AppResponsiveHeigh.h40,
                                radius: AppConstance.ten,
                                textStyle: const TextStyle(
                                  fontSize: FontSize.s18,
                                  fontFamily: 'DancingScript',
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                shape: false,
                                width:
                                    (MediaQuery.of(context).size.width - 25) / 2,
                                background: AppColors.colorPrimary,
                                context: context,
                                function: () {},
                                text: AppStrings.save,
                                isUpperCase: false),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            );
          },
        ));
  }
}
