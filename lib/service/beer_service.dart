import 'package:beer_hunter/model/beer.dart';
import 'package:beer_hunter/networking/api_connection.dart';
import 'package:beer_hunter/networking/api_endpoints.dart';

abstract class BeerService {
  Future<List<Beer>> getRandomBeers(int count);
}

class BeerServiceImpl implements BeerService {
  final ApiConnection _apiConnection;

  BeerServiceImpl(this._apiConnection);

  @override
  Future<List<Beer>> getRandomBeers(int count) async {
    final response = await _apiConnection.restGet(path: ApiEndpoints.beers);

    final beers = List<Beer>.from(response.data.map(Beer.fromMap));

    
    beers.shuffle();

    return beers.take(10).toList();
  }
}
