import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer buildShimmerCategItem(BuildContext context) {
  return Shimmer.fromColors(
    baseColor:Theme.of(context).primaryColorDark,
    highlightColor:Theme.of(context).highlightColor,
    // baseColor: Colors.grey.shade300,
    // highlightColor: Colors.grey.shade100,
    child: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Container(
          height: 20,
          width: 100,
          color: Colors.white,
        ),
      ],
    ),
  );
}