import 'package:beer_hunter/layout/screen_content_widget.dart';
import 'package:beer_hunter/layout/spacer.dart';
import 'package:beer_hunter/usecase/base_view.dart';
import 'package:beer_hunter/usecase/details/details_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:beer_hunter/model/beer.dart';

class DetailsView extends StatelessWidget {
  final Beer beer;

  const DetailsView({
    Key? key,
    required this.beer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailsViewmodel>(
      model: DetailsViewmodel(),
      onModelReady: (DetailsViewmodel model) => {},
      builder: (BuildContext context, DetailsViewmodel model, _) => Scaffold(
        appBar: AppBar(),
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
        children: [
          SizedBox(
              height: 300,
              child: Hero(tag: beer.id, child: Image.network(beer.imageUrl))),
          const SizedSpacer(),
          Text(beer.description),
          const SizedSpacer(),
          const Text('Tips:'),
          Text(beer.brewersTips),
          const SizedSpacer(),
          const Text('First brewed:'),
          Text(beer.firstBrewed),
        ],
      ),
    );
  }
}
