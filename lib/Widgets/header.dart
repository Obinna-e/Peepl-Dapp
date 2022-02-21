import 'package:flutter/material.dart';
import 'package:nftapp/constants/style.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchField(),
        ),
        Spacer(),
        Row(
          children: [
            Notification(),
            ConnectWallet(),
          ],
        )
      ],
    );
  }
}

class ConnectWallet extends StatelessWidget {
  const ConnectWallet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(defaultPadding * 0.75),
        decoration: BoxDecoration(
          color: callToAction,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: const Text(
            "Connect Wallet",
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}

class Notification extends StatelessWidget {
  const Notification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(defaultPadding * 0.75),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: const Icon(
            Icons.notifications_outlined,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search item, Collections...",
          hintStyle: const TextStyle(color: Colors.white70),
          prefixIcon: Icon(
            Icons.search_sharp,
            color: Colors.white70,
          ),
          fillColor: containerColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)))),
    );
  }
}
