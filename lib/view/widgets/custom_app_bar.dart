import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onPressedLeading,
    this.actions,
    this.profilePicture,
    this.onPressedProfilePicture,
  });
  final Widget title;
  final Widget? leadingIcon;
  final VoidCallback? onPressedLeading;
  final List<Widget>? actions;
  final Widget? profilePicture;

  final VoidCallback? onPressedProfilePicture;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0.0,
      centerTitle: true,
      title: title,
      leading: (leadingIcon != null)
          ? IconButton(
              icon: leadingIcon!,
              onPressed: onPressedLeading,
            )
          : null,
      actions: (profilePicture != null)
          ? [_buildProfilePicture(profilePicture!)]
          : actions,
    );
  }

  Padding _buildProfilePicture(Widget profilePicture) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: onPressedProfilePicture,
        borderRadius: BorderRadius.circular(60),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: profilePicture,
        ),
      ),
    );
  }
}
