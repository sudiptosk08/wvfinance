import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loan_app/app/widgets/drawer_menu_tile.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
    required this.controller,
    required this.imageFor,
  });

  final dynamic controller;
  final String imageFor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerMenuTile(
          onTap: () async {
            await controller.pickImage(
              source: ImageSource.camera,
              imageFor: imageFor,
            );
            Get.back();
          },
          iconData: Icons.camera_alt_outlined,
          title: "Take Photo From Camera",
        ),
        DrawerMenuTile(
          onTap: () async {
            await controller.pickImage(
              source: ImageSource.gallery,
              imageFor: imageFor,
            );
            Get.back();
          },
          iconData: Icons.image_outlined,
          title: "Pick Image From Gallary",
        ),
      ],
    );
  }
}
