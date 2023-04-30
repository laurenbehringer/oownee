part of 'add_new_bloc.dart';

abstract class AddNewEvent extends Equatable {
  const AddNewEvent();
}

class LoadAddNewTenantEvent extends AddNewEvent {
  final String name,
      rentPrice,
      email,
      phone,
      // startingDate,
      propertyID,
      birthDate,
      // tenantCountry,
      bankaccNo;
  // final XFile image, document;

  LoadAddNewTenantEvent(
      {required this.name,
      // required this.image,
      required this.propertyID,
      required this.rentPrice,
      required this.email,
      required this.phone,
      // required this.startingDate,
      required this.birthDate,
      // required this.tenantCountry,
      required this.bankaccNo});

  @override
  List<Object?> get props => [
        name,
        rentPrice,
        email,
        phone,
        propertyID,
        birthDate,
        bankaccNo,
      ];
}
