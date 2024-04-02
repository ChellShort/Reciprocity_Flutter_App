import 'package:flutter/material.dart';
import '../ui/views/register_view.dart';

import '../ui/views/login_view.dart';

import '../ui/views/Pagina1.dart';

import '../ui/views/Inicio.dart';

var customRoutes = <String, WidgetBuilder>{
  /// vistas de registro y login
  LoginView.id: (_) => LoginView(),
  RegisterView.id: (_) => const RegisterView(),
  Pagina1.id: (_) => const Pagina1(),
  Inicio.id: (_) => Inicio()
  ///
};
