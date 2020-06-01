import 'package:testenviroment/model/ERC_model.dart';

class ERCRepository {
  List<ERCItem> _cardsList = <ERCItem>[
    ERCItem(ERCTitle: "Отопление", ERCPrice: "uuuiiiiooooo oioi", isSelected: true, payAmount: 15000),
    ERCItem(ERCTitle: "Отопление", ERCPrice: "uuuiiiiooooo oioi", isSelected: true, payAmount: 15000),
    ERCItem(ERCTitle: "Отопление", ERCPrice: "uuuiiiiooooo oioi", isSelected: true, payAmount: 15000),
  ];

  double sum = 0;

  Future<List<ERCItem>> selectERCItem(int index) async {
    _cardsList[index].isSelected = !_cardsList[index].isSelected;

    return _cardsList;
  }

  Future<double> getSum() async {
    sum = 0;

    _cardsList.forEach((element) {
      if(element.isSelected){
        sum += element.payAmount;
      }
    });

    return sum;
  }
}
