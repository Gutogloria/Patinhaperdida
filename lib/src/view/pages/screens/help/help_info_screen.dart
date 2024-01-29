import 'package:flutter/material.dart'; // Importação do pacote flutter/material.dart para utilizar os widgets do Flutter.
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Importação do pacote flutter_spinkit/flutter_spinkit.dart para utilizar animações de carregamento.
import 'package:get/get.dart'; // Importação do pacote get/get.dart para utilizar o GetX, um framework de gerenciamento de estado e navegação.
import 'package:google_fonts/google_fonts.dart'; // Importação do pacote google_fonts/google_fonts.dart para utilizar fontes do Google Fonts.
import 'package:patinha_perdida_app/src/config/cutom_color_config.dart'; // Importação de um arquivo local para configurações de cores personalizadas.
import 'package:patinha_perdida_app/src/pages_routes/pages_app.dart'; // Importação de um arquivo local contendo rotas de páginas.

class HelpInfoScreen extends StatefulWidget {
  // Classe HelpInfoScreen que estende StatefulWidget.
  const HelpInfoScreen({super.key}); // Construtor da classe HelpInfoScreen.

  @override
  State<HelpInfoScreen> createState() =>
      _HelpInfoScreenState(); // Método que cria o estado da classe HelpInfoScreen.
}

class _HelpInfoScreenState extends State<HelpInfoScreen> {
  // Classe _HelpInfoScreenState que estende o estado de HelpInfoScreen.
  @override
  void initState() {
    // Método chamado quando o estado é inicializado.
    super.initState(); // Chama o método initState da classe pai.

    Future.delayed(const Duration(seconds: 7), () {
      // Delay de 7 segundos antes de executar o código dentro da função anônima.
      // Ao invés de usar o Navigator, pushReplacement e a MaterialPageRoute nós usamos apenas Get.offNamed
      Get.offNamed(PagesRoutes
          .baseScreen); // Navega para a tela baseScreen utilizando GetX.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Método que constrói a interface gráfica da tela.
    return Material(
      // Retorna um Material, que é um widget que implementa o Material Design.
      child: Container(
        // Container que contém todos os elementos da tela.
        alignment:
            Alignment.center, // Alinhamento do conteúdo do container ao centro.
        decoration: BoxDecoration(
          // Decoração do container, neste caso, um gradiente linear de duas cores.
          gradient: LinearGradient(
            // Criação de um gradiente linear.
            begin: Alignment
                .topLeft, // Início do gradiente no canto superior esquerdo.
            end: Alignment
                .bottomRight, // Fim do gradiente no canto inferior direito.
            colors: [
              // Lista de cores para o gradiente.
              CustomColors.customSwatchColorPurple, // Cor personalizada roxa.
              CustomColors.customSwatchColor
                  .shade50, // Cor personalizada (tom de cinza).
            ],
          ),
        ),
        child: Column(
          // Coluna que organiza os elementos verticalmente.
          mainAxisSize: MainAxisSize
              .min, // Define o tamanho principal da coluna como o mínimo possível.
          children: [
            // Lista de widgets filhos da coluna.
            Expanded(
              // Widget que expande seu filho para preencher o espaço disponível.
              child: Column(
                // Coluna que organiza os elementos verticalmente.
                mainAxisAlignment: MainAxisAlignment
                    .center, // Alinhamento principal dos elementos ao centro.
                children: [
                  // Lista de widgets filhos da coluna.
                  Text(
                    // Widget de texto para exibir "Comentário enviado!".
                    "Comentário enviado!", // Texto a ser exibido.
                    style: GoogleFonts.righteous(
                      // Estilo do texto utilizando a fonte Righteous do Google Fonts.
                      fontSize: 38, // Tamanho da fonte.
                      fontWeight: FontWeight.w200, // Peso da fonte.
                      color: Colors.white, // Cor do texto.
                    ),
                  ),
                  const SizedBox(
                    // Espaçamento entre o texto e o próximo widget.
                    height: 10, // Altura do espaço.
                  ),
                  SpinKitPouringHourGlassRefined(
                    // Widget de animação de carregamento.
                    color: CustomColors
                        .customSwatchColorPurple, // Cor da animação (roxo personalizado).
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
