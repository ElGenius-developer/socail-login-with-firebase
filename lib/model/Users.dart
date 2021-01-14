
import 'package:firebase_auth/firebase_auth.dart';

class UsersSigned{
    String uid;
    String displayName;
    String photoUrl;
    String email;
    String phoneNumber;

  UsersSigned({this.displayName, this.photoUrl, this.phoneNumber,this.email, this.uid});

   fillUserData(User user){

     return UsersSigned(email: user.email,uid: user.uid,
         displayName: user.displayName,photoUrl: user.photoURL,
         phoneNumber: user.phoneNumber
     );


   }


}