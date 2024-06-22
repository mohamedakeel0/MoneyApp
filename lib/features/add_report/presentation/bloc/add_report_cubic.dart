

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:moneyapp/core/error/exceptions.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/core/utils/enums.dart';
import 'package:moneyapp/features/add_report/domain/entities/add_report_entity.dart';
import 'package:moneyapp/features/add_report/domain/use_cases/add_report_use_case.dart';

import 'package:moneyapp/features/add_report/presentation/bloc/add_report_state.dart';
import 'package:moneyapp/features/login/domain/entities/loginEntity.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/shared/custom_dialog_error_.dart';
class AddReportingCubic extends Cubit<AddReportingState> {
  AddReportingCubic(this.addReportUseCase) : super(InitailReportingState());
final AddReportUseCase addReportUseCase;
  static AddReportingCubic get(context) => BlocProvider.of(context);
  TextEditingController reportingController = TextEditingController();
  final picker = ImagePicker();
  XFile? pickedFile;
  File? postImage;
  String profileImageUrl = '';
  AddReportEntity? addReportEntity;
  RequestState? addReportState = RequestState.loaded;
  LoginEntity? loginEntity;
  Future<void> addReport(BuildContext context,
      AddReportParameter addReportParameter) async {
    if (!isClosed) {
      addReportState = RequestState.loading;
      emit(LoadingAddReportState());
    }
    final resultLogin = await addReportUseCase(addReportParameter).catchError((error) {
      print('dsfa+++++++++++++++++++++');
      print(error);
      ServerException errorMessageModel = error;
      dialogErrorLogin(context,
          errorText: errorMessageModel.errorMessageModel.message!);
      print('dsfa+++++++++++++++++++++');
      if (!isClosed) {
        addReportState = RequestState.error;
        emit(ErrorAddReportState());
      }
    });
    resultLogin.fold((l) {
      dialogErrorLogin(context, errorText: l.message);
      if (!isClosed) {
        addReportState = RequestState.error;
        emit(ErrorAddReportState());
      }
    }, (date) async {
      addReportEntity = date;

      Navigator.pop(context);
      dialogErrorLogin(context, errorText: AppStrings.addReportSuccessfully);

      if (!isClosed) {
        addReportState = RequestState.loaded;
        emit(SuccesAddReportState());
      }
    });
  }
  Future<void> uploadImage() async {
    emit(LoadingUploadImageState());
    pickedFile = await picker.pickImage (
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      postImage = File(pickedFile!.path);
      print(postImage!.path);
      profileImageUrl=postImage!.path;
      emit(SuccesUploadImageState());

    } else {
      emit(ErrorUploadImageState());


    }

  }
  CameraPosition initialCameraPosition =
  const CameraPosition(target: LatLng(0.0, 0.0), zoom: 14);
  var lat = 0.0;
  var lon = 0.0;
  var address = '';
  late GoogleMapController googleMapController;

  Future<void> determinePosition(context) async {
    emit(InitailCheckPermissionState());
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      emit(ErrorCheckPermissionState());

      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        emit(ErrorCheckPermissionState());
        return Future.error("Location permission denied");
      }

      emit(ErrorCheckPermissionState());
    }

    if (permission == LocationPermission.deniedForever) {
      emit(ErrorCheckPermissionState());
      return Future.error('Location permissions are permanently denied');
    }
    getLocation();
    emit(SuccesCheckPermissionState());
  }
  void getLocation()async{
    Position position = await Geolocator.getCurrentPosition();
    log('Position Data ${position.latitude}');
    log('Position Data ${position.longitude}');
    lat = position.latitude;
    lon = position.longitude;

    initialCameraPosition = CameraPosition(target: LatLng(lat, lon), zoom: 14);

    List<Placemark> addresses = await placemarkFromCoordinates(lat, lon);
    var first = addresses.first;
    address =
    "${first.country} - ${first.administrativeArea} - ${first.name} - ${first.subAdministrativeArea}";
    if (!isClosed) {
      emit(SuccesGetPermissionState());
    }

  }
  void updateLocation(double mLat, double mLon) async {
    lat = mLat;
    lon = mLon;
    List<Placemark> addresses = await placemarkFromCoordinates(lat, lon);

    var first = addresses.first;
    initialCameraPosition = CameraPosition(target: LatLng(lat, lon), zoom: 14);

    address =
    "${first.country} - ${first.administrativeArea} - ${first.name} - ${first.subAdministrativeArea}";

    emit(UpdateLocationState());
  }
  void informationUser(BuildContext context){
    if (!isClosed) {
      emit(LoadingInformationUserState());
    }
    fetchDataUserLocal().then((value) {
      loginEntity=value;
print('object');
      addReport(context, AddReportParameter(name:loginEntity!.username!, location: address, image:postImage!));
print(loginEntity!.username);
    });
    if (!isClosed) {
      emit(SuccesInformationUserState());
    }
  }
}
