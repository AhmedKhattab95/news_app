import 'package:get_it/get_it.dart';
import 'package:news_app/Core/managers/managers_lib.dart';

import 'managers/managers_lib.dart';
import 'repositories/repository_lib.dart';

/// class that should be called at first of application to do injection
/// this is dependant on get_it
class InjectionSetup implements IInjectionSetup {
  GetIt get _getIt => GetIt.I;

  ///region singleton
  static InjectionSetup? _instance;

  static InjectionSetup get Instance => _instance ??= InjectionSetup._();

  InjectionSetup._();

  ///endregion

  @override
  void setup() {
    registerSingleton<ICacheManager>(CacheManager());
    registerSingleton<IConnectivityManager>(ConnectivityManager());
    registerSingleton<IArticlesRepository>(ArticlesRepository());
    registerSingleton<IArticleManager>(ArticleManager(get<IArticlesRepository>()));
  }

  @override
  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    _getIt.registerFactory<T>(factoryFunc, instanceName: instanceName);
  }

  @override
  void registerSingleton<T extends Object>(T instance,
      {String? instanceName, bool? signalsReady, DisposingFunc<T>? dispose}) {
    _getIt.registerSingleton<T>(instance,
        instanceName: instanceName,
        signalsReady: signalsReady,
        dispose: dispose);
  }

  @override
  T get<T extends Object>() {
    return _getIt.get<T>();
  }

  @override
  Future<T> getAsync<T extends Object>() {
    return _getIt.getAsync<T>();
  }
}

abstract class IInjectionSetup {
  /// register dependancies of project in this function
  /// should be called before project runs
  void setup();

  /// get specific object that is registered in app
  T get<T extends Object>();

  /// get specific object that is registered in app with future work
  Future<T> getAsync<T extends Object>();

  /// register classes as singleton
  void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? dispose,
  });

  /// register classes as factory
  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  });
}
