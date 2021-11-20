import 'package:ecommerce_bloc/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  static const String routeName = '/checkout';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  'ORDER NOW',
                  style: Theme.of(context).textTheme.headline3!,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CUSTOMER INFORMATION',
                  style: Theme.of(context).textTheme.headline3,
                ),
                _buildTextFormField(emailController, context, 'Email'),
                _buildTextFormField(nameController, context, 'Full Name'),
                const SizedBox(height: 20),
                Text(
                  'DELIVERY INFORMATION',
                  style: Theme.of(context).textTheme.headline3,
                ),
                _buildTextFormField(addressController, context, 'Address'),
                _buildTextFormField(cityController, context, 'City'),
                _buildTextFormField(countryController, context, 'Country'),
                _buildTextFormField(zipCodeController, context, 'ZIP Code'),
                const SizedBox(height: 20),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 12,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          'SELECT A PAYMENT METHOD',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ORDER SUMMARY',
                  style: Theme.of(context).textTheme.headline3,
                ),
                const OrderSummary(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    TextEditingController controller,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
