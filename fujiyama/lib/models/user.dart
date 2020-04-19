class User {

  final String userEmail;
  final String userPassword;
  final String userID;
  final String userName;
  final String userClass;
  final String userPhone;
  final String userLevel;
  final String userStatus;

  User({this.userEmail, this.userPassword, this.userID, this.userName, this.userClass, this.userPhone, this.userLevel, this.userStatus});

  User.fromData(Map<String, dynamic> data)
      : userEmail = data['userEmail'],
        userPassword = data['userPassword'],
        userID = data['userId'],
        userName = data['userName'],
        userClass = data['userClass'],
        userPhone = data['userPhone'],
        userLevel = data['userLevel'],
        userStatus = data['userStatus'];

  Map<String, dynamic> toJson() {
    return {
      'userEmail': userEmail,
      'userPassword': userPassword,
      'userId': userID,
      'userName': userName,
      'userClass': userClass,
      'userPhone': userPhone,
      'userLevel': userLevel,
      'userStatus': userStatus,
    };
  }

}