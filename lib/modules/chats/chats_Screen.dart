import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/layout/cubit/cubit.dart';
import 'package:socialapp/layout/cubit/states.dart';
import 'package:socialapp/models/user_model.dart';
import 'package:socialapp/modules/chat_details/chat_details_screen.dart';
import 'package:socialapp/shared/components/components.dart';
import 'package:socialapp/shared/style/colors.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return (LayoutCubit.get(context).users.isNotEmpty)
            ? Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildChatRow(
                      context, LayoutCubit.get(context).users[index]),
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(color: Colors.grey, thickness: .3),
                  ),
                  itemCount: LayoutCubit.get(context).users.length,
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: defaultColor,
                  ),
                ),
              );
      },
    );
  }

  Widget buildChatRow(context, UserModel user) {
    return InkWell(
      onTap: () {
        navPush(context, ChatDetailsScreen(user: user));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 50,
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage('${user.image}'),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${user.name}',
                          maxLines: 1,
                          style: const TextStyle(
                            height: 1.5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.check_circle,
                          size: 18,
                          color: Colors.blueAccent,
                        )
                      ],
                    ),
                    Text(
                      '3333',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall! //caption
                          .copyWith(height: 1.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {
                  // print(LayoutCubit.get(context).usersIds[index]);
                },
                icon: const Icon(
                  Icons.more_horiz_outlined,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
