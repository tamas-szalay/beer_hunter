import 'package:beer_hunter/model/beer.dart';
import 'package:beer_hunter/service/beer_service.dart';
import 'package:beer_hunter/usecase/viewmodel.dart';

class SelectionViewmodel extends BaseViewmodel<List<Beer>> {
  Function(List<Beer> beers) onFinish;

  final BeerService _beerService;

  SelectionViewmodel(this._beerService, this.onFinish);

  List<Beer>? _beers;
  Beer? beer;

  List<Beer> likedBeers = [];

  @override
  bool get hasData => beer != null;

  @override
  Future<void> performLoading() async {
    try {
      _beers = await _beerService.getRandomBeers(10);
      _next();
    } catch (e) {
      error = e;
    }
  }

  void _next() {
    if (_beers?.isNotEmpty == true) {
      beer = _beers?.removeAt(0);
      notifyListeners();
    } else {
      onFinish(likedBeers);
    }
  }

  void like() {
    likedBeers.add(beer!);
    _next();
  }

  void dislike() {
    _next();
  }
}
