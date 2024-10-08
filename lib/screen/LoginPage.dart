import 'package:ecorecycle/screen/RegisterPage.dart';
import 'package:ecorecycle/components/CustomRoundedIconButton.dart';
import 'package:ecorecycle/screen/Splash.dart';
import 'package:ecorecycle/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecorecycle/services/autenticar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  AutenticacaoServico _autenticaServico = AutenticacaoServico(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form( 
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 30),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FractionallySizedBox(
                    heightFactor: 0.9,
                    widthFactor: 1,
                    child: SvgPicture.asset(
                      'assets/svg/img01.svg',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  height: 50,
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 10),
              SizedBox(
                child:  TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.alternate_email),
                    hintText: 'Digite seu email',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'O campo não pode ser vazio';
                    }
                    if (value.length < 5) {
                      return 'O email é invalido';
                    }
                    if (!value.contains('@')) {
                      return 'Email invalido';
                    }
                    if (!value.contains('.com')) {
                      return 'Email invalido';
                    }
                    return null;
                  },              
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                    hintText: '********',
                    labelStyle:GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  obscureText: true,              
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'A senha não pode ser vazia';
                    }
                    if (value.length < 6) {
                      return 'A senha deve conter 6 caracteres';
                    }
                    if (!value.contains(RegExp(r'[a-zA-Z]'))) {
                      return 'A senha deve conter pelo menos uma letra';
                    }
                    if (!value.contains(RegExp(r'[0-9]'))) { 
                      return 'A senha deve conter pelo menos um numero';
                    }
                    return null;
                  },
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Splash(nextRoute: '/registerpage')),
                        );
                      },
                      child: Text(
                        'Esqueci minha senha',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 6),
              Center(
                child: GestureDetector(
                  onTap: () {
                    String email = _emailController.text;
                    String senha = _passwordController.text;
                    
                    // Verificar se o formulário é válido
                    if (_formkey.currentState!.validate()) {
                      _autenticaServico.logarUsuario(email: email, senha: senha).then(
                        (String? erro) {
                        if (erro != null) {
                          // Mostrar mensagem de erro
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Erro4: $erro'),
                          ));
                        } 
                        else {
                          // Navegar para a próxima página se não houver erro
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Splash(nextRoute: '/homepage'),
                            ),
                          );
                        }
                      }).catchError((e) {
                        // Tratar erros inesperados
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Erro ao autenticar: $e'),
                        ));
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 43, 133, 31),
                        borderRadius: BorderRadius.circular(34)),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  RegisterPage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Não possui conta? Cadastre-se',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 0.2,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Ou faça login com',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 0.2,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRoundedIconButton(
                      imagePath: 'assets/images/google-logo.png'),
                  SizedBox(
                    width: 23,
                  ),
                  CustomRoundedIconButton(
                      imagePath: 'assets/images/facebook-logo.png')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
