class SubCategory {
  final String subCategory;
  final int categoryId;

  SubCategory({
    required this.subCategory,
    required this.categoryId
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
        subCategory: json["subCategory"],
        categoryId: json["categoryId"]);
  }
}