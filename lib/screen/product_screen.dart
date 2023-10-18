import 'package:api_project_bloc/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(const ProductLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductLoadedState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Data Loaded")));
            } else if (state is ProductErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Data Not Loaded")));
            }
          },
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is ProductErrorState) {
              return Center(child: Text(state.errorMessage));
            } else if (state is ProductLoadedState) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.productModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text(state.productModel[index].title.toString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
