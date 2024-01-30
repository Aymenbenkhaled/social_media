import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialapp/layout/cubit/cubit.dart';
import 'package:socialapp/layout/cubit/states.dart';
import 'package:socialapp/models/user_model.dart';
import 'package:socialapp/modules/new_post/add_post_screen.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/colors.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        if (state is LayoutChangeButtomNavAddPostState) {
          navPush(context, AddPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.index]),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded, size: 35),
                onPressed: () {},
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                icon: const Icon(Icons.search, size: 35),
                onPressed: () {},
              ),
            ],
          ),
          body: (LayoutCubit.get(context).userModel != null)
              ? Column(
                  children: [
                    // if (!FirebaseAuth.instance.currentUser!.emailVerified)
                    //   Container(
                    //     padding: const EdgeInsets.symmetric(horizontal: 10),
                    //     color: Colors.amber.withOpacity(.8),
                    //     child: Row(
                    //       children: [
                    //         const Icon(Icons.info_outline),
                    //         SizedBox(width: 10.w),
                    //         const Expanded(
                    //           child: Text(
                    //             'Please verify your email',
                    //             style: TextStyle(fontSize: 18),
                    //           ),
                    //         ),
                    //         defaultTexButton(
                    //           function: () {
                    //             FirebaseAuth.instance.currentUser!
                    //                 .sendEmailVerification()
                    //                 .then((value) {
                    //               CustomFlutterToast(
                    //                 context: context,
                    //                 text: 'Check your mail',
                    //                 color: Colors.green,
                    //                 icon: Icons.info_outline,
                    //               );
                    //             }).catchError((onError) {});
                    //           },
                    //           text: 'SEND',
                    //           textSize: 18,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    cubit.screens[cubit.index],
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: defaultColor,
                )),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              cubit.ChangeButtomNav(value);
            },
            items: const [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Chat', icon: Icon(Icons.chat_bubble_outline)),
              BottomNavigationBarItem(
                  label: 'Add Post', icon: Icon(Icons.upload_file)),
              BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.person)),
              BottomNavigationBarItem(
                  label: 'Settings', icon: Icon(Icons.settings)),
            ],
            currentIndex: cubit.index,
          ),
        );
      },
    );
  }
}
