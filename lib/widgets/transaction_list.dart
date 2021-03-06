import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  Function deleteTr;

  TransactionList(this.transactions, this.deleteTr);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 470,
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
          return Column(
            children: <Widget>[
              Text(
                'No transactions added yet!',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ],
          );
        })
            : ListView(
          children: transactions.map((Tr) =>
              TransactionItem(
                  key: ValueKey(Tr.id),
                  transaction: Tr,
                  deleteTr: deleteTr
              )).toList(),
        )
    );
  }
}
