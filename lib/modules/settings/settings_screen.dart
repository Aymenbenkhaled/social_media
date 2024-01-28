import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialapp/layout/cubit/cubit.dart';
import 'package:socialapp/layout/cubit/states.dart';
import 'package:socialapp/modules/edit_profile/edit_profile_screen.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = LayoutCubit.get(context).userModel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment.bottomCenter,
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
                            image: NetworkImage('${userModel!.coverImage}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      radius: 74,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage('${userModel.image}'),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${userModel.name}',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '${userModel.bio}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '140',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '268',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Photos',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '18K',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Followers',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '52',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Followings',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: defaultButton(
                      context: context,
                      function: () {},
                      text: 'Add Photos',
                      color: Theme.of(context).scaffoldBackgroundColor,
                      buttonColor: Theme.of(context).scaffoldBackgroundColor,
                      textColor: defaultColor,
                      borderColor: Colors.grey,
                      borderWidth: 1,
                      radius: 4.0,
                      height: 40.0,
                      textSize: 18,
                      isUpperCase: false,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  defaultButton(
                      context: context,
                      function: () {
                        navPush(context, EditProfileScreen());
                      },
                      text: '',
                      color: Colors.black,
                      width: 60.0,
                      height: 40.0,
                      radius: 4.0,
                      buttonColor: Theme.of(context).scaffoldBackgroundColor,
                      textColor: defaultColor,
                      textSize: 18,
                      withIcon: true,
                      icon: Icons.edit,
                      prefxOrSuffx: false,
                      iconSize: 20,
                      iconColor: defaultColor,
                      spaceBtwTextAndIcon: 5,
                      borderColor: Colors.grey,
                      borderWidth: 1,
                      isUpperCase: false),
                ],
              ),
            ],
          ),
        );
      },
    );
    ;
  }
}
