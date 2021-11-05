import 'package:time_managment_flutter/blocs/form_bloc.dart';
import 'package:flutter/material.dart';

class FormProvider extends InheritedWidget {
  final bloc = FormBloc();
  

  FormProvider({Key? key,required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static FormBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<FormProvider>() as FormProvider).bloc;
  }
}
