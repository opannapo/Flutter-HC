class HomeEntity {
  ProductSection productSection;
  ArticleSection articleSection;

  HomeEntity({this.productSection, this.articleSection});

  factory HomeEntity.fromJson(Map<String, dynamic> json) {
    var data = json['data'] as List;

    ProductSection p;
    ArticleSection a;

    data.forEach((val) {
      Map<String, dynamic> j = val;
      if (j['section'] == 'products') {
        p = new ProductSection.fromJson(j);
      } else if (j['section'] == 'articles') {
        a = new ArticleSection.fromJson(j);
      }
    });

    return HomeEntity(productSection: p, articleSection: a);
  }
}

class ProductSection {
  String section;
  List<Product> items;

  ProductSection({this.section, this.items});

  factory ProductSection.fromJson(Map<String, dynamic> json) {
    List<Product> products = new List();
    (json['items'] as List).forEach((val) {
      products.add(new Product.fromJson(val));
    });

    return ProductSection(section: json['section'] as String, items: products);
  }
}

class ArticleSection {
  String section;
  String sectionTitle;
  List<Article> items;

  ArticleSection({this.section, this.sectionTitle, this.items});

  factory ArticleSection.fromJson(Map<String, dynamic> json) {
    List<Article> articles = new List();
    (json['items'] as List).forEach((val) {
      articles.add(new Article.fromJson(val));
    });

    return ArticleSection(
        section: json['section'] as String,
        sectionTitle: json['section_title'] as String,
        items: articles);
  }
}

class Product {
  String productName;
  String productImage;
  String link;

  Product({this.productName, this.productImage, this.link});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['product_name'] as String,
      productImage: json['product_image'] as String,
      link: json['link'] as String,
    );
  }
}

class Article {
  String articleTitle;
  String articleImage;
  String link;

  Article({this.articleTitle, this.articleImage, this.link});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      articleTitle: json['article_title'] as String,
      articleImage: json['article_image'] as String,
      link: json['link'] as String,
    );
  }
}
