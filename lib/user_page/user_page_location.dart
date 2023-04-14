import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_ys/settings/settings_menu.dart';
import '/user_page/user_page.dart';

class UserPageLocation extends BeamLocation<BeamState>{
  UserPageLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) =>[
    const BeamPage(
        key: ValueKey('user_page'),
        type: BeamPageType.noTransition,
        child: UserPage(detailsPath: '/user_page/settings',)
    ),
    if (state.uri.pathSegments.length == 2)
       BeamPage(
          key: const ValueKey('user_page/settings'),
          child: SettingsMenu()
      )
  ];
}