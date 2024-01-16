import 'package:conso1project/core/services/datetime_service.dart';
import 'package:conso1project/core/services/firebase_service.dart';
import 'package:conso1project/models/usuario_model.dart';
import 'package:conso1project/ui/general/colors.dart';
import 'package:conso1project/ui/widgets/custom_button.dart';
import 'package:conso1project/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegistroUsuarioPage extends StatelessWidget {
// Controladores para los campos de texto
  final TextEditingController nombresController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController repetirContrasenaController =
      TextEditingController();
  final TextEditingController celularController = TextEditingController();
  final TextEditingController fechaNacimientoController =
      TextEditingController();
  final TextEditingController domicilioController = TextEditingController();
  DateTime? selectedDate;
  // Función de validación personalizada para el campo de contraseña
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa una contraseña';
    }
    return null;
  }

//controlador para el form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Nuevo Usuario'),
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextFormField(
                  controller: nombresController,
                  hintText: 'Nombres',
                  customValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tus nombres';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: apellidosController,
                  hintText: 'Apellidos',
                  customValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tus apellidos';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: correoController,
                  hintText: 'Correo electrónico',
                  customValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu correo electrónico';
                    }
                    // Puedes agregar una validación de formato de correo electrónico aquí
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: contrasenaController,
                  hintText: 'Contraseña',
                  isPassword: true,
                  customValidator: validatePassword,
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: repetirContrasenaController,
                  hintText: 'Vuelva a escribir contraseña',
                  isPassword: true,
                  customValidator: (value) {
                    if (value != contrasenaController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: celularController,
                  hintText: 'Número de celular',
                  customValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu número de celular';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: fechaNacimientoController,
                  hintText: 'Fecha de nacimiento',
                  onTap: () {
                    selectDateInput(
                        context, fechaNacimientoController, selectedDate);
                  },
                  customValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu fecha de nacimiento';
                    }
                    // Puedes agregar una validación de formato de fecha aquí
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                  controller: domicilioController,
                  hintText: 'Domicilio',
                  customValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu domicilio';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.0),
                CustomElevatedButton(
                  onPressed: () async {
                    if ( _formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 10),
                                Text('Registrando usuario...'),
                              ],
                            ),
                          );
                        },
                      );

                      try {
                        Usuario nuevoUsuario = Usuario(
                          nombres: nombresController.text,
                          apellidos: apellidosController.text,
                          correo: correoController.text,
                          contrasena: contrasenaController.text,
                          repetirContrasena: repetirContrasenaController.text,
                          numeroCelular: celularController.text,
                          fechaNacimiento: selectedDate ?? DateTime.now(),
                          domicilio: domicilioController.text,
                        );
                        await FirebaseService().registrarUsuario(nuevoUsuario);
                        Navigator.pop(context);
                      } catch (error) {
                        // Maneja errores aquí, por ejemplo, muestra un mensaje de error
                        print('Error al registrar usuario: $error');
                        // Cierra el diálogo de carga en caso de error
                        Navigator.pop(context);
                      }
                    }
                  },
                  buttonText: 'Registrarse',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
