import 'package:equatable/equatable.dart';

class CreateAccount1State extends Equatable {
  final String title;

  const CreateAccount1State({
    this.title = '',
  });

  CreateAccount1State copyWith({
    String? title,
  }) {
    return CreateAccount1State(
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [
        title,
      ];
}
