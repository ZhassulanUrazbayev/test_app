import 'package:testenviroment/model/card_model.dart';

class CardsRepository {
  List<CardItem> _cardsList = <CardItem>[];
  int _lastIndex = -1;

  Future<List<CardItem>> addCard() async {
    _cardsList.add(CardItem(cardNumber: 9982, isSelected: false));
    return _cardsList;
  }

  Future<List<CardItem>> deletedCard(int index) async {
    _cardsList.removeAt(index);
    return _cardsList;
  }

  Future<List<CardItem>> selectCard(int index, CardItem item) async {

    if (_lastIndex == -1) {
      _cardsList[index].isSelected = !_cardsList[index].isSelected;
    } else {
      if (index == _lastIndex)
        _cardsList[index].isSelected = !_cardsList[index].isSelected;
      else {
        _cardsList[_lastIndex].isSelected = false;
        _cardsList[index].isSelected = true;
      }
    }

    _lastIndex = index;

    return _cardsList;
  }

}