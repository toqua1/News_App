import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Column buildShimmerSlider(BuildContext context) {
  return Column(
    children: [
      Shimmer.fromColors(
        baseColor:Theme.of(context).primaryColorDark,
        highlightColor:Theme.of(context).highlightColor,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          height: 200.0, // Adjust the height as needed
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(6, (index) {
          return Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.2),
            ),
          );
        }),
      ),
    ],
  );
}