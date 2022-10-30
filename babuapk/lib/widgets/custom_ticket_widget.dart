import 'package:flutter/material.dart';

class TicketWidget extends StatefulWidget {
  final double width;
  final double height;
  final double area;
  final double curveSize;
  final Widget child;
  final Color color;
  final bool isCornerRounded;

  const TicketWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.child,
      required this.area,
      required this.curveSize,
      this.color = Colors.white,
      this.isCornerRounded = false});

  @override
  TicketWidgetState createState() => TicketWidgetState();
}

class TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipBehavior: Clip.hardEdge,
      clipper: TicketClipper(area: widget.area, curveSize: widget.curveSize),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: widget.isCornerRounded
                ? BorderRadius.circular(20.0)
                : BorderRadius.circular(0.0)),
        child: widget.child,
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  final double area;
  final double curveSize;

  TicketClipper({required this.area, required this.curveSize});

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(center: Offset(area, 0.0), radius: curveSize));
    path.addOval(
        Rect.fromCircle(center: Offset(area, size.height), radius: curveSize));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
