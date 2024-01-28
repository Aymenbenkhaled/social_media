import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/login/cubit/state.dart';
import 'package:socialapp/shared/network/local/cache_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool obscure = true;
  IconData icon = Icons.visibility_outlined;

  void ChangeVisibility() {
    obscure = !obscure;
    if (obscure) {
      icon = Icons.visibility_outlined;
    } else
      icon = Icons.visibility_off_outlined;
    emit(LoginChangeVisibilityPasswordState());
  }

  void LoginUser({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((onError) {
      emit(LoginErrorState(onError.toString()));
    });
  }
}
