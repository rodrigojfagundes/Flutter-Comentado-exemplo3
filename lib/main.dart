// CALCULADORA SALARIO

//Nesta versão da CALCULADORA SALARIO eu fiz o codigo bem simples...
//para verificar se o SALARIO é MAIOR ou MENOR q os gastos...
//
//
//

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//funcao main ta iniciando o MaterialApp e diz q a HOME/INICIO do APP é a funcao HOME
void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

//criando a classe Home...
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//ACHO Q aqui fica as VARIAVEIS e COISAS q MUDAM DE ESTADO....
class _HomeState extends State<Home> {
  //
  // Declarando as variaveis e dizendo q elas vao receber texto editavel
  TextEditingController salarioController = TextEditingController();
  TextEditingController gastoUmController = TextEditingController();
  TextEditingController gastoDoisController = TextEditingController();

  // ACHO Q aqui é relacionado ao BOTAO de ANALISAR SALARIO
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //variavel _resultado vai receber os dados da operacao feita com os valores das variaveis NumUm, NumDois, NumTres
  String _resultadoCalculadora = "Resultado: ";

//ao apertar no X q tem no TOPBAR é reiniciado os valores da calculadora... Zerando os valores das variaveis
  void _limpaCampos() {
    setState(() {
      salarioController.text = "";
      gastoUmController.text = "";
      gastoDoisController.text = "";
      //passando o valor de RESULTADO q no caso comeca com o valor 0
      _resultadoCalculadora = "Resultado: ";
    });
  }

//funcao calcular recebe o valor de UMA OPERACAO no formato INT
  void calcular(int operacao) {
    setState(() {
      //pegando o valor q ta nos campos EX double.parse(numUmController.text); e movendo para as variaveis DOUBLE numUm... etc..
      double salario = double.parse(salarioController.text);
      double gastoUm = double.parse(gastoUmController.text);
      double gastoDois = double.parse(gastoDoisController.text);

//variavel RESULTADO COMECA COM 0
      double resultado = 0;

//quando o uusario apertar no botao ANALISAR SALARIO...
//sera executado os codigos a baixo nas variaveis
      switch (operacao) {
        case 1:
          if (salario < gastoUm + gastoDois) {
            _resultadoCalculadora = "o salario e menor que os seus gastos";
          }
          if (salario > gastoUm + gastoDois) {
            _resultadoCalculadora = "o salario é maior q os gastos";
          }
          break;
      }
    });
  }

//carregando mais a parte de design do app
  @override
  //criando um widget de construcao
  Widget build(BuildContext context) {
    //
    //
    //criando o esqueleto, com um appBar escrito calculadora de salario... TopBar cor Verde e um botao de RESET em cima
    return Scaffold(
        appBar: AppBar(
          title: Text("Verificar salario"),
          backgroundColor: Colors.green,
          //
          //
          // criando o botao no topbar chamado LIMPA CAMPOS
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear),
              //ao ser precionado o botao chamaa funcao _LIMPA CAMPOS
              onPressed: _limpaCampos,
            )
          ],
        ),
        //
        //
        //ACHO Q daqui a baixo cria o design do corpo do APP
        body: SingleChildScrollView(
          //ACHO Q aqui ta dizendo q vamos criar um formulario (campos, colunas, etc..)
          child: Form(
            //eu acho q tem haver com o botao ANALISAR SALARIO
            key: _formKey,
            child: Column(
              //
              //
              //LOGO / IMAGEM q fica em cima no APP
              children: <Widget>[
                Icon(Icons.calculate, size: 120.0, color: Colors.green),
                //
                //
                //criando um FIELD(CAMPO) para add um numero e SALVAR na variavel SALARIO
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "informe o  salario",
                  ),
                  //alinhando o numero digitado no campo no centro do campo
                  textAlign: TextAlign.center,
                  //armazenando o valor digitado no campo, na variavel SALARIO
                  controller: salarioController,
                ),
                //
                //
                //criando o segundo campo para digitar o primeiro gasto
                TextFormField(
                  //campo só aceita valores numericos
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "primeiro gasto",
                  ),
                  //centralizando o numero digitado
                  textAlign: TextAlign.center,
                  //armazenando os valores digitado no CAMPO na variavel gastoUm
                  controller: gastoUmController,
                ),
                //
                //
                //terceiro campo para digitar GASTO DOIS
                TextFormField(
                  //campo tambem só aceita valores numericos... por causa do .number
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "terceiro gasto",
                  ),
                  //centralizando os valores digitados no centro do campo
                  textAlign: TextAlign.center,
                  //armazenando os valores digitados na variavel GASTO DOIS
                  controller: gastoDoisController,
                ),
                //
                //
                //Criando o botao
                Row(
                  //criando um widget (q sera um botao)
                  children: <Widget>[
                    RaisedButton(
                      //se o botao for precionadoo... e passado o valor 1 para funcao calcular
                      //valor 1 irá fazer a funcao calcular, verificar se o SALARIO e MAIOR q
                      //os gastos
                      onPressed: () {
                        //passando valor 1 parafuncao calcular
                        calcular(1);
                      },
                      //texto q vai aparecer no botao... no caso o + SOMAR
                      child: Text(
                        "analisar salario",
                      ),
                      //cor do botao verde
                      color: Colors.green,
                    ),
                  ],
                ),
                //campo text para exibir o resultado
                Text(
                  _resultadoCalculadora,
                  //centralizando o resultado
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
