import 'package:cloud_firestore/cloud_firestore.dart'; // Importa o pacote cloud_firestore, que permite interagir com o Firebase Firestore.
import 'package:patinha_perdida_app/src/model/post_model.dart'; // Importa o arquivo que contém a classe PostModel.

class PostDAO {
  // Define a classe PostDAO para lidar com operações relacionadas aos posts no Firestore.
  final CollectionReference colecao = FirebaseFirestore.instance
      .collection("relatos"); // Referência à coleção "relatos" no Firestore.

  Future<void> addPost(PostModel post, String doc) {
    // Método para adicionar um novo post ao Firestore.
    return colecao.add(post
        .toMap()); // Adiciona o post convertido em um mapa à coleção e retorna um Future.
  }

  Future<List<PostModel>> getPosts(String doc) async {
    // Método para obter todos os posts do Firestore.
    final QuerySnapshot resultado =
        await colecao.get(); // Obtém um snapshot dos documentos na coleção.

    final List<DocumentSnapshot> lista =
        resultado.docs; // Obtém a lista de documentos do snapshot.

    return lista.map((DocumentSnapshot documento) {
      // Mapeia cada documento para um objeto PostModel.
      return PostModel.fromFirestore(
          documento); // Cria um objeto PostModel a partir do documento.
    }).toList(); // Retorna a lista de objetos PostModel.
  }

  Future<int> obterTotalRegistros() async {
    // Método para obter o total de registros na coleção.
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('relatos')
          .get(); // Obtém um snapshot dos documentos na coleção.

      int totalRegistros =
          querySnapshot.size; // Obtém o número de documentos na coleção.
      return totalRegistros; // Retorna o total de registros.
    } catch (e) {
      // Captura qualquer exceção que ocorra.
      print('Erro ao obter total de registros: $e'); // Exibe o erro no console.
      return 0; // Retorna 0 em caso de erro.
    }
  }

  Future<double> obterPorcentagemRegistrosMachucado() async {
    // Método para obter a porcentagem de registros com animais machucados.
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('relatos')
        .get(); // Obtém um snapshot dos documentos na coleção.

    int totalRegistros =
        querySnapshot.size; // Obtém o número total de registros.

    QuerySnapshot querySnapshots = await FirebaseFirestore
        .instance // Obtém um snapshot dos documentos na coleção filtrados por animais machucados.
        .collection('relatos')
        .where('machucado', isEqualTo: true)
        .get();

    int totalRegistrosMachucado = querySnapshots
        .size; // Obtém o número de registros com animais machucados.

    if (totalRegistrosMachucado == 0) {
      // Verifica se não há registros com animais machucados.
      return 0.0; // Retorna 0.0 se não houver registros.
    }

    double porcentagemMachucado = (totalRegistrosMachucado / totalRegistros) *
        100.0; // Calcula a porcentagem de registros com animais machucados.
    return porcentagemMachucado; // Retorna a porcentagem.
  }

  // Métodos semelhantes para obter a porcentagem de registros com animais desnutridos, sem coleira e não dóceis.
}
