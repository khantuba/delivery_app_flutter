/// @author mohd.shadab
/// This is pojo class for holding the Bean Configuration
class UserDetailsBean {
  final String _firstName;
  final String _lastName;
  final String _designation;

  const UserDetailsBean({
    required String firstName,
    required String lastName,
    required String designation,
  })  : _designation = designation,
        _lastName = lastName,
        _firstName = firstName;

  @override
  String toString() {
    return 'UserDetailsBean{firstName: $_firstName, lastName: $_lastName, designation: $_designation}';
  }

  ///This function is used to convert the bean to json
  Map toJson() {
    return {
      'firstName': _firstName,
      'lastName': _lastName,
      'designation': _designation,
    };
  }

  ///This function is used to convert decoded json back into the pojo class
  factory UserDetailsBean.fromJson(Map<String, dynamic> json) {
    return UserDetailsBean(
      firstName: json['firstName'],
      lastName: json['lastName'],
      designation: json['designation'],
    );
  }

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get designation => _designation;
}
