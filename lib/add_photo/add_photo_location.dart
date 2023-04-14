import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:instagram_clone_ys/add_photo/add_photo.dart';

class AddPhotoLocation extends BeamLocation<BeamState> {
  AddPhotoLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
    const BeamPage(
      key: ValueKey('add_photo'),
      type: BeamPageType.noTransition,
      child: AddPhoto(),
    ),
  ];
}