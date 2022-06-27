import 'package:flutter/material.dart';

class SingleSlidingImage extends StatefulWidget {
  SingleSlidingImage({
    required this.image,
  });

  final String image;

  @override
  State<SingleSlidingImage> createState() => _SingleSlidingImageState();
}

class _SingleSlidingImageState extends State<SingleSlidingImage> {
  final _controller = ScrollController();
  late double _height;

  _slide() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final divider = 
      setState((){
        
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}