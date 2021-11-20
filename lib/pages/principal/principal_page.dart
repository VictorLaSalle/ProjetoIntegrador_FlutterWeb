import 'package:development/pages/principal/principal_page_desktop.dart';
import 'package:development/pages/principal/principal_page_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
      builder: (context, sizeInfo) =>
          sizeInfo.deviceScreenType == DeviceScreenType.desktop
              ? PrincipalPageDesktop()
              : PrincipalPageMobile());
}
