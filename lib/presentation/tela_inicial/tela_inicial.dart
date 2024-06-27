import 'package:projeto_integrado/presentation/tela_cadastro_especialista/tela_cadastro_especialista.dart';
import 'package:projeto_integrado/presentation/tela_cadastro_usuario/tela_cadastro_usuario.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class TelaInicial extends StatelessWidget {
  void _navigateToParaVoce(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CadastroUsuario()),
    );
  }

  void _navigateToParaEspecialistas(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CadastroEspecialista()),
    );
  }

  const TelaInicial({Key? key})
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
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 906.v,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.h,
                            vertical: 74.v,
                          ),
                          decoration: AppDecoration.fillPrimaryContainer,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Sound \nMind",
                                maxLines: null,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.displayMedium,
                              ),
                              SizedBox(height: 64.v),
                              _buildColumnencontreo(context),
                              SizedBox(height: 272.v)
                            ],
                          ),
                        ),
                      ),
                      _buildTf1(context)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnencontreo(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 44.h),
      child: Column(
        children: [
          Text(
            "Encontre o suporte  necessário para cuidar da sua saúde mental ",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bodyLargeBlack900,
          ),
          SizedBox(height: 10.v),
          CustomImageView(
            imagePath: ImageConstant.imgFrame,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
          SizedBox(height: 32.v),
          GestureDetector(
            onTap: () => _navigateToParaVoce(context),
            child: Text(
              "Para você",
              style: CustomTextStyles.titleLargePrimary.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 34.v),
          GestureDetector(
            onTap: () => _navigateToParaEspecialistas(context),
            child: Text(
              "Para especialistas",
              style: CustomTextStyles.titleLargePrimary_1.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 48.h),
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMulhermeditando,
            height: 300.v,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 4.h),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTf1(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 22.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder198,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildTf(context), SizedBox(height: 52.v)],
      ),
    );
  }
}
