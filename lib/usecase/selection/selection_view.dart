import 'package:auto_route/auto_route.dart';
import 'package:beer_hunter/core/di.dart';
import 'package:beer_hunter/layout/screen_content_widget.dart';
import 'package:beer_hunter/layout/spacer.dart';
import 'package:beer_hunter/navigation/router.gr.dart';
import 'package:beer_hunter/usecase/base_view.dart';
import 'package:beer_hunter/usecase/selection/selection_viewmodel.dart';
import 'package:flutter/material.dart';

class SelectionView extends StatelessWidget {
  const SelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectionViewmodel>(
      model: SelectionViewmodel(
          DI.resolve(), (beers) => context.router.replace(ResultRoute(beers: beers))),
      onModelReady: (SelectionViewmodel model) => model.load(),
      builder: (BuildContext context, SelectionViewmodel model, _) => Scaffold(
        appBar: AppBar(
          title: const Text('Beer Hunter'),
        ),
        body: ScreenContentWidget(
            state: model.screenContentState,
            config: ScreenContentConfig(),
            isScrollable: false,
            child: _buildBody(context, model)),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    SelectionViewmodel model,
  ) {
    if (model.hasData) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Image.network(model.beer!.imageUrl)),
            const SizedSpacer(size: SpacerSize.large),
            Row(
              children: [
                OutlinedButton(
                    onPressed: model.dislike,
                    child: const Icon(Icons.thumb_down)),
                const Spacer(),
                OutlinedButton(
                    onPressed: model.like, child: const Icon(Icons.thumb_up)),
              ],
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
