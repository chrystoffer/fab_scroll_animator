import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FABScrollAnimator extends StatefulWidget {
  final ScrollController scrollController;
  final Widget Function(bool isFABExtended) onScroll;
  final double collapsedWidth;
  final Duration animationDuration;

  const FABScrollAnimator({super.key, required this.scrollController, required this.onScroll, this.collapsedWidth = 55.0, this.animationDuration = const Duration(milliseconds: 300)});

  @override
  State<FABScrollAnimator> createState() => _FABScrollAnimatorState();
}

class _FABScrollAnimatorState extends State<FABScrollAnimator> {
  final ValueNotifier<bool> extended = ValueNotifier<bool>(true);

  Size? size;

  @override
  void initState() {
    widget.scrollController.addListener(_onScrollChanged);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScrollChanged);
    super.dispose();
  }

  void _onScrollChanged() {
    extended.value = (widget.scrollController.position.userScrollDirection == ScrollDirection.idle || widget.scrollController.position.userScrollDirection == ScrollDirection.forward);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
          if (renderBox != null && size == null) {
            setState(() {
              size = renderBox.size;
            });
          }
        });
        return ValueListenableBuilder<bool>(valueListenable: extended, builder: (context, value, child) => AnimatedContainer(width: extended.value ? size?.width : widget.collapsedWidth, duration: widget.animationDuration, child: widget.onScroll(value)));
      },
    );
  }
}
