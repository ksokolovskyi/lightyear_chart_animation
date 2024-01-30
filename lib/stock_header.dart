import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lightyear_chart_animation/stock_overview.dart';
import 'package:lightyear_chart_animation/stock_price.dart';
import 'package:lightyear_chart_animation/stock_price_chart.dart';

class StockHeader extends StatelessWidget {
  const StockHeader({
    required this.maxHeight,
    super.key,
  });

  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _StockHeaderSliverPersistentHeaderDelegate(
        maxHeight: maxHeight,
        header: const StockOverview(),
        chart: const StockPriceChart(series: mockStockPriceSeries),
      ),
    );
  }
}

enum _StockHeaderPart {
  gradient,
  header,
  chart,
}

class _StockHeaderSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  const _StockHeaderSliverPersistentHeaderDelegate({
    required this.maxHeight,
    required this.header,
    required this.chart,
  });

  final double maxHeight;

  final Widget header;

  final Widget chart;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final scrollProgress = shrinkOffset / maxExtent;

    return RepaintBoundary(
      child: SizedBox.expand(
        child: CustomMultiChildLayout(
          delegate: _StockHeaderMultiChildLayoutDelegate(
            scrollProgress: scrollProgress,
          ),
          children: [
            if (scrollProgress < 1)
              LayoutId(
                id: _StockHeaderPart.gradient,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF081F22),
                        Color(0xFF081F22),
                        Color(0xFF06181A),
                        Color(0xFF02090D),
                        Colors.black,
                      ],
                      stops: [0, 0.235, 0.4201, 0.6897, 1],
                    ),
                  ),
                ),
              ),
            LayoutId(
              id: _StockHeaderPart.header,
              child: Opacity(
                opacity: clampDouble(1 - scrollProgress * 2, 0, 1),
                child: header,
              ),
            ),
            LayoutId(
              id: _StockHeaderPart.chart,
              child: chart,
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => 1;

  @override
  bool shouldRebuild(_StockHeaderSliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        header != oldDelegate.header ||
        chart != oldDelegate.chart;
  }
}

class _StockHeaderMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  _StockHeaderMultiChildLayoutDelegate({required this.scrollProgress});

  final double scrollProgress;

  @override
  void performLayout(Size size) {
    if (hasChild(_StockHeaderPart.gradient)) {
      layoutChild(
        _StockHeaderPart.gradient,
        BoxConstraints.tightFor(
          height: size.height,
          width: size.width,
        ),
      );
      positionChild(_StockHeaderPart.gradient, Offset.zero);
    }

    final headerSize = layoutChild(
      _StockHeaderPart.header,
      BoxConstraints(
        minWidth: size.width,
        maxWidth: size.width,
        maxHeight: size.height,
      ),
    );
    positionChild(_StockHeaderPart.header, Offset.zero);

    final headerHeightFactor = clampDouble(1 - scrollProgress * 2, 0, 1);

    final chartSize = layoutChild(
      _StockHeaderPart.chart,
      BoxConstraints.tightFor(
        height: size.height - (headerSize.height + 24) * headerHeightFactor,
        width: size.width,
      ),
    );
    positionChild(
      _StockHeaderPart.chart,
      Offset(0, size.height - chartSize.height),
    );
  }

  @override
  bool shouldRelayout(_StockHeaderMultiChildLayoutDelegate oldDelegate) {
    return scrollProgress != oldDelegate.scrollProgress;
  }
}
