import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    required this.searchInputController,
    this.searchPressed,
  });
  final TextEditingController searchInputController;

  final VoidCallback? searchPressed;
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      titleSpacing: 0,
      title: Container(
        margin: const EdgeInsets.only(left: 16, right: 10),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          controller: widget.searchInputController,
          onChanged: (value) {
            setState(() {});
          },
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            prefixIcon: Visibility(
              visible:
                  (widget.searchInputController.text.isEmpty) ? true : false,
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 12),
                child: SvgPicture.asset(
                  'assets/icons/Search.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            prefixIconConstraints: const BoxConstraints(maxHeight: 20),
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.2)),
            contentPadding: const EdgeInsets.only(left: 16, bottom: 9),
            focusColor: Colors.white,
          ),
        ),
      ),
      actions: [
        // The search button will appear if the input is not empty
        (widget.searchInputController.text.isEmpty)
            ? ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontWeight: FontWeight.w400),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                child: const Text('cancel'),
              )
            : ElevatedButton(
                onPressed: widget.searchPressed,
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontWeight: FontWeight.w400),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                child: const Text('Search'),
              ),
      ],
    );
  }
}
