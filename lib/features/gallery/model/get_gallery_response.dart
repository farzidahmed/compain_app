import 'dart:convert';

class GetGalleryResponse {
    String? status;
    List<String>? images;

    GetGalleryResponse({
        this.status,
        this.images,
    });

    GetGalleryResponse copyWith({
        String? status,
        List<String>? images,
    }) => 
        GetGalleryResponse(
            status: status ?? this.status,
            images: images ?? this.images,
        );

    factory GetGalleryResponse.fromRawJson(String str) => GetGalleryResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetGalleryResponse.fromJson(Map<String, dynamic> json) => GetGalleryResponse(
        status: json["status"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    };
}
