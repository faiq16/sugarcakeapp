import 'package:flutter/material.dart';

import '../../checkout/screen/checkout_screen.dart';
import '../../constants.dart';
import '../../models/cake.dart';
import '../../models/category.dart';
import '../../models/ingredient.dart';


class NotEmptyCart extends StatefulWidget {
  const NotEmptyCart({Key? key}) : super(key: key);

  @override
  State<NotEmptyCart> createState() => _NotEmptyCartState();
}


class _NotEmptyCartState extends State<NotEmptyCart> {
  late List<List<Cake>> cart = [];
  int totalPay = 0;

  final cake = Cake(
    name: 'Berries and Cream Puff Pastries with Cream Cheese Drizzle',
    description:
      'Oreo Cookies And Cream Cupcakes are ultra-moist with creamy Oreo buttercream and drizzled with glossy chocolate sauce',
    image: 'assets/images/10.jpg', 
    price: 4,
    ingredients: [
      ingredients[0],
      ingredients[11],
      ingredients[1],
      ingredients[7]
      ],
    categories: [categories[0], categories[1]],
    rating: 4.8,
    time: 15,
    );

  final cake2 = Cake(
    name: 'Red Velvet Cake Cheesecake',
    description:
      'Lime vanilla cupcakes with coconut frosting, sprinkled with lime zest and coconut, finished with a lime wedge.',
    image: 'assets/images/12.jpg', 
    price: 4,
    ingredients: [
      ingredients[6],
      ingredients[7],
      ingredients[1],
      ingredients[5]
    ],
    categories: [categories[0], categories[1]],
    rating: 4.8,
    time: 25,
  );


  @override
  initState() {
    super.initState();
    cart.add([cake, cake, cake]);
    cart.add([cake2]);
    totalPay = cart.fold(0, (previousValue, element) {
      return previousValue + element[0].price!.toInt() * element.length;
    });
    super.initState();
  }

  Widget cakeListTile(List<List<Cake>> cart, int index, Size size) {
    return Container(
      margin: const EdgeInsets.only(
          top: kDefaultPadding / 2, bottom: kDefaultPadding / 2),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      width: size.width * 0.8,
      height: size.height * 0.1,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          cart[index][0].name!,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
        ),
        leading: SizedBox(
          width: size.width * 0.20,
          height: size.height * 0.1,
          child: Image.asset(cart[index][0].image!),
        ),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              cart.remove(cart[index]);
            });
          },
          icon: const Icon(Icons.delete),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$ ${cart[index][0].price! * cart[index].length}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              children: [
                SizedBox(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (cart[index].length > 1) {
                          totalPay -= cart[index][0].price!.toInt();
                          cart[index].remove(cart[index][0]);
                        }
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
                Text(cart[index].length.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
                IconButton(
                  onPressed: () {
                    setState(() {
                      totalPay += cart[index][0].price!.toInt();
                      cart[index].add(cart[index][0]);
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget totalToPayRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total:',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        Text('\$${totalPay.toString()}',
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

  Widget elevatedCheckoutButton(Size size) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 35,
            spreadRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      width: size.width,
      height: size.height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 2, vertical: kDefaultPadding / 2),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutScreen(
                cart: cart,
              ),
            ),
          );
        },
        child: const Text('Checkout'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      return cakeListTile(cart, index, size);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                totalToPayRow(),
                const SizedBox(height: 10),
                elevatedCheckoutButton(size),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
