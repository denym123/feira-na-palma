import 'package:intl/intl.dart';

extension MoneyFormatter on num {
  /// Formata o número (assumido como valor em centavos) para uma string de moeda.
  ///
  /// Converte `this` (assumido como inteiro em centavos) para a unidade monetária principal
  /// (dividindo por 100.0) antes de formatar.
  ///
  /// [locale]: O código da localidade para formatação (ex: 'pt_BR', 'en_US').
  ///           Se não for especificado, usará a localidade padrão do sistema.
  /// [symbol]: O símbolo da moeda a ser usado. Se não for especificado,
  ///           o símbolo padrão da localidade será usado.
  /// [decimalDigits]: Número de casas decimais para exibir. Padrão é 2.
  /// [name]: O nome da moeda (ex: 'BRL', 'USD').
  /// [customPattern]: Um padrão de formatação customizado.
  ///
  /// Exemplo:
  /// - 1234.toCurrency() => "R$ 12,34" (se a localidade for pt_BR)
  /// - 50.toCurrency(locale: 'en_US', symbol: '\$') => "$0.50"
  String toCurrency({
    String? locale,
    String? symbol,
    int decimalDigits = 2, // Default para moedas em centavos
    String? name,
    String? customPattern,
  }) {
    // Converte o valor de centavos para a unidade principal (ex: 1234 -> 12.34)
    double valueInUnits = this.toDouble() / 100.0;
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: decimalDigits,
      name: name,
      customPattern: customPattern,
    );
    return formatter.format(valueInUnits);
  }

  /// Formata o número (assumido como valor em centavos) para Real Brasileiro (BRL).
  ///
  /// Sempre usa a localidade 'pt_BR' e o símbolo 'R$'.
  ///
  /// Exemplo:
  /// - 1234.toBRL() => "R$ 12,34"
  /// - 50.toBRL() => "R$ 0,50"
  String toBRL() {
    return toCurrency(locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2);
  }

  /// Formata o número (assumido como valor em centavos) para Dólar Americano (USD).
  ///
  /// Sempre usa a localidade 'en_US' e o símbolo '$'.
  ///
  /// Exemplo:
  /// - 1234.toUSD() => "$12.34"
  /// - 50.toUSD() => "$0.50"
  String toUSD() {
    return toCurrency(locale: 'en_US', symbol: '\$', decimalDigits: 2);
  }

  /// Formata o número (assumido como valor na unidade monetária principal)
  /// para uma string de moeda.
  ///
  /// Use este método se o seu número JÁ ESTÁ na unidade principal (ex: 12.34 para R$ 12,34).
  ///
  /// [locale]: O código da localidade para formatação.
  /// [symbol]: O símbolo da moeda.
  /// [decimalDigits]: Número de casas decimais.
  /// [name]: O nome da moeda.
  /// [customPattern]: Um padrão de formatação customizado.
  ///
  /// Exemplo:
  /// - 123.45.toCurrencyFromUnits(locale: 'en_US', symbol: '\$') => "$123.45"
  /// - 50.toCurrencyFromUnits(locale: 'pt_BR') => "R$ 50,00"
  String toCurrencyFromUnits({
    String? locale,
    String? symbol,
    int? decimalDigits,
    String? name,
    String? customPattern,
  }) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: decimalDigits,
      name: name,
      customPattern: customPattern,
    );
    return formatter.format(this);
  }

  /// Formata o número (assumido como valor na unidade monetária principal)
  /// para Real Brasileiro (BRL).
  ///
  /// Exemplo:
  /// - 123.45.toBRLFromUnits() => "R$ 123,45"
  /// - 50.toBRLFromUnits() => "R$ 50,00"
  String toBRLFromUnits() {
    return toCurrencyFromUnits(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );
  }
}
