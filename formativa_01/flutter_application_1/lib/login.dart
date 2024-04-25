import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'cadastro_produtos.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Usuário',
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
                // Simulação de login bem-sucedido
                bool loginSucesso = true; // Altere para false para simular login falho

                if (loginSucesso) {
                  // Navega para a tela de cadastro de produtos
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CadastroProdutosPage()),
                  );
                } else {
                  // Caso contrário, exibe uma mensagem de erro
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Usuário ou senha incorretos'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Navega para a tela de cadastro de usuários
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroPage()),
                );
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
