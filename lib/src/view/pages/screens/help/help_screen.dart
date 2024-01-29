import 'package:flutter/material.dart'; // Importa o pacote flutter/material.dart para utilizar os widgets do Flutter.
import 'package:get/get.dart'; // Importa o pacote get/get.dart para utilizar o GetX, um framework de gerenciamento de estado e navegação.
import 'package:patinha_perdida_app/src/config/cutom_color_config.dart'; // Importa um arquivo local para configurações de cores personalizadas.
import 'package:patinha_perdida_app/src/pages_routes/pages_app.dart'; // Importa um arquivo local contendo rotas de páginas.
import 'package:patinha_perdida_app/src/services/util_services.dart'; // Importa um arquivo local para serviços utilitários.
import 'package:patinha_perdida_app/src/services/validators_services.dart'; // Importa um arquivo local para serviços de validação.

class HelpScreen extends StatefulWidget {
  // Classe HelpScreen que estende StatefulWidget.
  const HelpScreen({super.key}); // Construtor da classe HelpScreen.

  @override
  State<HelpScreen> createState() =>
      _HelpScreenState(); // Método que cria o estado da classe HelpScreen.
}

class _HelpScreenState extends State<HelpScreen> {
  // Classe _HelpScreenState que estende o estado de HelpScreen.
  final _formKey = GlobalKey<FormState>(); // Chave global para o formulário.
  final UtilsServices _utilsServices =
      UtilsServices(); // Instância de UtilsServices para exibir toasts.

