import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialapp/layout/cubit/cubit.dart';
import 'package:socialapp/layout/cubit/states.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/colors.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final now = DateTime.now();

        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Add Post',
            actions: [
              defaultTexButton(
                function: () {
                  // print(now.toString());
                  if (cubit.postImage != null) {
                    cubit.uploadPostImage(
                      text: textController.text,
                      dateTime: now.toString(),
                    );
                  } else {
                    cubit.createNewPost(
                      dateTime: now.toString(),
                      text: textController.text,
                    );
                  }
                },
                text: 'post',
                textSize: 20,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (state is LayoutCreatePostLoadingState)
                  const LinearProgressIndicator(),
                if (state is LayoutCreatePostLoadingState)
                  const SizedBox(
                    height: 10,
                  ),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/image2.jpg'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Benkhaled Aymenn',
                            maxLines: 1,
                            style: TextStyle(
                              height: 1.5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Text(
                          //   'Fab 07, 2023 at 10:23',
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodySmall! //caption
                          //       .copyWith(height: 1.5),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'What is on your mind ...',
                    ),
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                if (cubit.postImage != null)
                  Stack(
                    alignment: const AlignmentDirectional(.95, -.9),
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
                              image: FileImage(cubit.postImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.red,
                        child: IconButton(
                          onPressed: () {
                            cubit.deletePostImage();
                          },
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.close,
                            size: 25,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: defaultButton(
                      context: context,
                      text: 'Add Photo',
                      isUpperCase: false,
                      color: Colors.white,
                      textColor: defaultColor,
                      buttonColor: Theme.of(context).scaffoldBackgroundColor,
                      withIcon: true,
                      prefxOrSuffx: true,
                      icon: Icons.photo_camera_outlined,
                      iconColor: defaultColor,
                      iconSize: 25,
                      spaceBtwTextAndIcon: 10,
                      textSize: 18,
                      function: () {
                        LayoutCubit.get(context).getPostImage();
                      },
                    )),
                    Expanded(
                        child: defaultButton(
                      context: context,
                      function: () {},
                      text: '# Tags',
                      isUpperCase: false,
                      color: Colors.white,
                      textColor: defaultColor,
                      buttonColor: Theme.of(context).scaffoldBackgroundColor,
                      textSize: 20,
                    )
                        // defaultTexButton(
                        //   function: () {},
                        //   text: '# tags',
                        //   textSize: 18,
                        // ),
                        ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
