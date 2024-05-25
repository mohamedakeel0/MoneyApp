import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/camera/data/model/Prediction.dart';
import 'package:moneyapp/features/camera/domain/use_cases/AddImageUseCase.dart';
import 'package:moneyapp/features/camera/presentation/bloc/add_image_state.dart';
import 'package:multiple_image_camera/camera_file.dart';
import 'package:multiple_image_camera/multiple_image_camera.dart';

class AddImageCubic extends Cubit<AddImageState> {
  AddImageCubic(this.addImageUseCase) : super(InitailImageState());
  final AddImageUseCase addImageUseCase;

  static AddImageCubic get(context) => BlocProvider.of(context);
  List<MediaModel> images = [];
  RequestState? loginState = RequestState.loaded;
  Prediction?prediction;
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
      print('66666');
      print(images[0].file.path);
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

      print(date);
      resultPrediction(date);
      if (!isClosed) {
        loginState = RequestState.loaded;
        emit(SuccessAddImageState());
      }
    });
  }
  Future<void>resultPrediction(String image) async {
    if (!isClosed) {
      loginState = RequestState.loading;
      emit(LoadingAddImageState());
    }
    final resultLogin = await addImageUseCase.resultPrediction(image).catchError((error) {
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
      print('resultPrediction');
      print(date.prediction);
      prediction=date;
      if (!isClosed) {
        loginState = RequestState.loaded;
        emit(SuccessAddImageState());
      }
    });
  }
}
