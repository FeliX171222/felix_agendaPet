import 'package:agendamento_pet/data/repository/firebase_repository.dart';
import 'package:agendamento_pet/domain/model/agendamento.dart';
import 'package:agendamento_pet/domain/model/pet.dart';
import 'package:agendamento_pet/domain/model/servico.dart';
import 'package:agendamento_pet/domain/model/usuario.dart';
import 'package:agendamento_pet/domain/model/clientes.dart';
import 'package:injectable/injectable.dart';

abstract class FirebaseUsecase {
  // Users
  Future<void> registerUser(Usuario usuario);
  Future<void> updatePassword(String newPassword);
  Future<Usuario?> getUserDetails(String userId);
  Future<void> updateUserDetails(Usuario usuario);
<<<<<<< HEAD

  //Clients
  Future<List<Clientes>> fetchClients(String userId);
  Future<void> addClient(Clientes client, String userId);
  Future<void> deleteClient(Clientes client, String userId);
=======
<<<<<<< HEAD
  Future<List<Clientes>> fetchClients(String userId);
  Future<void> addClients(Clientes client, String userId);
  Future<void> deleteClients(Clientes client, String userId);
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b

  // Pets
  Future<void> addPet(Pet pet);
  Future<List<Pet>> fetchPets(String clientId);
  Future<void> deletePet(Pet pet);

  // Agendamentos
  Future<void> addAgendamento(
      Agendamento agendamento, String petId, String userId);
  Future<List<Agendamento>> fetchAgendamentos(
      {bool paraVerificacaoConflito = false});
  Future<void> deleteAgendamento(String agendamentoId);
  Future<void> updateAgendamento(
      String agendamentoId, Agendamento agendamento, String motivo);
  Future<List<Agendamento>> fetchAgendamentosCancelados();
  Future<void> atualizarStatusRealizado(Agendamento agendamento);

  // Serviços
  Future<void> addServico(Servico servico);
  Future<List<Servico>> fetchServicos();
  Future<void> deleteServico(String servicoId);
  Future<void> updateServico(String servicoId, Servico servico);
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04

  // Relatórios
  Future<List<Map<String, dynamic>>> listarNovosClientes(
      DateTime inicio, DateTime fim);
  Future<List<Map<String, dynamic>>> contarServicosRealizados(
      DateTime inicio, DateTime fim);

  Future<List<Map<String, dynamic>>> aniversariosClientes(
      DateTime inicio, DateTime fim);
  Future<List<Map<String, dynamic>>> aniversariosPets(
      DateTime inicio, DateTime fim);
  Future<Map<String, int>> relatorioServicosPorTipo(
      DateTime inicio, DateTime fim);
  Future<List<Map<String, dynamic>>> fetchClientesCadastrados(
      DateTime inicio, DateTime fim);
  Future<List<Map<String, dynamic>>> fetchServicosCadastrados();
<<<<<<< HEAD

  Future<List<Agendamento>> listarAgendamentosCancelados(
      DateTime inicio, DateTime fim);

  Future<List<Agendamento>> listarAgendamentosRealizados(
      DateTime inicio, DateTime fim);
=======
=======
<<<<<<< HEAD
=======
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
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
>>>>>>> 223d6506fd582454a94d09826bd478ff49f01485
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04
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
<<<<<<< HEAD
  Future<void> addPet(Pet pet) async {
=======
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
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
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
<<<<<<< HEAD
  Future<void> addAgendamento(
      Agendamento agendamento, String petId, String userId) async {
    try {
<<<<<<< HEAD
      await firestoreRepository.addAgendamento(agendamento, petId);
=======
      await firestoreRepository.addAgendamento(agendamento, petId, userId);
=======
  Future<void> addAgendamento(Agendamento agendamento) async {
    try {
      await firestoreRepository.addAgendamento(agendamento);
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Agendamento>> fetchAgendamentos(
      {bool paraVerificacaoConflito = false}) async {
    try {
      return await firestoreRepository.fetchAgendamentos(
          paraVerificacaoConflito: paraVerificacaoConflito);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Agendamento>> fetchAgendamentosCancelados() async {
    try {
      return await firestoreRepository.fetchAgendamentosCancelados();
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
  Future<void> updateAgendamento(
      String agendamentoId, Agendamento agendamento, String motivo) async {
    try {
      await firestoreRepository.updateAgendamento(
          agendamentoId, agendamento, motivo);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateAgendamento(
      String agendamentoId, Agendamento agendamento, String motivo) async {
    try {
      await firestoreRepository.updateAgendamento(
          agendamentoId, agendamento, motivo);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> atualizarStatusRealizado(Agendamento agendamento) async {
    try {
      await firestoreRepository.atualizarStatusRealizado(agendamento);
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

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04
  // Relatórios
  @override
  Future<List<Map<String, dynamic>>> listarNovosClientes(
      DateTime inicio, DateTime fim) async {
    try {
      return await firestoreRepository.listarNovosClientes(inicio, fim);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> contarServicosRealizados(
      DateTime inicio, DateTime fim) async {
    try {
      return await firestoreRepository.contarServicosRealizados(inicio, fim);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> aniversariosClientes(
      DateTime inicio, DateTime fim) async {
    try {
      return await firestoreRepository.aniversariosClientes(inicio, fim);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> aniversariosPets(
      DateTime inicio, DateTime fim) async {
    try {
      return await firestoreRepository.aniversariosPets(inicio, fim);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, int>> relatorioServicosPorTipo(
      DateTime inicio, DateTime fim) async {
    try {
      return await firestoreRepository.relatorioServicosPorTipo(inicio, fim);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchClientesCadastrados(
      DateTime inicio, DateTime fim) async {
    try {
      return await firestoreRepository.fetchClientesCadastrados(inicio, fim);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchServicosCadastrados() async {
    try {
      return await firestoreRepository.fetchServicosCadastrados();
<<<<<<< HEAD
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Agendamento>> listarAgendamentosCancelados(
      DateTime inicio, DateTime fim) async {
    try {
      return await firestoreRepository.listarAgendamentosCancelados(
          inicio, fim);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Agendamento>> listarAgendamentosRealizados(
      DateTime inicio, DateTime fim) async {
    try {
      return await firestoreRepository.listarAgendamentosRealizados(
          inicio, fim);
=======
=======
  @override
  Future<void> updateServico(String servicoId, Servico servico) async {
    try {
      return await firestoreRepository.updateServico(servicoId, servico);
>>>>>>> 223d6506fd582454a94d09826bd478ff49f01485
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04
    } catch (e) {
      rethrow;
    }
  }
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
=======
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
>>>>>>> 223d6506fd582454a94d09826bd478ff49f01485
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04
}
