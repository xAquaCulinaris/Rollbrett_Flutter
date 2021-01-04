import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

class RequirementsWidget extends StatefulWidget {
  final StreamController<BluetoothState> streamController;

  final bool authorizationStatusOk;
  final bool locationServiceEnabled;
  final bool bluetoothEnabled;

  RequirementsWidget(this.streamController, this.authorizationStatusOk, this.locationServiceEnabled, this.bluetoothEnabled);

  @override
  _RequirementsWidgetState createState() => _RequirementsWidgetState();
}


class _RequirementsWidgetState extends State<RequirementsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [if (!widget.authorizationStatusOk)
        IconButton(
            icon: Icon(Icons.portable_wifi_off),
            color: Colors.red,
            onPressed: () async {
              await flutterBeacon.requestAuthorization;
            }),
        if (!widget.locationServiceEnabled)
          IconButton(
              icon: Icon(Icons.location_off),
              color: Colors.red,
              onPressed: () async {
                if (Platform.isAndroid) {
                  await flutterBeacon.openLocationSettings;
                } else if (Platform.isIOS) {}
              }),
        StreamBuilder<BluetoothState>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final state = snapshot.data;

              if (state == BluetoothState.stateOn) {
                return IconButton(
                  icon: Icon(Icons.bluetooth_connected),
                  onPressed: () {},
                  color: Colors.lightBlueAccent,
                );
              }
              if (state == BluetoothState.stateOff) {
                return IconButton(
                  icon: Icon(Icons.bluetooth),
                  onPressed: () async {
                    if (Platform.isAndroid) {
                      try {
                        await flutterBeacon.openBluetoothSettings;
                      } on PlatformException catch (e) {
                        print(e);
                      }
                    } else if (Platform.isIOS) {}
                  },
                  color: Colors.red,
                );
              }
              return IconButton(
                icon: Icon(Icons.bluetooth_disabled),
                onPressed: () {},
                color: Colors.grey,
              );
            }

            return SizedBox.shrink();
          },
          stream: widget.streamController.stream,
          initialData: BluetoothState.stateUnknown,
        ),
      ],
    );
  }
}
