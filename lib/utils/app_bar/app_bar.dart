// import 'package:flutter/material.dart';
// import 'package:loan_app/utils/color/kcolors.dart';
// import 'package:loan_app/utils/text_utils/text_utils.dart';

// class KAppBar extends StatelessWidget {
//   final String? title;
//   final bool checkTitle;
//   final List<Widget>? actions;
//   final Widget? leading;
//   final Color? color;
//   const KAppBar({
//     this.title,
//     this.checkTitle = false,
//     this.actions,
//     this.leading,
//     this.color,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: color ?? KColors.background,
//       automaticallyImplyLeading: false,
//       centerTitle: true,
//       title: checkTitle == true
//           ? Text('$title',
//               style: TextStyle(fontSize: KFontSize.large, color: KColors.black))
//           : null,
//       elevation: 0,
//       leading: leading,
//       actions: actions,
//     );
//   }
// }
