import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/configuration/configuration_page.dart';
import 'package:listinha/src/configuration/services/configuration_service.dart';
import 'package:listinha/src/home/home_module.dart';
import 'package:listinha/src/shared/services/realm/realm_config.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.instance<Realm>(Realm(config)),
        Bind.factory<ConfigurationService>(
          (i) => ConfigurationServiceImpl(i.get<Realm>()),
        ),
        Bind.singleton(
          (i) => AppStore(i.get<ConfigurationService>()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        )
      ];
}
