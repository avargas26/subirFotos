import 'package:flutter/material.dart';
import 'package:form_validations/src/bloc/login_bloc.dart';
export 'package:form_validations/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }
  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  final loginBloc = LoginBloc();
  /*Provider({Key key, Widget child}) :
   super(key: key, child: child);*/

  @override
  //esto actualiza a los hijos
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  //toma el context y va a buscar un widget con el mismo provider
  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}