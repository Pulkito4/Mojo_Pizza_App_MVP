import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mojo_pizza_app_mvp/modules/cart/views/pages/cart_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/home/views/pages/home_screen.dart';
import 'package:mojo_pizza_app_mvp/firebase_options.dart';
import 'package:mojo_pizza_app_mvp/modules/menu/views/pages/menu_screen.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/views/pages/sign_up_screen.dart';

import 'modules/account/views/pages/account_screen.dart';
import 'modules/cart/bloc/cart_bloc.dart';
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

/* void main() {
  runApp(MaterialApp(
    // home: Referral(),
    home: Offerscreen()
    // Offerscreen(),
  runApp( MaterialApp(
    home: HomeScreen(),
  ));
} */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CartBloc(FirebaseFirestore.instance),
      )
    ],
    child: MaterialApp(
      home: SplashScreen(),
    ),
  ));
}
