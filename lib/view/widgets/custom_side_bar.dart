import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readky/route/slide_page_route.dart';
import 'package:readky/view/screens/profile_page.dart';

class CustomSideBar extends StatefulWidget {
  const CustomSideBar({super.key});

  @override
  State<CustomSideBar> createState() => _CustomSideBarState();
}

class _CustomSideBarState extends State<CustomSideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ColoredBox(
        color: Colors.black,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(SlidePageRoute(child: const ProfilePage()));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        'assets/images/pp.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Shasy Rhe',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Basic Account.',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.35),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: Color(0xFF606060),
            ),
            _buildListTile(
              context,
              iconAssetPath: 'assets/icons/Arrow - Up Square.svg',
              title: 'Upgrade Plan',
              onTap: () {},
            ),
            _buildListTile(
              context,
              iconAssetPath: 'assets/icons/Notification.svg',
              title: 'Notification',
              onTap: () {},
            ),
            _buildListTile(
              context,
              iconAssetPath: 'assets/icons/Time Circle.svg',
              title: 'Your Activity',
              onTap: () {},
            ),
            _buildListTile(
              context,
              iconAssetPath: 'assets/icons/Setting.svg',
              title: 'Settings',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required String title,
    required String iconAssetPath,
    required VoidCallback? onTap,
  }) {
    return ColoredBox(
      color: Colors.black,
      child: ListTileTheme(
        contentPadding: const EdgeInsets.only(left: 24, top: 10, bottom: 10),
        minLeadingWidth: 12,
        tileColor: Colors.white.withValues(alpha: 0.8),
        selectedTileColor: Colors.white,
        selectedColor: Colors.white,
        textColor: Colors.white.withValues(alpha: 0.8),
        child: ListTile(
          leading: SvgPicture.asset(
            iconAssetPath,
            height: 24,
            width: 24,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
