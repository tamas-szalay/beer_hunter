class BeerDto {
    final int id;
    final String name;
    final String tagline;
    final String firstBrewed;
    final String description;
    final Uri imageUrl;
    final List<String> foodPairing;
    final String brewersTips;
    final String contributedBy;

    BeerDto({
        required this.id,
        required this.name,
        required this.tagline,
        required this.firstBrewed,
        required this.description,
        required this.imageUrl,
        required this.foodPairing,
        required this.brewersTips,
        required this.contributedBy,
    });

}
