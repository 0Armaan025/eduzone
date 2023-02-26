// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String name;
  final String uid;
  final String email;
  final String password;
  final String phoneNumber;
  final String totalHoursStudied;
  final String noOfFriends;
  final String invited;
  User({
    required this.name,
    required this.uid,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.totalHoursStudied,
    required this.noOfFriends,
    required this.invited,
  });

  User copyWith({
    String? name,
    String? uid,
    String? email,
    String? password,
    String? phoneNumber,
    String? totalHoursStudied,
    String? noOfFriends,
    String? invited,
  }) {
    return User(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      totalHoursStudied: totalHoursStudied ?? this.totalHoursStudied,
      noOfFriends: noOfFriends ?? this.noOfFriends,
      invited: invited ?? this.invited,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'totalHoursStudied': totalHoursStudied,
      'noOfFriends': noOfFriends,
      'invited': invited,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      uid: map['uid'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      totalHoursStudied: map['totalHoursStudied'] as String,
      noOfFriends: map['noOfFriends'] as String,
      invited: map['invited'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, uid: $uid, email: $email, password: $password, phoneNumber: $phoneNumber, totalHoursStudied: $totalHoursStudied, noOfFriends: $noOfFriends, invited: $invited)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.uid == uid &&
      other.email == email &&
      other.password == password &&
      other.phoneNumber == phoneNumber &&
      other.totalHoursStudied == totalHoursStudied &&
      other.noOfFriends == noOfFriends &&
      other.invited == invited;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      uid.hashCode ^
      email.hashCode ^
      password.hashCode ^
      phoneNumber.hashCode ^
      totalHoursStudied.hashCode ^
      noOfFriends.hashCode ^
      invited.hashCode;
  }
}
