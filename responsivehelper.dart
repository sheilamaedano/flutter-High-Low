import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget desktopportrait;
  final Widget desktoplandscape;

  const ResponsiveWidget(
      {Key? key,
      required this.mobile,
      required this.desktopportrait,
      required this.desktoplandscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 760) {
        return mobile;
      } else if (constraints.maxWidth < 960 && constraints.maxWidth >= 760) {
        return desktopportrait;
      } else {
        return desktoplandscape;
      }
    });
  }
}