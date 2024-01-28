import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialapp/layout/cubit/cubit.dart';
import 'package:socialapp/layout/cubit/states.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/colors.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        var userModel = cubit.userModel;
        var profileImage = cubit.profileImage;
        var coverImage = cubit.coverImage;
        nameController.text = userModel!.name!;
        bioController.text = userModel.bio!;
        phoneController.text = userModel.phone!;
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              defaultTexButton(
                function: () {
                  if (cubit.profileImage == null && cubit.coverImage == null) {
                    LayoutCubit.get(context).UpdateUser(
                      name: nameController.text,
                      bio: bioController.text,
                      phone: phoneController.text,
                    );
                  } else if (cubit.profileImage != null &&
                      cubit.coverImage != null) {
                    cubit.uploadProfileAndCoverImages(
                      name: nameController.text,
                      bio: bioController.text,
                      phone: phoneController.text,
                    );
                    // cubit.urlProfileImage == null;
                    // cubit.urlProfileImage == null;
                  } else if (cubit.profileImage != null &&
                      cubit.coverImage == null) {
                    cubit.uploadProfileImage(
                      name: nameController.text,
                      bio: bioController.text,
                      phone: phoneController.text,
                    );
                  } else if (cubit.profileImage == null &&
                      cubit.coverImage != null) {
                    cubit.uploadCoverImage(
                      name: nameController.text,
                      bio: bioController.text,
                      phone: phoneController.text,
                    );
                  }
                  // cubit.uploadProfileImage(
                  //   name: nameController.text,
                  //   bio: bioController.text,
                  //   phone: phoneController.text,
                  // );
                },
                text: 'Update',
                textSize: 20,
                toUpperCase: true,
              ),
              SizedBox(width: 10.w),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is LayoutUserUpdateLoadingState)
                    const LinearProgressIndicator(),
                  if (state is LayoutUserUpdateLoadingState)
                    const SizedBox(
                      height: 10,
                    ),
                  SizedBox(
                    height: 250,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Stack(
                          alignment: const AlignmentDirectional(.95, .47),
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0)),
                                  image: DecorationImage(
                                    image: (coverImage == null)
                                        ? NetworkImage(
                                            '${userModel.coverImage}')
                                        : FileImage(coverImage)
                                            as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: defaultColor,
                              child: IconButton(
                                onPressed: () {
                                  LayoutCubit.get(context).getCoverImage();
                                },
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 20,
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: const AlignmentDirectional(.85, .85),
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              radius: 74,
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: (profileImage != null)
                                    ? FileImage(profileImage)
                                    : NetworkImage('${userModel.image}')
                                        as ImageProvider<Object>?,
                              ),
                            ),
                            CircleAvatar(
                              radius: 18,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: defaultColor,
                                child: IconButton(
                                  onPressed: () {
                                    LayoutCubit.get(context).getProfileImage();
                                  },
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    label: 'Name',
                    prefIcon: Icons.person,
                    validate: (value) {
                      if (value == null) {
                        return 'Name must not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                    controller: bioController,
                    type: TextInputType.text,
                    label: 'Bio',
                    prefIcon: Icons.info_outline,
                    validate: (value) {
                      if (value == null) {
                        return 'Bio must not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    label: 'Phone',
                    prefIcon: Icons.phone,
                    validate: (value) {
                      if (value == null) {
                        return 'Phone must not be empty';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
