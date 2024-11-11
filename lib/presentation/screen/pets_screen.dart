import 'package:agendamento_pet/controller/dashboard_controller.dart';
import 'package:agendamento_pet/core/utils/all_widgets.dart';
import 'package:agendamento_pet/core/utils/colors.dart';
import 'package:agendamento_pet/core/utils/widget_stateful.dart';
import 'package:agendamento_pet/domain/model/pet.dart';
import 'package:agendamento_pet/presentation/widgets/custom_buttom_widget.dart';
import 'package:agendamento_pet/presentation/widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends WidgetStateful<PetsScreen, DashboardController> {
  DateTime? dataNascimento;

  @override
  void initState() {
    super.initState();

    controller.fetchClients();
    controller.fetchPets();
  }

  List<String> tutores = [];

  final _formKey = GlobalKey<FormState>();

  List<String> racasSelecionadas = [];

  void calcularIdade(String? data) {
    if (data != null && data.isNotEmpty) {
      final DateTime nascimento = DateFormat('dd/MM/yyyy').parse(data);
      final DateTime agora = DateTime.now();

      int idadeAnos = agora.year - nascimento.year;
      int idadeMeses = agora.month - nascimento.month;
      int idadeDias = agora.day - nascimento.day;

      if (idadeMeses < 0 || (idadeMeses == 0 && idadeDias < 0)) {
        idadeAnos--;
        idadeMeses += 12;
      }

      int totalMeses = idadeAnos * 12 + idadeMeses;

      if (totalMeses == 0) {
        controller.idadePetController.text = 'menos de um mês';
      } else if (idadeAnos == 0) {
        controller.idadePetController.text = '$totalMeses meses';
      } else {
        controller.idadePetController.text =
            '$idadeAnos anos e $idadeMeses meses';
      }

      double idadeDecimal = totalMeses / 12.0;
      controller.idadeDecimalPetController.text =
          idadeDecimal.toStringAsFixed(1);
    } else {
      controller.idadePetController.clear();
      controller.idadeDecimalPetController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
<<<<<<< HEAD
        child: Observer(
          builder: (_) => CustomContainerWidget(
            color: MColors.cian,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  _buildPetsListSection(),
                  Expanded(
                    flex: 2,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildTutorAndPetNameFields(),
                                const SizedBox(height: 16),
                                _buildPetTypeAndSizeFields(),
                                const SizedBox(height: 16),
                                _buildBirthDateAndAgeFields(),
                                const SizedBox(height: 16),
                                _buildWeightField(),
                                const SizedBox(height: 32),
                                _buildConfirmationButton(),
                              ],
                            ),
=======
        child: CustomContainerWidget(
          color: MColors.cian,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const SizedBox(width: 16),
                _buildPetsListSection(),
                Expanded(
                  flex: 2,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Observer(
                                      builder: (_) {
                                        return buildDropdownField(
                                          'Tutor:',
                                          controller.clients.isEmpty
                                              ? ["Escolha"]
                                              : controller.clients
                                                  .map((client) => client.nome)
                                                  .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              tutorSelecionado =
                                                  value ?? 'Escolha';
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value == 'Escolha') {
                                              return 'Por favor, selecione o tutor';
                                            }
                                            return null;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: buildTextField(
                                      'Nome:',
                                      'Nome do pet',
                                      controller.nomePetController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Por favor, insira o nome do pet';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: buildDropdownField(
                                      'Sexo:',
                                      ['Escolha', 'Macho', 'Fêmea'],
                                      onChanged: (value) {
                                        setState(() {
                                          sexoSelecionado = value ?? 'Escolha';
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null ||
                                            value == 'Escolha') {
                                          return 'Por favor, selecione o sexo';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: buildDropdownField(
                                      'Tipo de Pet:',
                                      ['Escolha', 'Cão', 'Gato'],
                                      onChanged: (value) {
                                        setState(() {
                                          tipoPetSelecionado =
                                              value ?? 'Escolha';
                                          porteSelecionado = 'Escolha';
                                          racasSelecionadas = [];
                                          racaSelecionada = 'Escolha';
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null ||
                                            value == 'Escolha') {
                                          return 'Por favor, selecione o tipo de pet';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: buildDropdownField(
                                      'Porte:',
                                      tipoPetSelecionado == 'Escolha'
                                          ? ['Escolha']
                                          : porte[tipoPetSelecionado] ??
                                              ['Escolha'],
                                      onChanged: (value) {
                                        setState(() {
                                          porteSelecionado = value ?? 'Escolha';
                                          racasSelecionadas = [];
                                          racaSelecionada = 'Escolha';

                                          if (tipoPetSelecionado == 'Cão') {
                                            if (porteSelecionado == 'Pequeno') {
                                              racasSelecionadas =
                                                  portePequeno['Cão'] ?? [];
                                            } else if (porteSelecionado ==
                                                'Médio') {
                                              racasSelecionadas =
                                                  porteMedio['Cão'] ?? [];
                                            } else if (porteSelecionado ==
                                                'Grande') {
                                              racasSelecionadas =
                                                  porteGrande['Cão'] ?? [];
                                            }
                                          } else if (tipoPetSelecionado ==
                                              'Gato') {
                                            if (porteSelecionado ==
                                                'Pequeno, de 2 a 4 kg') {
                                              racasSelecionadas =
                                                  portePequeno['Gato'] ?? [];
                                            } else if (porteSelecionado ==
                                                'Médio, de 4 a 6 kg') {
                                              racasSelecionadas =
                                                  porteMedio['Gato'] ?? [];
                                            } else if (porteSelecionado ==
                                                'Grande, acima de 6 kg') {
                                              racasSelecionadas =
                                                  porteGrande['Gato'] ?? [];
                                            }
                                          }
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null ||
                                            value == 'Escolha') {
                                          return 'Por favor, selecione o porte';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: buildDropdownField(
                                      'Raça:',
                                      racasSelecionadas.isEmpty
                                          ? ['Escolha']
                                          : racasSelecionadas,
                                      onChanged: (value) {
                                        setState(() {
                                          racaSelecionada = value ?? 'Escolha';
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null ||
                                            value == 'Escolha') {
                                          return 'Por favor, selecione a raça';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: buildTextField(
                                      'Nascimento:',
                                      'Data de Nascimento',
                                      controller.nascimentoPetController,
                                      keyboardType: TextInputType.datetime,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Por favor, insira a data de nascimento';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        calcularIdade(value);
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.calendar_today,
                                      size: 40,
                                    ),
                                    onPressed: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate:
                                            dataNascimento ?? DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime.now(),
                                      );
                                      if (picked != null &&
                                          picked != dataNascimento) {
                                        setState(() {
                                          dataNascimento = picked;
                                          controller.nascimentoPetController
                                                  .text =
                                              DateFormat('dd/MM/yyyy')
                                                  .format(dataNascimento!);
                                          calcularIdade(controller
                                              .nascimentoPetController.text);
                                        });
                                      }
                                    },
                                  ),
                                  Expanded(
                                    child: buildTextField(
                                      'Idade (decimal):',
                                      'Idade do Pet (ex: 0,3)',
                                      controller.idadeDecimalPetController,
                                      keyboardType: TextInputType.number,
                                      readOnly: true,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: buildTextField(
                                      'Peso:',
                                      'Peso do pet (kg)',
                                      controller.pesoPetController,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Por favor, insira o peso';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 32),
                              // Botão de Confirmação
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  child: CustomButtomWidget(
                                    buttonChild: Text(
                                      'Confirmar Cadastro',
                                      style: boldFont(
                                        MColors.primaryWhite,
                                        16.0,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        await controller.cadastrarPet(
                                          context: context,
                                          sexo: sexoSelecionado,
                                          tipoPet: tipoPetSelecionado,
                                          porte: porteSelecionado,
                                          raca: racaSelecionada,
                                          tutor: tutorSelecionado,
                                          clienteId: controller.currentUserId,
                                        );
                                        controller.clearFields();
                                      }
                                    },
                                    color: MColors.blue,
                                  ),
                                ),
                              ),
                            ],
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTutorAndPetNameFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Observer(
            builder: (_) {
              return buildDropdownField(
                'Tutor:',
                controller.clients.isEmpty
                    ? ["Escolha"]
                    : controller.clients.map((client) => client.nome).toList(),
                value: controller.tutorSelecionado,
                onChanged: (value) {
                  controller.tutorSelecionado = value ?? 'Escolha';
                },
                validator: (value) {
                  if (value == null || value == 'Escolha') {
                    return 'Por favor, selecione o tutor';
                  }
                  return null;
                },
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: buildTextField(
            'Nome:',
            'Nome do pet',
            controller.nomePetController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Por favor, insira o nome do pet';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: buildDropdownField(
            'Sexo:',
            ['Escolha', 'Macho', 'Fêmea'],
            value: controller.sexoSelecionado,
            onChanged: (value) {
              controller.sexoSelecionado = value ?? 'Escolha';
            },
            validator: (value) {
              if (value == null || value == 'Escolha') {
                return 'Por favor, selecione o sexo';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPetTypeAndSizeFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: buildDropdownField(
            'Tipo de Pet:',
            ['Escolha', 'Cão', 'Gato'],
            value: controller.tipoPetSelecionado,
            onChanged: (value) {
              controller.tipoPetSelecionado = value ?? 'Escolha';
              controller.porteSelecionado = 'Escolha';
              racasSelecionadas = []; // Limpar raças ao mudar o tipo
              controller.racaSelecionada = 'Escolha'; // Resetar a raça
            },
            validator: (value) {
              if (value == null || value == 'Escolha') {
                return 'Por favor, selecione o tipo de pet';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: buildDropdownField(
            'Porte:',
            controller.tipoPetSelecionado == 'Escolha'
                ? ['Escolha']
                : controller.porte[controller.tipoPetSelecionado] ??
                    ['Escolha'],
            value: controller.porteSelecionado,
            onChanged: (value) {
              controller.porteSelecionado = value ?? 'Escolha';
              controller.racaSelecionada = 'Escolha';

              controller.atualizarRacas();
            },
            validator: (value) {
              if (value == null || value == 'Escolha') {
                return 'Por favor, selecione o porte';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: buildDropdownField(
            'Raça:',
            controller.racasSelecionadas.isEmpty
                ? ['Escolha']
                : controller.racasSelecionadas,
            value: controller.racaSelecionada,
            onChanged: (value) {
              controller.racaSelecionada = value ?? 'Escolha';
            },
            validator: (value) {
              if (value == null || value == 'Escolha') {
                return 'Por favor, selecione a raça';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBirthDateAndAgeFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: buildDateField(
            'Nascimento:',
            'Data de Nascimento',
            onDateSelected: (date) {
              controller.nascimentoPetController.text =
                  "${date.day}/${date.month}/${date.year}";
            },
            validator: (value) {
              if (controller.nascimentoPetController.text.isEmpty) {
                return 'Por favor, selecione a data de nascimento';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: buildTextField(
            'Idade (decimal):',
            'Idade do Pet (ex: 0,3)',
            controller.idadeDecimalPetController,
            keyboardType: TextInputType.number,
            readOnly: true,
          ),
        ),
      ],
    );
  }

  Widget _buildWeightField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: buildTextField(
            'Peso:',
            'Peso do pet (kg)',
            controller.pesoPetController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Por favor, insira o peso';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmationButton() {
    return Center(
      child: SizedBox(
        width: 200,
        child: CustomButtomWidget(
          buttonChild: Text(
            controller.isUpdatePet ? 'Atualizar Pet' : 'Confirmar Cadastro',
            style: boldFont(MColors.primaryWhite, 16.0),
          ),
          onPressed: () async {
            if (_formKey.currentState?.validate() ?? false) {
              await controller.cadastrarPet(
                context: context,
                sexo: controller.sexoSelecionado,
                tipoPet: controller.tipoPetSelecionado,
                porte: controller.porteSelecionado,
                raca: controller.racaSelecionada,
                tutor: controller.tutorSelecionado,
              );
              controller.clearFields();
            }
          },
          color: MColors.blue,
        ),
      ),
    );
  }

  Widget _buildPetsListSection() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: MColors.blue),
                    const SizedBox(width: 8),
                    Text(
                      'Pets',
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: MColors.blue,
                      ),
                    ),
                  ],
                ),
<<<<<<< HEAD
=======
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPetsListSection() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: MColors.blue),
                    const SizedBox(width: 8),
                    Text(
                      'Pets',
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: MColors.blue,
                      ),
                    ),
                  ],
                ),
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar Pets',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => controller.searchPets(value),
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) {
                    if (controller.isLoadingSearchPet) {
                      return Center(
                        child: CircularProgressIndicator(color: MColors.blue),
                      );
                    }
                    if (controller.pets.isEmpty) {
                      return const Center(
                        child: Text(
                          'Nenhum Pet encontrado.',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.pets.length,
                        itemBuilder: (context, index) {
                          final pets = controller.pets[index];
                          return ListTile(
                            title: Text(pets.nome),
                            subtitle: Text(
                              'Nascimento: ${DateFormat('dd/MM/yyyy').format(pets.nascimento)}\n'
                              'Raça: ${pets.raca}\n'
                              'Peso: ${pets.peso}\n'
                              'Porte: ${pets.porte}\n'
                              'Tutor: ${pets.tutor}\n',
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () {
                                    controller.preencherCamposPet(pets);
                                    controller.isUpdatePet = true;
                                    controller.petIdToUpdate = pets.id!;
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    _confirmarExclusao(pets);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) {
                    if (controller.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.pets.isEmpty) {
                      return const Center(
                        child: Text(
                          'Nenhum Pet encontrado.',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.pets.length,
                        itemBuilder: (context, index) {
                          final pets = controller.pets[index];
                          return ListTile(
                            title: Text(pets.nome),
                            subtitle: Text(
                              'Nascimento: ${pets.nascimento}\n'
                              'Raça: ${pets.raca}\n'
                              'Peso: ${pets.peso}\n'
                              'Porte: ${pets.porte}\n',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _confirmarExclusao(context, pets);
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    String hint,
    TextEditingController controller, {
    List<TextInputFormatter>? inputFormatters,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
    bool readOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
          ),
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          readOnly: readOnly,
        ),
      ],
    );
  }

  Widget buildDateField(String label, String hint,
      {required Function(DateTime) onDateSelected,
      String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (pickedDate != null && pickedDate != dataNascimento) {
              setState(() {
                dataNascimento = pickedDate;
                controller.nascimentoPetController.text =
                    DateFormat('dd/MM/yyyy').format(dataNascimento!);
                calcularIdade(controller.nascimentoPetController.text);
              });
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller.nascimentoPetController,
              decoration: InputDecoration(
                hintText: hint,
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDropdownField(
    String label,
    List<String> options, {
    String? value,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
  }) {
    // Verifica se o valor inicial existe na lista de opções.
    final initialValue = options.contains(value)
        ? value
        : (options.isNotEmpty ? options.first : null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          value: initialValue,
          items: options
              .toSet() // Remove valores duplicados
              .map((option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }

<<<<<<< HEAD
  void _confirmarExclusao(Pet pet) {
=======
  void _confirmarExclusao(BuildContext context, Pet pet) {
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
<<<<<<< HEAD
          title: const Text('Excluir Pets'),
          content: const Text('Tem certeza que deseja excluir o pet?'),
=======
          title: const Text('Excluir Pet'),
          content: const Text('Tem certeza que deseja excluir o Pet?'),
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Excluir'),
              onPressed: () async {
                Navigator.of(context).pop();
<<<<<<< HEAD
                await controller.deletePets(pet);
=======
                await controller.deletePet(pet.clienteId);
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
              },
            ),
          ],
        );
      },
    );
  }
}
