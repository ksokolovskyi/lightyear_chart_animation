import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 14),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _PageIndicator(),
            SizedBox(width: 8),
            _PageIndicator(),
            SizedBox(width: 8),
            _PageIndicator(),
            SizedBox(width: 8),
            _PageIndicator(),
            SizedBox(width: 8),
            _PageIndicator(selected: true),
          ],
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    this.selected = false,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 30,
            height: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xCCFEFEFE)
                    : const Color(0x997B7A85),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          if (selected)
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: SizedBox.square(
                dimension: 4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xCCFEFEFE),
                  ),
                ),
              ),
            )
          else
            const SizedBox(height: 12),
        ],
      ),
    );
  }
}
