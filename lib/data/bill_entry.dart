import 'package:equatable/equatable.dart';
import 'package:bill_spliter/data/client.dart';
import 'package:bill_spliter/data/product.dart';

class BillEntry extends Equatable {
  final Product product;
  final int amount;
  final Set<Client> clients;

  const BillEntry({
    required this.product,
    this.amount = 1,
    required this.clients,
  });

  @override
  List<Object?> get props => [product, amount, clients];

  BillEntry copyWith({
    Product? product,
    int? amount,
    Set<Client>? clients,
  }) {
    return BillEntry(
      product: product ?? this.product,
      amount: amount ?? this.amount,
      clients: clients ?? this.clients,
    );
  }

  operator +(BillEntry other) {
    return copyWith(amount: amount + other.amount);
  }
}
