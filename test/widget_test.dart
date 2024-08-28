import 'package:test/test.dart';
import '../lib/main.dart';

void main() {
  test('Adicionar depósito na conta', () {
    var conta = ContaBancaria<Transacao>(titular: 'João Silva');
    conta.adicionarTransacao(Deposito(1000.0));
    conta.saldo += 1000.0;

    expect(conta.saldo, 1000.0);
    expect(conta.transacoes.length, 1);
    expect(conta.transacoes[0] is Deposito, true);
  });

  test('Adicionar retirada na conta', () {
    var conta = ContaBancaria<Transacao>(titular: 'Maria Souza');
    conta.adicionarTransacao(Retirada(500.0));
    conta.saldo -= 500.0;

    expect(conta.saldo, -500.0);
    expect(conta.transacoes.length, 1);
    expect(conta.transacoes[0] is Retirada, true);
  });

  test('Verificar o extrato da conta', () {
    var conta = ContaBancaria<Transacao>(titular: 'Ana Santos');
    conta.adicionarTransacao(Deposito(1500.0));
    conta.saldo += 1500.0;

    conta.adicionarTransacao(Retirada(300.0));
    conta.saldo -= 300.0;

    expect(conta.saldo, 1200.0);
    expect(conta.transacoes.length, 2);
  });
}
