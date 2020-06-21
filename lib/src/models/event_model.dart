class EventModel {
  int id;
  String title;
  List<String> img;
  String interest;
  DateTime date;
  String address;
  String trainerName;
  String trainerImg;
  String trainerInfo;
  String occasionDetail;
  List<ReserveTypesModel> reserveTypes;

  EventModel(
      {this.id,
        this.title,
        this.img,
        this.interest,
        this.date,
        this.address,
        this.trainerName,
        this.trainerImg,
        this.trainerInfo,
        this.occasionDetail,
        this.reserveTypes});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'].cast<String>();
    interest = json['interest'];
    date = DateTime.parse(json['date']);
    address = json['address'];
    trainerName = json['trainerName'];
    trainerImg = json['trainerImg'];
    trainerInfo = json['trainerInfo'];
    occasionDetail = json['occasionDetail'];
    if (json['reservTypes'] != null) {
      reserveTypes = new List<ReserveTypesModel>();
      json['reservTypes'].forEach((v) {
        reserveTypes.add(new ReserveTypesModel.fromJson(v));
      });
    }
  }
}

class ReserveTypesModel {
  int id;
  String name;
  int count;
  int price;

  ReserveTypesModel({this.id, this.name, this.count, this.price});

  ReserveTypesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    price = json['price'];
  }
}
