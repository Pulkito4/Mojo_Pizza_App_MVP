import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mojo_pizza_app_mvp/modules/eatClubScreen/eatClub.dart';
import 'package:mojo_pizza_app_mvp/modules/home/views/pages/home_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/all%20offers/FlatOff/flatOff.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/all%20offers/allOffers_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/freebies/freebies.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/freebies/umbrella.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/freebies/umbrella1.dart';
import 'package:mojo_pizza_app_mvp/modules/referral/pages/referral_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/views/pages/sign_up_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/offerScreen/offerScreen.dart';

import 'modules/account/views/pages/account_screen.dart';
import 'modules/home/views/pages/home_screen.dart';
import 'modules/splash/views/pages/splash_screen.dart';

// import 'package:mojo_pizza_app_mvp/modules/adaptive_layout/adaptive_layout.dart';
// import 'package:mojo_pizza_app_mvp/modules/adaptive_layout/desktop_layout.dart';
// import 'package:mojo_pizza_app_mvp/modules/adaptive_layout/mobile_layout.dart';
// import 'package:mojo_pizza_app_mvp/modules/adaptive_layout/tab_layout.dart';
// import 'package:mojo_pizza_app_mvp/modules/splash/views/pages/splash_screen.dart';

/* void main() {
  runApp(const MaterialApp(
    home: AdaptiveLayout(
        desktopLayout: DesktopLayout(),
        mobileLayout: MobileLayout(),
        tabLayout: TabLayout()),
  ));
}
 */

/* void main() {
  runApp(const MaterialApp(
    home: SplashScreen(),
  ));
} */

void main() {
  runApp(MaterialApp(
    // home: Referral(),
    home: Offerscreen()
    // Offerscreen(),
  ));
}

