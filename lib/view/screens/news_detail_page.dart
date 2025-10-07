import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readky/model/core/news.dart';
import 'package:readky/view/widgets/custom_app_bar.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.data});
  final News data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        onPressedLeading: () {},
        title: SvgPicture.asset('assets/icons/appname.svg'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share_outlined,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/Bookmark.svg',
              colorFilter: ColorFilter.mode(
                Colors.white.withValues(alpha: 0.5),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 240,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: data.photo != null
                  ? DecorationImage(
                      image: AssetImage(data.photo!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.date} | ${data.author}.',
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.6),
                    fontSize: 12,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 20),
                  child: Text(
                    data.title ?? 'No Title',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 150 / 100,
                      fontFamily: 'inter',
                    ),
                  ),
                ),
                Text(
                  data.description ?? 'No Description',
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.8),
                    fontSize: 14,
                    height: 150 / 100,
                    fontWeight: FontWeight.w500,
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
