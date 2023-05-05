part of 'view_tenant_bloc.dart';

abstract class ViewTenantEvent extends Equatable {
  const ViewTenantEvent();
}

class LoadTenantViewEvent extends ViewTenantEvent {
  final String tenantID;

  LoadTenantViewEvent({required this.tenantID});

  @override
  List<Object?> get props => [tenantID];
}

class LoadTenantEditEvent extends ViewTenantEvent {
  final String tenantID,
      name,
      propertyName,
      rentPrice,
      email,
      phone,
      startingDate,
      propertyID,
      birthDate,
      tenantCountry,
      bankaccNo;
  final File image;
  // final XFile image, document;

  LoadTenantEditEvent(
      {required this.tenantID,
      required this.name,
      required this.image,
      required this.propertyName,
      required this.rentPrice,
      required this.email,
      required this.phone,
      required this.startingDate,
      required this.propertyID,
      required this.birthDate,
      required this.tenantCountry,
      required this.bankaccNo});

  @override
  List<Object?> get props => [
        name,
        propertyName,
        rentPrice,
        email,
        phone,
        startingDate,
        propertyID,
        birthDate,
        bankaccNo,
        tenantCountry,
        image
      ];
}
