import 'dart:convert';

class GetProgrammeImageResponse {
    String? status;
    List<String>? images;

    GetProgrammeImageResponse({
        this.status,
        this.images,
    });

    GetProgrammeImageResponse copyWith({
        String? status,
        List<String>? images,
    }) => 
        GetProgrammeImageResponse(
            status: status ?? this.status,
            images: images ?? this.images,
        );

    factory GetProgrammeImageResponse.fromRawJson(String str) => GetProgrammeImageResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetProgrammeImageResponse.fromJson(Map<String, dynamic> json) => GetProgrammeImageResponse(
        status: json["status"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    };
}
