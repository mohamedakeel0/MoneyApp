

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/features/exchange/presentation/bloc/exchange_state.dart';
import 'package:multiple_image_camera/camera_file.dart';
import 'package:multiple_image_camera/multiple_image_camera.dart';
class ExchangeCubic extends Cubit<ExchangeState> {
  ExchangeCubic() : super(InitailReportingState());

  static ExchangeCubic get(context) => BlocProvider.of(context);

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
   updateLocation(lat,lon);
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
  List<MediaModel> images = [];
  void captureImage(context){
    if (!isClosed) {
      emit(LoadingCaptureImageClientState());
    }
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



      images = value;


      if (!isClosed) {
        emit(SuccessCaptureImageClientState());
      }

    });

  }

}
