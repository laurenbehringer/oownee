part of 'add_new_bloc.dart';

abstract class AddNewEvent extends Equatable {
  const AddNewEvent();
}

class LoadAddNewTenantEvent extends AddNewEvent {
  final String tenant_name,
      rentPrice,
      email,
      phone,
      propertyID,
      birthDate,
      date,
      bankaccNo,
      country,
      tenant_image,
      tenant_doc;

  LoadAddNewTenantEvent(
      {required this.tenant_name,
      required this.propertyID,
      required this.rentPrice,
      required this.email,
      required this.phone,
      required this.birthDate,
      required this.date,
      required this.bankaccNo,
      required this.country,
      required this.tenant_image,
      required this.tenant_doc});

  @override
  List<Object?> get props => [
        tenant_name,
        rentPrice,
        email,
        phone,
        propertyID,
        birthDate,
        date,
        bankaccNo,
        country,
        tenant_image,
        tenant_doc
      ];
}

class LoadAddNewPropertyEvent extends AddNewEvent {
  final String propertyName,
      numberofTenants,
      propertyType,
      monthlyRent,
      address,
      userId,
      maintenance_charge;
  // property_doc,
  // property_image;

  LoadAddNewPropertyEvent({
    required this.propertyName,
    required this.numberofTenants,
    required this.propertyType,
    required this.monthlyRent,
    required this.address,
    required this.userId,
    required this.maintenance_charge,
    // required this.property_doc,
    // required this.property_image,
  });

  @override
  List<Object?> get props => [
        propertyName,
        numberofTenants,
        propertyType,
        monthlyRent,
        address,
        userId,
        maintenance_charge,
        // property_doc,
        // property_image
      ];
}

class LoadUploadPropertyImgEvent extends AddNewEvent {
  final String propertyId, propertyImg, propertyDoc;

  const LoadUploadPropertyImgEvent(
      {required this.propertyId,
      required this.propertyImg,
      required this.propertyDoc});

  @override
  List<Object?> get props => [propertyId, propertyImg, propertyDoc];
}

class ResetAddNewEvent extends AddNewEvent {
  @override
  List<Object?> get props => [];
}
