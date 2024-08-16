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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: SplashScreen(),
    ),
  ));
}
