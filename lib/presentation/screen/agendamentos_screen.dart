// ignore_for_file: use_build_context_synchronously

import 'package:agendamento_pet/controller/dashboard_controller.dart';
import 'package:agendamento_pet/core/utils/all_widgets.dart';
import 'package:agendamento_pet/core/utils/colors.dart';
import 'package:agendamento_pet/core/utils/widget_stateful.dart';
import 'package:agendamento_pet/domain/model/agendamento.dart';
import 'package:agendamento_pet/domain/model/pet.dart';
<<<<<<< HEAD
import 'package:agendamento_pet/domain/model/servico.dart';
=======
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
import 'package:agendamento_pet/presentation/widgets/custom_buttom_widget.dart';
import 'package:agendamento_pet/presentation/widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
=======
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
import 'package:intl/intl.dart';

class AgendamentosScreen extends StatefulWidget {
  const AgendamentosScreen({super.key});

  @override
  State<AgendamentosScreen> createState() => _AgendamentosScreenState();
}

class _AgendamentosScreenState
    extends WidgetStateful<AgendamentosScreen, DashboardController> {
  @override
  void initState() {
    controller.fetchPets();
    controller.carregarAgendamentos();
<<<<<<< HEAD
    controller.fecthServico();
=======
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainerWidget(
        color: MColors.cian,
        child: Row(
          children: [
            _buildAgendamentoListSection(),
            _buildAgendamentoFormSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAgendamentoListSection() {
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
                      'Agendamentos',
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: MColors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar agendamento',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) {
                    if (controller.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.agendamentos.isEmpty) {
                      return const Center(
                        child: Text(
                          'Nenhum agendamento encontrado.',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.agendamentos.length,
                        itemBuilder: (context, index) {
                          final agendamento = controller.agendamentos[index];
                          return ListTile(
                            title: Text(agendamento.petNome),
                            subtitle: Text(
                              'Raça: ${agendamento.raca}, '
                              'Idade: ${agendamento.idade} anos, '
                              'Peso: ${agendamento.peso} kg\n'
<<<<<<< HEAD
                              'serviço: ${agendamento.servico.nome}\n'
                              'Data: ${DateFormat('dd/MM/yyyy').format(agendamento.data)} '
                              'Hora: ${agendamento.hora}',
=======
                              'Serviço: ${agendamento.servico},'
                              'Data: ${DateFormat('dd/MM/yyyy').format(agendamento.dataHora)} '
                              'Hora: ${DateFormat('HH:mm').format(agendamento.dataHora)}',
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _confirmarExclusao(context, agendamento);
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

  Widget _buildAgendamentoFormSection(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SingleChildScrollView(
        child: Card(
          elevation: 2,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.pets, color: MColors.blue),
                    const SizedBox(width: 8),
                    Text(
                      'Agendamento',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MColors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildPetDropdown(),
<<<<<<< HEAD
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: buildTextField(
                          'Raça:', 'Raça', controller.racaPetController),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: buildTextField('Idade:', 'Idade do pet',
                          controller.idadePetController),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: buildTextField(
                          'Peso:', 'Peso do pet', controller.pesoPetController),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
=======
                buildTextField('Raça:', 'Raça', controller.racaPetController),
                buildTextField(
                    'Idade:', 'Idade do pet', controller.idadePetController),
                buildTextField(
                    'Peso:', 'Peso do pet', controller.pesoPetController),
                const SizedBox(height: 8),
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
                const Text('Sexo:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButtonFormField<String>(
                  value: controller.selectedSexo,
                  items: ['Escolha', 'Macho', 'Fêmea']
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      controller.selectedSexo = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 16),
<<<<<<< HEAD
                _buildServicoDropdown(),
                const SizedBox(height: 16),
                // buildDateField(context),
                _buildDateSlotField(context),
=======
                buildDateField(context),
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: CustomButtomWidget(
                    buttonChild: Text(
                      'Confirmar Agendamento',
                      style: boldFont(
                        MColors.primaryWhite,
                        16.0,
                      ),
                    ),
                    onPressed: () => _confirmarAgendamento(context),
                    color: MColors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildDateSlotField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Data:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller.dataController,
          readOnly: true,
          decoration: const InputDecoration(
            hintText: 'dd/MM/yyyy',
            suffixIcon: Icon(Icons.calendar_today),
            border: OutlineInputBorder(),
          ),
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());

            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );

            if (pickedDate != null) {
              setState(() {
                controller.selectedDate = pickedDate;
                controller.dataController.text =
                    DateFormat('dd/MM/yyyy').format(pickedDate);

                controller.availableTimeSlots =
                    controller.getAvailableTimeSlots(pickedDate);

                controller.selectedTimeSlot = null;
              });
            }
          },
        ),
        const SizedBox(height: 16),
        const Text('Horário:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: controller.selectedTimeSlot,
          items: controller.availableTimeSlots.map((time) {
            return DropdownMenuItem(
              value: time,
              child: Text(time),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              controller.selectedTimeSlot = value;
            });
          },
          decoration: const InputDecoration(
            hintText: 'Selecione um horário',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

=======
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
  Widget _buildPetDropdown() {
    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
<<<<<<< HEAD
              const Text('Pet:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField<Pet>(
                  value: controller.selectedPet,
                  items: controller.pets.map((pet) {
                    return DropdownMenuItem(
                      value: pet,
                      child: Text(pet.nome),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      controller.selectedPet = value;
                      if (controller.selectedPet != null) {
                        _fillPetDetails(controller.selectedPet!);
                      }
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Selecione um pet',
                    border: OutlineInputBorder(),
                  ),
=======
              const Text('Pet:', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<Pet>(
                value: controller.selectedPet,
                items: controller.pets.map((pet) {
                  return DropdownMenuItem(
                    value: pet,
                    child: Text(pet.nome),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    controller.selectedPet = value;
                    if (controller.selectedPet != null) {
                      _fillPetDetails(controller.selectedPet!);
                    }
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Selecione um pet',
                  border: OutlineInputBorder(),
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
                ),
              ),
            ],
          ),
        );
      },
    );
  }

<<<<<<< HEAD
  Widget _buildServicoDropdown() {
    return Observer(
      builder: (_) {
        // Filtra os serviços de acordo com o porte do pet selecionado
        final servicosFiltrados =
            controller.getServicosPorPorte(controller.selectedPet);

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Serviço:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField<Servico>(
                  value: controller.selectedServico,
                  items: servicosFiltrados.map((servico) {
                    return DropdownMenuItem(
                      value: servico,
                      child: Text(
                          "${servico.nome} - R\$ ${servico.preco.toStringAsFixed(2)}"),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      controller.selectedServico = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Selecione um serviço',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

=======
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
  void _fillPetDetails(Pet pet) {
    controller.racaPetController.text = pet.raca;
    controller.idadePetController.text = pet.idade.toString();
    controller.pesoPetController.text = pet.peso.toString();
    controller.selectedSexo = pet.sexo;
  }

  Widget buildTextField(
      String label, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              )),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Data e Hora:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller.dataController,
          readOnly: true,
          decoration: const InputDecoration(
<<<<<<< HEAD
            hintText: 'dd/MM/yyyy, --:--',
=======
            hintText: 'dd/MM/aaaa, --:--',
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
            suffixIcon: Icon(Icons.calendar_today),
            border: OutlineInputBorder(),
          ),
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());

<<<<<<< HEAD
=======
            // Seleciona a data
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 30)),
            );

            if (pickedDate != null) {
<<<<<<< HEAD
              controller.selectedDate = pickedDate;
              print(controller.selectedDate);

              List<TimeOfDay> availableTimes = [];
              for (int hour = 8; hour <= 18; hour++) {
                if (hour == 12) continue;
                availableTimes.add(TimeOfDay(hour: hour, minute: 0));
                if (hour < 18) {
                  availableTimes.add(TimeOfDay(hour: hour + 1, minute: 0));
                }
              }

              final selectedTime = await showModalBottomSheet<TimeOfDay>(
                context: context,
                builder: (BuildContext context) {
                  return ListView(
                    children: availableTimes.map((time) {
                      return ListTile(
                        title: Text(time.format(context)),
                        onTap: () {
                          Navigator.pop(context, time);
                        },
                      );
                    }).toList(),
                  );
                },
              );

              if (selectedTime != null) {
                // Formata e salva a data e hora selecionada
                DateTime selectedDateTime = DateTime(
                  pickedDate.year,
                  pickedDate.month,
                  pickedDate.day,
                  selectedTime.hour,
                  selectedTime.minute,
                );

                // Atualiza o controlador e a data formatada
=======
              // Seleciona a hora
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (pickedTime != null) {
                // Combina data e hora
                final DateTime selectedDateTime = DateTime(
                  pickedDate.year,
                  pickedDate.month,
                  pickedDate.day,
                  pickedTime.hour,
                  pickedTime.minute,
                );

                // Formata data e hora
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
                setState(() {
                  controller.selectedDate = selectedDateTime;
                  controller.dataController.text =
                      DateFormat('dd/MM/yyyy, HH:mm').format(selectedDateTime);
<<<<<<< HEAD

                  // Formatação correta da hora
                  controller.selectedTimeSlot =
                      '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';

                  print(
                      'Hora selecionada: ${controller.selectedTimeSlot}'); // Para debug
=======
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
                });
              }
            }
          },
        ),
      ],
    );
  }

  Future<void> _confirmarAgendamento(BuildContext context) async {
    try {
<<<<<<< HEAD
      if (controller.selectedPet == null ||
          controller.selectedServico == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Por favor, selecione um pet e serviço.')),
=======
      if (controller.selectedPet == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, selecione um pet.')),
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
        );
        return;
      }

<<<<<<< HEAD
      // Verifique se a hora foi selecionada
      if (controller.selectedTimeSlot == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, selecione um horário.')),
        );
        return;
      }

      // Cria o agendamento
      final String userId = controller.currentUserId;
=======
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
      final agendamento = Agendamento(
        petNome: controller.selectedPet!.nome,
        raca: controller.racaPetController.text,
        idade: controller.idadePetController.text,
        peso: controller.pesoPetController.text,
<<<<<<< HEAD
        sexo: controller.selectedSexo!,
        data: controller.selectedDate!,
        hora: controller.selectedTimeSlot!,
        servico: controller.selectedServico!,
        petId: controller.selectedPet!.id,
        userId: userId,
      );

      // Salva o agendamento
=======
        servico: controller.servicoPetController.text,
        sexo: controller.selectedSexo!,
        dataHora: controller.selectedDate!,
      );

      bool existeAgendamentoNoMesmoHorario = controller.agendamentos
          .any((a) => a.dataHora.isAtSameMomentAs(agendamento.dataHora));

      if (existeAgendamentoNoMesmoHorario) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Já existe um agendamento para este horário.')),
        );
        return;
      }

>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
      await controller.salvarAgendamento(agendamento, context);
    } catch (e) {
      print(e);
    }
  }

  void _confirmarExclusao(BuildContext context, Agendamento agendamento) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excluir Agendamento'),
          content: Text(
              'Tem certeza que deseja excluir o agendamento de ${agendamento.petNome}?'),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
<<<<<<< HEAD
                Navigator.of(context).pop();
=======
                Navigator.of(context).pop(); // Fecha o dialog
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
              },
            ),
            TextButton(
              child: const Text('Excluir'),
              onPressed: () async {
<<<<<<< HEAD
                Navigator.of(context).pop();
                await controller.excluirAgendamento(agendamento);
=======
                Navigator.of(context).pop(); // Fecha o dialog
                await controller
                    .excluirAgendamento(agendamento); // Exclui o agendamento
>>>>>>> 204f589ca0a6ab9755dbcd8490f9c3a925a08369
              },
            ),
          ],
        );
      },
    );
  }
}
