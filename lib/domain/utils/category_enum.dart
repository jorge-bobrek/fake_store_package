enum Category {
  none,
  electronics,
  jewelery,
  mensClothing,
  womensClothing,
}

extension CategoryExtension on Category {
  /// Retorna, en formato reconozible para el API, el nombre de la categoría.
  String get name {
    switch (this) {
      case Category.electronics:
        return "electronics";
      case Category.jewelery:
        return "jewelery";
      case Category.mensClothing:
        return "men's clothing";
      case Category.womensClothing:
        return "women's clothing";
      case Category.none:
      default:
        return "none";
    }
  }

  /// Retorna el nombre de la categoría en español.
  String get displayName {
    switch (this) {
      case Category.electronics:
        return "Electrónicos";
      case Category.jewelery:
        return "Joyería";
      case Category.mensClothing:
        return "Ropa de hombre";
      case Category.womensClothing:
        return "Ropa de mujer";
      case Category.none:
      default:
        return "Sin filtro";
    }
  }
}
