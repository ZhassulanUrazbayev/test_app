import 'package:testenviroment/model/card_model.dart';

class ReceiptERCRepository {
  List<CardItem> _cardsList = <CardItem>[
    CardItem(cardNumber: "9988", isSelected: false),
    CardItem(cardNumber: "0012", isSelected: true),
    CardItem(cardNumber: "0015", isSelected: false)
  ];

  Future<List<CardItem>> selectCard(int index, CardItem item) async {
    for (int i = 0; i < _cardsList.length; i++) {
      if(i == index){
        _cardsList[i].isSelected = !_cardsList[i].isSelected;
      }else{
        _cardsList[i].isSelected = false;
      }
    }

    return _cardsList;
  }
}
