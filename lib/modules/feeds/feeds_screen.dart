import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/layout/cubit/cubit.dart';
import 'package:socialapp/layout/cubit/states.dart';
import 'package:socialapp/models/post_model.dart';
import 'package:socialapp/shared/style/colors.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return (cubit.posts != [])
            ? Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Card(
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          alignment: AlignmentDirectional.centerStart,
                          children: [
                            Image(
                              image: AssetImage('assets/images/image1.jpg'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Communicate with freinds',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            buildPostItem(context, cubit.posts[index], index),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 13),
                        itemCount: cubit.posts.length,
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              );
      },
    );
  }

  Widget buildPostItem(context, PostModel post, int index) {
    return Card(
      surfaceTintColor: Colors.brown.shade200,
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('${post.image}'),
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
                            '${post.name}',
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
                        '${post.dateTime}',
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
                    // print(LayoutCubit.get(context).postsIds[index]);
                  },
                  icon: const Icon(
                    Icons.more_horiz_outlined,
                    size: 25,
                  ),
                ),
              ],
            ),
            Divider(
              // height: 1,
              color: Colors.grey[300],
              thickness: 1,
            ),
            Text(
                overflow: TextOverflow.clip,
                style: const TextStyle(fontSize: 13, height: 1.3),
                '${post.text}'),
            // if(post.)
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                // bottom: 10,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 5,
                  children: [
                    SizedBox(
                      height: 20,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        minWidth: 1.0,
                        onPressed: () {},
                        child: Text('#Software',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: defaultColor)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        minWidth: 1.0,
                        onPressed: () {},
                        child: Text('#Software',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: defaultColor)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        minWidth: 1.0,
                        onPressed: () {},
                        child: Text('#Software',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: defaultColor)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        minWidth: 1.0,
                        onPressed: () {},
                        child: Text('#Software',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: defaultColor)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        minWidth: 1.0,
                        onPressed: () {},
                        child: Text('#Software',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: defaultColor)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        minWidth: 1.0,
                        onPressed: () {},
                        child: Text('#Software',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: defaultColor)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        minWidth: 1.0,
                        onPressed: () {},
                        child: Text('#Software',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: defaultColor)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (post.postImage != '')
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    image: DecorationImage(
                      image: NetworkImage('${post.postImage}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${LayoutCubit.get(context).likes[index]}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.chat_rounded,
                              // color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '97 comment',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey[300],
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                '${LayoutCubit.get(context).userModel!.image}'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'write a comment ...',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall! //caption
                                .copyWith(height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      LayoutCubit.get(context)
                          .likePost(LayoutCubit.get(context).postsIds[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Like',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
