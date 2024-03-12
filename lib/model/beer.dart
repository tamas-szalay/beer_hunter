import 'dart:convert';

class Beer {
    final int id;
    final String name;
    final String tagline;
    final String firstBrewed;
    final String description;
    final String imageUrl;
    final String brewersTips;
    final String contributedBy;

    Beer({
        required this.id,
        required this.name,
        required this.tagline,
        required this.firstBrewed,
        required this.description,
        required this.imageUrl,
        required this.brewersTips,
        required this.contributedBy,
    });


  Beer copyWith({
    int? id,
    String? name,
    String? tagline,
    String? firstBrewed,
    String? description,
    String? imageUrl,
    List<String>? foodPairing,
    String? brewersTips,
    String? contributedBy,
  }) {
    return Beer(
      id: id ?? this.id,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      firstBrewed: firstBrewed ?? this.firstBrewed,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      brewersTips: brewersTips ?? this.brewersTips,
      contributedBy: contributedBy ?? this.contributedBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'firstBrewed': firstBrewed,
      'description': description,
      'imageUrl': imageUrl,
      'brewersTips': brewersTips,
      'contributedBy': contributedBy,
    };
  }

  factory Beer.fromMap(dynamic map) {
    return Beer(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      tagline: map['tagline'] ?? '',
      firstBrewed: map['first_brewed'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['image_url'] ?? '',
      brewersTips: map['brewers_tips'] ?? '',
      contributedBy: map['contributed_by'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Beer.fromJson(String source) => Beer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BeerDto(id: $id, name: $name, tagline: $tagline, firstBrewed: $firstBrewed, description: $description, imageUrl: $imageUrl, brewersTips: $brewersTips, contributedBy: $contributedBy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Beer &&
      other.id == id &&
      other.name == name &&
      other.tagline == tagline &&
      other.firstBrewed == firstBrewed &&
      other.description == description &&
      other.imageUrl == imageUrl &&
      other.brewersTips == brewersTips &&
      other.contributedBy == contributedBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      tagline.hashCode ^
      firstBrewed.hashCode ^
      description.hashCode ^
      imageUrl.hashCode ^
      brewersTips.hashCode ^
      contributedBy.hashCode;
  }
}
