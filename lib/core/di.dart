import 'package:beer_hunter/networking/api_connection.dart';
import 'package:beer_hunter/networking/error_parser.dart';
import 'package:beer_hunter/networking/remote_api_connection.dart';
import 'package:beer_hunter/service/beer_service.dart';
import 'package:kiwi/kiwi.dart';

extension SetupDI on KiwiContainer {
  static setup() async {
    final container = KiwiContainer();

    container.registerFactory<ErrorParser>((container) => BasicErrorParser());
    container.registerFactory<ApiConnection>((container) =>
        RemoteApiConnection('https://api.punkapi.com', container.resolve()));
    container.registerFactory<BeerService>(
        (container) => BeerServiceImpl(container.resolve()));
  }
}

class DI {
  DI._();

  static T resolve<T>() => KiwiContainer().resolve();
}
