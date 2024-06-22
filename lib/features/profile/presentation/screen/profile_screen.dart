import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/assets_manager.dart';
import 'package:moneyapp/core/resources/routes_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/utils/app_constance.dart';
import 'package:moneyapp/core/utils/dumy.dart';
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
                          120.h,
                         120.w,
                          isimage: true,
                          image: ImageAssets.person),
                      imageBorderCircle(
                          context,
                         30.h,
                         30.w,
                          isborder: false,
                          color: AppColors.colorPrimary,
                          isimage: false,
                          icon: Icons.camera_alt_outlined),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 260,
                    decoration:  BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.sp),
                            topLeft: Radius.circular(30.sp))),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                          vertical: 25.h, horizontal:30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            AppStrings.userName,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp,
                              color: AppColors.colorPrimaryDark,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            height: 40.h,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: defaultFormField(
                              context: context,
                              onTap: () {},
                              prefix: null,
                              prefixIsImage: false,
                              textStyle: Theme.of(context).textTheme.titleLarge,
                              iconSize: 10.sp,
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
                            height: 10.h,
                          ),
                           Text(
                            AppStrings.email,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp,
                              color: AppColors.colorPrimaryDark,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            height: 40.h,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: defaultFormField(
                              context: context,
                              onTap: () {},
                              prefix: null,
                              prefixIsImage: false,
                              textStyle: Theme.of(context).textTheme.titleLarge,
                              iconSize: 10.sp,
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
                            height: 10.h,
                          ),
                           Text(
                            AppStrings.phone,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp,
                              color: AppColors.colorPrimaryDark,
                            ),
                          ),
                          SizedBox(
                            height:10.h,
                          ),
                          Container(
                            height: 40.h,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: defaultFormField(
                              context: context,
                              onTap: () {},
                              prefix: null,
                              prefixIsImage: false,
                              textStyle: Theme.of(context).textTheme.titleLarge,
                              iconSize: 10.sp,
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
                            height: 30.h,
                          ),
                          Center(
                            child: defaultButton(
                                height: 40.h,
                                radius: AppConstance.ten,
                                textStyle:  TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'DancingScript',
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                shape: false,
                                width:
                                180.w,
                                background: AppColors.orangeLight,
                                context: context,
                                function: () {
                                  Navigator.pushNamed(
                                      context, Routes.changePasswordRoute,
                                      arguments:
                                      ChangePasswordArugu(isProfile: true,
                                          email: cubic.emailController.text));
                                },
                                text: AppStrings.changePassword,
                                isUpperCase: false),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Center(
                            child: defaultButton(
                                height: 40.h,
                                radius: AppConstance.ten,
                                textStyle:  TextStyle(
                                  fontSize:18.sp,
                                  fontFamily: 'DancingScript',
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                shape: false,
                                width:
                                    180.w,
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
