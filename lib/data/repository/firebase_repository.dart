import 'package:agendamento_pet/domain/model/agendamento.dart';
import 'package:agendamento_pet/domain/model/clientes.dart';
import 'package:agendamento_pet/domain/model/pet.dart';
import 'package:agendamento_pet/domain/model/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreRepository {
  //usuário
  Future<void> addUser(Usuario usuario);
  Future<void> changePassword(String newPassword);
  Future<Usuario?> getUserDetails(String userId);
  Future<void> updateUserDetails(Usuario usuario);

  //clientes
  Future<List<Clientes>> fetchClients();
  Future<void> addClients(Clientes client);

  //pets
  Future<void> addPet(Pet pet);
  Future<List<Pet>> fetchPets();
  Future<void> deletePet(String petId);

  //agendamento
  Future<void> addAgendamento(Agendamento agendamento);
  Future<List<Agendamento>> fetchAgendamentos();
  Future<void> deleteAgendamento(String agendamentoId);
}

@Injectable(as: FirestoreRepository)
class FirestoreRepositoryImpl implements FirestoreRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  FirestoreRepositoryImpl(this.firestore, this.auth);

  @override
  Future<void> addUser(Usuario usuario) async {
    try {
      await firestore.collection('users').doc(usuario.id).set(usuario.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Usuario?> getUserDetails(String userId) async {
    try {
      final docSnapshot = await firestore.collection('users').doc(userId).get();
      if (docSnapshot.exists) {
        return Usuario.fromJson(docSnapshot.data()!);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> changePassword(String newPassword) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
      } else {
        throw FirebaseAuthException(
            code: 'user-not-logged-in', message: 'User is not logged in.');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserDetails(Usuario usuario) async {
    try {
      await firestore
          .collection('users')
          .doc(usuario.id)
          .update(usuario.toJson());

      User? currentUser = auth.currentUser;
      if (currentUser != null) {
        await currentUser.verifyBeforeUpdateEmail(usuario.email);
        await currentUser.updateProfile(
            displayName: usuario.name, photoURL: usuario.photoURL);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Clientes>> fetchClients() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('clientes').get();
      return snapshot.docs.map((doc) => Clientes.fromDocument(doc)).toList();
    } catch (e) {
      print("Erro ao buscar clientes: $e");
      rethrow;
    }
  }

  @override
  Future<void> addClients(Clientes client) async {
    try {
      await firestore.collection('clientes').add(client.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addPet(Pet pet) async {
    try {
      await firestore.collection('pets').doc(pet.id).set(pet.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Pet>> fetchPets() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('pets').get();
      return snapshot.docs.map((doc) => Pet.fromDocument(doc)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deletePet(String petId) async {
    try {
      await firestore.collection('pets').doc(petId).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addAgendamento(Agendamento agendamento) async {
    try {
      await firestore
          .collection('agendamentos')
          .doc(agendamento.id)
          .set(agendamento.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Agendamento>> fetchAgendamentos() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('agendamentos').get();
      return snapshot.docs.map((doc) => Agendamento.fromDocument(doc)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAgendamento(String agendamentoId) async {
    try {
      await firestore.collection('agendamentos').doc(agendamentoId).delete();
    } catch (e) {
      rethrow;
    }
  }
}
