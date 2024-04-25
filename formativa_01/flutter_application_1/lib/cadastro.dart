import 'package:flutter/material.dart';
import 'login.dart';

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome de Usuário',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Coloque aqui a lógica para cadastrar o usuário
              },
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Coloque aqui a lógica para deletar o usuário
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete),
                  SizedBox(width: 10.0),
                  Text('Deletar Usuário'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
