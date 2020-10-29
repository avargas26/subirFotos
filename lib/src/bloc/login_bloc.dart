import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:form_validations/src/bloc/validators.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //escuchando los cambios y recupearr los datos streams
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);
  //insertar valores al streams
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //obtener el ultimo valor ingresado a los streams
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    //? evitamos que de error cuando es vacio
    _emailController?.close();
    _passwordController?.close();
  }
}
