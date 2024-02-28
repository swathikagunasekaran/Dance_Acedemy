import 'package:flutter/material.dart';
import 'dart:async';

class BranchDetails extends StatefulWidget {
  const BranchDetails({Key? key}) : super(key: key);

  @override
  _BranchDetailsState createState() => _BranchDetailsState();
}

class _BranchDetailsState extends State<BranchDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Details'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name:'),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your beautiful name',
                border: OutlineInputBorder(),
              ),
             keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16.0),

            const Text('Address:'),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                hintText: 'Enter your address',
                border: OutlineInputBorder(),
              ),
             keyboardType: TextInputType.multiline,
            ),

            const SizedBox(height: 16.0),
            const Text('Email ID:'),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email id',
                border: OutlineInputBorder(),
              ),
             keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 16.0),
            const Text('Phone Number:'),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(
                hintText: 'Enter your phone number',
                border: OutlineInputBorder(),
              ),
             keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 16.0),
            const Text('Age:'),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                hintText: 'Enter your age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String address = addressController.text;
                String email = emailController.text;
                String phoneNumber = phoneNumberController.text;
                String age = ageController.text;

                print('Name: $name');
                print('Address: $address');
                print('Email ID: $email');
                print('Phone Number: $phoneNumber');
                print('Age: $age');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuccessPage(),
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _bounceAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
      ),
    );

    _animationController.forward();

    // Delay the particle animation to start after the bouncing effect
    Timer(const Duration(milliseconds: 800), () {
      _startParticleAnimation();
    });
  }

  void _startParticleAnimation() {
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBackground(),
          RainParticles(
            particleCount: 50,
          ),
          Center(
            child: AnimatedBuilder(
              animation: _bounceAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, -100 * _bounceAnimation.value),
                  child: child,
                );
              },
              child: const Text(
                'Successfully Registered!👯‍♂️',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple,
            Colors.purpleAccent,
            Colors.deepPurple,
            Colors.deepPurpleAccent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.25, 0.5, 0.75, 1.0],
        ),
      ),
    );
  }
}

class RainParticles extends StatelessWidget {
  final int particleCount;

  RainParticles({required this.particleCount});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        child: Row(
          children: List.generate(particleCount, (index) {
            final randomSize = 5.0 + (index % 5).toDouble();
            final randomDelay = Duration(milliseconds: index * 100);
            return Particle(
              size: randomSize,
              delay: randomDelay,
            );
          }),
        ),
      ),
    );
  }
}

class Particle extends StatefulWidget {
  final double size;
  final Duration delay;

  Particle({required this.size, required this.delay});

  @override
  _ParticleState createState() => _ParticleState();
}

class _ParticleState extends State<Particle> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();

    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Positioned(
          top: -_animation.value * 600,
          left: widget.size * 10,
          child: child ?? Container(),
        );
      },
      child: Transform.scale(
        scale: 1.0 - _animation.value.abs(),
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: Colors.primaries[widget.size.toInt() % Colors.primaries.length],
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}


