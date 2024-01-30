import 'package:flutter/material.dart';
import 'package:lightyear_chart_animation/stock_price.dart';

class StockPriceChart extends StatelessWidget {
  const StockPriceChart({
    required this.series,
    super.key,
  });

  final StockPriceSeries series;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _StockPriceChartPainter(series: series),
    );
  }
}

class _StockPriceChartPainter extends CustomPainter {
  const _StockPriceChartPainter({required this.series});

  final StockPriceSeries series;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final paint = Paint()
      ..color = const Color(0xFF9FD8D8)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final height = rect.height;
    final width = rect.width;
    final length = series.prices.length;

    if (height == 1) {
      canvas.drawLine(
        const Offset(0, 0.5),
        Offset(width, 0.5),
        paint,
      );
      return;
    }

    final spaceBetween = width / (length - 1);

    final path = Path();
    var dx = 0.0;

    for (var i = 0; i < length; i++) {
      final price = series.prices[i].price;
      final dy = _remap(
        price,
        series.minPrice.price,
        series.maxPrice.price,
        height,
        0,
      );

      if (i == 0) {
        path.moveTo(dx, dy);
      } else {
        path.lineTo(dx, dy);
      }

      dx += spaceBetween;
    }

    canvas.drawPath(path, paint);
  }

  double _remap(
    double number,
    double fromLow,
    double fromHigh,
    double toLow,
    double toHigh,
  ) {
    return (number - fromLow) * (toHigh - toLow) / (fromHigh - fromLow) + toLow;
  }

  @override
  bool shouldRepaint(_StockPriceChartPainter oldDelegate) {
    return series != oldDelegate.series;
  }
}
