import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/layout/cubit/states.dart';
import 'package:socialapp/models/post_model.dart';
import 'package:socialapp/models/user_model.dart';
import 'package:socialapp/modules/chats/chats_Screen.dart';
import 'package:socialapp/modules/feeds/feeds_screen.dart';
import 'package:socialapp/modules/new_post/add_post_screen.dart';
import 'package:socialapp/modules/settings/settings_screen.dart';
import 'package:socialapp/modules/users/users_screen.dart';
import 'package:socialapp/shared/components/constants.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserData() {
    // emit(LayoutGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then(
      (value) {
        userModel = UserModel.fromJson(value.data()!);
        emit(LayoutGetUserSuccesState());
      },
    ).catchError((onError) {
      emit(LayoutGetUserErrorState(onError.toString()));
    });
  }

  int index = 0;

  List<Widget> screens = [
    const FeedScreen(),
    const ChatsScreen(),
    AddPostScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];
  List<String> titles = [
    'Home',
    'Chats',
    'Add Post',
    'Users',
    'Settings',
  ];

  // ignore: non_constant_identifier_names
  void ChangeButtomNav(int value) {
    if (value == 2) {
      emit(LayoutChangeButtomNavAddPostState());
    } else {
      index = value;
      emit(LayoutChangeButtomNavState());
    }
  }

  File? profileImage;
  File? postImage;
  File? coverImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(LayoutProfileImagePickedSuccesState());
    } else {
      print('no image');
      emit(LayoutProfileImagePickedErrorState());
    }
  }

  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(LayoutProfileImagePickedSuccesState());
    } else {
      print('no image');
      emit(LayoutProfileImagePickedErrorState());
    }
  }

  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(LayoutCoverImagePickedSuccesState());
    } else {
      print('no image');
      emit(LayoutCoverImagePickedErrorState());
    }
  }

  String? urlProfileImage;
  String? urlCoverImage;
  String? urlPostImage;
  final storage = FirebaseStorage.instance;

  void uploadProfileImage({
    required String name,
    required String bio,
    required String phone,
  }) {
    emit(LayoutUserUpdateLoadingState());

    // final storage = FirebaseStorage.instance;
    storage
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      print(value.storage);
      value.ref.getDownloadURL().then((value) {
        urlProfileImage = value;
        // print(urlProfileImage);
        UpdateUser(
          name: name,
          bio: bio,
          phone: phone,
          profileImage: value,
        );
        // emit(LayoutUploadProfileImageSuccesState());
      }).catchError((onError) {
        emit(LayoutUploadProfileImageErrorState());
      });
    }).catchError((onError) {
      emit(LayoutUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String bio,
    required String phone,
  }) {
    emit(LayoutUserUpdateLoadingState());
    // final storage = FirebaseStorage.instance;

    storage
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        urlCoverImage = value;
        print(value);
        UpdateUser(
          name: name,
          bio: bio,
          phone: phone,
          profileImage: value,
        );
        emit(LayoutUploadCoverImageSuccesState());
      }).catchError((onError) {
        emit(LayoutUploadCoverImageErrorState());
      });
    }).catchError((onError) {
      emit(LayoutUploadCoverImageErrorState());
    });
  }

  void uploadProfileAndCoverImages({
    required String name,
    required String bio,
    required String phone,
  }) {
    emit(LayoutUserUpdateLoadingState());
    // final storage = FirebaseStorage.instance;
    storage
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      print(value.storage);
      value.ref.getDownloadURL().then((value) {
        urlProfileImage = value;
        storage
            .ref()
            .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
            .putFile(coverImage!)
            .then((value) {
          value.ref.getDownloadURL().then((value) {
            urlCoverImage = value;
            // print(value);
            UpdateUser(
              name: name,
              bio: bio,
              phone: phone,
              profileImage: urlProfileImage,
              coverImage: urlCoverImage,
            );
            // emit(LayoutUploadCoverImageSuccesState());
          }).catchError((onError) {
            emit(LayoutUploadCoverImageErrorState());
          });
        }).catchError((onError) {
          emit(LayoutUploadCoverImageErrorState());
        });
      }).catchError((onError) {
        emit(LayoutUploadProfileImageErrorState());
      });
    }).catchError((onError) {
      emit(LayoutUploadProfileImageErrorState());
    });
  }

  // ignore: non_constant_identifier_names
  void UpdateUser({
    required String name,
    required String bio,
    required String phone,
    String? profileImage,
    String? coverImage,
  }) {
    emit(LayoutUserUpdateLoadingState());
    UserModel updatedUserModel = UserModel(
      name: name,
      bio: bio,
      phone: phone,
      coverImage: coverImage ?? userModel!.coverImage,
      image: profileImage ?? userModel!.image,
      email: userModel!.email,
      uId: userModel!.uId,
      isEmailVerified: userModel!.isEmailVerified,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(updatedUserModel.toMap())
        .then((value) {
      // if (urlProfileImage != null) urlProfileImage == null;
      getUserData();
    }).catchError((onError) {
      emit(LayoutUserUpdateErrorState());
    });
  }

  void uploadPostImage({
    required String text,
    required String dateTime,
  }) {
    emit(LayoutCreatePostLoadingState());
    // final storage = FirebaseStorage.instance;
    storage
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      print(value.storage);
      value.ref.getDownloadURL().then((value) {
        urlPostImage = value;
        createNewPost(
          dateTime: dateTime,
          text: text,
          postImage: urlPostImage,
        );
        // emit(LayoutUploadProfileImageSuccesState());
      }).catchError((onError) {
        emit(LayoutCreatePostErrorState());
      });
    }).catchError((onError) {
      emit(LayoutCreatePostErrorState());
    });
  }

  void createNewPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    emit(LayoutCreatePostLoadingState());
    PostModel postModel = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.toMap())
        .then((value) {
      // if (urlProfileImage != null) urlProfileImage == null;
      getUserData();
    }).catchError((onError) {
      emit(LayoutCreatePostErrorState());
    });
  }

  void deletePostImage() {
    postImage = null;
    emit(LayoutdeletePostImageState());
  }

  List<PostModel> posts = [];
  List<String> postsIds = [];
  List<int> likes = [];

  void getPosts() {
    emit(LayoutGetPostsLoadingState());
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          postsIds.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
          emit(LayoutGetPostsSuccesState());
        }).catchError((onError) {});
      });
    }).catchError((onError) {
      emit(LayoutGetPostsErrorState(onError));
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId)
        .set({'like': true}).then((value) {
      emit(LayoutLikePostSuccesState());
    }).catchError((onError) {
      emit(LayoutLikePostErrorState());
    });
  }
}
