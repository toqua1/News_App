import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer buildShimmerNewsCard(BuildContext context) {
        return Shimmer.fromColors(
            baseColor:Theme.of(context).primaryColorDark,
            highlightColor:Theme.of(context).highlightColor,
          child:const SizedBox(
          height: 190,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40)
                )
            ),
            // elevation: 10,
            margin: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            color: Colors.white,
          ),
          ),
        );
}