import 'package:flutter/material.dart';
import 'package:projeto_integrado/presentation/tela_principal_container/tela_principal_container.dart';
import '../presentation/app_navigation/app_navigation.dart';
import '../presentation/tela_inicial/tela_inicial.dart';
import '../presentation/tela_principal/tela_principal.dart';
import '../presentation/tela_cadastro_especialista/tela_cadastro_especialista.dart';
import '../presentation/tela_cadastro_usuario/tela_cadastro_usuario.dart';
import '../presentation/tela_login_usuario/tela_login_usuario.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String telaInicialScreen = '/tela_inicial_screen';

  static const String tlCadastroUsuRioScreen = '/tl_cadastro_usu_rio_screen';

  static const String tlCadastroEspecialistaScreen =
      '/tl_cadastro_especialista_screen';

  static const String telaPrincipalDepoisDoLoginContainerScreen =
      '/tela_principal_depois_do_login_container_screen';

  static const String telaPrincipalDepoisDoLoginPage =
      '/tela_principal_depois_do_login_page';

  static const String tlEntrarUsuRioScreen = '/tl_entrar_usu_rio_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    telaInicialScreen: (context) => TelaInicial(),
    tlCadastroUsuRioScreen: (context) => CadastroUsuario(),
    tlCadastroEspecialistaScreen: (context) => CadastroEspecialista(),
    telaPrincipalDepoisDoLoginPage: (context) =>
        TelaPrincipal(),
    telaPrincipalDepoisDoLoginContainerScreen: (context) =>
        TelaPrincipalContainer(),
    tlEntrarUsuRioScreen: (context) => LoginUsuario(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => TelaInicial()
  };
}
