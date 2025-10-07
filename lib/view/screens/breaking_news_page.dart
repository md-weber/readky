import 'package:flutter/material.dart';
import 'package:readky/model/core/news.dart';
import 'package:readky/model/helper/news_helper.dart';
import 'package:readky/view/widgets/custom_app_bar.dart';
import 'package:readky/view/widgets/news_tile.dart';

class BreakingNewsPage extends StatefulWidget {
  const BreakingNewsPage({super.key});

  @override
  State<BreakingNewsPage> createState() => _BreakingNewsPageState();
}

class _BreakingNewsPageState extends State<BreakingNewsPage> {
  List<News> allCategoriesNews = NewsHelper.allCategoriesNews;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressedLeading: () {
          Navigator.of(context).pop();
        },
        title: const Text(
          'Breaking News',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: allCategoriesNews.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
              itemBuilder: (context, index) {
                return NewsTile(data: allCategoriesNews[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
