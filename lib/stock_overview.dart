import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StockOverview extends StatelessWidget {
  const StockOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox.square(
                dimension: 36,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0x4DFEFEFE),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              SizedBox(width: 14),
              Flexible(
                child: SizedBox(
                  width: 138,
                  height: 22,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0x80000000),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14),
              Flexible(
                child: SizedBox(
                  width: 106,
                  height: 22,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0x80000000),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 48,
            height: 20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0x4DFEFEFE),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SizedBox(
                  width: 92,
                  height: 34,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0x4DFEFEFE),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Flexible(
                child: SizedBox(
                  width: 92,
                  height: 28,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xB352A2AE),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
