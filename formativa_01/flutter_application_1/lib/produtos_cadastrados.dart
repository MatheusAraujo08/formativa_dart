import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "http://10.109.83.5:3000/produtos";
  List dado = [];
  var produtos = <Produto>[];

  _getDado() async {
    http.Response resposta = await http.get(Uri.parse(url));
    dado = json.decode(resposta.body);
    setState(() {
      produtos = dado.map((json) => Produto.fromJson(json)).toList();
    });
  }

  _post() async {
    Map<String, dynamic> mensagem = {"nome": "Nitro 5", "valor": "5000"};
    Map<String, dynamic> msg2 = {"nome": "Mac Book", "valor": "9500"};

    await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(msg2),
    );

    _getDado(); // Atualiza a lista de produtos após adicionar um novo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App http métodos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Get, Post, Put, delete http",
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(onPressed: _getDado, child: Text("Ler")),
            ElevatedButton(onPressed: _post, child: Text("Publicar")),
            Expanded(
              child: ListView.builder(
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(produtos[index].nome),
                    subtitle: Text('Valor: R\$ ${produtos[index].valor}'),
                    onTap: () {
                      // Lógica para quando o produto for selecionado
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Produto {
  String id;
  String nome;
  String valor;
  Produto(this.id, this.nome, this.valor);

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(json["id"], json["nome"], json["valor"]);
  }
}
