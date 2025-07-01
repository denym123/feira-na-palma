import 'package:feira_na_palma/core/extensions/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DifferentProducerModal {
  Future<bool> showDifferentProducerModal() async {
    bool shouldCleanCart = false;
    await showDialog(
      context: Modular.routerDelegate.navigatorKey.currentContext!,
      builder: (context) {
        return Dialog(
          backgroundColor: context.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Você tem certeza que deseja continuar?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                Text(
                  "Você está tentando adicionar o produto de outro feirante ao mesmo carrinho, tem certeza que deseja continuar?.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancelar"),
                    ),
                    FilledButton(
                      onPressed: () {
                        shouldCleanCart = true;
                        Navigator.of(context).pop();
                      },
                      child: Text("Limpar carrinho"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    return shouldCleanCart;
  }
}
