import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@JsonSerializable()
class Pet {
  String? id;
  String clientId;
  String nome;
  String raca;
  String porte;
  DateTime nascimento;
  String idade;
  String peso;
  String sexo;
  String tipo;
<<<<<<< HEAD
  String tutor;
=======
  String clienteId;
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b

  Pet({
    this.id,
    required this.clientId,
    required this.nome,
    required this.raca,
    required this.porte,
    required this.nascimento,
    required this.idade,
    required this.peso,
    required this.sexo,
    required this.tipo,
<<<<<<< HEAD
    required this.tutor,
=======
    required this.clienteId,

>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

<<<<<<< HEAD
  Map<String, dynamic> toJson() {
    final json = _$PetToJson(this);
    // Converter 'nascimento' para Timestamp antes de retornar
    json['nascimento'] = Timestamp.fromDate(nascimento);
    return json;
  }

=======
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04
  factory Pet.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Pet(
      id: doc.id,
      nome: data['nome'] ?? '',
      sexo: data['sexo'] ?? '',
      nascimento: data['nascimento'] is String
          ? DateTime.parse(data['nascimento'])
          : (data['nascimento'] as Timestamp).toDate(),
      raca: data['raca'] ?? '',
      porte: data['porte'] ?? '',
      idade: data['idade'] ?? '',
      peso: data['peso'] ?? '',
      tipo: data['tipo'] ?? '',
      tutor: data['tutor'] ?? '',
      clientId: data['clientId'] ?? '',
    );
  }
}
