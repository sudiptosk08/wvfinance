import 'package:flutter/material.dart';
import 'package:loan_app/utils/color/kcolors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          dismissible: false,
          color: KColors.primary.withOpacity(0.25),
        ),
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
