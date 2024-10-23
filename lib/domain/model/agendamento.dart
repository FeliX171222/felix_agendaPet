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
    required this.petNome,
    required this.raca,
    required this.idade,
    required this.peso,
    required this.servico,
    required this.sexo,
    required this.dataHora,
  });

  // Converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'petNome': petNome,
      'raca': raca,
      'idade': idade,
      'peso': peso,
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
