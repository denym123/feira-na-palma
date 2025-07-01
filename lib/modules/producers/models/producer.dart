class Producer {
  final String address;
  final String cpf;
  final String description;
  final String email;
  final String id;
  final String name;
  final String phone;

  Producer({
    required this.address,
    required this.cpf,
    required this.description,
    required this.email,
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Producer.fromJson(Map<String, dynamic> json, String id) {
    return Producer(
      id: id,
      name: json["name"],
      address: json["address"],
      cpf: json["cpf"],
      description: json["description"],
      email: json["email"],
      phone: json["phone"],
    );
  }
}
