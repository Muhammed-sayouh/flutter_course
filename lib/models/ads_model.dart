import 'dart:convert';

class AdsModel {
    int status;
    List<SliderImages> data;

    AdsModel({
        required this.status,
        required this.data,
    });

    factory AdsModel.fromRawJson(String str) => AdsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
        status: json["status"],
        data: List<SliderImages>.from(json["data"].map((x) => SliderImages.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class SliderImages {
    int id;
    String image;
    String link;

    SliderImages({
        required this.id,
        required this.image,
        required this.link,
    });

    factory SliderImages.fromRawJson(String str) => SliderImages.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SliderImages.fromJson(Map<String, dynamic> json) => SliderImages(
        id: json["id"],
        image: json["image"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "link": link,
    };
}
