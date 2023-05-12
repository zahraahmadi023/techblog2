class TagslModel{
  String? id;
  String? title;


  
  TagslModel({

    required this.id,
    required this.title,
    

  });
  TagslModel.fromJson(Map<String ,dynamic> element){
    id=element["id"];
    title=element["title"];
    

  }

}

//  "id": "1",
//             "title": "۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید",
//             "image": "/Techblog/assets/upload/images/article/valhalla.jpg",
//             "cat_id": "1",
//             "cat_name": "اخبار و مقالات",
//             "author": "بهرام امینی",
//             "view": "1883",
//             "status": "1",
//             "created_at": "۱۴۰۱/۲/۱۶"