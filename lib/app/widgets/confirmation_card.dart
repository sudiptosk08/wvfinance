import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app/widgets/drawer_menu_tile.dart';

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget({
    super.key,
    required this.controller,
    required this.imageFor,
    required this.onTap,
  });

  final dynamic controller;
  final String imageFor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DrawerMenuTile(
          onTap: onTap,
          iconData: Icons.check,
          title: "Confirm",
        ),
        DrawerMenuTile(
          onTap: () async {
            Get.back();
          },
          iconData: Icons.close,
          title: "Cancel",
        ),
      ],
    );
  }
}
