import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/services/firestore_service.dart';
import '../../../shared/services/geo_locator_service.dart';
import '../../../shared/services/google_oauth.dart';
import '../views/pages/enter_phone.dart';
import 'user_state.dart';

abstract class UserEvent {}

class LoginEvent extends UserEvent {
  final BuildContext context;

  LoginEvent(this.context);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {

    //LOGIN EVENT
    on<LoginEvent>((event, emit) async {
      GoogleOauth auth = GoogleOauth();
      FirestoreService firestoreService = FirestoreService();

      try {
        UserCredential userCred = await auth.signInWithGoogle();

        //user already exists in database
        if (userCred.user != null) {
          String email = userCred.user!.email!;
          String userName = userCred.user!.displayName!;

          // check if user already exists in firestore
          bool userExists = await firestoreService.checkIfUserExists(email);

          // add user to the firestore if user not exist already
          if (!userExists) {
            await firestoreService.addUserToFirestore(
                email: email, name: userName);
          }

          // google oauth done -> get phone number from EnterPhone screen and update in firestore using email (callback function)
          Navigator.pushReplacement(
            event.context,
            MaterialPageRoute(
                builder: (context) => EnterPhone(
                      onPhoneNumberEntered: (phoneNumber) async {
                        await firestoreService.updateUserPhoneNumber(
                            userCred.user!.email!, phoneNumber);
                      },
                    ),), // Navigate to the next screen
          );

                  String address = await fetchAddress();

          emit(UserState.init(userName, email,address));
        }
      } catch (e) {
        print("Error signing in with Google: $e");
      }
    });
  }
}


Future<String> fetchAddress() async {
  String address = await getAddressFromLocation();
  return address;
}