  @override
  Widget build(BuildContext context) {
    // Método que constrói a interface gráfica da tela.
    return Scaffold(
      // Retorna um Scaffold, que é uma estrutura básica para a construção de telas.
      body: Form(
        // Formulário para validação de campos.
        key: _formKey, // Chave global do formulário para validação.
        child: SingleChildScrollView(
          // SingleChildScrollView para evitar overflow na tela.
          child: Padding(
            // Padding para adicionar espaçamento em volta dos elementos.
            padding: const EdgeInsets.all(
                20), // Espaçamento de 20 em todos os lados.
            child: Column(
              // Coluna para organizar os elementos verticalmente.
              children: [
                // Lista de widgets filhos da coluna.
                const Text(
                  // Widget de texto com "Caso tenha alguma duvida ou sugestão..."
                  "Caso tenha alguma duvida ou sugestão, deixe um comentário logo abaixo que iremos responder o mais breve possível! :)", // Texto a ser exibido.
                  style: TextStyle(
                    // Estilo do texto.
                    fontSize: 18, // Tamanho da fonte.
                    fontWeight: FontWeight.bold, // Peso da fonte.
                  ),
                  textAlign:
                      TextAlign.center, // Alinhamento do texto ao centro.
                ),
                const Padding(
                    padding:
                        EdgeInsets.all(13)), // Espaçamento entre elementos.

                TextFormField(
                  // Campo de texto para informar o nome.
                  validator:
                      nameSuggestionValidator, // Função de validação do nome.
                  decoration: InputDecoration(
                    // Decoração do campo de texto.
                    labelText:
                        "Informe seu nome...", // Rótulo do campo de texto.
                    isDense:
                        true, // Reduz o espaçamento interno do campo de texto.
                    border: OutlineInputBorder(
                      // Borda do campo de texto.
                      borderRadius:
                          BorderRadius.circular(18), // Borda circular.
                    ),
                  ),
                ),
                const Padding(
                    padding:
                        EdgeInsets.all(13)), // Espaçamento entre elementos.

                TextFormField(
                  // Campo de texto para informar o email.
                  validator:
                      emailSuggestionValidator, // Função de validação do email.
                  decoration: InputDecoration(
                    // Decoração do campo de texto.
                    labelText:
                        "Email para entrarmos em contato...", // Rótulo do campo de texto.
                    isDense:
                        true, // Reduz o espaçamento interno do campo de texto.
                    border: OutlineInputBorder(
                      // Borda do campo de texto.
                      borderRadius:
                          BorderRadius.circular(18), // Borda circular.
                    ),
                  ),
                ),
                const Padding(
                    padding:
                        EdgeInsets.all(13)), // Espaçamento entre elementos.

                TextFormField(
                  // Campo de texto para deixar o comentário ou sugestão.
                  validator:
                      suggestionValidator, // Função de validação do comentário ou sugestão.
                  decoration: const InputDecoration(
                    // Decoração do campo de texto.
                    hintText: "Comentário ou sugestão", // Texto de dica.
                    border: OutlineInputBorder(), // Borda do campo de texto.
                  ),
                  maxLines: 9, // Número máximo de linhas do campo de texto.
                ),
                const Padding(
                    padding:
                        EdgeInsets.all(13)), // Espaçamento entre elementos.

                const Padding(
                  // Padding para adicionar espaçamento inferior.
                  padding: EdgeInsets.only(
                      bottom: 20), // Espaçamento inferior de 20.
                  child: Text(
                    // Widget de texto com "É muito importante conhecermos sua opinião..."
                    "É muito importante conhecermos sua opinião. Você faz parte do Patinha Perdida!", // Texto a ser exibido.
                    style: TextStyle(
                      // Estilo do texto.
                      fontSize: 16, // Tamanho da fonte.
                    ),
                    textAlign:
                        TextAlign.center, // Alinhamento do texto ao centro.
                  ),
                ),

                Row(
                  // Linha para organizar os botões horizontalmente.
                  mainAxisAlignment: MainAxisAlignment
                      .spaceAround, // Alinhamento principal dos elementos ao redor.
                  children: [
                    // Lista de widgets filhos da linha.
                    OutlinedButton(
                      // Botão de cancelar.
                      onPressed: () {
                        // Função executada ao pressionar o botão.
                        _utilsServices.showToast(
                            // Exibe um toast de mensagem de cancelamento.
                            message: "Comentário cancelado!",
                            isError: true); // Mensagem de erro.
                        Get.toNamed(PagesRoutes
                            .baseScreen); // Navega para a tela baseScreen utilizando GetX.
                      },
                      style: OutlinedButton.styleFrom(
                        // Estilo do botão de cancelar.
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30), // Espaçamento interno do botão.
                        shape: RoundedRectangleBorder(
                          // Forma do botão.
                          borderRadius:
                              BorderRadius.circular(20), // Borda circular.
                        ),
                      ),
                      child: Text(
                        // Texto do botão de cancelar.
                        "Cancelar", // Texto a ser exibido.
                        style: TextStyle(
                            // Estilo do texto.
                            fontSize: 15, // Tamanho da fonte.
                            letterSpacing: 2, // Espaçamento entre letras.
                            color: CustomColors
                                .customSwatchColorPurple), // Cor do texto.
                      ),
                    ),

                    ElevatedButton(
                      // Botão de enviar.
                      onPressed: () {
                        // Função executada ao pressionar o botão.
                        if (_formKey.currentState!.validate()) {
                          // Verifica se o formulário é válido.
                          Get.toNamed(PagesRoutes
                              .helpInfoScreen); // Navega para a tela helpInfoScreen utilizando GetX.
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // Estilo do botão de enviar.
                        backgroundColor: CustomColors
                            .customSwatchColorPurple, // Cor de fundo do botão.
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30), // Espaçamento interno do botão.
                        shape: RoundedRectangleBorder(
                          // Forma do botão.
                          borderRadius:
                              BorderRadius.circular(20), // Borda circular.
                        ),
                      ),
                      child: const Text(
                        // Texto do botão de enviar.
                        "Enviar", // Texto a ser exibido.
                        style: TextStyle(
                          // Estilo do texto.
                          fontSize: 15, // Tamanho da fonte.
                          letterSpacing: 2, // Espaçamento entre letras.
                          color: Colors.white, // Cor do texto.
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
