import 'package:flutter/material.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/constants/style.dart';

class Header extends StatefulWidget {
  final String? walletState;
  final VoidCallback connectWallet;
  const Header({Key? key, this.walletState, required this.connectWallet})
      : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo-red.png',
          width: 150,
          height: 150,
        ),
        const SizedBox(
          width: itemPadding + 80,
        ),
        ConnectWallet(
          text: widget.walletState,
          connectWallet: widget.connectWallet,
        ),
      ],
    );
  }
}

class ConnectWallet extends StatefulWidget {
  final String? text;
  final VoidCallback connectWallet;
  const ConnectWallet({Key? key, this.text, required this.connectWallet})
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
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: CustomText(
            text: widget.text == null ? 'Connect Wallet' : "${widget.text}",
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}
