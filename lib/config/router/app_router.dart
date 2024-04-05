import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/error_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/screens/email_verification_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/screens/home_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/screens/landing_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/screens/login_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/screens/phone_number_screen.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/screens/registration_screen.dart';
import 'package:the_food_hub_nsk_nig/features/cart/models/meal_item.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/screens/cart_screen.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/presentation/drinks.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/presentation/food_type.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/presentation/protein.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/presentation/soups.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/pages/home.dart';
import 'package:the_food_hub_nsk_nig/features/payment/presentation/screens/add_new_card_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.landing:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );
      case Routes.baseScreen:
        return MaterialPageRoute(
          builder: (_) => const BaseScreen(),
        );
      case Routes.registration:
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.emailVerification:
        return MaterialPageRoute(
          builder: (_) => const EmailVerificationScreen(),
        );

      case Routes.soups:
        var data = routeSettings.arguments as List<MealItemModel>;
        return MaterialPageRoute(
          builder: (_) => SoupsScreen(mealList: data),
        );

      case Routes.meats:
        var data = routeSettings.arguments as List<MealItemModel>;

        return MaterialPageRoute(
          builder: (_) => MeatScreen(mealList: data),
        );

      case Routes.drinks:
        var data = routeSettings.arguments as List<MealItemModel>;

        return MaterialPageRoute(
          builder: (_) => DrinksScreen(mealList: data),
        );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case Routes.payment:
        return MaterialPageRoute(
          builder: (_) => const AddNewCardScreen(),
        );
      case Routes.foodType:
        var data = routeSettings.arguments as Food;
        return MaterialPageRoute(
          builder: (_) => FoodTypeScreen(
            food: data,
          ),
        );
      case Routes.verifyPhoneNo:
        return MaterialPageRoute(
          builder: (_) => const PhoneNumberScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
