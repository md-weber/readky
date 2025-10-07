import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readky/model/core/news.dart';
import 'package:readky/model/helper/news_helper.dart';
import 'package:readky/route/slide_page_route.dart';
import 'package:readky/view/screens/breaking_news_page.dart';
import 'package:readky/view/screens/profile_page.dart';
import 'package:readky/view/widgets/breaking_news_card.dart';
import 'package:readky/view/widgets/custom_app_bar.dart';
import 'package:readky/view/widgets/featured_news_card.dart';
import 'package:readky/view/widgets/news_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _featuredNewsScrollController = ScrollController();
  List<News> featuredNewsData = NewsHelper.featuredNews;
  List<News> breakingNewsData = NewsHelper.breakingNews;
  List<News> recomendationNewsData = NewsHelper.recomendationNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leadingIcon: SvgPicture.asset(
          'assets/icons/Menu.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        onPressedLeading: () {
          Scaffold.of(context).openDrawer();
        },
        title: SvgPicture.asset('assets/icons/appname.svg'),
        profilePicture: Image.asset(
          'assets/images/pp.png',
          fit: BoxFit.cover,
        ),
        onPressedProfilePicture: () {
          Navigator.of(context)
              .push(SlidePageRoute(child: const ProfilePage()));
        },
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // section 1 - Featured News
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: MediaQuery.of(context).size.width,
            height: 390,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 320,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    controller: _featuredNewsScrollController,
                    padding: const EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredNewsData.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      return FeaturedNewsCard(
                        data: featuredNewsData[index],
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Featured news',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // section 2 - Breaking News
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Breaking News',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            SlidePageRoute(child: const BreakingNewsPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          'view more',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.only(top: 6),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: breakingNewsData.length,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 13,
                      );
                    },
                    itemBuilder: (context, index) {
                      return BreakingNewsCard(
                        data: breakingNewsData[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // section 3 - Based on Your Reading History
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: const Text(
                    'Based on your reading history...',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: recomendationNewsData.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                    itemBuilder: (context, index) {
                      return NewsTile(
                        data: recomendationNewsData[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
