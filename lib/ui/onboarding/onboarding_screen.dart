import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      animation: 'assets/Animation - 1733350137600.json',
      title: 'Welcome to PetConnect+',
      description:
          'Your all-in-one platform for pet care services and management.',
      color: const Color(0xFF6C63FF),
      gradient: const [Color(0xFF6C63FF), Color(0xFF4B45FF)],
    ),
    OnboardingPage(
      animation: 'assets/Animation - 1733350548926.json',
      title: 'Easy Scheduling',
      description:
          'Book appointments, manage clients, and track your services effortlessly.',
      color: const Color(0xFF00C853),
      gradient: const [Color(0xFF00C853), Color(0xFF009624)],
    ),
    OnboardingPage(
      animation: 'assets/Animation - 1733350398407.json',
      title: 'Grow Your Business',
      description:
          'Connect with pet owners, expand your services, and boost your revenue.',
      color: const Color(0xFFFF5252),
      gradient: const [Color(0xFFFF5252), Color(0xFFD50000)],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutQuint,
      ),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutQuint,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onNextPage() {
    if (_currentPage < _pages.length - 1) {
      _animationController.reset();
      _pageController
          .nextPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .then((_) => _animationController.forward());
    } else {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _pages[_currentPage].gradient.first.withOpacity(0.2),
                  _pages[_currentPage].gradient.last.withOpacity(0.3),
                ],
              ),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
                _animationController.reset();
                _animationController.forward();
              });
            },
            itemBuilder: (context, index) {
              final page = _pages[index];
              return OnboardingPageWidget(
                page: page,
                scaleAnimation: _scaleAnimation,
                fadeAnimation: _fadeAnimation,
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    _pages[_currentPage].gradient.first.withOpacity(0.1),
                    _pages[_currentPage].gradient.last.withOpacity(0.3),
                  ],
                ),
              ),
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: _fadeAnimation,
                    builder: (context, child) => Opacity(
                      opacity: _fadeAnimation.value,
                      child: child,
                    ),
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: _pages.length,
                      effect: CustomizableEffect(
                        spacing: 20,
                        dotDecoration: DotDecoration(
                          width: 10,
                          height: 10,
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300,
                        ),
                        activeDotDecoration: DotDecoration(
                          width: 24,
                          height: 10,
                          borderRadius: BorderRadius.circular(8),
                          color: _pages[_currentPage].color,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => context.go('/'),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                          child: Text(
                            'Skip',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: _pages[_currentPage].color,
                                ),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _scaleAnimation,
                          builder: (context, child) => Transform.scale(
                            scale: _scaleAnimation.value,
                            child: child,
                          ),
                          child: ElevatedButton(
                            onPressed: _onNextPage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _pages[_currentPage].color,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 3,
                              shadowColor:
                                  _pages[_currentPage].color.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _currentPage == _pages.length - 1
                                      ? 'Get Started'
                                      : 'Next',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                if (_currentPage == _pages.length - 1) ...[
                                  const SizedBox(width: 8),
                                  const Icon(Icons.arrow_forward_rounded,
                                      size: 20),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String animation;
  final String title;
  final String description;
  final Color color;
  final List<Color> gradient;

  OnboardingPage({
    required this.animation,
    required this.title,
    required this.description,
    required this.color,
    required this.gradient,
  });
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;
  final Animation<double> scaleAnimation;
  final Animation<double> fadeAnimation;

  const OnboardingPageWidget({
    super.key,
    required this.page,
    required this.scaleAnimation,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            page.gradient.first.withOpacity(0.1),
            page.gradient.last.withOpacity(0.2),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            AnimatedBuilder(
              animation: scaleAnimation,
              builder: (context, child) => Transform.scale(
                scale: scaleAnimation.value,
                child: child,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Lottie.asset(
                  page.animation,
                  fit: BoxFit.contain,
                  repeat: true,
                  errorBuilder: (context, error, stackTrace) {
                    print('Lottie Error: $error');
                    return Center(
                      child: Icon(
                        Icons.error_outline,
                        size: 64,
                        color: page.color,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: AnimatedBuilder(
                animation: fadeAnimation,
                builder: (context, child) => Opacity(
                  opacity: fadeAnimation.value,
                  child: child,
                ),
                child: Column(
                  children: [
                    Text(
                      page.title,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: page.gradient.last,
                                letterSpacing: -0.5,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      page.description,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey.shade700,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
