

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

import 'package:moneyapp/features/add_report/presentation/bloc/add_report_state.dart';
import 'package:moneyapp/features/login/presentation/bloc/login_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddReportingCubic extends Cubit<AddReportingState> {
  AddReportingCubic() : super(InitailReportingState());

  static AddReportingCubic get(context) => BlocProvider.of(context);
  TextEditingController reportingController = TextEditingController();
  final picker = ImagePicker();
  XFile? pickedFile;
  File? postImage;
  String profileImageUrl = '';
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
}
