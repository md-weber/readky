import 'package:flutter/material.dart';
import 'package:readky/model/core/video_news.dart';
import 'package:readky/view/utils/app_theme.dart';
import 'package:readky/view/widgets/tag_card.dart';

class VideoNewsCard extends StatelessWidget {
  const VideoNewsCard({super.key, required this.data});
  static const double itemHeight = 400;
  static const double itemWidth = 300;
  final VideoNews data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight,
      width: itemWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(data.thumbnail ?? ''),
          fit: BoxFit.cover,
        ),
        color: Colors.black,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        alignment: Alignment.bottomLeft,
        width: itemHeight,
        height: itemWidth,
        decoration: BoxDecoration(gradient: AppTheme.textOverlayGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TagCard(tagName: 'Video'),
            const SizedBox(height: 8),
            Text(
              data.title ?? 'No title',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'inter',
                fontSize: 16,
                height: 150 / 100,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
