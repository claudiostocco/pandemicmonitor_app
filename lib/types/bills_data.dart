class BillsData {
  const BillsData(this.id, this.description, this.whereSpend, this.issuedDate, this.dueDate, this.paid, this.amount);

  final String id;
  final String description;
  final String whereSpend;
  final DateTime issuedDate;
  final DateTime dueDate;
  final bool paid;
  final double amount;
}
