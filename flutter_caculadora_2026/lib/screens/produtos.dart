import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Simulador',
      home: Produtos(),
    ),
  );
}

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _AppState();
}

class _AppState extends State<Produtos> {
  double valor = 0;
  double juros = 0;
  int parcelas = 0;
  double taxas = 0;

  double valorParcela = 0;
  double valorTotal = 0;

  void calcular() {
    double taxa = juros / 100;

    double jurosTotal = valor * taxa * parcelas;

    valorTotal = valor + jurosTotal + taxas;

    valorParcela = valorTotal / parcelas;

    setState(() {});
  }

  void alert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Resultado"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Valor total a ser pago: R\$ ${valorTotal.toStringAsFixed(2)}",
              ),
              Text("Valor da parcela: R\$ ${valorParcela.toStringAsFixed(2)}"),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Simulador de Financiamento")),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25.0),
        backgroundColor: const Color.fromARGB(255, 173, 206, 127),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            Text("Valor do financiamento:", style: TextStyle(fontSize: 20)),

            TextField(
              decoration: InputDecoration(
                labelText: "Valor do financiamento",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                valor = double.parse(v);
              },
            ),

            Text("Taxa de Juros ao mês:", style: TextStyle(fontSize: 20)),

            TextField(
              decoration: InputDecoration(
                labelText: "Taxa de juros ao mês",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                juros = double.parse(v);
              },
            ),

            Text("Número de parcelas:", style: TextStyle(fontSize: 20)),

            TextField(
              decoration: InputDecoration(
                labelText: "Número de parcelas",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                parcelas = int.parse(v);
              },
            ),

            Text("Outras taxas e custos:", style: TextStyle(fontSize: 20)),

            TextField(
              decoration: InputDecoration(
                labelText: "Outras taxas e custos",
                border: OutlineInputBorder(),
              ),
              onChanged: (v) {
                taxas = double.parse(v);
              },
            ),

            ElevatedButton(
              onPressed: () {
                calcular();
                alert(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 183, 223, 148)),
              child: Text("Calcular", 
              style: TextStyle(color: Colors.white),
              ),
            ),

            Text(
              "Valor total a ser pago: R\$ ${valorTotal.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),

            Text(
              "Valor da parcela: R\$ ${valorParcela.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}