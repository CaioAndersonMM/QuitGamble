import 'package:flutter/material.dart';

class GamblingAwarenessApp extends StatelessWidget {
  const GamblingAwarenessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo Consciente',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> tips = [
    {
      'title': 'Limites Financeiros',
      'content':
          'Estabeleça um orçamento máximo para apostas e nunca o ultrapasse. Lembre-se: esse dinheiro poderia ser investido em algo produtivo.',
      'icon': Icons.attach_money,
      'color': Colors.green[800],
    },
    {
      'title': 'Sinais de Alerta',
      'content':
          'Mentir sobre apostas, sentir ansiedade para jogar ou tentar recuperar perdas são sinais claros de problema.',
      'icon': Icons.warning,
      'color': Colors.orange[800],
    },
    {
      'title': 'Alternativas Saudáveis',
      'content':
          'Substitua o vício por hobbies como esportes, leitura, música ou aprendizado de novas habilidades.',
      'icon': Icons.sports_esports,
      'color': Colors.blue[800],
    },
    {
      'title': 'Busque Ajuda',
      'content':
          'Se sentir que perdeu o controle, procure grupos como Jogadores Anônimos (0800 771 0408) ou ajuda profissional.',
      'icon': Icons.help_outline,
      'color': Colors.red[800],
    },
    {
      'title': 'Evite Gatilhos',
      'content':
          'Evite locais, sites ou pessoas que incentivem apostas. O ambiente tem forte influência no comportamento.',
      'icon': Icons.block,
      'color': Colors.purple[800],
    },
    {
      'title': 'Autoconhecimento',
      'content':
          'Reconheça os momentos de maior vulnerabilidade emocional e evite apostar nesses períodos.',
      'icon': Icons.self_improvement,
      'color': Colors.teal[800],
    },
    {
      'title': 'Desative Notificações',
      'content':
          'Desinstale apps de apostas e desative notificações que possam gerar impulsos de jogar.',
      'icon': Icons.notifications_off,
      'color': Colors.grey[800],
    },
    {
      'title': 'Converse com Alguém',
      'content':
          'Falar com amigos, familiares ou terapeutas pode aliviar a pressão e ajudar a enxergar o problema com mais clareza.',
      'icon': Icons.chat_bubble_outline,
      'color': Colors.indigo[800],
    },
  ];

  final List<String> warningMessages = [
    'Apenas 1% dos jogadores conseguem lucro consistente',
    'O vício em apostas pode destruir famílias inteiras',
    'As casas de apostas sempre têm vantagem matemática',
    'A emoção momentânea não compensa o arrependimento duradouro',
    'Apostar não é uma renda extra, é um risco constante',
    'A promessa de vitória é o isco para manter você jogando',
    'Perdas sucessivas causam estresse, ansiedade e depressão',
    'A cada nova aposta, você pode estar se afastando da sua liberdade financeira',
    'Recuperar o dinheiro perdido é o maior engano do jogador viciado',
    'A dependência emocional do jogo afasta amigos e oportunidades',
    'O controle parece possível... até que se perde tudo',
  ];

  final List<Map<String, dynamic>> statistics = [
    {
      'value': '60%',
      'description': 'dos jogadores compulsivos contraem dívidas'
    },
    {'value': '5x', 'description': 'maior risco de depressão entre viciados'},
    {
      'value': '1 em 10',
      'description': 'jogadores desenvolvem vício patológico'
    },
    {
      'value': '75%',
      'description': 'dos viciados começam a jogar ainda na adolescência'
    },
    {
      'value': '40%',
      'description':
          'dos jogadores relataram problemas familiares devido ao jogo'
    },
    {
      'value': '2 em 3',
      'description':
          'viciados negligenciam responsabilidades profissionais ou acadêmicas'
    },
    {
      'value': '80%',
      'description': 'não procuram ajuda profissional por vergonha ou negação'
    },
  ];

  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogue Consciente ou Não Jogue!'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showAboutDialog(context),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0A2E0A),
              Color(0xFF121212),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildHeaderCard(),
                    const SizedBox(width: 10),
                    _buildSecondCard(),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Dicas Essenciais',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildTipsCarousel(),
              const SizedBox(height: 25),
              const Text(
                'Estatísticas Alarmantes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildStatisticsGrid(),
              const SizedBox(height: 25),
              const Text(
                'Alertas Importantes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildWarningMessages(),
              const SizedBox(height: 25),
              _buildEmergencyButton(),
              const SizedBox(height: 20),
              _buildImageLogo(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return GestureDetector(
      onTap: () => _showInteractiveQuiz(context),
      child: Container(
        width: 310,
        height: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B5E20)!, Colors.green[800]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.quiz, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            const Text(
              'Você joga de forma consciente?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              'Faça nosso teste rápido e descubra',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondCard() {
    return GestureDetector(
      onTap: () => _showExpandedQuiz(context), // Chama o novo teste interativo
      child: Container(
        width: 350,
        height: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blue[800]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.quiz, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            const Text(
              'Teste Avançado',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              'Responda mais perguntas e avalie seu comportamento',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipsCarousel() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tips.length,
        itemBuilder: (context, index) {
          final tip = tips[index];
          return GestureDetector(
            onTap: () => _showTipDetail(context, tip),
            child: Container(
              width: 180,
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: tip['color'],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(tip['icon'], size: 40, color: Colors.white),
                  const SizedBox(height: 15),
                  Text(
                    tip['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatisticsGrid() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Permite rolagem horizontal
      child: Row(
        children: statistics.map((stat) {
          return Container(
            width: 120,
            height: 170,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.green[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stat['value'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    stat['description'],
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildWarningMessages() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: warningMessages
            .map((message) => _buildWarningBubble(message))
            .toList(),
      ),
    );
  }

  Widget _buildWarningBubble(String message) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.red[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning_amber, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          SizedBox(
            width: 200,
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () => _showEmergencyHelp(context),
        icon: const Icon(Icons.emergency),
        label: const Text('PRECISO DE AJUDA URGENTE'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red[800],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _showTipDetail(BuildContext context, Map<String, dynamic> tip) {
    showModalBottomSheet(
      context: context,
      backgroundColor: tip['color'],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(tip['icon'], size: 50, color: Colors.white),
            const SizedBox(height: 15),
            Text(
              tip['title'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              tip['content'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: tip['color'],
              ),
              child: const Text('Entendi'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _showExpandedQuiz(BuildContext context) {
    int currentQuestion = 0;
    int score = 0;

    final List<Map<String, dynamic>> questions = [
      {
        'question':
            'Com que frequência você pensa em apostas quando não está jogando?',
        'options': [
          'Nunca',
          'Raramente',
          'Várias vezes por semana',
          'Quase todo dia'
        ],
        'scores': [0, 1, 2, 3],
      },
      {
        'question':
            'Você precisa apostar quantias cada vez maiores para sentir emoção?',
        'options': ['Nunca', 'Às vezes', 'Frequentemente', 'Sempre'],
        'scores': [0, 1, 2, 3],
      },
      {
        'question':
            'Quando tenta reduzir ou parar, sente inquietação ou irritabilidade?',
        'options': ['Nunca', 'Levemente', 'Moderadamente', 'Gravemente'],
        'scores': [0, 1, 2, 3],
      },
      {
        'question':
            'Seu hábito de apostas já causou problemas financeiros significativos?',
        'options': [
          'Nenhum problema',
          'Pequenos atrasos',
          'Dívidas consideráveis',
          'Perdas catastróficas'
        ],
        'scores': [0, 1, 2, 3],
      },
      {
        'question':
            'Você já usou dinheiro de contas importantes (aluguel, contas) para apostar?',
        'options': ['Nunca', '1-2 vezes', '3-5 vezes', 'Mais de 5 vezes'],
        'scores': [0, 1, 2, 3],
      },
      {
        'question':
            'Já pediu empréstimos ou vendeu pertences para apostar ou pagar dívidas?',
        'options': ['Nunca', 'Uma vez', 'Algumas vezes', 'Muitas vezes'],
        'scores': [0, 1, 2, 3],
      },
      {
        'question': 'Seu jogo já afetou negativamente seu trabalho ou estudos?',
        'options': ['Nunca', 'Pouco', 'Moderadamente', 'Gravemente'],
        'scores': [0, 1, 2, 3],
      },
      {
        'question':
            'Você já mentiu para familiares sobre seu hábito de apostas?',
        'options': [
          'Nunca',
          'Omiti detalhes',
          'Mentiras pequenas',
          'Mentiras graves'
        ],
        'scores': [0, 1, 2, 3],
      },
      {
        'question': 'Já perdeu relacionamentos importantes devido às apostas?',
        'options': [
          'Nenhum',
          'Tensões leves',
          '1 relacionamento',
          'Vários relacionamentos'
        ],
        'scores': [0, 1, 2, 3],
      },
      {
        'question':
            'Já apostou para escapar de problemas ou aliviar sentimentos negativos?',
        'options': ['Nunca', 'Raramente', 'Às vezes', 'Frequentemente'],
        'scores': [0, 1, 2, 3],
      },
      {
        'question':
            'Depois de perder, você sente necessidade de apostar novamente para recuperar?',
        'options': ['Nunca', 'Às vezes', 'Frequentemente', 'Sempre'],
        'scores': [0, 1, 2, 3],
      },
      {
        'question': 'Você já faltou ao trabalho/compromissos para apostar?',
        'options': ['Nunca', '1-2 vezes', '3-5 vezes', 'Mais de 5 vezes'],
        'scores': [0, 1, 2, 3],
      },
      {
        'question':
            'Quanto tempo você dedica semanalmente a pensar ou praticar apostas?',
        'options': [
          'Menos de 1h',
          '2-5 horas',
          '6-15 horas',
          'Mais de 15 horas'
        ],
        'scores': [0, 1, 2, 3],
      },
      {
        'question':
            'Você já considerou ou tentou suicídio devido a problemas com apostas?',
        'options': [
          'Nunca',
          'Pensamentos passageiros',
          'Planejei seriamente',
          'Tentei'
        ],
        'scores': [0, 3, 5, 7], // Peso maior para esta pergunta crítica
      },
      {
        'question': 'Se pudesse voltar no tempo, você começaria a apostar?',
        'options': ['Sim, sem dúvida', 'Talvez', 'Provavelmente não', 'Nunca'],
        'scores': [3, 2, 1, 0],
      },
    ];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            if (currentQuestion >= questions.length) {
              String result;
              String recommendation;
              Color color;

              if (score <= 7) {
                result = 'Baixo risco';
                recommendation =
                    'Seu padrão parece recreativo. Mantenha o controle!';
                color = Colors.green;
              } else if (score <= 15) {
                result = 'Risco moderado';
                recommendation =
                    'Alguns sinais preocupantes. Considere reduzir.';
                color = Colors.orange;
              } else if (score <= 25) {
                result = 'Alto risco';
                recommendation =
                    'Padrão problemático. Recomendamos buscar ajuda.';
                color = Colors.deepOrange;
              } else {
                result = 'Risco grave';
                recommendation = 'Procure ajuda profissional imediatamente.';
                color = Colors.red;
              }

              return AlertDialog(
                backgroundColor: Colors.grey[900],
                title: Text(
                  'Resultado: $result',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pontuação: $score/${questions.length * 3}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      recommendation,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (score > 7)
                      Column(
                        children: [
                          const Text(
                            'Recursos de Apoio:',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '• CVV: 188 (24h)\n• Jogo Responsável: 0800 891 891\n• Clínicas especializadas',
                            style: TextStyle(
                              color: Colors.blue[200],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Entendi',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  if (score > 15)
                    TextButton(
                      onPressed: () {
                        // Ação para encontrar ajuda
                        Navigator.pop(context);
                        _showHelpResources(context);
                      },
                      child: Text(
                        'Encontrar Ajuda',
                        style: TextStyle(
                          color: Colors.red[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              );
            }

            final question = questions[currentQuestion];
            return AlertDialog(
              backgroundColor: Colors.grey[900],
              title: Text(
                'Questionário (${currentQuestion + 1}/${questions.length})',
                style: const TextStyle(color: Colors.white),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      question['question'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...List.generate(question['options'].length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              score += question['scores'][index] as int;
                              currentQuestion++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            question['options'][index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showHelpResources(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Recursos de Ajuda',
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHelpItem(
                  'Centro de Valorização da Vida (CVV)', '188 • 24h/dia'),
              _buildHelpItem('Jogo Responsável', '0800 891 891'),
              _buildHelpItem('Clínicas Especializadas',
                  'Lista disponível em www.saude.gov.br'),
              _buildHelpItem(
                  'Apostadores Anônimos', 'Reuniões presenciais e online'),
              const SizedBox(height: 15),
              const Text(
                'Lembre-se: pedir ajuda é o primeiro passo para recuperação.',
                style: TextStyle(
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Fechar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHelpItem(String title, String details) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            details,
            style: TextStyle(
              color: Colors.blue[200],
            ),
          ),
        ],
      ),
    );
  }

  void _showInteractiveQuiz(BuildContext context) {
    int currentQuestion = 0;
    int score = 0;

    final List<Map<String, dynamic>> questions = [
      {
        'question': 'Você já mentiu sobre quanto apostou?',
        'options': ['Nunca', 'Raramente', 'Às vezes', 'Frequentemente'],
        'scores': [0, 1, 2, 3],
      },
      {
        'question': 'Você já tentou recuperar perdas apostando mais?',
        'options': ['Nunca', 'Uma ou duas vezes', 'Várias vezes', 'Sempre'],
        'scores': [0, 1, 2, 3],
      },
      {
        'question': 'Seu hábito de apostas já afetou relacionamentos?',
        'options': ['Não', 'Um pouco', 'Moderadamente', 'Gravemente'],
        'scores': [0, 1, 2, 3],
      },
    ];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            if (currentQuestion >= questions.length) {
              return AlertDialog(
                backgroundColor: Colors.green[900],
                title: const Text(
                  'Resultado do Teste',
                  style: TextStyle(color: Colors.white),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      score <= 3
                          ? 'Seu risco parece baixo, mas mantenha-se atento!'
                          : score <= 6
                              ? 'Você mostra alguns sinais de preocupação'
                              : 'Você pode estar desenvolvendo um problema sério',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Lembre-se: esse teste não substitui avaliação profissional',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Fechar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            }

            final question = questions[currentQuestion];
            return AlertDialog(
              backgroundColor: Colors.green[900],
              title: Text(
                'Pergunta ${currentQuestion + 1}/${questions.length}',
                style: const TextStyle(color: Colors.white),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    question['question'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(question['options'].length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            score += question['scores'][index] as int;
                            currentQuestion++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[800],
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 45),
                        ),
                        child: Text(question['options'][index]),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showEmergencyHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.red[900],
        title: const Text(
          'AJUDA IMEDIATA',
          style: TextStyle(color: Colors.white),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Se você está em crise devido a apostas, ligue para:',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.white),
              title: Text(
                'Jogadores Anônimos',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                '0800 771 0408',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.health_and_safety, color: Colors.white),
              title: Text(
                'CVV - Prevenção ao Suicídio',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                '188 (ligação gratuita)',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Fechar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.green[900],
        title: const Text(
          'Sobre o Aplicativo',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Este aplicativo tem como objetivo conscientizar sobre os riscos dos jogos de apostas e oferecer recursos para quem precisa de ajuda.\n\n'
          'Lembre-se: o jogo responsável começa com informação e autoconhecimento.',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Entendi',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  _buildImageLogo() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          'assets/logo.jpeg',
          width: double.infinity,
          height: 350,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
