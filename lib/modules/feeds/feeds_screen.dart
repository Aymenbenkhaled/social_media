import 'package:flutter/material.dart';
import 'package:socialapp/shared/style/colors.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Card(
              elevation: 5,
              margin: EdgeInsets.all(8),
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
              itemBuilder: (context, index) => buildPostItem(context),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 5,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget buildPostItem(context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/image2.jpg'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Benkhaled Aymenn',
                            maxLines: 1,
                            style: TextStyle(
                              height: 1.5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            size: 18,
                            color: Colors.blueAccent,
                          )
                        ],
                      ),
                      Text(
                        'Fab 07, 2023 at 10:23',
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
                  onPressed: () {},
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
            const Text(
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 13, height: 1.3),
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 10,
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
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
                  image: AssetImage('assets/images/image2.jpg'),
                  fit: BoxFit.cover,
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
                              '103',
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
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/image2.jpg'),
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
