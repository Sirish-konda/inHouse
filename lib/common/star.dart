import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Stars extends StatelessWidget {
  final double rating;

  const Stars({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (context, _) {
        return Icon(
          Icons.star,
          color: Colors.amberAccent,
        );
      },
      direction: Axis.horizontal,
      itemCount: 5,
      rating: rating,
      itemSize: 15,
    );
  }
}
