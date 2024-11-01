import 'package:agendamento_pet/data/repository/firebase_repository.dart';
import 'package:agendamento_pet/domain/model/agendamento.dart';
import 'package:agendamento_pet/domain/model/pet.dart';
import 'package:agendamento_pet/domain/model/servico.dart';
import 'package:agendamento_pet/domain/model/usuario.dart';
import 'package:agendamento_pet/domain/model/clientes.dart';
import 'package:injectable/injectable.dart';

abstract class FirebaseUsecase {
  // Clientes
  Future<void> registerUser(Usuario usuario);
  Future<void> updatePassword(String newPassword);
  Future<Usuario?> getUserDetails(String userId);
  Future<void> updateUserDetails(Usuario usuario);
<<<<<<< HEAD
  Future<List<Clientes>> fetchClients(String userId);
  Future<void> addClients(Clientes client, String userId);
  Future<void> deleteClients(Clientes client, String userId);

  // Pets
  Future<void> addPet(Pet pet, String clientId);
  Future<List<Pet>> fetchPets(String clienteId);
  Future<void> deletePet(String petId);

  // Agendamento
  Future<void> addAgendamento(
      Agendamento agendamento, String petId, String userId);
  Future<List<Agendamento>> fetchAgendamentos();
  Future<void> deleteAgendamento(String agendamentoId);

  //Servico
  Future<void> addServico(Servico servico);
  Future<List<Servico>> fetchServico();
  Future<void> deleteServico(String servicoId);
  Future<void> updateServico(String servicoId, Servico servico);
=======
  Future<List<Clientes>> fetchClients();
  Future<void> addClients(Clientes client);

  // Pets
  Future<void> addPet(Pet pet);
  Future<List<Pet>> fetchPets();
  Future<void> deletePet(String petId);

  // Agendamento
  Future<void> addAgendamento(Agendamento agendamento);
  Future<List<Agendamento>> fetchAgendamentos();
  Future<void> deleteAgendamento(String agendamentoId);
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
}

@Injectable(as: FirebaseUsecase)
class FirebaseUsecaseImpl implements FirebaseUsecase {
  final FirestoreRepository firestoreRepository;

  FirebaseUsecaseImpl(this.firestoreRepository);

  // Clientes
  @override
  Future<void> registerUser(Usuario usuario) async {
    try {
      await firestoreRepository.addUser(usuario);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    try {
      await firestoreRepository.changePassword(newPassword);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Usuario?> getUserDetails(String userId) async {
    try {
      return await firestoreRepository.getUserDetails(userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserDetails(Usuario usuario) async {
    try {
      await firestoreRepository.updateUserDetails(usuario);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Clientes>> fetchClients(String userId) async {
    try {
      return await firestoreRepository.fetchClients(userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addClients(Clientes client, String userId) async {
    try {
      await firestoreRepository.addClients(client, userId);
    } catch (e) {
      rethrow;
    }
  }

  // Pets
  @override
  Future<void> deleteClients(Clientes client, String userId) async {
    try {
      await firestoreRepository.deleteClients(client, userId);
    } catch (e) {
      rethrow;
    }
  }

  // Pets
  @override
  Future<void> addPet(Pet pet, String clientId) async {
    try {
      await firestoreRepository.addPet(pet, clientId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Pet>> fetchPets(String clienteId) async {
    try {
      return await firestoreRepository.fetchPets(clienteId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deletePet(String petId) async {
    try {
      await firestoreRepository.deletePet(petId);
    } catch (e) {
      rethrow;
    }
  }

  // Agendamento
  @override
<<<<<<< HEAD
  Future<void> addAgendamento(
      Agendamento agendamento, String petId, String userId) async {
    try {
      await firestoreRepository.addAgendamento(agendamento, petId, userId);
=======
  Future<void> addAgendamento(Agendamento agendamento) async {
    try {
      await firestoreRepository.addAgendamento(agendamento);
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Agendamento>> fetchAgendamentos() async {
    try {
      return await firestoreRepository.fetchAgendamentos();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAgendamento(String agendamentoId) async {
    try {
      await firestoreRepository.deleteAgendamento(agendamentoId);
    } catch (e) {
      rethrow;
    }
  }
<<<<<<< HEAD

  @override
  Future<void> addServico(Servico servico) async {
    try {
      await firestoreRepository.addServico(servico);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteServico(String servicoId) async {
    try {
      await firestoreRepository.deleteServico(servicoId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Servico>> fetchServico() async {
    try {
      return await firestoreRepository.fetchServico();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateServico(String servicoId, Servico servico) async {
    try {
      return await firestoreRepository.updateServico(servicoId, servico);
    } catch (e) {
      rethrow;
    }
  }
=======
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
}
