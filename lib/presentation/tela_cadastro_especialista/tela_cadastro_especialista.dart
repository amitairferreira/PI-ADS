import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_integrado/presentation/tela_login_usuario/tela_login_usuario.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class CadastroEspecialista extends StatefulWidget {
  CadastroEspecialista({Key? key}) : super(key: key);

  @override
  _CadastroEspecialistaState createState() => _CadastroEspecialistaState();
}

class _CadastroEspecialistaState extends State<CadastroEspecialista> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController crpController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  bool euconcordocomos = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (!euconcordocomos) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Você deve concordar com os termos de uso')),
        );
        return;
      }
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: senhaController.text,
        );

        await FirebaseFirestore.instance.collection('especialistas').doc(userCredential.user!.uid).set({
          'nome': nomeController.text,
          'email': emailController.text,
          'crp': crpController.text,
        });

        // Cadastro bem-sucedido, navegue para a tela de login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginUsuario()),
        );
      } on FirebaseAuthException catch (e) {
        // Exiba a mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Erro ao cadastrar')),
        );
      } catch (e) {
        // Exiba outras mensagens de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro desconhecido ao cadastrar')),
        );
      }
    }
  }

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
                          onPressed: _register,
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
                        _buildGoogleRowSection(context),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.v),
                  _buildTf(context),
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
          ),
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
              controller: nomeController,
              hintText: "Nome completo",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu nome completo';
                }
                return null;
              },
            ),
            SizedBox(height: 18.v),
            CustomTextFormField(
              controller: emailController,
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu email';
                }
                return null;
              },
            ),
            SizedBox(height: 18.v),
            CustomTextFormField(
              controller: crpController,
              hintText: "CRP",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu CRP';
                }
                return null;
              },
            ),
            SizedBox(height: 18.v),
            CustomTextFormField(
              controller: senhaController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                return null;
              },
            ),
            SizedBox(height: 18.v),
            CustomCheckboxButton(
              text: "Eu concordo com os termos de uso ",
              value: euconcordocomos,
              onChange: (value) {
                setState(() {
                  euconcordocomos = value;
                });
              },
            ),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginUsuario()),
              );
            },
            child: Text(
              "Já tenho uma conta",
              style: theme.textTheme.bodyMedium!.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
