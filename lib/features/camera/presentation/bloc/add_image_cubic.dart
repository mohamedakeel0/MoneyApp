import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/services/app_navigator.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/camera/data/model/Prediction.dart';
import 'package:moneyapp/features/camera/domain/use_cases/AddImageUseCase.dart';
import 'package:moneyapp/features/camera/presentation/bloc/add_image_state.dart';
import 'package:moneyapp/shared/custom_dialog_error_.dart';
import 'package:multiple_image_camera/camera_file.dart';
import 'package:multiple_image_camera/multiple_image_camera.dart';

class AddImageCubic extends Cubit<AddImageState> {
  AddImageCubic(this.addImageUseCase) : super(InitailImageState());
  final AddImageUseCase addImageUseCase;

  static AddImageCubic get(context) => BlocProvider.of(context);
  List<MediaModel> images = [];
  RequestState? loginState = RequestState.loaded;
  Prediction? prediction;

  void captureImage(context) {
    if (!isClosed) {
      emit(LoadingCaptureImageClientState());
    }
    MultipleImageCamera.capture(
        context: context,
        customDoneButton: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Container(
              width: MediaQuery.of(context).size.width / AppResponsiveWidth.w40,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height /
                        AppResponsiveHeigh.h10),
              ),
              child: Icon(
                Icons.done_all_sharp,
                color: AppColors.white,
              )),
        )).then((value) {
      images = value;
      uploadAddImage(images[0].file);
      if (!isClosed) {
        emit(SuccessCaptureImageClientState());
      }
    });
  }

  Future<void> uploadAddImage(File image) async {
    if (!isClosed) {
      loginState = RequestState.loading;
      emit(LoadingAddImageState());
    }
    final resultLogin = await addImageUseCase(image).catchError((error) {
      if (!isClosed) {
        loginState = RequestState.error;
        emit(ErrorAddImageState());
      }
    });
    resultLogin.fold((l) {
      if (!isClosed) {
        loginState = RequestState.error;
        emit(ErrorAddImageState());
      }
    }, (date) async {
      resultPrediction(date);
      if (!isClosed) {
        loginState = RequestState.loaded;
        emit(SuccessAddImageState());
      }
    });
  }

  Future<void> resultPrediction(String image) async {
    if (!isClosed) {
      loginState = RequestState.loading;
      emit(LoadingAddImageState());
    }
    final resultLogin =
        await addImageUseCase.resultPrediction(image).catchError((error) {
      if (!isClosed) {
        loginState = RequestState.error;
        emit(ErrorAddImageState());
      }
    });
    resultLogin.fold((l) {
      if (!isClosed) {
        loginState = RequestState.error;
        emit(ErrorAddImageState());
      }
    }, (date) async {
      prediction = date;
      if (date.prediction == 'Fake Money') {
        dialogErrorLogin(Go.navigatorKey.currentState!.context,
            errorText: date.prediction!);
      } else {
        dialogErrorLogin(Go.navigatorKey.currentState!.context,
            errorText: date.prediction!, colorText: AppColors.colorPrimary);
      }
      if (!isClosed) {
        loginState = RequestState.loaded;
        emit(SuccessAddImageState());
      }
    });
  }
}
