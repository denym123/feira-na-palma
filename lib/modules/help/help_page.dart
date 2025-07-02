import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'help.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends PageLifeCycleState<HelpController, HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Perguntas Frequentes",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      ...[
                        {
                          "pergunta": "Como funciona o Feira na Palma?",
                          "resposta":
                              "Você faz seu pedido pelo aplicativo e os produtores locais preparam e entregam os produtos até você.",
                        },
                        {
                          "pergunta": "Como posso pagar pelos produtos?",
                          "resposta":
                              "Você pode pagar com cartão de crédito, débito, Pix ou boleto bancário.",
                        },
                        {
                          "pergunta": "Qual o prazo de entrega?",
                          "resposta":
                              "O prazo de entrega varia entre 1 a 3 dias úteis, dependendo da sua localização.",
                        },
                        {
                          "pergunta": "Os produtos são orgânicos?",
                          "resposta":
                              "Grande parte dos produtos é orgânica. A origem e tipo são indicados na descrição do produto.",
                        },
                        {
                          "pergunta": "Posso cancelar meu pedido?",
                          "resposta":
                              "Sim, você pode cancelar seu pedido até 12 horas antes da entrega.",
                        },
                        {
                          "pergunta": "Como avalio um produtor?",
                          "resposta":
                              "Após receber seu pedido, você pode avaliar o produtor diretamente pelo aplicativo.",
                        },
                      ].map(
                        (item) => Card(
                          child: ExpansionTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: Text(
                              item["pergunta"]!,
                              style: TextStyle(fontSize: 14),
                            ),

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item["resposta"]!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Entre em Contato",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.phone, color: Colors.green),
                              title: Text("Telefone"),
                              subtitle: Text("(11) 99999-9999"),
                            ),
                            ListTile(
                              leading: Icon(Icons.email, color: Colors.green),
                              title: Text("E-mail"),
                              subtitle: Text("contato@feiranapalma.com"),
                            ),
                            ListTile(
                              leading: Icon(Icons.chat, color: Colors.green),
                              title: Text("WhatsApp"),
                              subtitle: Text("(11) 88888-8888"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Sobre o Feira na Palma",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "O Feira na Palma é uma plataforma que conecta consumidores a pequenos produtores locais de hortaliças, promovendo o consumo de produtos frescos e apoiando a agricultura familiar.\n\n"
                        "Nossa missão é facilitar o acesso a alimentos saudáveis e fortalecer a economia local, criando uma ponte direta entre quem produz e quem consome.",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 80), // espaço para o menu inferior
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
