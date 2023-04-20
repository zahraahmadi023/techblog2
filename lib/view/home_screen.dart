import 'package:flutter/material.dart';
import 'package:tecgblog2_prac/models/data_models.dart';
import 'package:tecgblog2_prac/component/myColors.dart';
import 'package:tecgblog2_prac/component/myString.dart';

import '../models/fake_data.dart';
import '../component/my_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.marginBody,
  });

  final Size size;
  final TextTheme textTheme;
  final double marginBody;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: [
              //appbar
              HomePagePoster(size: size, textTheme: textTheme),
              const SizedBox(
                height: 16,
              ),
              
              HomePageTagList(marginBody: marginBody, textTheme: textTheme),
              const SizedBox(
                height: 16,
              ),
              
              SeeMoreBlog(marginBody: marginBody, textTheme: textTheme),

              HomePageBlogeList(size: size, marginBody: marginBody, textTheme: textTheme),
              const SizedBox(
                height: 16,
              ),
              SeeMorePodcast(marginBody: marginBody, textTheme: textTheme),
              
              HomePagePodcastList(size: size, marginBody: marginBody, textTheme: textTheme),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    super.key,
    required this.size,
    required this.marginBody,
    required this.textTheme,
  });

  final Size size;
  final double marginBody;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4.1,
      child: ListView.builder(
          itemCount: blogList.getRange(0, 5).length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            ///////item blog+text
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? marginBody : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 6,
                      width: size.width / 2.4,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      blogList[index].imageUrl),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        blogList[index].writer,
                        style: textTheme.headline3,
                        // overflow: TextOverflow.ellipsis,
                        // maxLines: 2,
                      )),
                ],
              ),
            );
          })),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.marginBody,
    required this.textTheme,
  });

  final double marginBody;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: marginBody, bottom: 8),
      child: Row(
        children: [
          const ImageIcon(
              AssetImage(
                "assets/icons/blue_pen.png",
              ),
              color: SolidColors.seeMore),
          const SizedBox(
            width: 5,
          ),
          Text(
            MyStrings.viewHotestPodCasts,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}

class HomePageBlogeList extends StatelessWidget {
  const HomePageBlogeList({
    super.key,
    required this.size,
    required this.marginBody,
    required this.textTheme,
  });

  final Size size;
  final double marginBody;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4.1,
      child: ListView.builder(
          itemCount: blogList.getRange(0, 5).length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            ///////item blog+text
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? marginBody : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 5.8,
                      width: size.width / 2.4,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      blogList[index].imageUrl),
                                  fit: BoxFit.cover),
                            ),
                            foregroundDecoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              gradient: LinearGradient(
                                  colors: GradientColors.blogPost,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  blogList[index].writer,
                                  style: textTheme.headline1,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      blogList[index].views,
                                      style: textTheme.subtitle1,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        blogList[index].title,
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )),
                ],
              ),
            );
          })),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.marginBody,
    required this.textTheme,
  });

  final double marginBody;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: marginBody, bottom: 8),
      child: Row(
        children: [
          const ImageIcon(
              AssetImage(
                "assets/icons/blue_pen.png",
              ),
              color: SolidColors.seeMore),
          const SizedBox(
            width: 5,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.marginBody,
    required this.textTheme,
  });

  final double marginBody;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                8, 8, index == 0 ? marginBody : 16, 8),
            child: MainTags(textTheme: textTheme, index: index,),
          );
        },
      ),
    );
  }
}



class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage("assets/images/poster_test.png"),
              fit: BoxFit.cover,
            ),
          ),
          ////////gradiant
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
              colors: GradientColors.homePosterCoverGradiant,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        " " +
                        homePagePosterMap["data"],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["veiw"],
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        size: 16,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
              Text(
                homePagePosterMap["title"],
                style: textTheme.headline1,
              )
            ],
          ),
        )
      ],
    );
  }
}
