import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({Widget? leading, List<Widget>? actions, Widget? title, bool? centerTitle, Color? backgroundColor, Color? shadowColor}) :
      super(leading: leading, actions: actions, title: title, centerTitle: centerTitle, backgroundColor: backgroundColor, shadowColor: shadowColor);
}