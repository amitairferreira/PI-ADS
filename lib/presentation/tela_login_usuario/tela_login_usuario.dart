import 'package:projeto_integrado/presentation/tela_cadastro_usuario/tela_cadastro_usuario.dart';
import 'package:flutter/material.dart';
import 'package:projeto_integrado/presentation/tela_principal/tela_principal.dart';
import 'package:projeto_integrado/presentation/tela_principal_container/tela_principal_container.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class LoginUsuario extends StatelessWidget {
  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaPrincipalContainer()),
    );
  }

  void _navigateToCadastro(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CadastroUsuario()),
    );
  }

  LoginUsuario({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordoneController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSoundMindSection(context),
                  SizedBox(height: 30.v),
                  SizedBox(
                    height: 492.v,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomElevatedButton(
                          width: 216.h,
                          text: "Entrar",
                          margin: EdgeInsets.only(bottom: 88.v),
                          buttonStyle: CustomButtonStyles.fillPrimary,
                          onPressed: () => _navigateToHome(context),
                        ),
                        GestureDetector(
                          onTap: () => _navigateToCadastro(context),
                          child: Text(
                            "Criar uma conta",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse1421,
                          height: 216.v,
                          width: 108.h,
                          alignment: Alignment.topLeft,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse1441,
                          height: 274.v,
                          width: 124.h,
                          alignment: Alignment.bottomRight,
                        ),
                        _buildSocialLoginRow(context)
                      ],
                    ),
                  ),
                  SizedBox(height: 4.v)
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
  Widget _buildTf(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        decoration: AppDecoration.outlineBlack900,
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      height: 54.v,
                      text: "Google",
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: 12.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgGroup18x18,
                          height: 18.adaptSize,
                          width: 18.adaptSize,
                        ),
                      ),
                      buttonTextStyle: CustomTextStyles.bodyLargeRubik,
                    ),
                  ),
                  SizedBox(width: 14.h),
                  Expanded(
                    child: CustomElevatedButton(
                      height: 54.v,
                      text: "Facebook",
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: 16.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgGroupOnprimary18x18,
                          height: 18.adaptSize,
                          width: 18.adaptSize,
                        ),
                      ),
                      buttonTextStyle: CustomTextStyles.bodyLargeRubik,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 36.v),
            CustomTextFormField(
              controller: emailController,
              hintText: "ProjetoIntegrado@gmail.com",
              hintStyle: CustomTextStyles.bodyLargeRubik,
              textInputType: TextInputType.emailAddress,
              suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 20.v, 24.h, 20.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgCheckmark,
                  height: 10.v,
                  width: 14.h,
                ),
              ),
              suffixConstraints: BoxConstraints(
                maxHeight: 54.v,
              ),
              contentPadding: EdgeInsets.only(
                left: 24.h,
                top: 16.v,
                bottom: 16.v,
              ),
            ),
            SizedBox(height: 18.v),
            CustomTextFormField(
              controller: passwordoneController,
              textInputAction: TextInputAction.done,
              suffix: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 20.v,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroupBlueGray500,
                  height: 14.v,
                  width: 16.h,
                ),
              ),
              suffixConstraints: BoxConstraints(
                maxHeight: 54.v,
              ),
              obscureText: true,
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSocialLoginRow(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.h,
          top: 58.v,
          right: 24.h,
        ),
        child: Row(
          children: [_buildTf(context)],
        ),
      ),
    );
  }
}
