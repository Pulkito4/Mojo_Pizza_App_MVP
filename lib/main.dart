import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mojo_pizza_app_mvp/modules/referral/pages/referral_screen.dart';

import 'modules/account/views/pages/account_screen.dart';
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
  runApp(const MaterialApp(
    home: Referral(),
  ));
}