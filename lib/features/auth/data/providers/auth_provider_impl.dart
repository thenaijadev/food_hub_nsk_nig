import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_food_hub_nsk_nig/core/network/typedef.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/interfaces/auth_provider.dart';

class AuthProviderImpl implements AuthProvider {
  AuthProviderImpl({required this.supabase});
  final SupabaseClient supabase;
  @override
  EitherUser signUpWithEmail(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'username': fullName},
      );
      // final Session? session = res.session;
      final User? user = res.user;

      return right(user);
    } on AuthException catch (e) {
      print(e.message);
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  String _generateRandomString() {
    final random = Random.secure();
    return base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
  }

  @override
  EitherUser signUpWithGoogle() async {
    try {
      // Just a random string
      final rawNonce = _generateRandomString();
      final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

      var clientId = defaultTargetPlatform == TargetPlatform.iOS
          ? '932400961744-p7i2782qiu4kdvsnlc6p5u7qqs8gakld.apps.googleusercontent.com'
          : "932400961744-cjk4r9kqjbgia1a75g3sq7ofh52oqh41.apps.googleusercontent.com";

      final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

      const discoveryUrl =
          'https://accounts.google.com/.well-known/openid-configuration';

      const appAuth = FlutterAppAuth();

      final result = await appAuth.authorize(
        AuthorizationRequest(
          clientId,
          redirectUrl,
          discoveryUrl: discoveryUrl,
          nonce: hashedNonce,
          scopes: [
            'openid',
            'email',
          ],
        ),
      );

      if (result == null) {
        throw 'No result';
      }

      final tokenResult = await appAuth.token(
        TokenRequest(
          clientId,
          redirectUrl,
          authorizationCode: result.authorizationCode,
          discoveryUrl: discoveryUrl,
          codeVerifier: result.codeVerifier,
          nonce: result.nonce,
          scopes: [
            'openid',
            'email',
          ],
        ),
      );

      final idToken = tokenResult?.idToken;

      if (idToken == null) {
        throw 'No idToken';
      }

      final res = await supabase.auth.signInWithIdToken(
        provider: Provider.google,
        idToken: idToken,
        nonce: rawNonce,
      );

      final User? user = res.user;
      return right(user);
    } on AuthException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherUser login({required String email, required String password}) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      // final Session? session = res.session;
      final User? user = res.user;

      return right(user);
    } on AuthException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  EitherUser signInWithGoogle() async {
    try {
      // Perform web based OAuth login
      await supabase.auth.signInWithOAuth(
        Provider.github,
        redirectTo: kIsWeb ? null : 'io.supabase.flutter://callback',
      );

      final user = supabase.auth.currentUser;
      return right(user);
    } on AuthException catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }

// Listen to auth state changes in order to detect when ther OAuth login is complete.
    // supabase.auth.onAuthStateChange.listen((data) {
    //   final AuthChangeEvent event = data.event;
    //   if (event == AuthChangeEvent.signedIn) {
    //     // Do something when user sign in
    //   }
    // });
  }

  @override
  EitherBool isLoggedIn() async {
    try {
      final currentUser = supabase.auth.currentSession;

      if (currentUser != null) {
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
