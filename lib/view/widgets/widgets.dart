import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {

  final int rating;
  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.star, color: rating >= 1 ? const Color(0xffFFCE00):const Color(0xffBDC3C7), size: 18,),
        Icon(Icons.star, color: rating >= 2 ? const Color(0xffFFCE00):const Color(0xffBDC3C7), size: 18,),
        Icon(Icons.star, color: rating >= 3 ? const Color(0xffFFCE00):const Color(0xffBDC3C7), size: 18,),
        Icon(Icons.star, color: rating >= 4 ? const Color(0xffFFCE00):const Color(0xffBDC3C7), size: 18,),
        Icon(Icons.star, color: rating == 5 ? const Color(0xffFFCE00):const Color(0xffBDC3C7), size: 18,)
      ],
    );
  }
}
