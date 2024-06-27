import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'widgets/k0_item_widget.dart';
import 'widgets/maincontentlist_item_widget.dart'; // ignore_for_file: must_be_immutable

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        body: Column(
          children: [
            Container(
              height: 708.5.v,
              width: double.maxFinite,
              decoration: AppDecoration.fillPrimaryContainer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildMainContentList(context),
                  _buildHeaderSection(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMainContentList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 206.v,
        bottom: 66.v,
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return MaincontentlistItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return SizedBox(
      height: 108.v,
      width: double.maxFinite,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 12.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return K0ItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTf1(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [_buildTf(context)],
      ),
    );
  }

  /// Section Widget
  Widget _buildHeaderSection(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 16.v),
        decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.customBorderBL20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 26.v),
            CustomAppBar(
              title: Padding(
                padding: EdgeInsets.only(left: 15.h),
                child: Column(
                  children: [
                    AppbarTitle(
                      text: "Boa tarde,",
                    ),
                    AppbarSubtitle(
                      text: "Pessoa",
                      margin: EdgeInsets.only(
                        left: 1.h,
                        right: 37.h,
                      ),
                    )
                  ],
                ),
              ),
              actions: [
                AppbarTrailingImage(
                  imagePath: ImageConstant.imgFrameOnprimary,
                  margin: EdgeInsets.only(
                    right: 22.h,
                    bottom: 20.v,
                  ),
                )
              ],
            ),
            SizedBox(height: 32.v),
            _buildTf1(context)
          ],
        ),
      ),
    );
  }
}
