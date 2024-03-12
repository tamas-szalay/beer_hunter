// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:beer_hunter/model/beer.dart' as _i4;
import 'package:beer_hunter/navigation/navigation_pages.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailsPage(
          key: args.key,
          beer: args.beer,
        ),
      );
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>();
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ResultPage(
          key: args.key,
          beers: args.beers,
        ),
      );
    },
    SelectionRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SelectionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailsPage]
class DetailsRoute extends _i2.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i3.Key? key,
    required _i4.Beer beer,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            beer: beer,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const _i2.PageInfo<DetailsRouteArgs> page =
      _i2.PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.beer,
  });

  final _i3.Key? key;

  final _i4.Beer beer;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, beer: $beer}';
  }
}

/// generated route for
/// [_i1.ResultPage]
class ResultRoute extends _i2.PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    _i3.Key? key,
    required List<_i4.Beer> beers,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          ResultRoute.name,
          args: ResultRouteArgs(
            key: key,
            beers: beers,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const _i2.PageInfo<ResultRouteArgs> page =
      _i2.PageInfo<ResultRouteArgs>(name);
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.beers,
  });

  final _i3.Key? key;

  final List<_i4.Beer> beers;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, beers: $beers}';
  }
}

/// generated route for
/// [_i1.SelectionPage]
class SelectionRoute extends _i2.PageRouteInfo<void> {
  const SelectionRoute({List<_i2.PageRouteInfo>? children})
      : super(
          SelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectionRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
