import 'package:flutter/material.dart';
import '../ui/views/register_view.dart';

import '../ui/views/login_view.dart';

import '../ui/views/Pagina1.dart';

import '../ui/views/Inicio.dart';

import '../ui/views/LandingPage.dart';

import '../ui/views/seccion1.dart';

import '../ui/views/seccion2.dart';

import '../ui/views/seccion3.dart';

var customRoutes = <String, WidgetBuilder>{
  /// vistas de registro y login
  LoginView.id: (_) => LoginView(),
  RegisterView.id: (_) => const RegisterView(),
  Pagina1.id: (_) => const Pagina1(),
  Inicio.id: (_) => const Inicio(),
  LandingPage.id: (_) => const LandingPage(),
  seccion1.id: (_) => const seccion1(),
  seccion2.id: (_) => const seccion2(),
  seccion3.id: (_) => const seccion3(),
  ///
};
