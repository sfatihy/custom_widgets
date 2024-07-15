import 'package:flutter/material.dart';

import 'glass_morphism.dart';

class GlassMorphismWidget extends StatelessWidget {
  const GlassMorphismWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(
        4,
        (index) => SizedBox(
          height: MediaQuery.of(context).size.width * 0.225,
          width: MediaQuery.of(context).size.width * 0.225,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
              ),
              Align(
                alignment: const Alignment(0,-0.75),
                child: [
                  GlassMorphism(
                    blur: 8,
                    color: Colors.white,
                    opacity: 0.1,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Center(
                        child: Text(
                          "GLASS",
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.yellowAccent.shade100
                          ),
                        )
                      ),
                    )
                  ),
                  GlassMorphism(
                    blur: 8,
                    color: Colors.white,
                    opacity: 0.9,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Center(
                        child: Text(
                          "GLASS",
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.yellowAccent.shade100
                          ),
                        )
                      ),
                    )
                  ),
                  GlassMorphism(
                    blur: 12,
                    color: Colors.blueAccent,
                    opacity: 1,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Center(
                        child: Text(
                          "GLASS",
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.yellowAccent.shade100
                          ),
                        )
                      ),
                    )
                  ),
                  GlassMorphism(
                    blur: 4,
                    color: Colors.white,
                    opacity: 0.25,
                    border: const Border(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: const Center(
                        child: Icon(
                          Icons.person_2_outlined,
                          color: Colors.white70,
                          size: 36,
                        )
                      ),
                    )
                  ),
                ][index]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
