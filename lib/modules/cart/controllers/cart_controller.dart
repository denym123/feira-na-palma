import 'package:feira_na_palma/global_modules/user_cart/controllers/user_cart_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/core.dart';
import '../cart.dart';

class CartController with ControllerLifeCycle, CartVariables {
  final UserCartStore userCartStore = Modular.get<UserCartStore>();

  final CartRepository _cartRepository;

  CartController({required CartRepository cartRepository})
    : _cartRepository = cartRepository;

  Future<void> clearCart() async {
    userCartStore.globalCart.value.clear();
  }

  Future<void> clearItem(CartItem item) async {
    userCartStore.globalCart.value.remove(item);
  }

  Future<void> sendWhatsAppOrderMessage(List<CartItem> cartItems) async {
    if (cartItems.isEmpty) {
      return;
    }

    // Assumimos que todos os itens no carrinho são do MESMO produtor para esta mensagem
    final String producerName = cartItems.first.producerName;
    int totalOrderPriceCents = 0;
    String productsListText = '';

    String producerPhone = cartItems.first.producerPhone;

    for (var item in cartItems) {
      final int itemTotalPriceCents =
          item.amount * item.price; // Preço parcial do item em centavos
      totalOrderPriceCents += itemTotalPriceCents;

      // Formata cada linha do produto
      productsListText +=
          '- ${item.productName} - Qtd: ${item.amount} ${item.unit} - ${itemTotalPriceCents.toBRL()}\n';
    }

    // Formata o valor total do pedido
    final String formattedTotalPrice = totalOrderPriceCents.toBRL();

    // Monta a mensagem completa
    final String message =
        '''Olá, $producerName!

Tenho um novo pedido da plataforma Feira na Palma:

Produtos:
$productsListText
Valor total do pedido: $formattedTotalPrice

Aguardando sua confirmação!
''';

    // Codifica a mensagem para URL
    final String encodedMessage = Uri.encodeComponent(message);

    // Constrói a URL do WhatsApp
    final Uri whatsappUrl = Uri.parse(
      "whatsapp://send?phone=$producerPhone&text=$encodedMessage",
    );
    // Ou para web: final Uri whatsappUrl = Uri.parse("https://wa.me/$targetPhoneNumber?text=$encodedMessage");

    // Abre a URL no WhatsApp
    await launchUrl(whatsappUrl);
  }
}
