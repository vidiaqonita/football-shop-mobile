// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> newsEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String newsEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    int price;
    int stock;
    String description;
    String category;
    String? thumbnail; // <-- UBAH KE String?
    bool isFeatured;
    int userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.stock,
        required this.description,
        required this.category,
        this.thumbnail, 
        required this.isFeatured,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"] ?? "",
        name: json["name"] ?? "No Name",
        price: json["news_views"] ?? 0,
        stock: json["news_views"] ?? 0,
        description: json["description"] ?? "No Description",
        category: json["category"] ?? "new",
        thumbnail: json["thumbnail"] as String?, // <-- CAST to String?
        isFeatured: json["is_featured"] ?? false,
        userId: json["user_id"] ?? 0,
    );
    
    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "stock": stock,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "user_id": userId,
    };
}
