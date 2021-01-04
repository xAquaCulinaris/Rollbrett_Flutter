import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:rollbrett_rottweil/Class/obstacle.dart';
import 'package:rollbrett_rottweil/CoursePreview/obstacleListViewItem.dart';
import 'package:rollbrett_rottweil/CoursePreview/requirementsWidget.dart';

class CoursePreview extends StatefulWidget {
  @override
  _CoursePreviewState createState() => _CoursePreviewState();
}

class _CoursePreviewState extends State<CoursePreview>
    with WidgetsBindingObserver {
  List<Obstacle> obstacleInRange = Obstacle.getObstacles();

  final StreamController<BluetoothState> streamController = StreamController();
  StreamSubscription<RangingResult> _streamRanging;
  StreamSubscription<BluetoothState> _streamBluetooth;
  final _regionBeacons = <Region, List<Beacon>>{};
  final _beacons = <Beacon>[];
  bool authorizationStatusOk = false;
  bool locationServiceEnabled = false;
  bool bluetoothEnabled = false;

  @override
  initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    listeningState();
  }

  listeningState() async {
    print('Listening to bluetooth state');
    _streamBluetooth = flutterBeacon
        .bluetoothStateChanged()
        .listen((BluetoothState state) async {
      print('BluetoothState = $state');
      streamController.add(state);

      switch (state) {
        case BluetoothState.stateOn:
          initScanBeacon();
          break;
        case BluetoothState.stateOff:
          await pauseScanBeacon();
          await checkAllRequirements();
          break;
      }
    });
  }

  checkAllRequirements() async {
    final bluetoothState = await flutterBeacon.bluetoothState;
    final bluetoothEnabled = bluetoothState == BluetoothState.stateOn;
    final authorizationStatus = await flutterBeacon.authorizationStatus;
    final authorizationStatusOk =
        authorizationStatus == AuthorizationStatus.allowed ||
            authorizationStatus == AuthorizationStatus.always;
    final locationServiceEnabled =
        await flutterBeacon.checkLocationServicesIfEnabled;

    setState(() {
      this.authorizationStatusOk = authorizationStatusOk;
      this.locationServiceEnabled = locationServiceEnabled;
      this.bluetoothEnabled = bluetoothEnabled;
    });
  }

  initScanBeacon() async {
    try {
      await flutterBeacon.initializeAndCheckScanning;
    } on PlatformException catch (e) {
      print("Permissoin error!");
    }

    await checkAllRequirements();
    if (!authorizationStatusOk ||
        !locationServiceEnabled ||
        !bluetoothEnabled) {
      print('RETURNED, authorizationStatusOk=$authorizationStatusOk, '
          'locationServiceEnabled=$locationServiceEnabled, '
          'bluetoothEnabled=$bluetoothEnabled');
      return;
    }
    final regions = <Region>[
      Region(
        identifier: 'Cubeacon',
        proximityUUID: 'B9407F30-F5F8-466E-AFF9-25556B57FE6D',
      ),
    ];

    if (_streamRanging != null) {
      if (_streamRanging.isPaused) {
        _streamRanging.resume();
        return;
      }
    }
    _streamRanging =
        flutterBeacon.ranging(regions).listen((RangingResult result) {
      print(result);

      if (result != null && mounted) {
        setState(() {
          _regionBeacons[result.region] = result.beacons;
          _beacons.clear();
          _regionBeacons.values.forEach((list) {
            _beacons.addAll(list);
          });
          _beacons.sort(_compareParameters);

          for (Obstacle obstacle in obstacleInRange) {
            obstacle.inRange = false;
          }

          //Custom part
          for (int i = 0; i < _beacons.length; i++) {
            //handrail
            if (_beacons[i].proximityUUID ==
                'B9407F30-F5F8-466E-AFF9-25556B57FE6D') {
              obstacleInRange[1].inRange = true;
            }

            if (_beacons[i].proximityUUID == 'otherUUID') {
              obstacleInRange[0].inRange = true;
            }

            if (_beacons[i].proximityUUID == 'otherUUID') {
              obstacleInRange[2].inRange = true;
            }
          }

          for (Obstacle obstacle in obstacleInRange) {
            print(obstacle.inRange);
          }
          //end of coustum part
        });
      }
    });
  }

  pauseScanBeacon() async {
    _streamRanging?.pause();
    if (_beacons.isNotEmpty) {
      setState(() {
        _beacons.clear();
      });
    }
  }

  int _compareParameters(Beacon a, Beacon b) {
    int compare = a.proximityUUID.compareTo(b.proximityUUID);

    if (compare == 0) {
      compare = a.major.compareTo(b.major);
    }

    if (compare == 0) {
      compare = a.minor.compareTo(b.minor);
    }
    return compare;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print('AppLifecycleState = $state');
    if (state == AppLifecycleState.resumed) {
      if (_streamBluetooth != null && _streamBluetooth.isPaused) {
        _streamBluetooth.resume();
      }

      await checkAllRequirements();
      if (authorizationStatusOk && locationServiceEnabled && bluetoothEnabled) {
        await initScanBeacon();
      } else {
        await pauseScanBeacon();
        await checkAllRequirements();
      }
    } else if (state == AppLifecycleState.paused) {
      _streamBluetooth?.pause();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    streamController?.close();
    _streamRanging?.cancel();
    _streamBluetooth?.cancel();
    flutterBeacon.close;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Title Course preview")),
      body:
          !bluetoothEnabled || !locationServiceEnabled || !authorizationStatusOk
              ? RequirementsWidget(streamController, authorizationStatusOk,
                  locationServiceEnabled, bluetoothEnabled)
              : ListView.builder(
                  itemCount: obstacleInRange.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ObstacleListViewItem(obstacleInRange, index),
                ),
    );
  }
}
