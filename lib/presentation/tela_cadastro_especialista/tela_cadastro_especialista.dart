import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CadastroEspecialista extends StatelessWidget {
  CadastroEspecialista({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController crpvalueoneController = TextEditingController();

  TextEditingController senhaoneController = TextEditingController();

  bool euconcordocomos = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 46.v),
              child: Column(
                children: [
                  SizedBox(height: 16.v),
                  _buildSoundMindSection(context),
                  SizedBox(height: 26.v),
                  SizedBox(
                    height: 490.v,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomElevatedButton(
                          width: 216.h,
                          text: "Criar conta",
                          buttonStyle: CustomButtonStyles.fillPrimary,
                          alignment: Alignment.bottomCenter,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse142216x108,
                          height: 216.v,
                          width: 108.h,
                          alignment: Alignment.topLeft,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse144274x124,
                          height: 274.v,
                          width: 124.h,
                          alignment: Alignment.bottomRight,
                        ),
                        _buildGoogleRowSection(context)
                      ],
                    ),
                  ),
                  SizedBox(height: 26.v),
                  _buildTf(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSoundMindSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.only(left: 82.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sound \nMind",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.displayMedium,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabSection(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        decoration: AppDecoration.outlineBlack900.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomElevatedButton(
              height: 36.v,
              width: 120.h,
              text: "Google",
              leftIcon: Container(
                margin: EdgeInsets.only(right: 10.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroup,
                  height: 12.adaptSize,
                  width: 12.adaptSize,
                ),
              ),
              buttonTextStyle: CustomTextStyles.bodyMediumBluegray500,
            ),
            SizedBox(height: 18.v),
            CustomTextFormField(
              controller: emailoneController,
              hintText: "Nome completo",
            ),
            SizedBox(height: 18.v),
            CustomTextFormField(
              controller: emailController,
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 18.v),
            CustomTextFormField(
              controller: crpvalueoneController,
              hintText: "CRP",
            ),
            SizedBox(height: 18.v),
            CustomTextFormField(
              controller: senhaoneController,
              hintText: "Senha",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 20.v, 24.h, 20.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgMusic,
                  height: 14.adaptSize,
                  width: 14.adaptSize,
                ),
              ),
              suffixConstraints: BoxConstraints(
                maxHeight: 54.v,
              ),
              obscureText: true,
              contentPadding: EdgeInsets.only(
                left: 24.h,
                top: 16.v,
                bottom: 16.v,
              ),
            ),
            SizedBox(height: 18.v),
            CustomCheckboxButton(
              text: "Eu concordo com os termos de uso ",
              value: euconcordocomos,
              onChange: (value) {
                euconcordocomos = value;
              },
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGoogleRowSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Row(
        children: [_buildTabSection(context)],
      ),
    );
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          Text(
            "Já tenho uma conta",
            style: theme.textTheme.bodyMedium!.copyWith(
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}
