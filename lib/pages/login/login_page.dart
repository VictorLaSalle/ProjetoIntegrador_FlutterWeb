import 'package:development/pages/login/login_page_desktop.dart';
import 'package:development/pages/login/login_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) =>
            sizingInformation.isMobile || sizingInformation.isTablet
                ? LoginPageMobile()
                : LoginPageDesktop());
  }
}
