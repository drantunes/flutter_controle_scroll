import 'package:flutter/material.dart';
import 'package:flutter_controle_scroll/models/comida.dart';
import 'package:flutter_controle_scroll/repositories/comida_repository.dart';

class RestauranteDetalhes extends StatefulWidget {
  RestauranteDetalhes({Key? key}) : super(key: key);

  @override
  _RestauranteDetalhesState createState() => _RestauranteDetalhesState();
}

class _RestauranteDetalhesState extends State<RestauranteDetalhes> {
  final List<GlobalKey> categorias = [GlobalKey(), GlobalKey(), GlobalKey()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(
        builder: (BuildContext context) {
          // tabContext = context;
          return Scaffold(
            appBar: AppBar(
              leading: BackButton(color: Colors.red),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                )
              ],
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'BURGÃO',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Entrega em 40-50 min',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  )
                ],
              ),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text('Carnes')),
                  Tab(child: Text('Burgers')),
                  Tab(child: Text('Combos')),
                ],
                onTap: (int index) => print('scroll p/ categoria'),
                //scrollTo(index),
              ),
            ),
            body: SingleChildScrollView(
              // controller: scrollCont,
              child: Column(
                children: [
                  categoriaComida('Carnes', 0),
                  gerarListaComidas(ComidaRepository.carnes),
                  categoriaComida('Burgers', 1),
                  gerarListaComidas(ComidaRepository.burgers),
                  categoriaComida('Combos', 2),
                  gerarListaComidas(ComidaRepository.combos),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  gerarListaComidas(List<Comida> comidas) {
    return Column(
      children: comidas.map((comida) => comidaItem(comida)).toList(),
    );
  }

  Widget comidaItem(Comida comida) {
    return Column(
      children: [
        ListTile(
          title: Text(comida.nome),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comida.descricao,
                  style: TextStyle(fontSize: 13),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    comida.preco,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          trailing: Image.network(comida.imagem),
          contentPadding: EdgeInsets.all(15),
        ),
        Divider(),
      ],
    );
  }

  Widget categoriaComida(String titulo, int index) {
    return Padding(
      key: categorias[index],
      padding: EdgeInsets.only(top: 24),
      child: Column(
        children: [
          ListTile(
            title: Text(
              titulo,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
