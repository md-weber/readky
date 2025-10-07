import 'package:flutter/material.dart';
import 'package:readky/model/core/category.dart';
import 'package:readky/model/core/news.dart';
import 'package:readky/model/helper/category_helper.dart';
import 'package:readky/model/helper/news_helper.dart';
import 'package:readky/view/widgets/news_tile.dart';
import 'package:readky/view/widgets/search_app_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchInputController = TextEditingController();
  List<Category> category = CategoryHelper.categoryData;
  List<News> searchData = NewsHelper.searchNews;

  @override
  void dispose() {
    searchInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: SearchAppBar(
          searchInputController: searchInputController,
          searchPressed: () {},
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: Colors.black,
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: category.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.topCenter,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          searchInputController.text =
                              category[index].name ?? 'Name is missing';
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFF313131),
                        ),
                      ),
                      child: Text(
                        category[index].name ?? 'Name is missing',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: searchData.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                itemBuilder: (context, index) {
                  return NewsTile(data: searchData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
