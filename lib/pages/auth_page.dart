import 'package:conso1project/pages/registro_usuario_page.dart';
import 'package:conso1project/ui/general/colors.dart';
import 'package:conso1project/ui/widgets/custom_button.dart';
import 'package:conso1project/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'INICIAR SESION',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: 24),
                  CustomTextFormField(
                      controller: emailController, hintText: 'Ingresa email'),
                  SizedBox(height: 24),
                  CustomTextFormField(
                    controller: passController,
                    hintText: 'Ingresa contraseña',
                    isPassword: true,
                  ),
                  SizedBox(height: 24),
                  CustomElevatedButton(
                      backgroundColor: AppColors.primaryColor,
                      buttonText: 'Ingresar',
                      onPressed: () {}),
                  SizedBox(height: 12),
                  Text(
                    '¿No tienes una cuenta todavía?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  CustomElevatedButton(
                      backgroundColor: AppColors.primaryColor,
                      buttonText: 'Registrarse',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistroUsuarioPage()),
                        );
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
