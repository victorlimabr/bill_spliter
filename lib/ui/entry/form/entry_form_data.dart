import 'package:formz/formz.dart';
import 'package:bill_spliter/data/bill_entry.dart';
import 'package:bill_spliter/data/client.dart';
import 'package:bill_spliter/data/product.dart';
import 'package:bill_spliter/ui/common/common_inputs.dart';
import 'package:bill_spliter/ui/entry/form/input/product_amount_input.dart';
import 'package:bill_spliter/ui/entry/form/input/product_value_input.dart';

class EntryFormData with FormzMixin {
  final RequiredStringInput productName;
  final ProductValueInput productValue;
  final PositiveAmountInput productAmount;
  final RequiredSetInput<Client> clients;

  const EntryFormData({
    this.productName = const RequiredStringInput.pure(),
    this.productValue = const ProductValueInput.pure(),
    this.productAmount = const PositiveAmountInput.pure(),
    this.clients = const RequiredSetInput.pure(),
  });

  @override
  List<FormzInput> get inputs => [
        productName,
        productValue,
        productAmount,
        clients,
      ];

  BillEntry get entry => BillEntry(
        product: Product(
          name: productName.value,
          value: double.parse(productValue.value),
        ),
        amount: productAmount.value,
        clients: clients.value,
      );

  EntryFormData copyWith({
    RequiredStringInput? productName,
    ProductValueInput? productValue,
    PositiveAmountInput? productAmount,
    RequiredSetInput<Client>? clients,
  }) {
    return EntryFormData(
      productName: productName ?? this.productName,
      productValue: productValue ?? this.productValue,
      productAmount: productAmount ?? this.productAmount,
      clients: clients ?? this.clients,
    );
  }
}
