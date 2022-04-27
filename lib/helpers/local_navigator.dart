import 'package:flutter/material.dart';

import 'package:nftapp/routing/router.dart';
import 'package:nftapp/routing/routes.dart';

Navigator localNavigator() => const Navigator(
      initialRoute: vestingPageRoute,
      onGenerateRoute: generateRoute,
    );
