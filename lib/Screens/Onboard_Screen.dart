import 'package:flutter/material.dart';
import 'package:city_guide_project/Constants/App_Colors.dart';
import 'package:concentric_transition/concentric_transition.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final pages = [
    const PageData(
      title: "Welcome!Let’s  Explore",
      image: 'Images/city1.jpg',
      bgColor: Color.fromARGB(255, 132, 238, 185),
      textColor: Colors.white,
    ),
    const PageData(
      title: "Embrace the Adventure",
      image: 'Images/city2.jpg',
      bgColor:  Color.fromRGBO(255, 226, 131, 1),
      textColor: Colors.white,
    ),
    const PageData(
      title: "Dive into the Best Spots",
      image: 'Images/city3.jpg',
      bgColor: Color.fromARGB(255, 63, 226, 145),
      textColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        colors: pages.map((p) => p.bgColor).toList(),
        radius: screenWidth * 0.1,
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
          ),
        ),
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FinalPage()),
          );
        },
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(
            child: _Page(page: page),
          );
        },
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final PageData page;

  const _Page({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.1),
        ClipOval(
          child: Image.asset(
            page.image.toString(),
            width: screenHeight * 0.4,
            height: screenHeight * 0.4,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: screenHeight * 0.05),
        _Text(page: page, style: TextStyle(fontSize: screenHeight * 0.04)),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  final PageData page;
  final TextStyle style;

  const _Text({Key? key, required this.page, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      page.title ?? '',
      style: style,
    );
  }
}

class PageData {
  final String? title;
  final String? image;
  final Color bgColor;
  final Color textColor;

  const PageData({
    this.title,
    this.image,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}

class FinalPage extends StatefulWidget {
  const FinalPage({super.key});

  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> with SingleTickerProviderStateMixin {
  late final AnimationController _textAnimationController;
  late final Animation<double> _textFadeAnimation;
  late final Animation<Offset> _textSlideAnimation;
  late final Animation<Offset> _buttonSlideAnimation;

  @override
  void initState() {
    super.initState();
    _textAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _textFadeAnimation = CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.easeInOut,
    );
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.easeInOut,
    ));
    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.easeInOut,
    ));

    _textAnimationController.forward();
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/16.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _textSlideAnimation,
                child: FadeTransition(
                  opacity: _textFadeAnimation,
                  child: Text(
                    '"Explore City Guide"',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _buttonSlideAnimation,
                    child: AnimatedHoverButton(
                      text: 'Login',
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      backgroundColor: Color.fromARGB(255, 63, 226, 145),
                      borderColor: Color.fromRGBO(255, 226, 131, 1),
                      textColor: Colors.black,
                      hoverBackgroundColor: Colors.white,
                      hoverTextColor: Colors.white,
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.06,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _buttonSlideAnimation,
                    child: AnimatedHoverButton(
                      text: 'Sign Up',
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      backgroundColor: AppColors.white,
                      borderColor: AppColors.Pixiegreen,
                      textColor: Colors.black,
                      hoverBackgroundColor: Colors.white,
                      hoverTextColor: const Color.fromARGB(255, 255, 0, 0),
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.06,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedHoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color hoverBackgroundColor;
  final Color hoverTextColor;
  final double width;
  final double height;

  const AnimatedHoverButton({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.hoverBackgroundColor,
    required this.hoverTextColor,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedHoverButtonState createState() => _AnimatedHoverButtonState();
}

class _AnimatedHoverButtonState extends State<AnimatedHoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: _isHovered ? widget.hoverBackgroundColor : widget.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: widget.borderColor),
        ),
        child: TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: TextStyle(
              color: _isHovered ? widget.hoverTextColor : widget.textColor,
              fontSize: widget.height * 0.4,
            ),
          ),
        ),
      ),
    );
  }
}