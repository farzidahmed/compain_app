import 'dart:convert';

class CarasoulResponse {
    String? status;
    List<String>? images;

    CarasoulResponse({
        this.status,
        this.images,
    });

    CarasoulResponse copyWith({
        String? status,
        List<String>? images,
    }) => 
        CarasoulResponse(
            status: status ?? this.status,
            images: images ?? this.images,
        );

    factory CarasoulResponse.fromRawJson(String str) => CarasoulResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CarasoulResponse.fromJson(Map<String, dynamic> json) => CarasoulResponse(
        status: json["status"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    };
}
