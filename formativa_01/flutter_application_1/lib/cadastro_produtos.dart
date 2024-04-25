import 'dart:convert';

import 'package:flutter/material.dart';
import 'produtos_cadastrados.dart'; // Importe o arquivo correto
import 'package:http/http.dart' as http;

class CadastroProdutosPage extends StatefulWidget {

  @override
  _CadastroProdutosPageState createState() => _CadastroProdutosPageState();
}

class _CadastroProdutosPageState extends State<CadastroProdutosPage> {
  final _nomeController = TextEditingController();
  final _valorController = TextEditingController();
  final _quantidadeController = TextEditingController();

  String get url => "http://10.109.83.5:3000/produtos";

  _post() async {
    Map<String, dynamic> mensagem = {"nome": "PS5", "valor": "3700"};
    Map<String, dynamic> msg2 = {"nome": "Mac Pro", "valor": "15000"};

    await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(msg2),
    ); // Atualiza a lista de produtos após adicionar um novo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produtos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do Produto',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _valorController,
              decoration: InputDecoration(
                labelText: 'Valor do Produto',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _quantidadeController,
              decoration: InputDecoration(
                labelText: 'Quantidade do Produto',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                // Cria um novo produto com os dados dos campos
                String nomeProduto = _nomeController.text;
                double valorProduto =
                    double.tryParse(_valorController.text) ?? 0.0;
                int quantidadeProduto =
                    int.tryParse(_quantidadeController.text) ?? 0;

                // Coloque a lógica para adicionar o produto em algum lugar

                // Após cadastrar o produto, navegue para a tela de produtos cadastrados
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Cadastrar Produto'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navegue para a tela de produtos cadastrados
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text('Ver Produtos Cadastrados'),
            ),
          ],
        ),
      ),
    );
  }
}
