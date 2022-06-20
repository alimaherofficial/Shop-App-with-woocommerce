class AllProductModdel {
  List<ProducteModel> products = [];

  AllProductModdel.fromJson(List<dynamic> json) {
    products = json.map((e) => ProducteModel.fromJson(e)).toList();

    // json.forEach((element) {
    //   products.add(element);
    // });
  }
}

class ProducteModel {
  int? id;
  String? name;
  String? price;
  String? status;
  ImagesModel? images;
  Categorie? categories;
  ProducteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    status = json['status'];
    images = ImagesModel.fromJson(json['images']);
    categories = Categorie.fromJson(json['categories']);
  }
}

class ImagesModel {
  List<ImageModel>? images = [];
  ImagesModel.fromJson(List<dynamic> json) {
    images = json.map((e) => ImageModel.fromJson(e)).toList();
  }
}

class ImageModel {
  String? src;
  // String? name;
  ImageModel.fromJson(Map<String, dynamic> json) {
    src = json['src'];
    // name = json['name'];
  }
}

class Categorie {
  List<Categoriesmodel>? categories = [];
  Categorie.fromJson(List<dynamic> json) {
    categories = json.map((e) => Categoriesmodel.fromJson(e)).toList();
  }
}

class Categoriesmodel {
  int? id;
  String? name;
  // String? name;
  Categoriesmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // name = json['name'];
  }
}








// class Items {
//   final List<Items> items;

//   Items({required this.items});

//   factory Items.fromJson(List<dynamic> json) {
//     List<Items> itemList = json.map((i) => Items.fromJson(i)).toList();

//     return Items(
//         items: itemList
//     );
//   }
// }

// class Item {
//   final int id;
//   final String name;

//   Item({required this.id, required this.name,});

//   factory Item.fromJson(Map<String, dynamic> json) {
//     return Item(
//         id: json['id'],
//         name: json['name']
//     );
//   }
// }
