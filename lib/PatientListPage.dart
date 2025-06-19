import 'package:flutter/material.dart';
import 'package:quitgamble/PatientDetail.dart';

class PatientListPage extends StatefulWidget {
  const PatientListPage({super.key});

  @override
  _PatientListPageState createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  // Lista de participantes em recuperação
  final List<Map<String, dynamic>> patients = [
    {
      'name': 'Carlos Silva',
      'age': 35,
      'consultationDate': '2025-06-01',
      'recoveryDays': 14,
      'status': 'Precisando de ajuda',
      'isChecked': false,
    },
    {
      'name': 'Ana Oliveira',
      'age': 28,
      'consultationDate': '2025-06-28',
      'recoveryDays': 30,
      'status': 'Em progresso',
      'isChecked': false,
    },
    {
      'name': 'Pedro Santos',
      'age': 42,
      'consultationDate': '2025-04-30',
      'recoveryDays': 7,
      'status': 'Situação crítica',
      'isChecked': false,
    },
    {
      'name': 'Mariana Costa',
      'age': 31,
      'consultationDate': '2025-06-03',
      'recoveryDays': 60,
      'status': 'Estável',
      'isChecked': false,
    },
    {
      'name': 'João Pereira',
      'age': 45,
      'consultationDate': '2025-05-02',
      'recoveryDays': 21,
      'status': 'Precisando de ajuda',
      'isChecked': false,
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredPatients = patients.where((patient) {
      return patient['name'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acompanhamento de Recuperação',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.green[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddPatientDialog(context),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 12, 51, 14),
              Color.fromARGB(255, 10, 37, 5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(221, 255, 255, 255),
                  labelText: 'Buscar pessoas',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16.0),
              filteredPatients.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhum participante encontrado.',
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: filteredPatients.length,
                        itemBuilder: (context, index) {
                          final patient = filteredPatients[index];
                          Color statusColor;

                          switch (patient['status']) {
                            case 'Situação crítica':
                              statusColor = Colors.red;
                              break;
                            case 'Precisando de ajuda':
                              statusColor = Colors.orange;
                              break;
                            case 'Em progresso':
                              statusColor = Colors.blue;
                              break;
                            default:
                              statusColor = Colors.green;
                          }

                          return Card(
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: statusColor.withOpacity(0.2),
                                child: Icon(
                                  _getStatusIcon(patient['status']),
                                  color: statusColor,
                                ),
                              ),
                              title: Text(
                                patient['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 1, 29, 58),
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${patient['age']} anos | ${patient['recoveryDays']} dias sóbrio',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'Última sessão: ${patient['consultationDate']}',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  Chip(
                                    label: Text(
                                      patient['status'],
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: statusColor,
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.info_outline),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PatientDetailsPage(
                                        patientName: patient['name'],
                                        age: patient['age'],
                                        dataconsulta:
                                            patient['consultationDate'],
                                        recoveryDays: patient['recoveryDays'],
                                        status: patient['status'],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PatientDetailsPage(
                                      patientName: patient['name'],
                                      age: patient['age'],
                                      dataconsulta: patient['consultationDate'],
                                      recoveryDays: patient['recoveryDays'],
                                      status: patient['status'],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddPatientDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Novo Usuário'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    ageController.text.isNotEmpty) {
                  setState(() {
                    patients.add({
                      'name': nameController.text,
                      'age': int.parse(ageController.text),
                      'consultationDate':
                          '2024-${DateTime.now().month}-${DateTime.now().day}',
                      'recoveryDays': 0,
                      'status': 'Novo participante',
                      'isChecked': false,
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Situação crítica':
        return Icons.warning;
      case 'Precisando de ajuda':
        return Icons.error_outline;
      case 'Em progresso':
        return Icons.trending_up;
      default:
        return Icons.check_circle;
    }
  }
}
