import 'package:agendamento_pet/domain/model/agendamento.dart';
import 'package:agendamento_pet/domain/model/clientes.dart';
import 'package:agendamento_pet/domain/model/pet.dart';
import 'package:agendamento_pet/domain/model/servico.dart';
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
<<<<<<< HEAD

  //clientes
  Future<List<Clientes>> fetchClients(String userId);
  Future<void> addClients(Clientes client, String userId);
  Future<void> deleteClients(Clientes client, String userId);

  //pets
  Future<void> addPet(Pet pet, String clientId);
  Future<List<Pet>> fetchPets(String clienteId);
  Future<void> deletePet(String petId);

  //agendamento
  Future<void> addAgendamento(
      Agendamento agendamento, String petId, String userId);
  Future<List<Agendamento>> fetchAgendamentos();
  Future<void> deleteAgendamento(String agendamentoId);

  //servico
  Future<void> addServico(Servico servico);
  Future<List<Servico>> fetchServico();
  Future<void> deleteServico(String servicoId);
  Future<void> updateServico(String servicoId, Servico servico);
=======

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
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
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
  Future<List<Clientes>> fetchClients(String userId) async {
    final QuerySnapshot querySnapshot = await firestore
        .collection('clientes')
        .where('userId', isEqualTo: userId)
        .get();

    return querySnapshot.docs.map((doc) => Clientes.fromDocument(doc)).toList();
  }

  @override
  Future<void> addClients(Clientes client, String userId) async {
    try {
      client.id = userId;
      await firestore.collection('clientes').add(client.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteClients(Clientes client, String userId) async {
    try {
      await firestore.collection('clientes').doc(client.id).delete();
      print("Cliente deletado com sucesso!");
    } catch (e) {
      print("Erro ao deletar cliente: $e");
      rethrow;
    }
  }

  @override
  Future<void> addPet(Pet pet, String clientId) async {
    try {
      pet.id = clientId;
      await firestore.collection('pets').add(pet.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Pet>> fetchPets(String clienteId) async {
    try {
      // Filtra os pets pelo clienteId
      QuerySnapshot snapshot = await firestore
          .collection('pets')
          .where('clienteId', isEqualTo: clienteId)
          .get();

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
<<<<<<< HEAD
  Future<void> addAgendamento(
      Agendamento agendamento, String petId, String userId) async {
    try {
      agendamento.petId = petId;
      agendamento.userId = userId;
      await firestore.collection('agendamentos').add(agendamento.toJson());
=======
  Future<void> addAgendamento(Agendamento agendamento) async {
    try {
      await firestore
          .collection('agendamentos')
          .doc(agendamento.id)
          .set(agendamento.toJson());
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Agendamento>> fetchAgendamentos() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('agendamentos').get();
<<<<<<< HEAD

      if (snapshot.docs.isNotEmpty) {
        List<Agendamento> agendamentos =
            snapshot.docs.map((doc) => Agendamento.fromDocument(doc)).toList();

        agendamentos.sort((a, b) {
          int dateComparison = a.data.compareTo(b.data);

          if (dateComparison == 0) {
            DateTime horaA = DateTime.parse('1970-01-01 ${a.hora}');
            DateTime horaB = DateTime.parse('1970-01-01 ${b.hora}');
            return horaA.compareTo(horaB);
          }

          return dateComparison;
        });

        return agendamentos;
      } else {
        print("Nenhum agendamento encontrado.");
        return [];
      }
    } catch (e) {
      print("Erro ao buscar agendamentos: $e");
=======
      return snapshot.docs.map((doc) => Agendamento.fromDocument(doc)).toList();
    } catch (e) {
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
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
<<<<<<< HEAD

  @override
  Future<void> addServico(Servico servico) async {
    await FirebaseFirestore.instance
        .collection('servicos')
        .add(servico.toJson());
  }

  @override
  Future<void> deleteServico(String servicoId) async {
    await FirebaseFirestore.instance
        .collection('servicos')
        .doc(servicoId)
        .delete();
  }

  @override
  Future<List<Servico>> fetchServico() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('servicos').get();

    return snapshot.docs.map((doc) => Servico.fromDocument(doc)).toList();
  }

  @override
  Future<void> updateServico(String servicoId, Servico servico) async {
    await FirebaseFirestore.instance
        .collection('servicos')
        .doc(servicoId)
        .update(servico.toJson());
  }
=======
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
}
