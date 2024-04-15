import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.centerTitle
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppBar(
        title: Text(title),
        elevation: 0.2,
        centerTitle: centerTitle ?? true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: const Icon(Icons.arrow_back_ios_new_rounded)
          ),
        ),
        actions: actions?? []
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
