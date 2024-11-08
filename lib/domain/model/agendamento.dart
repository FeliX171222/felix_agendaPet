<<<<<<< HEAD
import 'package:agendamento_pet/domain/model/servico.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Agendamento {
  String? id;
  String petId;
  String userId;
  String petNome;
  String raca;
  String idade;
  String peso;
  String sexo;
  DateTime data;
<<<<<<< HEAD
  DateTime? cancelledAt;
  String hora;
  String motivoCancel;
=======
  String hora;
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
  Servico servico;
  List<String> horariosOcupados;

  Agendamento({
    this.id,
    required this.petId,
    required this.userId,
=======
import 'package:cloud_firestore/cloud_firestore.dart';

class Agendamento {
  final String? id;
  final String petNome;
  final String raca;
  final String idade;
  final String peso;
  final String servico;
  final String sexo;
  final DateTime dataHora;

  Agendamento({
    this.id,
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
    required this.petNome,
    required this.raca,
    required this.idade,
    required this.peso,
<<<<<<< HEAD
    required this.sexo,
    required this.data,
<<<<<<< HEAD
    this.cancelledAt,
    required this.hora,
    required this.motivoCancel,
=======
    required this.hora,
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
    required this.servico,
    List<String>? horariosOcupados,
  }) : horariosOcupados = horariosOcupados ?? [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'petId': petId,
      'userId': userId,
=======
    required this.servico,
    required this.sexo,
    required this.dataHora,
  });

  // Converter para JSON
  Map<String, dynamic> toJson() {
    return {
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
      'petNome': petNome,
      'raca': raca,
      'idade': idade,
      'peso': peso,
<<<<<<< HEAD
      'sexo': sexo,
      'data': Timestamp.fromDate(data),
<<<<<<< HEAD
      'cancelledAt': cancelledAt?.toIso8601String(),
      'hora': hora,
      'motivoCancel': motivoCancel,
=======
      'hora': hora,
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
      'servico': servico.toJson(),
      'horariosOcupados': horariosOcupados,
    };
  }

  factory Agendamento.fromMap(Map<String, dynamic> data) {
    return Agendamento(
      id: data['id'],
      petId: data['petId'] ?? '',
      userId: data['userId'] ?? '',
      petNome: data['petNome'] ?? '',
      raca: data['raca'] ?? '',
      idade: data['idade'] ?? '',
      peso: data['peso'] ?? '',
      cancelledAt: data['cancelledAt'] != null
          ? DateTime.parse(data['cancelledAt'])
          : null,
      sexo: data['sexo'] ?? '',
      data: (data['data'] as Timestamp?)?.toDate() ?? DateTime.now(),
      hora: data['hora'] ?? '',
<<<<<<< HEAD
      motivoCancel: data['motivoCancel'] ?? '',
      servico: Servico.fromMap(data['servico'] ?? {}),
      horariosOcupados: List<String>.from(data['horariosOcupados'] ?? []),
=======
      servico: Servico.fromMap(data['servico'] ?? {}),
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
    );
  }

  factory Agendamento.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Agendamento(
      id: doc.id,
      petId: data['petId'] ?? '',
      userId: data['userId'] ?? '',
      petNome: data['petNome'] ?? '',
      raca: data['raca'] ?? '',
      idade: data['idade'] ?? '',
      peso: data['peso'] ?? '',
      sexo: data['sexo'] ?? '',
      data: (data['data'] as Timestamp?)?.toDate() ?? DateTime.now(),
      hora: data['hora'] ?? '',
<<<<<<< HEAD
      motivoCancel: data['motivoCancel'] ?? '',
=======
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
      servico: Servico.fromMap(data['servico'] ?? {}),
      horariosOcupados: List<String>.from(data['horariosOcupados'] ?? []),
    );
  }
}

extension DateTimeExtension on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
<<<<<<< HEAD
=======
=======
      'servico': servico,
      'sexo': sexo,
      'dataHora': dataHora.toIso8601String(),
    };
  }

  // Criar a partir de um documento do Firestore
  factory Agendamento.fromDocument(DocumentSnapshot doc) {
    return Agendamento(
      id: doc.id,
      petNome: doc['petNome'],
      raca: doc['raca'],
      idade: doc['idade'],
      peso: doc['peso'],
      servico: doc['servico'],
      sexo: doc['sexo'],
      dataHora: DateTime.parse(doc['dataHora']),
    );
  }
}
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
