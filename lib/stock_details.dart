import 'package:flutter/material.dart';

class StockDetails extends StatelessWidget {
  const StockDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 46),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: 5,
          (context, index) {
            if (index.isEven) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160,
                    height: 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0x4DFEFEFE),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xE518171E),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox(height: 72);
          },
        ),
      ),
    );
  }
}
