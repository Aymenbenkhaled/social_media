import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/layout/cubit/cubit.dart';
import 'package:socialapp/layout/cubit/states.dart';
import 'package:socialapp/models/messages_model.dart';
import 'package:socialapp/models/user_model.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/network/endpoints.dart';
import 'package:socialapp/shared/style/colors.dart';

// ignore: must_be_immutable
class ChatDetailsScreen extends StatelessWidget {
  UserModel user;

  ChatDetailsScreen({super.key, required this.user});
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        LayoutCubit.get(context).getMessages(recieverId: user.uId);
        return BlocConsumer<LayoutCubit, LayoutStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage('${user.image}'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${user.name}',
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              body: (LayoutCubit.get(context).messages.isNotEmpty)
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Expanded(
                              child: ListView.separated(
                            itemBuilder: (context, index) {
                              var message =
                                  LayoutCubit.get(context).messages[index];
                              if (message.senderId ==
                                  LayoutCubit.get(context).userModel!.uId) {
                                return buildMyMessageItem(message);
                              }
                              return buildMessageItem(message);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemCount: LayoutCubit.get(context).messages.length,
                          )),
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                // Expanded(
                                //   child: TextFormField(
                                //     controller: textController,
                                //     decoration: InputDecoration(
                                //       border: InputBorder.none,
                                //       hintText: 'write your message ...',
                                //       suffix: Container(
                                //         clipBehavior: Clip.antiAliasWithSaveLayer,
                                //         width: 35,
                                //         height: 35,
                                //         decoration: BoxDecoration(
                                //           color: defaultColor,
                                //           borderRadius: BorderRadius.circular(50),
                                //         ),
                                //         child: MaterialButton(
                                //           padding: EdgeInsets.all(0),
                                //           // color: defaultColor,
                                //           minWidth: 1,
                                //           onPressed: () {},
                                //           child: const Icon(
                                //             size: 20,
                                //             Icons.send,
                                //             color: Colors.white,
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Expanded(
                                  child: TextFormField(
                                    controller: textController,
                                    decoration: const InputDecoration(
                                      hintText: 'write your message ...',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )),
                                  child: MaterialButton(
                                    onPressed: () {
                                      LayoutCubit.get(context).sendMessage(
                                        text: textController.text,
                                        recieverId: user.uId,
                                        dateTame: DateTime.now().toString(),
                                      );
                                    },
                                    color: defaultColor,
                                    minWidth: 1,
                                    child: const Icon(
                                      Icons.send,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }
}

Widget buildMessageItem(MessagesModel message) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(10),
          topStart: Radius.circular(10),
          topEnd: Radius.circular(10),
        ),
      ),
      child: Text(
        '${message.text}',
        style: const TextStyle(overflow: TextOverflow.clip),
      ),
    ),
  );
}

Widget buildMyMessageItem(MessagesModel message) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: defaultColor.withOpacity(.25),
        borderRadius: const BorderRadiusDirectional.only(
          bottomStart: Radius.circular(10),
          topStart: Radius.circular(10),
          topEnd: Radius.circular(10),
        ),
      ),
      child: Text(
        '${message.text}',
        style: const TextStyle(overflow: TextOverflow.clip),
      ),
    ),
  );
}
