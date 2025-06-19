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
      onTap: () => {}, // Chama o novo teste interativo
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
}
