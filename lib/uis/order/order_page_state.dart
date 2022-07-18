part of 'order_page_cubit.dart';

class OrderPageState extends Equatable {
  final String? hintText;
  final String? liquid;
  final String? weight;

  OrderPageState({
    this.hintText,
    this.liquid,
    this.weight,
  });

  OrderPageState copyWith({
    String? hintText,
    String? liquid,
    String? weight
  }) {
    return OrderPageState(
      hintText: hintText ?? this.hintText,
      liquid: liquid ?? this.liquid,
      weight: weight ?? this.weight,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        hintText,
        liquid,
    weight,
      ];
}
