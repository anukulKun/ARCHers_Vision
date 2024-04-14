import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wallet_provider.dart';
import 'create_or_import.dart'; // Assuming this is the correct import for the CreateOrImportPage
import 'wallet.dart'; // Assuming this is the correct import for the WalletPage

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    if (walletProvider.privateKey == null) {
      // If private key doesn't exist, load CreateOrImportPage
      return  CreateOrImportPage();
    } else {
      // If private key exists, load WalletPage
      return WalletPage();
    }
  }
}
