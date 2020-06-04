class SelectPeriodRepository {
  int firstPeriodMonth = 5;
  int firstPeriodYear = 2;
  int secondPeriodMonth = 5;
  int secondPeriodYear = 2;

  bool _isValidPeriod = true;

  Future<List<int>> firstPeriod() async {
    return [firstPeriodMonth, firstPeriodYear];
  }

  Future<List<int>> secondPeriod() async {
    return [secondPeriodMonth, secondPeriodYear];
  }

  Future<void> selectFirstPeriod(int firstPeriodMonth, int firstPeriodYear) async {
      this.firstPeriodMonth = firstPeriodMonth;
      this.firstPeriodYear = firstPeriodYear;
  }

  Future<void> selectSecondPeriod(int secondPeriodMonth, int secondPeriodYear) async {
    if(firstPeriodYear != secondPeriodYear && firstPeriodYear < secondPeriodYear){
      this.secondPeriodMonth = secondPeriodMonth;
      this.secondPeriodYear = secondPeriodYear;
    }else if(firstPeriodYear == secondPeriodYear){
      if(firstPeriodMonth != secondPeriodMonth && firstPeriodMonth < secondPeriodMonth){
        this.secondPeriodMonth = secondPeriodMonth;
        this.secondPeriodYear = secondPeriodYear;
      }else{
        _isValidPeriod = false;
      }
    }
  }

  Future<bool> isPeriodValid() async {
    if(_isValidPeriod){
      if((firstPeriodMonth+firstPeriodYear*100) <= (secondPeriodMonth+secondPeriodYear*100)){
        return true;
      }else{
        return false;
      }
    }else{
      _isValidPeriod = true;
      return false;
    }
  }
}