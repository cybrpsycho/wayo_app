import "package:flutter/material.dart";

class ImageSlider extends StatefulWidget {
  final List<String> imagePaths;
  final Duration duration;
  final bool isReversed;

  const ImageSlider({
    super.key,
    required this.imagePaths,
    required this.duration,
    this.isReversed = false,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final _scrollController = ScrollController();

  double get _scrollOffset => widget.duration.inSeconds * 150;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_scrollController.hasClients == false) return;
      _scrollController.animateTo(
        _scrollOffset,
        duration: widget.duration,
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      reverse: widget.isReversed,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => _buildImages(widget.imagePaths),
    );
  }

  Widget _buildImages(List<String> paths) {
    return Row(
      children: paths
          .map(
            (path) => Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 8,
                  color: Colors.black,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
              ),
              child: Image.asset("assets/images/splash/$path"),
            ),
          )
          .toList(),
    );
  }
}
