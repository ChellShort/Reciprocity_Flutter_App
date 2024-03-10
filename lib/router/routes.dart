import 'package:flutter/material.dart';
import '../ui/views/register_view.dart';

import '../ui/views/login_view.dart';

var customRoutes = <String, WidgetBuilder>{
  /// vistas de registro y login
  LoginView.id: (_) => LoginView(),
  RegisterView.id: (_) => const RegisterView(),

  ///
};
