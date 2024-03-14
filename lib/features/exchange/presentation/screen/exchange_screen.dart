import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moneyapp/core/resources/app_colors.dart';
import 'package:moneyapp/core/resources/font_manager.dart';
import 'package:moneyapp/core/resources/strings.dart';
import 'package:moneyapp/core/resources/values_manager.dart';
import 'package:moneyapp/features/exchange/presentation/bloc/exchange_cubic.dart';
import 'package:moneyapp/features/exchange/presentation/bloc/exchange_state.dart';
import 'package:moneyapp/shared/default_button.dart';
class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  Set<Marker> markers = {};
  Position? position;

  LatLng? CurrentLatLng;
  ExchangeCubic? cubic;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubic = ExchangeCubic.get(context);
      cubic!.getLocation();



      cubic!.getLocation();
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExchangeCubic, ExchangeState>(
      listener: (context, state) {},
      builder: (context, state) {
       cubic = ExchangeCubic.get(context);

        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;



        return Scaffold(
            backgroundColor: AppColors.white,

            body:  Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: GoogleMap(
                onTap: (latLng) {
                  setState(() {
                    cubic!.googleMapController!.animateCamera(
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

                    cubic!.updateLocation(
                        latLng.latitude, latLng.longitude);
                  });
                },
                initialCameraPosition: cubic!.initialCameraPosition!,
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                markers: markers,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  cubic!.googleMapController = controller;
                },
              ),
            ));
      },
    );
  }
}
