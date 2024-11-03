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
  Future<List<Clientes>> fetchClients(String userId);
  Future<void> addClient(Clientes client, String userId);
  Future<void> deleteClient(Clientes client, String userId);

  // Pets
  Future<void> addPet(Pet pet, String userId);
  Future<List<Pet>> fetchPets(String clientId);
  Future<void> deletePet(Pet pet);

  // Agendamentos
  Future<void> addAgendamento(
      Agendamento agendamento, String petId, String userId);
  Future<List<Agendamento>> fetchAgendamentos();
  Future<void> deleteAgendamento(String agendamentoId);

  // Serviços
  Future<void> addServico(Servico servico);
  Future<List<Servico>> fetchServicos();
  Future<void> deleteServico(String servicoId);
  Future<void> updateServico(String servicoId, Servico servico);
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
      return await firestoreRepository.fetchClients();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addClient(Clientes client, String userId) async {
    try {
      await firestoreRepository.addClients(client);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteClient(Clientes client, String userId) async {
    try {
      await firestoreRepository.deleteClients(client);
    } catch (e) {
      rethrow;
    }
  }

  // Pets
  @override
  Future<void> addPet(Pet pet, String userId) async {
    try {
      await firestoreRepository.addPets(pet);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Pet>> fetchPets(String clientId) async {
    try {
      return await firestoreRepository.fetchPets(clientId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deletePet(Pet pet) async {
    try {
      await firestoreRepository.deletePets(pet);
    } catch (e) {
      rethrow;
    }
  }

  // Agendamentos
  @override
  Future<void> addAgendamento(
      Agendamento agendamento, String petId, String userId) async {
    try {
      await firestoreRepository.addAgendamento(agendamento, petId);
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

  // Serviços
  @override
  Future<void> addServico(Servico servico) async {
    try {
      await firestoreRepository.addServico(servico);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Servico>> fetchServicos() async {
    try {
      return await firestoreRepository.fetchServico();
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
  Future<void> updateServico(String servicoId, Servico servico) async {
    try {
      await firestoreRepository.updateServico(servicoId, servico);
    } catch (e) {
      rethrow;
    }
  }
}
