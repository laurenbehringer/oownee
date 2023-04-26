part of 'property_view_bloc.dart';

abstract class PropertyViewEvent extends Equatable {
  const PropertyViewEvent();
}

class LoadPropertyViewEvent extends PropertyViewEvent {
  final String propertyID;

  LoadPropertyViewEvent({required this.propertyID});

  @override
  List<Object?> get props => [propertyID];
}

class LoadPropertyEditEvent extends PropertyViewEvent {
  final String property_id,
      property_name,
      // number_of_tenants,
      property_type,
      property_address,
      monthly_rent;

  LoadPropertyEditEvent(
      {required this.property_id,
      required this.property_name,
      // required this.number_of_tenants,
      required this.property_type,
      required this.property_address,
      required this.monthly_rent});

  @override
  List<Object?> get props => [
        property_id,
        property_name,
        // number_of_tenants,
        property_type,
        property_address,
        monthly_rent
      ];
}
