import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lightyear_chart_animation/page_indicator.dart';
import 'package:lightyear_chart_animation/stock_details.dart';
import 'package:lightyear_chart_animation/stock_header.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _controller = ScrollController();

  late double _headerMaxHeight;

  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleScrollUpdate);
  }

  @override
  void didChangeDependencies() {
    _headerMaxHeight = MediaQuery.sizeOf(context).height * 0.75;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleScrollUpdate() {
    if (_isAnimating) {
      return;
    }

    final threshold = _headerMaxHeight * 3 / 4;

    final scrollPosition = _controller.position;

    double? scrollTo;

    switch (scrollPosition.userScrollDirection) {
      case ScrollDirection.reverse:
        if (scrollPosition.pixels < threshold) {
          scrollTo = threshold;
        }

      case ScrollDirection.forward:
        if (scrollPosition.pixels <= threshold) {
          scrollTo = 0;
        }

      case ScrollDirection.idle:
      // ignore
    }

    if (scrollTo != null) {
      _isAnimating = true;
      _controller
          .animateTo(
            scrollTo,
            duration: const Duration(milliseconds: 750),
            curve: Curves.ease,
          )
          .then((value) => _isAnimating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      physics: const ClampingScrollPhysics(),
      slivers: [
        StockHeader(maxHeight: _headerMaxHeight),
        const PageIndicator(),
        const StockDetails(),
      ],
    );
  }
}
