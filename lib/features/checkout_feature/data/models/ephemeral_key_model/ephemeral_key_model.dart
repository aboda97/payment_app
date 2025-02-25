import 'associated_object.dart';

class EphemeralKeyModel {
	String? id;
	String? object;
	List<AssociatedObject>? associatedObjects;
	int? created;
	int? expires;
	bool? livemode;
	String? secret;

	EphemeralKeyModel({
		this.id, 
		this.object, 
		this.associatedObjects, 
		this.created, 
		this.expires, 
		this.livemode, 
		this.secret, 
	});

	factory EphemeralKeyModel.fromIdEphkey1QwM6Zcexz4cJg6ZiLh6h7UrObjectEphemeralKeyAssociatedObjectsIdCusRpmheGdwzozbb7TypeCustomerCreated1740482115Expires1740485715LivemodeFalseSecretEkTestYwNjdF8xUxRvcThDrVhaNgnkZzZaLEc0TUd2YkpwZGlXMzdtT243cnhjamhFTkttNxVrWg800Rq4Dqvsd(Map<String, dynamic> json) {
		return EphemeralKeyModel(
			id: json['id'] as String?,
			object: json['object'] as String?,
			associatedObjects: (json['associated_objects'] as List<dynamic>?)
						?.map((e) => AssociatedObject.fromIdEphkey1QwM6Zcexz4cJg6ZiLh6h7UrObjectEphemeralKeyAssociatedObjectsIdCusRpmheGdwzozbb7TypeCustomerCreated1740482115Expires1740485715LivemodeFalseSecretEkTestYwNjdF8xUxRvcThDrVhaNgnkZzZaLEc0TUd2YkpwZGlXMzdtT243cnhjamhFTkttNxVrWg800Rq4Dqvsd(e as Map<String, dynamic>))
						.toList(),
			created: json['created'] as int?,
			expires: json['expires'] as int?,
			livemode: json['livemode'] as bool?,
			secret: json['secret'] as String?,
		);
	}



	Map<String, dynamic> toIdEphkey1QwM6Zcexz4cJg6ZiLh6h7UrObjectEphemeralKeyAssociatedObjectsIdCusRpmheGdwzozbb7TypeCustomerCreated1740482115Expires1740485715LivemodeFalseSecretEkTestYwNjdF8xUxRvcThDrVhaNgnkZzZaLEc0TUd2YkpwZGlXMzdtT243cnhjamhFTkttNxVrWg800Rq4Dqvsd() {
		return {
			'id': id,
			'object': object,
			'associated_objects': associatedObjects?.map((e) => e.toIdEphkey1QwM6Zcexz4cJg6ZiLh6h7UrObjectEphemeralKeyAssociatedObjectsIdCusRpmheGdwzozbb7TypeCustomerCreated1740482115Expires1740485715LivemodeFalseSecretEkTestYwNjdF8xUxRvcThDrVhaNgnkZzZaLEc0TUd2YkpwZGlXMzdtT243cnhjamhFTkttNxVrWg800Rq4Dqvsd()).toList(),
			'created': created,
			'expires': expires,
			'livemode': livemode,
			'secret': secret,		};
	}
}
