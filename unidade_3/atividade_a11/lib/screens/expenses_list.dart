import 'package:bytebank/components/progress.dart';
import 'package:bytebank/database/dao/expense_dao.dart';
import 'package:bytebank/models/expense.dart';
import 'package:bytebank/screens/expense_form.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final ExpenseDao _dao = ExpenseDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas'),
      ),
      body: FutureBuilder<List<Expense>>(
        initialData: List(),
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Expense> expenses = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Expense expense = expenses[index];
                  return _ExpenseItem(
                    expense,
                  );
                },
                itemCount: expenses.length,
              );
              break;
          }
          return Text('Erro desconhecido');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ExpenseForm(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ExpenseItem extends StatelessWidget {
  final Expense expense;
  final Function onClick;

  _ExpenseItem(
    this.expense, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          expense.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          expense.value.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
