import 'package:flutter/material.dart';
import 'package:nftapp/controllers/home_controller.dart';
import 'package:nftapp/constants/style.dart';
import '../pages/vestingPage/vestingPage.dart';

class Header extends StatefulWidget {
  final String? walletState;
  final dynamic connectWallet;
  const Header({Key? key, this.walletState, this.connectWallet})
      : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
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
            ConnectWallet(
              text: widget.walletState,
              connectWallet: widget.connectWallet,
            ),
          ],
        )
      ],
    );
  }
}

class ConnectWallet extends StatefulWidget {
  final String? text;
  final dynamic connectWallet;
  const ConnectWallet({Key? key, this.text, this.connectWallet})
      : super(key: key);

  @override
  State<ConnectWallet> createState() => _ConnectWalletState();
}

class _ConnectWalletState extends State<ConnectWallet> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.connectWallet,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding * 0.75),
        decoration: const BoxDecoration(
          color: callToAction,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Text(
            widget.text == null ? 'Connect Wallet' : "${widget.text}",
            style: TextStyle(color: Colors.black),
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
