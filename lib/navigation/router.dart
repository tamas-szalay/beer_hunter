import 'package:auto_route/auto_route.dart';
import 'package:beer_hunter/navigation/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SelectionRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: ResultRoute.page,
        ),
        AutoRoute(
          page: DetailsRoute.page,
          fullscreenDialog: true,
        )
      ];
}
