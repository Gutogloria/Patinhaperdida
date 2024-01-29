import 'package:fl_chart/fl_chart.dart'; // Importa o pacote fl_chart, que contém widgets para criar gráficos.
import 'package:flutter/material.dart'; // Importa o pacote flutter/material.dart, que contém os widgets básicos do Flutter.
import 'package:patinha_perdida_app/src/config/cutom_color_config.dart'; // Importa um arquivo com configurações de cores personalizadas.
import 'package:patinha_perdida_app/src/dao/post_dao.dart'; // Importa um arquivo que contém a classe PostDAO para acessar dados.

class DataPostScreen extends StatefulWidget {
  // Define uma classe chamada DataPostScreen que é um StatefulWidget.
  const DataPostScreen({super.key}); // Construtor da classe DataPostScreen.

  @override
  State<DataPostScreen> createState() =>
      _DataPostScreenState(); // Método que cria o estado da classe DataPostScreen.
}

class _DataPostScreenState extends State<DataPostScreen> {
  // Define a classe _DataPostScreenState que é o estado de DataPostScreen.
  PostDAO postDao =
      PostDAO(); // Instância da classe PostDAO para acessar os dados.

  @override
  Widget build(BuildContext context) {
    // Método que constrói a interface gráfica da tela.
    return Scaffold(
      // Retorna um Scaffold, que é uma estrutura básica para a construção de telas.
      body: SingleChildScrollView(
        // Retorna um SingleChildScrollView, que permite rolar o conteúdo da tela.
        child: Padding(
          // Retorna um Padding, que adiciona espaçamento ao redor do seu conteúdo.
          padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top:
                  10), // Define o espaçamento entre as bordas do Padding e seu conteúdo.
          child: Column(
            // Retorna uma Column, que organiza seus filhos verticalmente.
            mainAxisAlignment: MainAxisAlignment
                .center, // Define o alinhamento dos filhos no eixo vertical.
            crossAxisAlignment: CrossAxisAlignment
                .center, // Define o alinhamento dos filhos no eixo horizontal.
            children: [
              // Lista de widgets filhos da Column.
              FutureBuilder<int>(
                // Widget que constrói uma interface baseada em um Future<int>.
                future: postDao
                    .obterTotalRegistros(), // Future que retorna o total de registros.
                builder: (context, snapshot) {
                  // Função que constrói a interface com base no snapshot do Future.
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Verifica se o Future ainda está em execução.
                    return const CircularProgressIndicator(); // Retorna um indicador de progresso enquanto aguarda o resultado.
                  } else if (snapshot.hasError) {
                    // Verifica se ocorreu um erro durante a execução do Future.
                    return Text(
                        'Erro: ${snapshot.error}'); // Retorna uma mensagem de erro.
                  } else {
                    // Se o Future foi concluído com sucesso.
                    int totalRegistros = snapshot.data ??
                        0; // Obtém o total de registros do snapshot.
                    return Padding(
                      // Retorna um Padding, que adiciona espaçamento ao redor do seu conteúdo.
                      padding: const EdgeInsets.all(
                          10), // Define o espaçamento entre as bordas do Padding e seu conteúdo.
                      child: Padding(
                        // Retorna um Padding, que adiciona espaçamento ao redor do seu conteúdo.
                        padding: const EdgeInsets.only(
                            bottom:
                                20), // Define o espaçamento entre as bordas do Padding e seu conteúdo.
                        child: Text(
                          // Retorna um Text, que exibe texto na tela.
                          "Total de relatos: ${totalRegistros.toInt()}", // Texto a ser exibido.
                          style: const TextStyle(
                            // Estilo do texto.
                            fontSize: 20, // Tamanho da fonte.
                            fontWeight: FontWeight.bold, // Peso da fonte.
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              Divider(
                  color: Colors.grey[
                      300]), // Retorna um Divider, que exibe uma linha divisória.

              FutureBuilder<double>(
                // Widget que constrói uma interface baseada em um Future<double>.
                future: postDao
                    .obterPorcentagemRegistrosMachucado(), // Future que retorna a porcentagem de animais machucados.
                builder: (context, snapshot) {
                  // Função que constrói a interface com base no snapshot do Future.
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Verifica se o Future ainda está em execução.
                    return const CircularProgressIndicator(); // Retorna um indicador de progresso enquanto aguarda o resultado.
                  } else if (snapshot.hasError) {
                    // Verifica se ocorreu um erro durante a execução do Future.
                    return Text(
                        'Erro: ${snapshot.error}'); // Retorna uma mensagem de erro.
                  } else {
                    // Se o Future foi concluído com sucesso.
                    double porcentagem =
                        snapshot.data ?? 0; // Obtém a porcentagem do snapshot.
                    return Card(
                      // Retorna um Card, que exibe um widget com sombra e bordas arredondadas.
                      color: Colors.white, // Cor de fundo do Card.
                      margin:
                          const EdgeInsets.all(8.0), // Margem ao redor do Card.
                      shadowColor: Colors.grey, // Cor da sombra do Card.
                      child: Column(
                        // Retorna uma Column, que organiza seus filhos verticalmente.
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Define o alinhamento dos filhos no eixo vertical.
                        children: [
                          // Lista de widgets filhos da Column.
                          const Padding(
                            // Retorna um Padding, que adiciona espaçamento ao redor do seu conteúdo.
                            padding: EdgeInsets.only(
                                top:
                                    10), // Define o espaçamento entre as bordas do Padding e seu conteúdo.
                            child: Text(
                              // Retorna um Text, que exibe texto na tela.
                              "Porcentagem de animais machucados", // Texto a ser exibido.
                              style: TextStyle(
                                // Estilo do texto.
                                fontSize: 18, // Tamanho da fonte.
                              ),
                              textAlign: TextAlign
                                  .center, // Alinhamento do texto ao centro.
                            ),
                          ),
                          AspectRatio(
                            // Retorna um AspectRatio, que ajusta o tamanho de seu filho para um aspect ratio específico.
                            aspectRatio:
                                1, // Define a proporção entre largura e altura.
                            child: PieChart(
                              // Retorna um PieChart, que exibe um gráfico de pizza.
                              PieChartData(
                                // Dados do gráfico de pizza.
                                sectionsSpace:
                                    5, // Espaçamento entre as seções do gráfico.
                                centerSpaceRadius:
                                    70, // Raio do espaço central do gráfico.
                                sections: [
                                  // Lista de seções do gráfico de pizza.
                                  PieChartSectionData(
                                    // Dados de uma seção do gráfico de pizza.
                                    value: porcentagem, // Valor da seção.
                                    color: CustomColors
                                        .customContrastColor, // Cor da seção.
                                    title:
                                        '${porcentagem.toStringAsFixed(2)}%', // Título da seção (porcentagem formatada).
                                    radius: 50, // Raio da seção.
                                    titleStyle: const TextStyle(
                                      // Estilo do título da seção.
                                      fontSize: 16, // Tamanho da fonte.
                                      fontWeight:
                                          FontWeight.bold, // Peso da fonte.
                                      color: Colors.white, // Cor do texto.
                                    ),
                                  ),
                                  PieChartSectionData(
                                    // Dados de outra seção do gráfico de pizza.
                                    value: 100 - porcentagem, // Valor da seção.
                                    color: Colors.grey
                                        .withOpacity(0.2), // Cor da seção.
                                    title: '', // Título da seção (vazio).
                                    radius: 50, // Raio da seção.
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),

              // Outros FutureBuilders similares para exibir outras informações...
            ],
          ),
        ),
      ),
    );
  }
}
