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
