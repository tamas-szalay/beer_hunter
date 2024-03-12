import 'package:beer_hunter/model/beer.dart';
import 'package:beer_hunter/usecase/viewmodel.dart';

class ResultViewmodel extends BaseViewmodel<List<Beer>> {
  final List<Beer> beers;

  ResultViewmodel(this.beers);
  @override
  bool get hasData => beers.isNotEmpty;
}
