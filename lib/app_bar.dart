import 'package:flutter/material.dart';

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFF081F22),
      child: SafeArea(
        bottom: false,
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: 60),
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: SizedBox(
                width: 140,
                height: 14,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0x4DFEFEFE),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
