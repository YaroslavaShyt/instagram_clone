import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_ys/feed/feed_scroll_page.dart';

class FeedScrollPageLocation extends BeamLocation<BeamState> {
  FeedScrollPageLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    const BeamPage(
      key: ValueKey('feed_scroll_page'),
      type: BeamPageType.noTransition,
      child: FeedScrollPage(),
    ),
  ];
}