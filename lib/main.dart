import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mojo_pizza_app_mvp/firebase_options.dart';
import 'package:mojo_pizza_app_mvp/modules/sign_up/bloc/user_bloc.dart';

import 'modules/cart/bloc/cart_bloc.dart';
import 'modules/splash/views/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    // Check if Firebase is already initialized
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    if (e is FirebaseException && e.code == 'duplicate-app') {
      // Firebase is already initialized, continue
      print('Firebase already initialized');
    } else {
      // Re-throw other exceptions
      rethrow;
    }
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CartBloc(FirebaseFirestore.instance),
      ),
      BlocProvider(
        create: (context) => UserBloc(),
      )
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  ));
}
