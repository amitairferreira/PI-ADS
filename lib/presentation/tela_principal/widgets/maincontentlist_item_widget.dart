import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class MaincontentlistItemWidget extends StatelessWidget {
  const MaincontentlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgEllipse145,
      height: 216.v,
    );
  }
}
