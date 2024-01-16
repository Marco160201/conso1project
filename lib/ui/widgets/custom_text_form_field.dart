import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onTap;
  final String? Function(String?)? customValidator;
  final bool isPassword;
  final int maxLines; // Nuevo parámetro para el número de líneas

  CustomTextFormField({
    required this.controller,
    required this.hintText,
    this.customValidator,
    this.isPassword = false,
    this.maxLines = 1, //Valor  predeterminado de 1 línea
    this.onTap, 
  }) : super();

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  //Estado del texto si se muestra o no la contrasena
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      controller: widget.controller,
      //Si el campo no es contrasena se muestra el texto normal
      obscureText: widget.isPassword ? _isObscure : false,
      maxLines: widget.maxLines, // Aplica el número de líneas personalizado
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        contentPadding: EdgeInsets.all(16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        //se agrega el icono de la contrasena en caso lo sea
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  //cambia de estado para que se muestre o no la contrasena
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                //cambia el icono dependiendo del estado con un ojo visible y uno tachado
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              )
            : null,
      ),
      validator: widget.customValidator,
    );
  }
}
