class BannerResponse {
  final int? status;
  final List<BannerItem>? data;

  BannerResponse({
    this.status,
    this.data,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    return BannerResponse(
      status: json['status'],
      data: json['data'] != null
          ? List<BannerItem>.from(
              json['data'].map((x) => BannerItem.fromJson(x)),
            )
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.map((x) => x.toJson()).toList(),
    };
  }
}

class BannerItem {
  final int? id;
  final String? image;
  final String? link;

  BannerItem({
    this.id,
    this.image,
    this.link,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json['id'],
      image: json['image'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'link': link,
    };
  }
}