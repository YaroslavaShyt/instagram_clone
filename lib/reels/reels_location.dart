import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:instagram_clone_ys/reels/reels.dart';

class ReelsLocation extends BeamLocation<BeamState>{
  ReelsLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) =>[
    const BeamPage(
        key: ValueKey('reels'),
        type: BeamPageType.noTransition,
        child: Reels()
    ),
  ];
}