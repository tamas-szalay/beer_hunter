import 'package:auto_route/auto_route.dart';
import 'package:beer_hunter/model/beer.dart';
import 'package:beer_hunter/usecase/details/details_view.dart';
import 'package:beer_hunter/usecase/result/result_view.dart';
import 'package:beer_hunter/usecase/selection/selection_view.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SelectionPage extends StatelessWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SelectionView();
  }
}

@RoutePage()
class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.beers}) : super(key: key);
  final List<Beer> beers;

  @override
  Widget build(BuildContext context) {
    return ResultView(beers: beers);
  }
}

@RoutePage()
class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.beer}) : super(key: key);
  final Beer beer;
  @override
  Widget build(BuildContext context) {
    return DetailsView(beer: beer);
  }
}
