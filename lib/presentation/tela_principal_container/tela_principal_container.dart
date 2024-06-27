import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../tela_principal/tela_principal.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class TelaPrincipalContainer extends StatelessWidget {
  TelaPrincipalContainer({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.telaPrincipalDepoisDoLoginPage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: _buildTf(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Inicio:
        return "/";
      case BottomBarEnum.Especialistas:
        return AppRoutes.telaPrincipalDepoisDoLoginPage;
      case BottomBarEnum.Perfil:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.telaPrincipalDepoisDoLoginPage:
        return TelaPrincipal();
      default:
        return DefaultWidget();
    }
  }
}
