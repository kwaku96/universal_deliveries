import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class UserRepository{
  final FirebaseAuth _firebaseAuth;
  final Firestore _firestore;

  UserRepository({
    FirebaseAuth firebaseAuth,
    Firestore firestore
  }): _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _firestore = firestore ?? Firestore.instance;

  Future<void> loginWithCredentials ({
    @required String email,
    @required String password
  }) async{
    return await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((e){
          print("#e");
          return "$e";
        });
  }

  Future<void> signUpWithCredentials({
    @required String email,
    @required String password,
    @required String name,
    @required String tel
  }) async {
    FirebaseUser firebaseUser;
    return await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((data)=> data.user)
        .then((data){
          firebaseUser = data;
          return _firestore.collection('users');
        })
        .then((db){
          Map<String,dynamic> data = {
            'tel':tel,
            'name':name,
            'email':email,
            'userId': firebaseUser.uid,
            'imageUrl':''
          };
          return db.add(data);
        })
        .catchError((e){
          print("$e");
          return "$e";
        });
  }

  Future<Map<String,dynamic>> getUserDetails({
    @required String userId
  }) async{
    return await _firestore
        .collection('users')
        .where('userId',isEqualTo: userId)
        .getDocuments()
        .then((data)=>data.documents)
        .then((data)=>data[0].data)
        .catchError((e){
          print("$e");
          return {
            "error":"$e"
          };
        });
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }

  
}