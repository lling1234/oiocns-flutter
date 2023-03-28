import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class MyWidgetPhysics extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidgetPhysics>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;

  @override
  void initState() {
    _simulation = SpringSimulation(
      SpringDescription(
        mass: 1,
        stiffness: 100,
        damping: 10,
      ),
      0.0,
      1.0,
      0.0,
    );
    _controller = AnimationController.unbounded(
      vsync: this,
      // lowerBound: double.negativeInfinity,
      // upperBound: double.infinity,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.animateWith(_simulation);
      },
      child: Container(
        width: _controller.value * 100.0,
        height: _controller.value * 100.0,
        color: Colors.blue,
      ),
    );
  }
}