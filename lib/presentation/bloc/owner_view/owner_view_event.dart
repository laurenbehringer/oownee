part of 'owner_view_bloc.dart';

abstract class OwnerViewEvent extends Equatable {
  const OwnerViewEvent();
}

class LoadOwnerEvent extends OwnerViewEvent {
  final String ownerID;

  LoadOwnerEvent({required this.ownerID});

  @override
  List<Object?> get props => [ownerID];
}

class LoadOwnerEditEvent extends OwnerViewEvent {
  final String ownerId, name, country, email, phoneNum, address, image;

  LoadOwnerEditEvent({
    required this.ownerId,
    required this.name,
    required this.image,
    required this.country,
    required this.email,
    required this.phoneNum,
    required this.address,
  });

  @override
  List<Object?> get props =>
      [ownerId, name, country, email, phoneNum, address, image];
}
