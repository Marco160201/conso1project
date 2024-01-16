import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conso1project/models/usuario_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registrarUsuario(Usuario usuario) async {
    try {
      // Referencia a la colección 'usuarios' en Firestore
      CollectionReference usuariosCollection = _firestore.collection('usuarios');

      // Agrega un nuevo documento con los datos del usuario
      await usuariosCollection.add({
        'nombres': usuario.nombres,
        'apellidos': usuario.apellidos,
        'correo': usuario.correo,
        'repetirContrasena': usuario.repetirContrasena,
        'numeroCelular': usuario.numeroCelular,
        'fechaNacimiento': usuario.fechaNacimiento,
        'domicilio': usuario.domicilio,
      });

      print('Usuario registrado en Firestore con éxito!');
    } catch (e) {
      print('Error al registrar usuario en Firestore: $e');
      // Puedes manejar el error según tus necesidades
    }
  }
}