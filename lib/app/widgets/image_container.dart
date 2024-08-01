import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/app/widgets/pick_image_widget.dart';
import 'package:loan_app/app/widgets/show_sheet.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/sizes/k_sizes.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    super.key,
    this.title = 'Here will be the title',
    this.controller,
    required this.defaultImage,
    required this.image,
    this.imageFor = "",
    this.removeImage,
    required this.isCompleted,
    // required this.isPendding,
  });

  final dynamic controller;
  final String title;
  final String defaultImage;
  final String image;
  final String imageFor;
  final VoidCallback? removeImage;
  final bool isCompleted;
  // final bool isPendding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isCompleted
          ? null
          : () => KWidgets.defaultDialog(
                context: context,
                title: title,
                child: PickImageWidget(
                  controller: controller,
                  imageFor: imageFor,
                ),
              ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: KSizes.hGapMedium,
        ),
        padding: EdgeInsets.all(
          KSizes.hGapMedium,
        ),
        height: 170.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: KColors.borderColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: isCompleted
            ? SizedBox(
                width: double.infinity,
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              )
            // : isPendding
            //     ? Stack(
            //         alignment: AlignmentDirectional.topEnd,
            //         children: [
            //           SizedBox(
            //             width: double.infinity,
            //             child: image.isEmpty
            //                 ? Image.asset(defaultImage)
            //                 : Image.network(
            //                     image,
            //                     fit: BoxFit.fill,
            //                   ),
            //           ),
            //           image.isEmpty
            //               ? Container()
            //               : IconButton(
            //                   onPressed: removeImage,
            //                   icon: Icon(
            //                     Icons.close,
            //                     color: KColors.red,
            //                   ),
            //                 )
            //         ],
            //       )
            //    
             : image.isNotEmpty
                    ? Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Image.file(
                              File(
                                image,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          IconButton(
                            onPressed: removeImage,
                            icon: Icon(
                              Icons.close,
                              color: KColors.red,
                            ),
                          )
                        ],
                      )
                    : Image.asset(defaultImage),
      ),
    );
  }
}
