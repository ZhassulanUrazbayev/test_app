class CurrentPaymentRepository {
  bool _isAccepted = false;

  Future<bool> accepting() async {
    _isAccepted = !_isAccepted;
    return _isAccepted;
  }

}