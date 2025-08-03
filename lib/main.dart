import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const ParanaDespachanteApp());

class ParanaDespachanteApp extends StatelessWidget {
  const ParanaDespachanteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paraná Despachante',
      theme: ThemeData(
        primaryColor: const Color(0xFF1A681E),
        scaffoldBackgroundColor: const Color(0xFFF1F8E9),
        appBarTheme: const AppBarTheme(
          backgroundColor:  Color(0xFF1A681E),
          foregroundColor: Color(0xFFFFFFFF),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF1A681E),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFFCC29)),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.black,
          iconColor: Color(0xFFFFCC29),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A681E),
          primary: const Color(0xFF1A681E),
          secondary: const Color(0xFFFFCC29),
          surface: const Color(0xFFF1F8E9),
          brightness: Brightness.light,
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F8E9), // Cor do tema
      body: Center(
        child: Image.asset(
          'assets/imagens/logo-parana-despachante-transparent.png',
          width: 500,
          height: 500,
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String currentPage = 'Início';

  void _abrirLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Não foi possível abrir o link')),
      );
    }
  }

  Widget _buildPage(String page) {
    switch (page) {
      case 'Sou Lojista':
        return _paginaTexto(
          titulo: 'Tenha um despachante\nparceiro em sua\nLoja de carros',
          texto:
              'A Paraná Despachante conta com uma equipe de 45 funcionários treinados e capacitados para atuar em todas as áreas de documentação de veículos, tanto na matriz quanto nas concessionárias atendidas.\n\n'
              'Conheça-nos! Nossa equipe está apta a solucionar as mais diversas demandas junto ao Detran-PR e demais órgãos competentes, dentro e fora do estado.',
        );

      case 'Serviços':
        return _paginaLista(
          titulo: 'NOSSOS SERVIÇOS',
          itens: [
            'Transferência Sem Reserva',
            'Transferência Com Baixa ou Inclusão de Gravame',
            'Transferência Com Baixa e Inclusão de Gravame',
            '2ª Via CRV/ ALTERAÇÃO DE DADOS (Sem transferência de Nome)',
            '2ª Via CRV/ Com Mudança de Município (Sem Transferência de No'
                'me)',
            'Transferência de Outro Estado Sem Reserva',
            'Transferência de Outro Estado Com Baixa ou Inclusão de Gravame',
            'Transferência de Outro Estado Com Baixa e Inclusão de Gravame',
            'Transferência de Outro Estado Sem Transferência de Nome',
            '1º Emplacamento Sem Inclusão de Gravame',
            '1º Emplacamento com Inclusão de Gravame',
            'Auto Financiamento Baixa e Alienar',
            'Auto Financiamento só Alienar',
            'Alteração para Mercosul sem Transferência',
            'Gerar Guia Detran',
            'Comunicação de Venda',
            'Baixa de Comunicado de Venda',
            'Baixa de Média Monta',
            'Pagamento de Débitos',
            'Certidões',
            'Escolha de Placa',
            'Preenchimento de ATPV',
            'Emissão de CRLV',
            'Autorização de CSV',
            'Desdobramento de Vistoria',
            'Placas Carro/Moto',
          ],
        );

      case 'Formulários':
        final List<Map<String, String>> formularios = [
          {
            'nome': 'Anuência de Oficio',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO1',
          },
          {
            'nome': 'Alienação Indevida',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO2',
          },
          {
            'nome': 'Baixa de Reserva de Dominio',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO2',
          },
          {
            'nome': 'Baixa de Media Monta',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Cancelamento de Comunicado de Venda',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Contrato de Reserva de dominio',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'CRLV Sinistro',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Contrato Arrendamento ANTT Transporte de Carga',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Declaração de Etiqueta ETA',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Declaração para Desativação de Comunicado de Venda',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Declaração de Mudança de Motor',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Declaração de Venda',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Declaração de Vistoria em Trânsito',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Declaração de Troca de Cor',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Declaração de Mão de Obra Sinistro Recuperado',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Declaração para Substituir Licenciamento de outro Estado',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Declaração para Remarcação de Chassi',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Extravio 2ª via CRV',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Procuração Particular',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Regularizacao de Combustivel',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Regularizacao de Intenção de Venda',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
          {
            'nome': 'Termo de Baixa de Veículo',
            'url': 'https://drive.google.com/uc?export=download&id=EXEMPLO3',
          },
        ];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Formulários para Download',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: formularios.length,
                  itemBuilder: (context, index) {
                    final item = formularios[index];
                    return ListTile(
                      title: Text(item['nome']!),
                      trailing: Icon(Icons.download),
                      onTap: () {
                        // código para abrir ou baixar item['url']
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      case 'Detrans':
        final detrans = {
          'PR': 'https://www.detran.pr.gov.br',
          'AC': 'https://www.detran.ac.gov.br',
          'AL': 'https://www.detran.al.gov.br',
          'AM': 'https://www.detran.am.gov.br',
          'AP': 'https://www.detran.ap.gov.br',
          'BA': 'https://www.detran.ba.gov.br',
          'CE': 'https://www.detran.ce.gov.br',
          'DF': 'https://www.detran.df.gov.br',
          'ES': 'https://detran.es.gov.br',
          'GO': 'https://www.detran.go.gov.br',
          'MA': 'https://www.detran.ma.gov.br',
          'MG': 'https://www.detran.mg.gov.br',
          'MS': 'https://www.detran.ms.gov.br',
          'MT': 'https://www.detran.mt.gov.br',
          'PA': 'https://www.detran.pa.gov.br',
          'PB': 'https://www.detran.pb.gov.br',
          'PE': 'https://www.detran.pe.gov.br',
          'PI': 'https://www.pi.gov.br/orgao/departamento-estadual-de-transito-detran',
          'RJ': 'https://www.detran.rj.gov.br',
          'RN': 'http://www.detran.rn.gov.br',
          'RO': 'https://www.detran.ro.gov.br',
          'RR': 'https://www.detran.rr.gov.br',
          'RS': 'https://www.detran.rs.gov.br',
          'SC': 'https://www.detran.sc.gov.br',
          'SE': 'https://www.detran.se.gov.br',
          'SP': 'https://www.detran.sp.gov.br',
          'TO': 'https://www.to.gov.br/detran',
        };

        return ListView(
          children: detrans.entries.map((entry) {
            final uf = entry.key;
            final url = entry.value;
            return ListTile(
              title: Text('DETRAN $uf'),
              trailing: Icon(Icons.open_in_new),
              onTap: () => _abrirLink(url),
            );
          }).toList(),
        );

      case 'Contato':
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contato',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A681E)),
              ),
              SizedBox(height: 20),
              SelectableText('Rua Alferes Poli, 1391. Rebouças, Curitiba-PR.'),
              SizedBox(height: 20),
              SelectableText(
                  'Atendimento de segunda a sexta, das 8:30h às 18h, sem fechar para o almoço.'),
              SelectableText('Sábado 9hs às 12hs.'),
              SizedBox(height: 20),
              SelectableText('admin@paranadespachante.com.br'),
              SizedBox(height: 20),
              SelectableText('(41) 3015 - 5501'),
              SelectableText('(41) 9926-1312'),
              SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    tooltip: 'Enviar email',
                    icon: Icon(Icons.email),
                    onPressed: () =>
                        _abrirLink('mailto:admin@paranadespachante.com.br'),
                  ),
                  IconButton(
                    tooltip: 'Ligar',
                    icon: Icon(Icons.phone),
                    onPressed: () => _abrirLink('tel:+554130155501'),
                  ),
                  IconButton(
                    tooltip: 'Enviar WhatsApp',
                    icon: FaIcon(FontAwesomeIcons.whatsapp,
                        color: Color(0xFF25D366)),
                    onPressed: () => _abrirLink('https://wa.me/554199261312'),
                  ),
                ],
              )
            ],
          ),
        );

      default:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/imagens/logo-parana-despachante-transparent.png',
                  width: 400,
                  height: 400,
                ),
                SizedBox(height: 30),
                Text(
                  'Bem-vindo ao Paraná Despachante',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A2F28)),
                ),
              ],
            ),
          ),
        );
    }
  }

  Widget _paginaTexto({required String titulo, required String texto}) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: Color(0xFF1A681E),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32, // Maior destaque
                fontWeight: FontWeight.w900,
                color: Color(0xFF1A681E),
                height: 1.3,
              ),
            ),
            SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  texto,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _paginaLista({required String titulo, required List<String> itens}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A681E)),
            ),
            SizedBox(height: 16),
            ...itens.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle,
                          size: 18, color: Color(0xFFFFCC29)),
                      SizedBox(width: 8),
                      Expanded(child: Text(item)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(currentPage),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFFDCEDC8)),
                child: Center(
                  child: Text(
                    'Paraná Despachante',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
              ),
              _drawerItem('Início'),
              _drawerItem('Sou Lojista'),
              _drawerItem('Serviços'),
              _drawerItem('Formulários'),
              _drawerItem('Detrans'),
              _drawerItem('Contato'),
            ],
          ),
        ),
        body: _buildPage(currentPage),
      ),
    );
  }


  Widget _drawerItem(String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        setState(() {
          currentPage = title;
        });
        Navigator.pop(context);
      },
    );
  }
}

class FormularioBusca extends StatefulWidget {
  final Function(String) onAbrirLink;
  const FormularioBusca({required this.onAbrirLink});

  @override
  State<FormularioBusca> createState() => _FormularioBuscaState();
}

class _FormularioBuscaState extends State<FormularioBusca> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _formularios = [];
  List<Map<String, String>> _filtrados = [];

  @override
  void initState() {
    super.initState();
    _formularios = [
      // Você pode preencher futuramente. Atualmente vazio conforme solicitado.
    ];
    _filtrados = _formularios;
  }

  void _filtrar(String texto) {
    setState(() {
      _filtrados = _formularios.where((item) {
        return item['nome']!.toLowerCase().contains(texto.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Buscar formulário',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: _filtrar,
          ),
          SizedBox(height: 16),
          Expanded(
            child: _filtrados.isEmpty
                ? Center(child: Text('Nenhum formulário encontrado'))
                : ListView.builder(
                    itemCount: _filtrados.length,
                    itemBuilder: (context, index) {
                      final item = _filtrados[index];
                      return Card(
                        child: ListTile(
                          title: Text(item['nome'] ?? ''),
                          trailing: Icon(Icons.download),
                          onTap: () => widget.onAbrirLink(item['url'] ?? ''),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
