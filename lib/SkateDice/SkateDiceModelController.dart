import 'package:flutter/material.dart';
import 'package:rollbrett_rottweil/Class/SkateDice/skateDiceData.dart';


class SkateDiceModelController extends InheritedWidget {
  final SkateDiceData data;

  
  static SkateDiceData of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<SkateDiceModelController>().data;
  
  SkateDiceModelController({
    Key key,
    @required Widget child
}) : assert(child!=null),
  data = SkateDiceData(),
  super(key: key, child: child);


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
