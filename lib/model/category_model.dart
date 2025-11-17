class Category{
  String title;
  String imagePath;
  String id;
  Category({required this.title , required this.imagePath,required this.id});

  static List<Category> categories = [
    Category(
        title: "General", id: "general",
        imagePath: "assets/images/general.png"),
    Category(
        title: "Business", id: "business",
        imagePath: "assets/images/business.png"),
    Category(
        title: "Sports", id: "sports",
        imagePath: "assets/images/sports.png"),
    Category(
        title: "Technology", id: "technology",
        imagePath: "assets/images/technology.png"),
    Category(
        title: "Health", id: "health",
        imagePath: "assets/images/health.png"),
    Category(
        title: "Science", id: "science",
        imagePath: "assets/images/science.png"),
    Category(
        title: "Entertainment", id: "entertainment",
        imagePath: "assets/images/entertainment.png")
  ];
}