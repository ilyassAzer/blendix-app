// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Provider.dart';

// **************************************************************************
// BlocProviderGenerator
// **************************************************************************

class $Provider extends Provider {
  static T of<T extends Bloc>() {
    switch (T) {
      case NavigationManager:
        {
          return BlocCache.getBlocInstance(
              "NavigationManager", () => NavigationManager.instance());
        }
      case ListManager:
        {
          return BlocCache.getBlocInstance(
              "ListManager", () => ListManager.instance());
        }
      case BlendManager:
        {
          return BlocCache.getBlocInstance(
              "BlendManager", () => BlendManager.instance());
        }
      case PostManager:
        {
          return BlocCache.getBlocInstance(
              "PostManager", () => PostManager.instance());
        }
    }
    return null;
  }

  static void dispose<T extends Bloc>() {
    switch (T) {
      case NavigationManager:
        {
          BlocCache.dispose("NavigationManager");
          break;
        }
      case ListManager:
        {
          BlocCache.dispose("ListManager");
          break;
        }
      case BlendManager:
        {
          BlocCache.dispose("BlendManager");
          break;
        }
      case PostManager:
        {
          BlocCache.dispose("PostManager");
          break;
        }
    }
  }
}
