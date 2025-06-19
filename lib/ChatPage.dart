import 'package:flutter/material.dart';

void main() {
  runApp(const ApoioApp());
}

class ApoioApp extends StatelessWidget {
  const ApoioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apoio Contra Vícios',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.green[800],
      ),
      home: const ChatListScreen(),
    );
  }
}

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  int _selectedIndex = 0; // 0 para Pessoas, 1 para Grupos de Apoio
  final List<Map<String, dynamic>> _groupChats = [
    {
      'name': 'Grupo de Prevenção',
      'lastMessage': 'Nova dica: Técnica dos 5 minutos',
      'time': '11:00',
      'unread': '3',
      'avatar': 'GP',
      'members': '125'
    },
    {
      'name': 'Sobriedade Diária',
      'lastMessage': 'Marina: Compartilhei minha experiência',
      'time': '10:15',
      'unread': '0',
      'avatar': 'SD',
      'members': '89'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> peopleChats = [
      {
        'name': 'Carlos (2 semanas sem jogar)',
        'lastMessage': 'Estou com muita vontade de jogar...',
        'time': '10:30',
        'unread': '2',
        'avatar': 'C',
        'status': 'Precisando de ajuda'
      },
      {
        'name': 'Ana (1 mês consciente)',
        'lastMessage': 'Consegui resistir à tentação hoje!',
        'time': '09:15',
        'unread': '1',
        'avatar': 'A',
        'status': 'Compartilhando vitória'
      },
      {
        'name': 'Pedro (3 dias com vontade)',
        'lastMessage': 'Alguém pode me ajudar? Estou fraco...',
        'time': '08:45',
        'unread': '5',
        'avatar': 'P',
        'status': 'Precisando de ajuda'
      },
      {
        'name': 'Mariana (2 meses sem jogar)',
        'lastMessage': 'Compartilhei minha rotina no grupo!',
        'time': 'Ontem',
        'unread': '0',
        'avatar': 'M',
        'status': 'Compartilhando vitória'
      },
      {
        'name': 'João (1 semana sem jogar)',
        'lastMessage': 'Quais técnicas vocês recomendam?',
        'time': 'Ontem',
        'unread': '0',
        'avatar': 'J',
        'status': 'Precisando de ajuda'
      },
    ];

    final List<Map<String, dynamic>> chats =
        _selectedIndex == 0 ? peopleChats : _groupChats;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Apoio Contra Vícios'),
        backgroundColor: Colors.green[900],
        elevation: 0,
        actions: [
          if (_selectedIndex == 1)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _showCreateGroupDialog(context),
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Seletor
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ToggleButtons(
                  isSelected: [_selectedIndex == 0, _selectedIndex == 1],
                  onPressed: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  selectedColor: Colors.white,
                  fillColor: Colors.deepPurple,
                  color: Colors.white70,
                  constraints: const BoxConstraints(
                    minHeight: 40,
                    minWidth: 150,
                  ),
                  children: const [
                    Text('  Pessoas  '),
                    Text('Grupos de Apoio'),
                  ],
                ),
              ),
            ),

            // Lista de Chats
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    color: const Color(0xFF1D1E33),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      leading: CircleAvatar(
                        backgroundColor: _selectedIndex == 0
                            ? Colors.deepPurple
                            : Colors.blueAccent,
                        child: Text(
                          chat['avatar']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        chat['name']!,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat['lastMessage']!,
                            style: const TextStyle(color: Colors.white70),
                          ),
                          if (_selectedIndex == 0)
                            Text(
                              chat['status']!,
                              style: TextStyle(
                                color: chat['status'] == 'Precisando de ajuda'
                                    ? Colors.orange
                                    : Colors.green,
                                fontSize: 12,
                              ),
                            ),
                          if (_selectedIndex == 1)
                            Text(
                              '${chat['members']} membros',
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                              ),
                            ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            chat['time']!,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white54),
                          ),
                          if (chat['unread'] != '0')
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                chat['unread']!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailScreen(
                              userName: chat['name']!,
                              isGroup: _selectedIndex == 1,
                              status:
                                  _selectedIndex == 0 ? chat['status'] : null,
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
    );
  }

  void _showCreateGroupDialog(BuildContext context) {
    final TextEditingController _groupNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1D1E33),
          title: const Text(
            'Criar Novo Grupo',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: _groupNameController,
            decoration: InputDecoration(
              hintText: 'Nome do grupo',
              hintStyle: const TextStyle(color: Colors.white54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: const Color(0xFF3B3D5B),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar',
                  style: TextStyle(color: Colors.white70)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                if (_groupNameController.text.isNotEmpty) {
                  setState(() {
                    _groupChats.insert(0, {
                      'name': _groupNameController.text,
                      'lastMessage': 'Grupo criado!',
                      'time': 'Agora',
                      'unread': '0',
                      'avatar': _groupNameController.text.substring(0, 2),
                      'members': '1'
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Criar', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}

class ChatDetailScreen extends StatefulWidget {
  final String userName;
  final bool isGroup;
  final String? status;
  final String? initialMessage;

  const ChatDetailScreen({
    super.key,
    required this.userName,
    required this.isGroup,
    this.status,
    this.initialMessage,
  });

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();

    // Mensagens iniciais baseadas no status
    if (!widget.isGroup) {
      if (widget.status == 'Precisando de ajuda') {
        _messages.addAll([
          {
            'text':
                'Olá! Vi que você está precisando de ajuda. Como posso te ajudar?',
            'time': '10:00',
            'isMe': false,
            'isTip': true,
          },
          {
            'text': 'Quando foi a última vez que você jogou?',
            'time': '10:02',
            'isMe': false,
            'isTip': false,
          },
          {
            'text': 'Estou aqui para te ajudar a superar essa vontade!',
            'time': '10:03',
            'isMe': false,
            'isTip': true,
          },
        ]);
      } else {
        _messages.addAll([
          {
            'text': 'Parabéns pelo seu progresso! Como está se sentindo?',
            'time': '10:00',
            'isMe': false,
            'isTip': true,
          },
          {
            'text':
                'Compartilhe conosco o que tem te ajudado a manter a sobriedade!',
            'time': '10:02',
            'isMe': false,
            'isTip': false,
          },
          {
            'text': 'Sua experiência pode inspirar outras pessoas!',
            'time': '10:03',
            'isMe': false,
            'isTip': true,
          },
        ]);
      }
    } else {
      _messages.addAll([
        {
          'text': 'Bem-vindo ao grupo de apoio! Compartilhe suas experiências.',
          'time': '10:00',
          'isMe': false,
          'isTip': true,
        },
        {
          'text':
              'Dica: Quando sentir vontade de jogar, respire fundo por 5 minutos',
          'time': '10:02',
          'isMe': false,
          'isTip': true,
        },
      ]);
    }

    if (widget.initialMessage != null) {
      _messages.add({
        'text': widget.initialMessage,
        'time': '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}',
        'isMe': true,
        'isTip': false,
      });
    }
  }

  void _sendMessage() {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        _messages.insert(0, {
          'text': message,
          'time': '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}',
          'isMe': true,
          'isTip': false,
        });
        _messageController.clear();

        // Resposta automática simulada
        if (!widget.isGroup) {
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _messages.insert(0, {
                'text': widget.status == 'Precisando de ajuda'
                    ? 'Você está no caminho certo! Já tentou as técnicas que sugerimos?'
                    : 'Obrigado por compartilhar sua vitória! Isso motiva todos nós!',
                'time': '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}',
                'isMe': false,
                'isTip': true,
              });
            });
          });
        } else {
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _messages.insert(0, {
                'text':
                    'Ótimo compartilhamento! Essa dica ajuda muitas pessoas.',
                'time': '${TimeOfDay.now().hour}:${TimeOfDay.now().minute}',
                'isMe': false,
                'isTip': true,
              });
            });
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.userName),
            if (widget.status != null)
              Text(
                widget.status!,
                style: TextStyle(
                  color: widget.status == 'Precisando de ajuda'
                      ? Colors.orange
                      : Colors.green,
                  fontSize: 12,
                ),
              ),
          ],
        ),
        backgroundColor: const Color(0xFF1D1E33),
        actions: widget.isGroup
            ? [
                IconButton(
                  icon: const Icon(Icons.people),
                  onPressed: () {
                    // Ação para ver membros do grupo
                  },
                ),
              ]
            : null,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 15, 44, 27)
              .withOpacity(0.8), // Fundo verde escuro quase transparente
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                reverse: false,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message['isMe']
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      constraints: const BoxConstraints(maxWidth: 300),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: message['isTip']
                            ? const Color(0xFF3B3D5B)
                            : message['isMe']
                                ? Colors.deepPurple
                                : const Color(0xFF24263B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (message['isTip'])
                            const Row(
                              children: [
                                Icon(Icons.lightbulb,
                                    size: 14, color: Colors.yellow),
                                SizedBox(width: 4),
                                Text(
                                  'DICA ÚTIL',
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          if (message['isTip']) const SizedBox(height: 4),
                          Text(
                            message['text'],
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            message['time'],
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: widget.isGroup
                            ? 'Compartilhe uma dica ou experiência...'
                            : 'Digite sua mensagem...',
                        hintStyle: const TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFF3B3D5B),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
