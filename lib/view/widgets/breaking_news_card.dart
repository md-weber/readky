import 'package:flutter/material.dart';
import 'package:readky/model/core/news.dart';
import 'package:readky/route/slide_page_route.dart';
import 'package:readky/view/screens/news_detail_page.dart';

class BreakingNewsCard extends StatelessWidget {
  const BreakingNewsCard({super.key, required this.data});
  final News data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(SlidePageRoute(child: NewsDetailPage(data: data)));
      },
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.photo != null)
              Container(
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(data.photo!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  data.title ?? 'No Title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    height: 150 / 100,
                    fontFamily: 'inter',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
