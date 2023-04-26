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
      bankNumber,
      startingDate;
  // final XFile image, document;

  LoadTenantEditEvent({
    required this.tenantID,
    required this.name,
    // required this.image,
    required this.propertyName,
    required this.rentPrice,
    required this.email,
    required this.phone,
    required this.bankNumber,
    required this.startingDate,
  });

  @override
  List<Object?> get props => [
        tenantID,
        name,
        propertyName,
        rentPrice,
        email,
        phone,
        bankNumber,
        startingDate
      ];
}
