import 'package:testenviroment/model/card_model.dart';

class CardsRepository {
  List<CardItem> cardsList = <CardItem>[];

  Future<List<CardItem>> addCard() async {
    cardsList.add(CardItem(cardNumber: 9982, isSelected: false));
    return cardsList;
  }

  Future<List<CardItem>> deletedCard(int index) async {
    cardsList.removeAt(index);
    return cardsList;
  }

  Future<List<CardItem>> selectCard(int index, CardItem item) async {
    List<CardItem> updatedList = <CardItem>[];

    for( int i = 0 ; i < cardsList.length; i++ ) {
      if(i == index){
        updatedList.add(CardItem(cardNumber: cardsList[i].cardNumber, isSelected: !cardsList[i].isSelected));
      }else{
        updatedList.add(CardItem(cardNumber: cardsList[i].cardNumber, isSelected: false));
      }
    }

    cardsList.clear();
    cardsList.addAll(updatedList);

    return cardsList;
  }

}