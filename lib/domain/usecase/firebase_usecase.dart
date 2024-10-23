import 'package:agendamento_pet/data/repository/firebase_repository.dart';
import 'package:agendamento_pet/domain/model/agendamento.dart';
import 'package:agendamento_pet/domain/model/pet.dart';
import 'package:agendamento_pet/domain/model/usuario.dart';
import 'package:agendamento_pet/domain/model/clientes.dart';
import 'package:injectable/injectable.dart';

abstract class FirebaseUsecase {
  // Clientes
  Future<void> registerUser(Usuario usuario);
  Future<void> updatePassword(String newPassword);
  Future<Usuario?> getUserDetails(String userId);
  Future<void> updateUserDetails(Usuario usuario);
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
  Future<List<Clientes>> fetchClients() async {
    try {
      return await firestoreRepository.fetchClients();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addClients(Clientes client) async {
    try {
      await firestoreRepository.addClients(client);
    } catch (e) {
      rethrow;
    }
  }

  // Pets
  @override
  Future<void> addPet(Pet pet) async {
    try {
      await firestoreRepository.addPet(pet);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Pet>> fetchPets() async {
    try {
      return await firestoreRepository.fetchPets();
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
  Future<void> addAgendamento(Agendamento agendamento) async {
    try {
      await firestoreRepository.addAgendamento(agendamento);
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
}
