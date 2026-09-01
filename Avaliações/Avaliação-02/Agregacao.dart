import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toMap()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toMap() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toMap()).toList(),
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}

void main() {
  var dep1 = Dependente("Hellboy");
  var dep2 = Dependente("Liz");
  var dep3 = Dependente("Abe Sapien");
  
  var func1 = Funcionario("Nuada", [dep1, dep2]);
  var func2 = Funcionario("Nuala", [dep3]);
  var func3 = Funcionario("Rei Balor", []);

  List<Funcionario> listaFuncionarios = [func1, func2, func3];
  
  var equipe = EquipeProjeto("Sistema de Vendas", listaFuncionarios);
  
  String jsonOutput = JsonEncoder.withIndent('  ').convert(equipe.toMap());
  print(jsonOutput);
}
