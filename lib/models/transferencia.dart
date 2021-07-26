class Transferencia {
  final double value;
  final int accountNumber;

  Transferencia(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transferencia{valor, $value, numeroConta: $accountNumber}';
  }
}
