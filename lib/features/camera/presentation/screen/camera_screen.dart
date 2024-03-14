import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:multiple_image_camera/multiple_image_camera.dart';
class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MultipleImageCamera.capture(context: context,customDoneButton: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Container(width:  MediaQuery.of(context).size.width /
            AppResponsiveWidth.w40,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height /
                      AppResponsiveHeigh.h10),

            ),
            child: Icon(Icons.done_all_sharp,color: AppColors.white,)),
      )).then((value) {








      });
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: AppColors.white,leading: SizedBox(),),backgroundColor: AppColors.white,);
  }
}
