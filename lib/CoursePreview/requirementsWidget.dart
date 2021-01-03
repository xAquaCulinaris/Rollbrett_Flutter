import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

class RequirementsWidget extends StatelessWidget {
  final bool authorizationStatusOk;
  final bool locationServiceEnabled;
  final bool bluetoothEnabled;

  RequirementsWidget(this.authorizationStatusOk, this.locationServiceEnabled, this.bluetoothEnabled);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                icon: Icon(Icons.portable_wifi_off),
                color: authorizationStatusOk ? Colors.blue : Colors.grey,
                onPressed: () async {
                  await flutterBeacon.requestAuthorization;
                }),
            Text("Rquired permission is given: " +
                authorizationStatusOk.toString()),
          ],
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(locationServiceEnabled
                    ? Icons.location_on
                    : Icons.location_off),
                color: locationServiceEnabled ? Colors.blue : Colors.grey,
                onPressed: () async {
                  if (Platform.isAndroid) {
                    await flutterBeacon.openLocationSettings;
                  } else if (Platform.isIOS) {}
                }),
            Text("Loccation service is turned on: : " +
                locationServiceEnabled.toString()),
          ],
        ),

        Row(
          children: [
            IconButton(
                icon: Icon(bluetoothEnabled ? Icons.bluetooth_connected : Icons.bluetooth_disabled),
                color: locationServiceEnabled ? Colors.blue : Colors.grey,
                onPressed: () async {
                  if (Platform.isAndroid) {
                    await flutterBeacon.openLocationSettings;
                  } else if (Platform.isIOS) {}
                }),
            Text("Loccation service is turned on: : " +
                locationServiceEnabled.toString()),
          ],
        )

      ],
    );
  }
}
