import 'package:flutter/material.dart';
import 'package:quitgamble/ChatPage.dart';

class PatientDetailsPage extends StatefulWidget {
  final String patientName;
  final int age;
  final String dataconsulta;
  final int recoveryDays;
  final String status;

  const PatientDetailsPage({
    super.key,
    required this.patientName,
    required this.age,
    required this.dataconsulta,
    required this.recoveryDays,
    required this.status,
  });

  @override
  _PatientDetailsPageState createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  String recoveryNotes = 'Notas sobre o progresso na recuperação:\n'
      '- Tem tido recaídas frequentes\n'
      '- Mostra interesse em participar de grupos de apoio\n'
      '- Já reduziu o tempo dedicado a jogos em 40%';

  String supportPlan = 'Plano de apoio:\n'
      '- Participação em 3 reuniões semanais\n'
      '- Acompanhamento psicológico\n'
      '- Limite de acesso a sites de apostas\n'
      '- Atividades alternativas recomendadas';

  bool isExpanded = false;
  Color statusColor = Colors.green;

  @override
  void initState() {
    super.initState();
    switch (widget.status) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Recuperação'),
        backgroundColor: Colors.green[800],
        elevation: 10,
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () => _sendSupportMessage(context),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 33, 35, 75),
              Color.fromARGB(255, 27, 141, 107),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPatientInfo(),
                    const SizedBox(height: 30),
                    _buildRecoveryStatus(),
                    const SizedBox(height: 20),
                    _buildRecoveryNotesSection(),
                    const SizedBox(height: 10),
                    _buildSupportPlanSection(),
                    const SizedBox(height: 20),
                    _buildSupportOptions(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientInfo() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: statusColor.withOpacity(0.2),
                  radius: 30,
                  child: Icon(
                    _getStatusIcon(widget.status),
                    color: statusColor,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.patientName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 29, 58),
                      ),
                    ),
                    Text(
                      '${widget.age} anos | ${widget.recoveryDays} dias sóbrio',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Última atualização: ${widget.dataconsulta}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecoveryStatus() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Status da Recuperação',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 29, 58),
              ),
            ),
            const SizedBox(height: 10),
            Chip(
              label: Text(
                widget.status,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: statusColor,
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: widget.recoveryDays / 90, // 90 dias como meta
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(statusColor),
            ),
            const SizedBox(height: 5),
            Text(
              'Progresso: ${(widget.recoveryDays / 90 * 100).toStringAsFixed(1)}% da meta de 90 dias',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecoveryNotesSection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: ExpansionTile(
        title: const Text(
          'Notas da Recuperação',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 1, 29, 58),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              recoveryNotes,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportPlanSection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: ExpansionTile(
        title: const Text(
          'Plano de Apoio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 1, 29, 58),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              supportPlan,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportOptions() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Ações de Apoio',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 29, 58),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => _scheduleSupportSession(context),
              child: const Text(
                'Agendar Sessão de Apoio',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => _sendSupportMessage(context),
              child: const Text(
                'Enviar Mensagem de Apoio',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            if (widget.status == 'Situação crítica')
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => _showEmergencyOptions(context),
                child: const Text(
                  'Ações Emergenciais',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _scheduleSupportSession(BuildContext context) {
    DateTime? selectedDate;
    TimeOfDay? selectedTime;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Agendar Sessão'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Selecione a data e horário:'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Selecionar data
                selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );

                if (selectedDate != null) {
                  // Selecionar horário
                  selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (selectedTime != null) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Sessão agendada para ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year} às ${selectedTime!.hour}:${selectedTime!.minute}',
                        ),
                      ),
                    );
                  }
                }
              },
              child: const Text('Selecionar Data e Horário'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  void _sendSupportMessage(BuildContext context) {
    final List<String> presetMessages = [
      'Olá ${widget.patientName}, como você está se sentindo hoje?',
      'Parabéns pelos ${widget.recoveryDays} dias de recuperação! Continue assim!',
      'Lembre-se: cada dia é uma nova oportunidade. Você é mais forte do que pensa!',
      'Estou aqui se precisar conversar. Não hesite em me chamar.',
      'Você está fazendo progresso incrível! Vamos marcar uma sessão para conversarmos?',
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enviar Mensagem de Apoio'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: presetMessages.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(presetMessages[index]),
                    trailing: const Icon(Icons.send),
                    onTap: () {
                      Navigator.pop(context);
                      // Navegar para o chat com a mensagem pré-selecionada
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDetailScreen(
                            userName: widget.patientName,
                            isGroup: false,
                            initialMessage: presetMessages[
                                index], // Passa a mensagem selecionada
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                ],
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  void _showEmergencyOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ações Emergenciais'),
        content: const Text(
          'Este participante está em situação crítica. '
          'Por favor, entre em contato imediatamente:\n\n'
          '1. Ligue para o participante\n'
          '2. Acione o suporte de emergência\n'
          '3. Marque uma intervenção urgente',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
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
