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

    for( int i = 0 ; i < cardsList.length; i++ ) {
      if(i == index){
        cardsList[i] = CardItem(cardNumber: cardsList[i].cardNumber, isSelected: !cardsList[i].isSelected);
      }else{
        cardsList[i] = CardItem(cardNumber: cardsList[i].cardNumber, isSelected: false);
      }
    }

    return cardsList;
  }

}