import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'search.dart';

class SearchLocation extends BeamLocation<BeamState> {
  SearchLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
     BeamPage(
      key: const ValueKey('search'),
      title: 'Tab A',
      type: BeamPageType.noTransition,
      child: SearchPage(),
    ),
  ];
}