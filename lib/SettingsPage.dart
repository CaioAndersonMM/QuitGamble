import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MaterialColor _primaryColor = Colors.green;

  void _changeColor(MaterialColor color) {
    setState(() {
      _primaryColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: _primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late MaterialColor _selectedColor = Colors.green;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: Colors.green[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 12, 51, 14)!,
              const Color.fromARGB(255, 10, 37, 5)
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Personalização'),
              _buildThemeSelector(),
              const Divider(height: 1, color: Colors.white),
              _buildSectionHeader('Conta'),
              _buildSettingsTile(
                icon: Icons.person,
                title: 'Perfil',
                subtitle: 'Edite suas informações pessoais',
              ),
              _buildSettingsTile(
                icon: Icons.lock,
                title: 'Privacidade',
                subtitle: 'Configurações de segurança e privacidade',
              ),
              const Divider(height: 1, color: Colors.white),
              _buildSectionHeader('Conscientização sobre Apostas'),
              _buildInfoCard(
                icon: Icons.warning,
                title: 'Jogo Responsável',
                content:
                    'Apostas devem ser feitas com moderação. Estabeleça limites financeiros e de tempo.',
              ),
              _buildInfoCard(
                icon: Icons.help,
                title: 'Ajuda e Suporte',
                content:
                    'Se precisar de ajuda com problemas de jogo:\n\n- Disque 188 (CVV)\n- Site: www.jogoresponsavel.org.br',
              ),
              const Divider(height: 1, color: Colors.white),
              _buildSectionHeader('Sobre Nós'),
              _buildInfoCard(
                icon: Icons.code,
                title: 'Desenvolvedores',
                content:
                    'Equipe de desenvolvimento:\n\n- Manoel Benício\n- Luis Filipe \n- Marcone Alexandre',
              ),
              _buildInfoCard(
                icon: Icons.volunteer_activism,
                title: 'Contribua',
                content:
                    'Quer ajudar no projeto?\n\n- Doe via PIX:\n  eee4d2bf-03f9-4459-9d12-4e74d08106a9\n- Participe do nosso GitHub\n- Envie suas sugestões',
              ),
              _buildInfoCard(
                icon: Icons.contact_mail,
                title: 'Contato',
                content: 'Telefone: (84) 99936-3074',
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Jogue com responsabilidade. A diversão acaba quando o controle se perde.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildThemeSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.color_lens, color: Colors.white),
          const SizedBox(width: 16),
          const Expanded(
              child:
                  Text('Cor do Tema', style: TextStyle(color: Colors.white))),
          DropdownButton<MaterialColor>(
            dropdownColor: Colors.green[900],
            underline: Container(),
            value: _selectedColor,
            items: [
              _buildColorDropdownItem(Colors.green, 'Verde'),
              _buildColorDropdownItem(Colors.teal, 'Verde-Azulado'),
              _buildColorDropdownItem(Colors.lightGreen, 'Verde Claro'),
              _buildColorDropdownItem(Colors.lime, 'Lima'),
            ],
            onChanged: (MaterialColor? newColor) {
              if (newColor != null) {
                setState(() {
                  _selectedColor = newColor;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.green[900],
              title: Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              content: const Text(
                'Aqui estará presente funcionalidades interessantes que ajudará a definir limites do uso do nosso aplicativo e armazenará informações do utilizador. Ainda não desenvolvido!',
                style: TextStyle(color: Colors.white70),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Fechar',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.green[900]!.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<MaterialColor> _buildColorDropdownItem(
      MaterialColor color, String text) {
    return DropdownMenuItem(
      value: color,
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
