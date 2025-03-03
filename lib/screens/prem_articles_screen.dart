import 'package:boxing/models/prem_article_model.dart';
import 'package:boxing/screens/prem_article_detail_screen.dart';
import 'package:boxing/values/app_icons.dart';
import 'package:boxing/values/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PremArticlesScreen extends StatelessWidget {
  const PremArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final diet = [
      PremArticleModel(
          imagePath: AppImages.pa11,
          title: 'Water balance',
          desc: '''Why It Matters:
Proper hydration is essential for boxers due to the intense physical exertion involved in the sport. Dehydration can negatively impact performance, reduce endurance, and increase the likelihood of muscle cramps. Since swimming takes place in water, athletes may overlook the need to drink fluids, but staying hydrated is just as important during and after training.

Hydration Tips:
Before Training: Drink 500-600 ml of water or a sports drink at least 30 minutes before your swim session to prepare your body.
During Training: Take small sips of water every 15-20 minutes, especially during intense workouts lasting over an hour.
After Training: Rehydrate with water, an electrolyte beverage, or a recovery drink to restore fluid balance.
Best Fluid Choices: Water is ideal, but for prolonged or high-temperature sessions, electrolyte-rich drinks containing sodium and potassium can help maintain hydration levels.
4o'''),
      PremArticleModel(
          imagePath: AppImages.pa12,
          title: 'You need a lot of energy',
          desc: '''Why It Matters:
Carbohydrates serve as the primary fuel source for boxers, especially during high-intensity efforts. They provide the necessary energy for training, competition, and recovery. A well-balanced, carb-rich diet helps maintain stamina and ensures peak performance during long swim sessions.

Nutrition Tips:
Pre-Swim Meal: Eat a carbohydrate-rich meal 2-3 hours before boxers. Good options include pasta, rice, oats, or whole-grain bread paired with some protein.
Quick Pre-Training Snack: If time is limited, have a small carb-based snack 30-60 minutes before swimming, such as a banana, granola bar, or toast with jam.
Post-Swim Refuel: Replenish glycogen stores after swimming with carb-rich foods like quinoa, sweet potatoes, fruits, and whole grains.
Best Carbohydrate Sources: Prioritize whole, complex carbs like brown rice, whole wheat bread, and vegetables, while also incorporating simple carbs like fruits (e.g., bananas, apples) for quick energy.'''),
      PremArticleModel(
          imagePath: AppImages.pa13,
          title: 'Protein supplements',
          desc: '''Why It Matters:
Protein plays a crucial role in muscle repair and recovery after intense box sessions. Consuming enough protein post-training helps rebuild muscle tissue that may have been broken down during exertion. This is especially important for boxers who train multiple times a day.

Nutrition Tips:
Post-Training Protein: Aim to consume 15-30 grams of protein within 30-60 minutes after boxing. Good sources include lean meats, fish, eggs, dairy, tofu, or protein shakes.
Balanced Meals: Ensure your daily meals include a protein source, such as chicken, turkey, salmon, or plant-based options like lentils, beans, or tempeh.
Best Protein Sources: Choose high-quality proteins like chicken, turkey, fish (especially salmon and tuna), Greek yogurt, cottage cheese, eggs, and plant-based options such as quinoa or chickpeas.'''),
      PremArticleModel(
          imagePath: AppImages.pa14,
          title: 'Healthy Fats',
          desc: '''Why It Matters:
Healthy fats provide long-lasting energy, making them essential for boxers, especially during endurance events or extended training sessions. They also support brain health and aid in the absorption of fat-soluble vitamins like A, D, E, and K.

Nutrition Tips:
Incorporate Healthy Fats: Add sources of healthy fats to your meals, such as avocados, olive oil, nuts, seeds, and fatty fish.
Pre-Swim Fuel: Include a small amount of fat in your pre-swim meal—like a handful of almonds or a slice of avocado—to provide steady energy throughout training.
Post-Swim Recovery: Enhance post-workout meals with healthy fats by adding chia seeds or flaxseeds to a smoothie or salad.
Best Fat Sources: Prioritize unsaturated fats from avocados, olive oil, nuts, seeds, and fatty fish like salmon and mackerel.'''),
      PremArticleModel(
          imagePath: AppImages.pa15,
          title: 'Vitamins and Minerals supplements',
          desc: '''Why It Matters:
Boxers require a wide range of vitamins and minerals to support energy production, immune function, and overall performance. Key nutrients such as calcium, vitamin D, iron, and magnesium play vital roles in muscle function, oxygen transport, and bone health.

Nutrition Tips:
Iron for Endurance: Consume iron-rich foods like lean red meat, beans, spinach, or fortified cereals to aid oxygen transport during intense exercise.
Calcium & Vitamin D for Bone Health: Include dairy products, leafy greens, or fortified alternatives to maintain strong bones and reduce injury risk.
Magnesium for Muscle Function: Eat magnesium-rich foods like nuts, seeds, legumes, and leafy greens to prevent cramps and promote muscle relaxation post-training.
Essential Nutrients & Sources:
Iron: Red meat, spinach, beans
Calcium: Dairy products, fortified plant-based milks, leafy greens
Magnesium: Almonds, spinach, black beans
Vitamin D: Fatty fish, egg yolks, fortified foods (milk, cereals)'''),
    ];

    final trauma = [
      PremArticleModel(
          imagePath: AppImages.pa21,
          title: 'Injury Prevention',
          desc: '''Introduction:
Injury, whether physical or psychological, can have lasting effects on a person’s well-being. Preventing injuries is essential for maintaining overall health and promoting resilience. This article explores key aspects of injury prevention and why it is crucial in everyday life.

Physical injury Prevention:
Physical injuries from falls, sports, or accidents can often be avoided through careful practices. Wearing protective gear, following safety protocols, and maintaining proper body mechanics are essential in reducing risks.
Wear Protective Gear: Helmets, knee pads, and other protective equipment help absorb impact and prevent severe injuries in sports and recreational activities.
Ensure a Safe Environment: Keep living and working spaces free of hazards like uneven walkways or sharp objects. Proper lighting and organization reduce the risk of falls.
Exercise Properly: Engage in regular physical activity to build strength, improve balance, and increase flexibility. Warm-ups and cool-downs help prevent muscle strain and joint injuries.
Mental Trauma Prevention
Psychological trauma can arise from emotional stress, abuse, or neglect. Preventing mental trauma involves developing healthy coping mechanisms and fostering supportive relationships.
Build Strong Support Networks: Surround yourself with people who offer emotional support, such as family, friends, or professionals, to help manage stress and reduce isolation.
Practice Stress Management: Techniques like mindfulness, deep breathing, and yoga can help regulate stress before it escalates.
Seek Professional Help: Therapy or counseling can be crucial for addressing past trauma and preventing future emotional harm.
Conclusion
Prevention is the most effective way to mitigate the risk of trauma. By taking proactive steps to safeguard both physical and mental health, individuals can lead healthier, more resilient lives.
4o'''),
      PremArticleModel(
          imagePath: AppImages.pa22,
          title: 'Sports Injuries',
          desc: '''Introduction:
Athletes face a higher risk of physical injury due to the intensity of their activities. Whether it's a sprained ankle or a concussion, injury prevention is essential for maintaining performance and long-term health. This article explores effective strategies to reduce the risk of common sports injuries.

Warm-Up and Stretching:
A proper warm-up prepares muscles for physical activity and helps prevent strains. Dynamic stretching, which involves moving muscles through a range of motion, is recommended before exercise.
Dynamic Stretches: Incorporate leg swings, arm circles, and torso rotations to activate muscles and increase blood flow.
Cooldown: After exercise, static stretching can improve flexibility and aid in muscle recovery.
Strength and Conditioning
Strengthening muscles, ligaments, and tendons is crucial for preventing sports-related injuries. A well-rounded training program should target all major muscle groups.
Core Strength: A strong core enhances stability and reduces the risk of back injuries.
Balance and Coordination: Exercises like single-leg squats or stability ball routines improve balance and proprioception, lowering the risk of falls and sprains.
Proper Technique
Using correct form and technique minimizes unnecessary stress on joints and muscles.
Sports-Specific Technique: Learning proper posture, movement patterns, and techniques for each sport helps prevent injuries.
Equipment Check: Regularly inspect gear such as shoes, pads, and helmets to ensure they are in good condition and fit properly.
Rest and Recovery
Adequate rest is vital for preventing overuse injuries. Allowing the body time to recover between training sessions helps maintain peak performance.
Sleep: Getting sufficient sleep each night promotes muscle repair and overall recovery.
Active Recovery: Engaging in low-intensity activities such as walking or swimming supports muscle recovery without excessive strain.
Conclusion
Preventing sports injuries requires a proactive approach. By incorporating warm-ups, strength training, proper technique, and rest into their routines, athletes can reduce the risk of injury and sustain high performance levels.
4o'''),
      PremArticleModel(
          imagePath: AppImages.pa23,
          title: 'Injury Prevention',
          desc: '''Introduction:
Workplace injuries are common but largely preventable. By fostering a culture of safety and implementing protective measures, businesses can significantly reduce the risk of accidents. This article explores key strategies for preventing injuries in the workplace.

Ergonomics and Posture:
Poor posture and improper workstation setup contribute to musculoskeletal injuries. Implementing ergonomic practices helps reduce strain on the body.
Adjustable Chairs and Desks: Ensure workstations are set at the correct height to support neutral body positioning.
Proper Desk Setup: Keep computer screens at eye level and keyboards at a comfortable angle to prevent neck and wrist strain.
Regular Breaks: Encourage employees to take short breaks to stretch and walk around, reducing muscle fatigue.
Safety Protocols and Equipment
Following safety protocols and using protective equipment can prevent injuries across various work settings.
Personal Protective Equipment (PPE): Provide workers with helmets, gloves, goggles, and other job-specific safety gear.
Comprehensive Training: Ensure employees are trained in safe work practices, including proper lifting techniques and machinery operation.
Housekeeping and Organization
A clean and organized workplace minimizes accident risks.
Clutter-Free Workspaces: Keep floors and walkways clear of obstacles to prevent slips, trips, and falls.
Proper Storage: Store heavy items at waist level to reduce bending and lifting injuries.
Mental Health and Stress Management
High stress and mental fatigue can contribute to workplace accidents. Supporting mental well-being is an essential part of injury prevention.
Work-Life Balance: Encourage employees to maintain a healthy work-life balance to prevent burnout and stress-related incidents.
Mindfulness and Wellness Programs: Offer access to stress management programs such as mindfulness sessions or yoga to improve focus and reduce workplace accidents.
Conclusion
Preventing workplace injuries requires a combination of ergonomic adjustments, safety protocols, organization, and mental health support. By prioritizing workplace safety, employers and employees can create a healthier, more productive work environment.'''),
      PremArticleModel(
          imagePath: AppImages.pa24,
          title: 'Injury Prevention for Children',
          desc: '''Introduction:
Children are especially vulnerable to physical and emotional injury due to their developing bodies and minds. Ensuring their safety and providing emotional support is essential for preventing harm and promoting healthy development.
Physical Injury Prevention:
Children are naturally active and curious, which increases their risk of injury. Taking proactive steps can help keep them safe.
Supervision: Always keep an eye on children during play, especially in environments like parks, playgrounds, and swimming pools.
Safe Play Areas: Ensure that play equipment is age-appropriate, well-maintained, and free from hazards.
Car Safety: Use properly fitted car seats, booster seats, and seatbelts to reduce the risk of injury in case of accidents.
Emotional and Psychological Trauma Prevention
Emotional well-being is just as important as physical safety. Childhood trauma can result from neglect, abuse, or exposure to distressing situations. Early intervention is key to preventing long-term effects.
Positive Reinforcement: Encourage good behavior and boost self-esteem with praise and constructive feedback.
Supportive Environment: Foster a loving and secure environment where children feel safe and valued.
Open Communication: Create a space where children feel comfortable discussing their feelings and any concerns they may have.
Conclusion
By ensuring both physical safety and emotional support, parents and caregivers can significantly reduce the risk of trauma in children, helping them grow into healthy, resilient individuals.'''),
      PremArticleModel(
          imagePath: AppImages.pa25,
          title: 'Injury in Older Adults',
          desc: '''Introduction:
As people age, they face an increased risk of physical and emotional injury. Preventing injuries and promoting mental health are crucial for maintaining a high quality of life. This article explores strategies to help older adults stay safe and healthy. 
Fall Prevention:
Falls are a leading cause of injury among older adults, but preventive measures can significantly reduce the risk.
Home Modifications: Install grab bars in bathrooms, improve lighting, and remove tripping hazards like loose rugs or clutter.
Exercise: Engage in regular physical activity, particularly balance and strength exercises, to enhance stability and coordination.
Proper Footwear: Wear non-slip, supportive shoes to reduce the likelihood of falls.
Chronic Disease Management
Conditions such as arthritis, osteoporosis, and diabetes can increase the risk of injury. Managing these conditions effectively is essential for injury prevention.
Regular Checkups: Encourage frequent visits to healthcare providers to monitor and manage chronic illnesses.
Medication Management: Review medications with a doctor to identify any that may cause dizziness, weakness, or other side effects that could lead to falls.
Mental Health and Cognitive Function
Mental health issues, including depression and cognitive decline, can contribute to physical trauma. Addressing these concerns is vital for overall well-being.
Social Engagement: Promote participation in social activities to reduce feelings of loneliness and depression.
Cognitive Stimulation: Encourage brain-boosting activities like puzzles, reading, or learning new skills to support cognitive health.
Professional Support: Seek counseling or therapy if there are signs of depression, anxiety, or other mental health challenges.
Conclusion
Preventing trauma in older adults requires a combination of fall prevention, chronic disease management, and mental health support. By taking proactive steps, older adults can enjoy a healthier, safer, and more fulfilling life.'''),
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: Get.back,
            child: Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcons.back,
                color: Color.fromRGBO(255, 210, 75, 1),
              ),
            ),
          ),
        ),
        title: Text(
          'premium'.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 210, 75, 1),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Diet',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Manrope',
                    color: Color.fromRGBO(255, 210, 75, 1),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: diet.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => PremArticleDetailScreen(
                            item: diet[index],
                            sectionTitle: 'DIET',
                          ),
                        );
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        constraints: const BoxConstraints(minHeight: 114),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(diet[index].imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: ColoredBox(
                            color:
                                Color.fromRGBO(255, 210, 75, 1).withOpacity(.6),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 100),
                                    child: Text(diet[index].title,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  const SizedBox(height: 4),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5, color: Colors.white),
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white10,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: const Text(
                                        'Learn more',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Trauma prevention',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Manrope',
                    color: Color.fromRGBO(255, 210, 75, 1),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: trauma.length,
                  itemBuilder: (context, index) {

                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => PremArticleDetailScreen(
                            item: trauma[index],
                            sectionTitle: 'TRAUMA',
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Container(
                                  width: 68,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: AssetImage(trauma[index].imagePath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    trauma[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w700),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
