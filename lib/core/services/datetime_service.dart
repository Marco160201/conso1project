import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> selectDateInput(
    BuildContext context,
    TextEditingController fechaNacimientoController,
    DateTime? selectedDate) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );

  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
    fechaNacimientoController.text = DateFormat('dd/MM/yyyy').format(picked);
  }
}
