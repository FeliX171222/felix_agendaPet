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
  String nascimento;
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
  Map<String, dynamic> toJson() => _$PetToJson(this);

  static Pet fromDocument(DocumentSnapshot doc) {
    return Pet.fromJson(doc.data() as Map<String, dynamic>);
  }
}
