import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taks_daily_app/core/router/router_provider.dart';
import 'package:taks_daily_app/core/router/router_provider.gr.dart';
import 'package:taks_daily_app/core/utils/methods/toast_information.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/models.dart' as m;
import 'package:taks_daily_app/src/services/services_google/sign_in_with_google.dart';
import 'package:taks_daily_app/src/usecases/insert_user_usecase.dart';
import 'package:taks_daily_app/src/usecases/login_user_usecase.dart';

class AuthenticationVm extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();

  Future<void> login(BuildContext context) async {
    final result = await sl<LoginUser>().execute(
      emailController.text,
      passwordController.text,
    );
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );

    result.match(
      (l) {
        toastDanger('Error al iniciar sesión');
      },
      (r) {
        toastSuccess('Sesión iniciada correctamente');
        Future.delayed(
          const Duration(milliseconds: 500),
          () => autoRouterPushAndPopUntil(
            context,
            HomeScreenRoute(email: emailController.text),
          ),
        );
      },
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    final credential = await authService.signInWithGoogle();
    // Once signed in, return the UserCredential
    return credential;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  Future<void> registerUser(
    String email,
  ) async {
    final result = await sl<InsertUser>().execute(
      m.User(
        id: 0,
        email: emailController.text,
        password: '',
        name: '',
        phone: '',
        image: '',
      ),
    );

    result.match(
      (l) {
        toastDanger('Error al registrar usuario');
      },
      (r) {
        toastSuccess('Usuario registrado correctamente');
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
