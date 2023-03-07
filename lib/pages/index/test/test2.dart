import 'dart:convert';

void main() {
  String rspDataStr =
      "[{\"id\":1,\"icon\":59475,\"cardName\":\"加好友\",\"func\":\"Routers.scanning\"},{\"id\":2,\"icon\":59648,\"cardName\":\"创单位1\",\"func\":\"() => print('Go to search page')\"},{\"id\":3,\"icon\":59574,\"cardName\":\"邀成员\",\"func\":\"() => print('Go to settings page')\"},{\"id\":4,\"icon\":59648,\"cardName\":\"建应用\",\"func\":\"() => print('Go to profile page')\"},{\"id\":5,\"icon\":59648,\"cardName\":\"逛商店\",\"func\":\"() => print('Go to search page')\"},{\"id\":6,\"icon\":59574,\"cardName\":\"通讯录\",\"func\":\"() => print('Go to settings page')\"},{\"id\":7,\"icon\":59648,\"cardName\":\"创单位1\",\"func\":\"() => print('Go to search page')\"}]";
  List<dynamic> jsonList2 = json.decode(rspDataStr);
  print(jsonList2);

  List<CardItem> cardItems = jsonList2
      .map((jsonMap) => CardItem(
          id: jsonMap['id'],
          icon: jsonMap['icon'],
          cardName: jsonMap['cardName'],
          func: jsonMap['func']))
      .toList();
  print(111111111);
  print(cardItems[0].id); // Output: 加好友
  print(cardItems[0].icon); // Output: 加好友
  print(cardItems[0].cardName); // Output: 加好友
  print(cardItems[0].func); // Output: 加好友
  // --------------------------------
  List<CardItem> obj = decodeCardItems(rspDataStr);
  print(222222);
  print(obj[0].id); // Output: 加好友
  print(obj[0].icon); // Output: 加好友
  print(obj[0].cardName); // Output: 加好友
  print(obj[0].func); // Output: 加好友
}

class CardItem {
  int id;
  int icon;
  String cardName;
  String func;

  CardItem(
      {required this.id,
      required this.icon,
      required this.cardName,
      required this.func});
}

List<CardItem> decodeCardItems(String rspDataStr) {
  List<dynamic> jsonList = json.decode(rspDataStr);
  List<CardItem> cardItems = jsonList
      .map((jsonMap) => CardItem(
            id: jsonMap['id'],
            icon: jsonMap['icon'],
            cardName: jsonMap['cardName'],
            func: jsonMap['func'],
          ))
      .toList();
  return cardItems;
}
