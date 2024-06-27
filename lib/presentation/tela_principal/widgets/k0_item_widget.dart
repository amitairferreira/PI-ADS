import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class K0ItemWidget extends StatelessWidget {
  const K0ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.h,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.fillPink.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgFrameOnprimary24x24,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
          SizedBox(height: 18.v),
          Text(
            "Minha jornada",
            style: CustomTextStyles.bodySmallOnPrimary,
          ),
          SizedBox(height: 12.v)
        ],
      ),
    );
  }
}
