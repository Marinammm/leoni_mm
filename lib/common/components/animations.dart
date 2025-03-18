import 'package:flutter/material.dart';
import 'texts.dart';

class AnimatedCard extends StatefulWidget {
  final String imagePath;
  final String? text;
  final BoxFit? fit;
  final bool reverse;
  final double height;
  final double width;
  const AnimatedCard({
    super.key,
    required this.imagePath,
    this.text,
    this.fit,
    this.reverse = false,
    this.height = 200.0,
    this.width = 200.0
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
  AnimationController(vsync: this, duration: const Duration(seconds: 4))
    ..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween(
    begin: widget.reverse ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                width: widget.width,
                height: widget.height,
                fit: widget.fit,
              ),
              SizedBox(height: 10.0,),
              if (widget.text != null) SansBold(widget.text, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}