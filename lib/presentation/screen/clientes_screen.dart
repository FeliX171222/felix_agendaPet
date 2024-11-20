import 'package:agendamento_pet/constants/app_constanst.dart';
import 'package:agendamento_pet/controller/dashboard_controller.dart';
import 'package:agendamento_pet/core/utils/all_widgets.dart';
import 'package:agendamento_pet/core/utils/colors.dart';
import 'package:agendamento_pet/core/utils/widget_stateful.dart';
import 'package:agendamento_pet/domain/model/clientes.dart';
<<<<<<< HEAD
=======
<<<<<<< HEAD
import 'package:agendamento_pet/domain/model/servico.dart';
=======
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04
import 'package:agendamento_pet/presentation/widgets/custom_buttom_widget.dart';
import 'package:agendamento_pet/presentation/widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:flutter/services.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState
    extends WidgetStateful<ClientesScreen, DashboardController> {
  @override
  void initState() {
    controller.fetchClients();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  String sexoSelecionado = 'Escolha';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
=======
<<<<<<< HEAD
      body: Observer(
        builder: (_) => CustomContainerWidget(
          color: MColors.cian,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const SizedBox(width: 16),
                _buildClientesListSection(),
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
                              // Nome e Sexo
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: buildTextField(
                                      'Nome:',
                                      'Nome do cliente',
                                      controller.nomeController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Por favor, insira o nome do cliente';
                                        }
                                        return null;
                                      },
=======
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04
      body: CustomContainerWidget(
        color: MColors.cian,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const SizedBox(width: 16),
              _buildClientesListSection(),
<<<<<<< HEAD
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MColors.blue,
        onPressed: () => _showCadastroDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
=======
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
                            // Nome e Sexo
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: buildTextField(
                                    'Nome:',
                                    'Nome do cliente',
                                    controller.nomeController,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Por favor, insira o nome do cliente';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: buildDropdownField(
                                    'Sexo:',
                                    ['Escolha', 'Masculino', 'Feminino'],
                                    validator: (value) {
                                      if (value == null || value == 'Escolha') {
                                        return 'Por favor, selecione o sexo';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Idade e CEP
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: buildDateField(
                                    'Nascimento:',
                                    'Data de Nascimento',
                                    onDateSelected: (date) {
                                      controller.dataNascimentoController.text =
                                          "${date.day}/${date.month}/${date.year}";
                                    },
                                    validator: (value) {
                                      if (controller.dataNascimentoController
                                          .text.isEmpty) {
                                        return 'Por favor, selecione a data de nascimento';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: buildTextField(
                                    'CEP:',
                                    'Digite o CEP',
                                    controller.cepController,
                                    inputFormatters: [maskCepFormatter],
                                    keyboardType: TextInputType.number,
                                    onChanged: (cep) {
                                      if (cep.length == 9) {
                                        // CEP com máscara: '#####-###'
                                        controller.searchCep(cep, context);
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Por favor, insira o CEP';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Cidade e UF (Campos Automáticos)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: buildTextField(
                                    'Cidade:',
                                    'Cidade',
                                    controller.cidadeController,
                                    readOnly: true,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Cidade não pode estar vazia';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: buildTextField(
                                    'UF:',
                                    'UF',
                                    controller.estadoController,
                                    readOnly: true,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'UF não pode estar vazia';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Endereço
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: buildTextField(
                                    'Endereço:',
                                    'Endereço do cliente',
                                    controller.enderecoController,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Por favor, insira o endereço';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Bairro e Número
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: buildTextField(
                                    'Bairro:',
                                    'Bairro',
                                    controller.bairroController,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Por favor, insira o bairro';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: buildTextField(
                                    'Número:',
                                    'Número da casa',
                                    controller.numeroController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Por favor, insira o número';
                                      }
                                      if (int.tryParse(value) == null) {
                                        return 'Por favor, insira um número válido';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Telefone
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: buildTextField(
                                    'Telefone:',
                                    'Telefone',
                                    controller.telefoneController,
                                    inputFormatters: [maskFormatter],
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Por favor, insira o telefone';
                                      }
                                      if (!maskFormatter.isFill()) {
                                        return 'Por favor, insira um telefone válido';
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
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: buildDropdownField(
                                      'Sexo:',
                                      ['Escolha', 'Masculino', 'Feminino'],
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
                              // Idade e CEP
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: buildDateField(
                                      'Nascimento:',
                                      'Data de Nascimento',
                                      onDateSelected: (date) {
                                        controller
                                                .dataNascimentoController.text =
                                            "${date.day}/${date.month}/${date.year}";
                                      },
                                      validator: (value) {
                                        if (controller.dataNascimentoController
                                            .text.isEmpty) {
                                          return 'Por favor, selecione a data de nascimento';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: buildTextField(
                                      'CEP:',
                                      'Digite o CEP',
                                      controller.cepController,
                                      inputFormatters: [
                                        controller.maskCepFormatter
                                      ],
                                      keyboardType: TextInputType.number,
                                      onChanged: (cep) {
                                        if (cep.length == 9) {
                                          // CEP com máscara: '#####-###'
                                          controller.searchCep(cep, context);
                                        }
                                      },
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Por favor, insira o CEP';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              // Cidade e UF (Campos Automáticos)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: buildTextField(
                                      'Cidade:',
                                      'Cidade',
                                      controller.cidadeController,
                                      readOnly: true,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Cidade não pode estar vazia';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: buildTextField(
                                      'UF:',
                                      'UF',
                                      controller.estadoController,
                                      readOnly: true,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'UF não pode estar vazia';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              // Endereço
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: buildTextField(
                                      'Endereço:',
                                      'Endereço do cliente',
                                      controller.enderecoController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Por favor, insira o endereço';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              // Bairro e Número
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: buildTextField(
                                      'Número:',
                                      'Número da casa',
                                      controller.numeroController,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Por favor, insira o número';
                                        }
                                        if (int.tryParse(value) == null) {
                                          return 'Por favor, insira um número válido';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: buildTextField(
                                      'Complemento:',
                                      'Complemento',
                                      controller.complementoController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Por favor, insira o complemento';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04

  _showCadastroDialog() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(
            "Cadastro do Cliente",
            style: boldFont(Colors.black, 20.0),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Nome e Sexo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: buildTextField(
                          'Nome:',
                          'Nome do cliente',
                          controller.nomeController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, insira o nome do cliente';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: buildDropdownField(
                          'Sexo:',
                          ['Escolha', 'Masculino', 'Feminino'],
                          validator: (value) {
                            if (value == null || value == 'Escolha') {
                              return 'Por favor, selecione o sexo';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Idade e CEP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: buildDateField(
                          'Nascimento:',
                          'Data de Nascimento',
                          onDateSelected: (date) {
                            controller.dataNascimentoController.text =
                                "${date.day}/${date.month}/${date.year}";
                          },
                          validator: (value) {
                            if (controller
                                .dataNascimentoController.text.isEmpty) {
                              return 'Por favor, selecione a data de nascimento';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: buildTextField(
                          'CEP:',
                          'Digite o CEP',
                          controller.cepController,
                          inputFormatters: [controller.maskCepFormatter],
                          keyboardType: TextInputType.number,
                          onChanged: (cep) {
                            if (cep.length == 9) {
                              // CEP com máscara: '#####-###'
                              controller.searchCep(cep, context);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, insira o CEP';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Cidade e UF (Campos Automáticos)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: buildTextField(
                          'Cidade:',
                          'Cidade',
                          controller.cidadeController,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Cidade não pode estar vazia';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: buildTextField(
                          'UF:',
                          'UF',
                          controller.estadoController,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'UF não pode estar vazia';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Endereço
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: buildTextField(
                          'Endereço:',
                          'Endereço do cliente',
                          controller.enderecoController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, insira o endereço';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  // E-mail
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: buildTextField(
                          'E-mail:',
                          'E-mail do cliente',
                          controller.emailController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, insira o seu email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Bairro e Número
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: buildTextField(
                          'Número:',
                          'Número da casa',
                          controller.numeroController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, insira o número';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Por favor, insira um número válido';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: buildTextField(
                          'Complemento:',
                          'Complemento',
                          controller.complementoController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, insira o complemento';
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
                          'Bairro:',
                          'Bairro',
                          controller.bairroController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, insira o bairro';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: buildTextField(
                          'Telefone:',
                          'Telefone',
                          controller.telefoneController,
                          inputFormatters: [controller.maskFormatter],
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, insira o telefone';
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
                      child: Observer(
                        builder: (_) => CustomButtomWidget(
                          buttonChild: Text(
                            controller.isUpdateClient
                                ? 'Atualizar Cliente'
                                : 'Confirmar Cadastro',
                            style: boldFont(
                              MColors.primaryWhite,
                              16.0,
                            ),
                          ),
                          onPressed: controller.isLoading
                              ? () {}
                              : () async {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    DateTime? dataNascimento =
                                        DateFormat('dd/MM/yyyy').parse(
                                      controller.dataNascimentoController.text,
                                      true,
                                    );

                                    await controller.cadastrarCliente(
                                      context: context,
                                      sexo: sexoSelecionado,
                                      dataNascimento: dataNascimento,
                                    );

                                    Navigator.of(ctx).pop();

                                    controller.clearFields();
                                  }
                                },
                          color: MColors.blue,
                        ),
                      ),
                    ),
<<<<<<< HEAD
                  )
                ],
              ),
=======
                  ),
                ),
<<<<<<< HEAD
              ],
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClientesListSection() {
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
                      'Clientes',
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
                    hintText: 'Pesquisar Cliente',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => controller.searchClients(value),
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) {
                    if (controller.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(color: MColors.blue),
                      );
                    }
                    if (controller.clients.isEmpty) {
                      return Center(
                        child: Text(
                          'Nenhum cliente encontrado.',
                          style: boldFont(Colors.black, 16.0),
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.clients.length,
                        itemBuilder: (context, index) {
                          final clientes = controller.clients[index];
                          return ListTile(
                            title: Text(clientes.nome),
                            subtitle: Text(
<<<<<<< HEAD
                                'Email: ${clientes.email} / '
                                'Telefone: ${clientes.telefone} / '
                                'Cidade: ${clientes.cidade} - ${clientes.uf} / '
                                'Nascimento: ${DateFormat('dd/MM/yyyy').format(clientes.nascimento)} ' ),
=======
                                'Nascimento: ${DateFormat('dd/MM/yyyy').format(clientes.nascimento)}\n'
                                'Telefone: ${clientes.telefone}\n'
                                'Cidade: ${clientes.cidade} - ${clientes.uf}'),
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () {
                                    controller.preencherCamposCliente(clientes);
                                    controller.isUpdateClient = true;
                                    _showCadastroDialog();
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    _confirmarExclusao(context, clientes);
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
              ],
            ),
=======
              ),
            ],
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
          ),
        ),
      ),
    );
  }

  Widget _buildClientesListSection() {
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
                      'Clientes',
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
                    hintText: 'Pesquisar Cliente',
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

                    if (controller.clients.isEmpty) {
                      return const Center(
                        child: Text(
                          'Nenhum cliente encontrado.',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.clients.length,
                        itemBuilder: (context, index) {
                          final clientes = controller.clients[index];
                          return ListTile(
                            title: Text(clientes.nome),
                            subtitle: Text(
                                'Nascimento: ${DateFormat('dd/MM/yyyy').format(clientes.dataNascimento)}\n'
                                'Telefone: ${clientes.telefone}\n'
                                'Cidade: ${clientes.cidade}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _confirmarExclusao(context, clientes);
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

  Widget buildDateField(String label, String hint,
      {required Function(DateTime) onDateSelected,
      String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: boldFont(Colors.black, 14.0),
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
            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('dd/MM/yyyy').format(pickedDate);
              controller.dataNascimentoController.text = formattedDate;
              onDateSelected(pickedDate);
            }
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller.dataNascimentoController,
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

  Widget buildTextField(
    String label,
    String hint,
    TextEditingController controller, {
    List<TextInputFormatter>? inputFormatters,
    Function(String)? onChanged,
    bool readOnly = false,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: boldFont(Colors.black, 14.0),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
          ),
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
        ),
      ],
    );
  }

  Widget buildDropdownField(
    String label,
    List<String> options, {
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: boldFont(Colors.black, 14.0),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          value: sexoSelecionado,
          items: options
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                sexoSelecionado = value;
              });
            }
          },
          validator: validator,
        ),
      ],
    );
  }

  void _confirmarExclusao(BuildContext context, Clientes clientes) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excluir Cliente'),
          content: const Text('Tem certeza que deseja excluir o cliente'),
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
                await controller.deleteClients(clientes, clientes.userId);
              },
            ),
          ],
        );
      },
    );
  }
<<<<<<< HEAD
=======
<<<<<<< HEAD

  void _showEditDialog(
      BuildContext context, Clientes cliente, Servico servico) {
    // Carregar os dados do cliente e serviço nos controladores
    final nomeController = TextEditingController(text: cliente.nome);
    final dataNascimentoController =
        TextEditingController(text: cliente.nascimento.toString());
    final servicoNomeController = TextEditingController(text: servico.nome);
    final precoController =
        TextEditingController(text: servico.preco.toString());
    final duracaoController =
        TextEditingController(text: servico.duracao.toString());

    final dialogFormKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Dados do Cliente'),
          content: SingleChildScrollView(
            child: Form(
              key: dialogFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Nome e Sexo
                  Row(
                    children: [
                      Expanded(
                        child: buildTextField(
                          'Nome:',
                          'Nome do cliente',
                          nomeController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, insira o nome do cliente';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: buildDropdownField(
                          'Sexo:',
                          ['Escolha', 'Masculino', 'Feminino'],
                          validator: (value) {
                            if (value == null || value == 'Escolha') {
                              return 'Por favor, selecione o sexo';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Nascimento e CEP
                  Row(
                    children: [
                      Expanded(
                        child: buildDateField(
                          'Nascimento:',
                          'Data de Nascimento',
                          onDateSelected: (date) {
                            dataNascimentoController.text =
                                "${date.day}/${date.month}/${date.year}";
                          },
                          validator: (value) {
                            if (dataNascimentoController.text.isEmpty) {
                              return 'Por favor, selecione a data de nascimento';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: buildTextField(
                          'CEP:',
                          'Digite o CEP',
                          controller.cepController,
                          inputFormatters: [controller.maskCepFormatter],
                          keyboardType: TextInputType.number,
                          onChanged: (cep) {
                            if (cep.length == 9) {
                              controller.searchCep(cep, context);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, insira o CEP';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Endereço e outros campos conforme necessário
                  buildTextField(
                    'Serviço:',
                    'Nome do serviço',
                    servicoNomeController,
                  ),
                  buildTextField(
                    'Preço:',
                    'Preço do serviço',
                    precoController,
                    keyboardType: TextInputType.number,
                  ),
                  buildTextField(
                    'Duração:',
                    'Duração do serviço',
                    duracaoController,
                    keyboardType: TextInputType.number,
                  ),
                  // Continue adicionando os campos conforme o necessário
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (dialogFormKey.currentState?.validate() ?? false) {
                  DateTime? dataNascimento = DateFormat('dd/MM/yyyy')
                      .parse(dataNascimentoController.text, true);
                  controller.cadastrarCliente(
                    context: context,
                    sexo: sexoSelecionado,
                    dataNascimento: dataNascimento,
                  );
                  controller.clearFields();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Salvar Alterações'),
            ),
          ],
        );
      },
    );
  }
=======
>>>>>>> cfe8b081c57c224c1bc3e1e87517189321563a6b
>>>>>>> 9a40c0d07c4c9330ade84bd58177016c97fdee04
}
