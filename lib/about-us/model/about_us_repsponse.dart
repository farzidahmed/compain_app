import 'dart:convert';

class AboutResponse {
    bool? status;
    String? message;
    Data? data;

    AboutResponse({
        this.status,
        this.message,
        this.data,
    });

    AboutResponse copyWith({
        bool? status,
        String? message,
        Data? data,
    }) => 
        AboutResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory AboutResponse.fromRawJson(String str) => AboutResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AboutResponse.fromJson(Map<String, dynamic> json) => AboutResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? type;
    String? description;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.type,
        this.description,
        this.createdAt,
        this.updatedAt,
    });

    Data copyWith({
        int? id,
        String? type,
        String? description,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Data(
            id: id ?? this.id,
            type: type ?? this.type,
            description: description ?? this.description,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: json["type"],
        description: json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
