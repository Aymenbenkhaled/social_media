import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/models/user_model.dart';
import 'package:socialapp/modules/register/cubit/state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool obscure = true;
  IconData icon = Icons.visibility_outlined;

  void ChangeVisibility() {
    obscure = !obscure;
    if (obscure) {
      icon = Icons.visibility_outlined;
    } else
      icon = Icons.visibility_off_outlined;
    emit(RegisterChangeVisibilityPasswordState());
  }

  void RegisterUser(
      {required String name,
      required String email,
      required String phone,
      required String password,
      context}) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('succes');
      createUSer(
        name: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,
      );
    }).catchError((onError) {
      print('error');
      emit(RegisterErrorState(onError.toString()));
    });
  }

  void createUSer({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      bio: 'write your bio ...',
      image:
          'https://img.freepik.com/free-photo/3d-rendering-zoom-call-avatar_23-2149556785.jpg?w=900&t=st=1704757541~exp=1704758141~hmac=af88ac9be3708c77de4f356e601bab9abd0db9281f3878bf16f72402ab9f89b',
      coverImage:
          'https://img.freepik.com/free-photo/beautiful-landscape-mountain-fuji_74190-3065.jpg?w=900&t=st=1704729193~exp=1704729793~hmac=f9553504f4e403d9e12b34d9ecfc6a7ee7b2116f28bad812421a902b57d36e37',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateUSerSuccessState());
    }).catchError((onError) {
      emit(CreateUSerErrorState());
    });
  }
}
