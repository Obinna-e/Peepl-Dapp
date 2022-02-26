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
        padding: const EdgeInsets.all(defaultPadding * 0.75),
        decoration: const BoxDecoration(
          color: callToAction,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Text(
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
          padding: const EdgeInsets.all(defaultPadding * 0.75),
          decoration: const BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.all(
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
      decoration: const InputDecoration(
          hintText: "Search item, Collections...",
          hintStyle: TextStyle(color: Colors.white70),
          prefixIcon: Icon(
            Icons.search_sharp,
            color: Colors.white70,
          ),
          fillColor: containerColor,
          helperStyle: TextStyle(color: Colors.white70),
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
    );
  }
}
