import 'package:auto_route/auto_route.dart';
import 'package:beer_hunter/layout/screen_content_widget.dart';
import 'package:beer_hunter/usecase/base_view.dart';
import 'package:beer_hunter/usecase/result/result_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:beer_hunter/model/beer.dart';
import 'package:beer_hunter/navigation/router.gr.dart';

class ResultView extends StatelessWidget {
  final List<Beer> beers;

  const ResultView({
    Key? key,
    required this.beers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ResultViewmodel>(
      model: ResultViewmodel(beers),
      onModelReady: (ResultViewmodel model) => {},
      builder: (BuildContext context, ResultViewmodel model, _) => Scaffold(
        appBar: AppBar(
          title: const Text('Liked beers'),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.replay_outlined,
              ),
              onPressed: () {
                context.router.replace(const SelectionRoute());
              },
            )
          ],
        ),
        body: ScreenContentWidget(
            state: model.screenContentState,
            config: ScreenContentConfig(),
            isScrollable: true,
            child: _buildBody(context)),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: beers
            .map((beer) => ListTile(
                  leading:
                      Hero(tag: beer.id, child: Image.network(beer.imageUrl)),
                  title: Text(beer.name),
                  subtitle: Text(beer.tagline),
                  onTap: () => context.router.push(DetailsRoute(beer: beer)),
                ))
            .toList(),
      ),
    );
  }
}
