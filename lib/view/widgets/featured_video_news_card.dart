import 'package:flutter/material.dart';
import 'package:readky/model/core/video_news.dart';
import 'package:readky/route/slide_page_route.dart';
import 'package:readky/view/screens/video_news_page.dart';
import 'package:readky/view/utils/app_theme.dart';
import 'package:readky/view/widgets/tag_card.dart';

class FeaturedVideoNewsCard extends StatelessWidget {
  const FeaturedVideoNewsCard({super.key, required this.data});
  final VideoNews data;
  @override
  Widget build(BuildContext context) {
    return (data.title != 'View More')
        ? Container(
            height: 170,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(data.thumbnail ?? ''),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              height: 170,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: AppTheme.textOverlayGradient,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TagCard(
                    tagName: 'Video',
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      data.title ?? 'No title',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 150 / 100,
                        fontFamily: 'inter',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(SlidePageRoute(child: const VideoNewsPage()));
            },
            child: Container(
              height: 170,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white.withValues(alpha: 0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'More Video',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 12,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
