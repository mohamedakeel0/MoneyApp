
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';


import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/core/utils/dumy.dart';
import 'package:moneyapp/features/add_report/presentation/bloc/add_report_cubic.dart';
import 'package:moneyapp/features/add_report/presentation/bloc/add_report_state.dart';
import 'package:moneyapp/shared/default_button.dart';

class MapScreen extends StatefulWidget {
  late MapModel? mapModel;
  MapScreen({Key? key,this.mapModel}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // late GoogleMapController googleMapController;
  // CameraPosition? initialCameraPosition ;
  Set<Marker> markers = {};
  Position? position;

  LatLng? CurrentLatLng;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddReportingCubic>().getLocation();

      context.read<AddReportingCubic>(). updateLocation(widget.mapModel!.lat!,widget.mapModel!.lon!);

      context.read<AddReportingCubic>().getLocation();
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddReportingCubic, AddReportingState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubic = AddReportingCubic.get(context);

        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;


        print(cubic.lat);
        print(cubic.lon);
        return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0.0,
            ),
            body: Padding(
              padding:
              const EdgeInsets.only(top: 25.0, left: 8.0, right: 8.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: height / AppResponsiveHeigh.h660,
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          height / AppResponsiveHeigh.h15),
                    ),
                    color: AppColors.white,
                    elevation: 4,
                    child:  Column(
                      children: [
                        Container(
                          height: height / AppResponsiveHeigh.h520,
                          width: double.infinity,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(color: AppColors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    height / AppResponsiveHeigh.h15),
                                topRight: Radius.circular(
                                    height / AppResponsiveHeigh.h15)),
                          ),
                          child: GoogleMap(
                            onTap: (latLng) {
                              setState(() {
                                cubic.googleMapController!.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            target: LatLng(latLng.latitude,
                                                latLng.longitude),
                                            zoom: 14)));
                                markers.clear();
                                markers.add(Marker(
                                    markerId: MarkerId('currentLocation'),
                                    position: LatLng(
                                        latLng.latitude, latLng.longitude)));
                                CurrentLatLng = latLng;

                                cubic.updateLocation(
                                    latLng.latitude, latLng.longitude);
                              });
                            },
                            initialCameraPosition: cubic.initialCameraPosition!,
                            zoomControlsEnabled: true,
                            mapType: MapType.normal,
                            markers: markers,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            onMapCreated: (GoogleMapController controller) {
                              cubic.googleMapController = controller;
                            },
                          ),
                        ),
                        SizedBox(
                          height: height / AppResponsiveHeigh.h10,
                        ),
                        Center(
                            child: Text(
                              cubic.address,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: FontSize.s17,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DancingScript'

                              ),
                              maxLines: 3,
                            )),

                        SizedBox(
                          height: height / AppResponsiveHeigh.h20,
                        ),
                        Center(
                          child: defaultButton(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                fontSize: FontSize.s18,
                                fontFamily: 'DancingScript',
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              shape: false,
                              border: true,
                              width: height / AppResponsiveHeigh.h120,
                              height: height / AppResponsiveHeigh.h50,
                              background: AppColors.graySoft2,
                              context: context,
                              function: () {


                                Navigator.pop(context);


                              },
                              text: AppStrings.save,
                              isUpperCase: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
