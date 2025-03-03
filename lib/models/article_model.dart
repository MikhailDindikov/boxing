import 'package:boxing/models/section_model.dart';
import 'package:boxing/values/app_icons.dart';
import 'package:boxing/values/app_images.dart';

class ArticleModel {
  final String title;
  final String iconPath;
  final List<SectionModel> sections;

  ArticleModel({
    required this.title,
    required this.iconPath,
    required this.sections,
  });
}

final articles = [
  ArticleModel(
    title: 'Fundamental boxing technique'.toUpperCase(),
    iconPath: AppIcons.act1,
    sections: [
      SectionModel(
        title: 'Basic Boxing Stance',
        text:
            'The basic boxing stance should be one that is easy for beginners to attack and defend from. In this stance, you are well covered and both of your hands are ready to attack. More advanced fighters will use different boxing stances for more advanced body movements and counter-attacking capabilities.\nThe basic boxing stance should be one that is easy for beginners to attack and defend from. In this stance, you are well covered and both of your hands are ready to attack. More advanced fighters will use different boxing stances for more advanced body movements and counter-attacking capabilities.\nWeight evenly distributed between the legs, knees slightly bent.\nFeet pointing diagonally, standing slightly wider than shoulder width, heel of back foot raised.\nElbows down, hands up.\nHead is behind the gloves, chin slightly down, eyes looking through the gloves.\nRelax and breathe\n*** Get used to getting back into this position after all the boxing moves!',
        imagePath: AppImages.act11,
      ),
      SectionModel(
        title: 'Basic Boxing Leg Work',
        text:
            'Beginners definitely need to learn the step-up and toe-turn manoeuvres. This movement may seem difficult at first because many people have a habit of constantly bouncing off the ground. In boxing, you need to keep your feet low to the ground so that you are always ready to attack, defend or sidestep. Also, jumping all the time is a huge waste of energy. Effective footwork will come naturally once you develop better coordination and technique.',
        imagePath: AppImages.act12,
      ),
      SectionModel(
        title: 'Basic Impact',
        text:
            'This is fundamental boxing footwork. Step with your lead foot and then tuck your back foot. This step and tuck footwork technique ensures that your weight has emphasis and that you are always ready to attack or defend. It also keeps you from walking or crossing your legs, which can rob you of your balance.\nTo go FORWARD or LEFT, first step with your left foot and then lift your right foot.\nTo go BACK or RIGHT, first step with your right foot and then lift your left foot.\nTIP: Try to finish all steps so that your feet stay the same distance apart.',
        imagePath: AppImages.act13,
      ),
      SectionModel(
          title: 'Leg Turn',
          text:
              'The next most important boxing footwork technique you need is the leg turn. It is usually performed on the front foot. You can use it for defence to get away from an attack, or for attacking to find new angles of attack. The toe turn can be useful for counter-strikes, moving you away from danger while still leaving you in striking distance for counter-strikes.\nTurn around in an HOUR, shifting your right foot and allowing your body to turn around on your left foot.\nPractice both small U-turns (45-90 degrees) and also large U-turns (90-180 degrees).'),
    ],
  ),
  ArticleModel(
    title: 'Basic Boxing Punches'.toUpperCase(),
    iconPath: AppIcons.act2,
    sections: [
      SectionModel(
        title: 'Basic Punching Technique',
        text:
            'Start from a relaxed position\nBreathe out when you strike\nClench your fist and body muscles at the moment of contact with the target\nBring your hand back to your side\nStriking is simply an action that starts with you being relaxed and then quickly accelerating your hand towards the target while exhaling sharply. You clench your fist the moment you make contact with the target, and then relax it to throw a few more punches. The trick is to put all of your body weight into the punch without losing balance. Skill and experience will teach you over time.\nFor a beginner, the most important thing to learn is how to execute a kick correctly. Later on, you will be able to throw many different variations of kicks from different positions, and develop your own kicking technique that suits your style.',
      ),
      SectionModel(
        title: 'Fundamental Striking Tips',
        text:
            'Twist your entire body and rotate your feet when throwing ALL punches, EXCEPT the JEB\nMaintain your stance and balance for greater strength and mobility\nMake sure your unbathed arm protects the opposite side of your body\nExhale sharply with each stroke\nAll boxing punches are essentially a variation of straight punches (elbow straight), side punches (elbow to the side), or uppercuts (elbow down)',
        imagePath: AppImages.act21,
      ),
      SectionModel(
        title:
            'The Left Straight (JEB) is the #1 most important weapon in boxing',
        text:
            'Keeping the rest of your torso still, extend your left fist in a straight line forward.\nExhale sharply as you punch, wrap your fist to hit the target so that your palm is pointing downwards.\nImmediately bring your hand back after a hit, for defence.\nTry to deliver the jab with a step forward (‘step jab’). Also, try to deliver the jab to the body with a slight bend in the knees and waist.\nThe jab is the most important punch in boxing. You can attack with the jab, defend, counter-attack, score points, create space, and more. It\'s your longest, fastest punch, it takes the least amount of energy, and leaves you minimally vulnerable. Boxing coaches will usually tell you that every combination should start with a jab. This is a quick jab that stuns your opponent long enough for you to get through your powerful punches.',
        imagePath: AppImages.act22,
      ),
      SectionModel(
        title: 'Right Straight (RIGHT CROSS) is your hardest hitter',
        text:
            'Rotate your hips and upper torso ACTIVELY, while rotating your right foot (about 90 degrees).\nExhale sharply while extending your right fist in a straight line from your chin.\nRotate your fist so that it faces palm down when it hits.\nRotate your fist so that it faces palm down when it hits.\nDo not allow your head to tilt forward beyond the level of your front knee.\nWhen necessary, the right elbow can bend to form a small looping angle (right overhand) or even a large looping angle (sprawling right) to punch around the opponent\'s defence. Many boxing coaches emphasise the importance of the straight right for beginners because it telegraphs less and doesn\'t leave the fighter heavily exposed. It is rare to see a ‘right hook’ because it is more likely to block with the opponent\'s left shoulder. Bend at the knees and at the waist if you want to punch a right cross to the body.\nThe right cross will naturally become your strongest punch because it flies out from your dominant hand and is easily reversed from behind. When the right cross is applied in tandem, the jab and right cross become known as a basic but incredibly useful double.',
        imagePath: AppImages.act23,
      ),
      SectionModel(
        title: 'LEFT HOOK - Dangerous power punch',
        text:
            'Rotate your feet clockwise (about 90 degrees) while lowering your right heel and raising your left heel.\nThe body rotates as one solid unit as you rotate the feet.\nFor a left hook to the body, bring your left arm down and punch with a vertical fist.\nThe left hook is without a doubt one of the most dangerous punches in boxing. It comes from the side angle, so it is difficult to defend against it when the opponent expects straight punches. Also, this punch often leads to knockouts because it turns your head and makes your opponents dizzy. You can deliver left hooks to the head with a horizontal or vertical fist; for beginners, I recommend using whichever feels most natural.\nLeft hooks to the body, this is the most common way to attack the torso. ‘The liver punch’ (located under the ribs on the right side) is famous for being incredibly painful and has led to many knockouts to the body. Body punches usually knock you out of breath and destroy your legs, stalling your ability to move. A well-placed body kick can paralyse your legs and prevent you from standing, even if you are conscious and still ready to fight.',
        imagePath: AppImages.act24,
      ),
      SectionModel(
        title: 'LEFT APPERCOT - a dangerous, short and long punch',
        text:
            'Rotate your feet clockwise (about 90 degrees) while lowering your right heel and raising your left heel.\nThe body rotates in the same way as you would for a left hook (don\'t lean forward or backward).\nWith your elbow facing down, you lower your left fist slightly and punch from the bottom to the top while exhaling.\nThe fist rests on the target with the palm up.\nHit this punch compactly, and quickly return back to your stance.\nYou can throw this punch more straight or more curved, and also to the head or body.\nThe left uppercut works incredibly well at short range or even medium range. It\'s more powerful than a jab, comes out fast, and can be quite surprising. The only risk is that you need to be closer to your opponent, and your shoulder is not raised to protect you from your opponent\'s right.',
        imagePath: AppImages.act25,
      ),
      SectionModel(
        title: 'RIGHT APPERCOT - a dangerous, short and long punch',
        text:
            'Rotate your hips and upper torso ACTIVELY, while also rotating your right foot (about 90 degrees).\nThe body rotates in the same way as in a right cross (don\'t lean forward or backward).\nWith the elbow facing down, you lower your right fist slightly and punch from the bottom to the top while exhaling.\nThe fist rests on the target with the palm up.\nHit this punch compactly, and quickly return back to your stance.\nThe right uppercut, is a devastating punch that is used at short to medium range. It is very powerful when you hit it to the head or body. The biggest risk is that you drop your right hand and leave yourself open for a counter left hook.',
      ),
    ],
  ),
  ArticleModel(
    title: 'Basic Kick Combinations',
    iconPath: AppIcons.act3,
    sections: [
      SectionModel(
          title: '',
          text:
              'Basic punch combinations for beginners! Learn the number system of punches below, and then try out all of these basic combinations. You can punch these combinations in shadow boxing, on the bag, on your feet, or even in sparring. Each boxer will need to hone these combinations so that they become commonplace.\n1 = jab\n2 = right cross\n3 = left hook\n4 = right ovrehand\n5 = left uppercut\n6 = right uppercut\nb = body\n*** Example: a 1-2-3k combination means a jab to the head, then a right cross to the head, then a left hook to the body.\n1-1\n1-1к\n1-2\n1-2к\n1к-2\n1-1-2\n1-2-1-1\n1-2-3\n1-2-1-2\n1-2-3-2\n1-2-3к-2\n1-2-5-2\n1-6-3-2\n1-2-3-2-1\nThere are no rules about boxing combinations. You can throw all the punches you want in the order you want. There are definitely REAL guidelines, such as throwing fast, probing punches (such as the jab) before investing with hard punches that leave you open longer. Also, it\'s more natural to alternate your punches between right and left hands, but it\'s also a good idea to punch with double lefts and double rights to confuse your opponent.\nOver time, you\'ll learn other combinations (some of which include effective defensive moves) and eventually come up with your own that fit the situation.')
    ],
  ),
  ArticleModel(
    title: 'Basic Boxing Defence',
    iconPath: AppIcons.act4,
    sections: [
      SectionModel(
        title: '',
        text:
            'There are many defence techniques that you may have heard of, some more spectacular than others. The first thing a beginning boxer needs to learn is how to block punches. Blocking is the easiest way to stay in striking distance without taking damage. And for beginners, blocking, is the safest way because it blocks the angles of attack. Once you master blocking, you can move on to more advanced things like knockdowns, turns, and dodges. The main pros of the more advanced defence techniques are that they allow you to defend yourself without using your hands, so your hands are free to punch back!',
        imagePath: AppImages.act41,
      ),
      SectionModel(
        title: 'Blocking blows to the head',
        text:
            'Bring the gloves closer to cover your face\nLift your right glove to block left-handed punches.\nLift your right glove to block left-handed punches.',
        imagePath: AppImages.act42,
      ),
      SectionModel(
        title: 'Blocking shots to the body',
        text:
            'Bring your elbows closer to you\nLower your right elbow to block left-handed punches\nLower your left elbow to block right-handed punches.',
      ),
      SectionModel(
        title: 'Boxing Defence Tips',
        text:
            'It\'s safer to cover yourself rather than chase a hit (which still leaves you exposed).\nKeep your eyes on your opponent at all times (punches you can see don\'t do as much damage).\nKeep your balance, blocking punches without bouncing back is easier when you\'re standing on both feet.\nHit back, the only way to go from defence to attack is to hit back.\nStep backwards out of striking distance, this is the easiest way to get out of striking range.\nWatch your strongest arm, if you can\'t defend against everything, then at least watch out for powerful punches.\nOf course, blocking is more than just bringing your gloves up to you, but it\'s a good start for beginners. You don\'t have to do anything supernatural or get confused about where to place your hand. Bring your hands up to your face, or bring your elbows to your body.',
      ),
    ],
  ),
  ArticleModel(
    title: 'Basic Boxing Counterpunches',
    iconPath: AppIcons.act5,
    sections: [
      SectionModel(
        title: '',
        text:
            'Over time you will realise that boxing, is almost constant non-stop counter-punching. You\'ll always be attacking and defending at the same time, so you\'ll need to combine your offensive and defensive boxing skills. For beginners, the easiest way to counter-attack is to block first and then counter punch immediately. A jab can be countered while simultaneously throwing another punch, or you can block first and then counter.\nAs your skills improve, you will eventually realise that any jab can be countered with any punch. The hard part is figuring out how to do it. For now, you should focus on easy counter punches for beginners that don\'t require high-level defensive movements.',
      ),
      SectionModel(
        title: 'Basic Counterstrikes against Jeb',
        text:
            'Punch your jab (head or body).\nPunch your other jab (head or body).\nBlock first and then counter punch may not be fast enough to counter the jab.',
      ),
      SectionModel(
        title: 'Basic Counter-Strikes vs. Right Cross/Overhand/Appercut',
        text:
            'Interrupt his right jab with a long jab.\nOr punch a quick left hook before or after his right jab.\nBlock first, then punch your right jab.',
      ),
      SectionModel(
        title: 'Basic Counter-Strikes vs. Left Hook/Appercut',
        text:
            'Hit a long left jab.\nBlock first, then counter punch with a right counter punch.',
      ),
    ],
  ),
  ArticleModel(
    title: 'Essential Boxing Equipment',
    iconPath: AppIcons.act6,
    sections: [
      SectionModel(
        title: '',
        text:
            'These are the most essential things EVERY boxer should have. Of course you can borrow them, but that\'s gross/unhygienic and not as safe as having your own gear.',
      ),
      SectionModel(
        title: 'Bandages',
        text:
            'An indispensable tool to protect your hands. Don\'t work on the bag without hand protection, it can damage your wrist and injure you quickly. You need to bandage your hands every time you plan to put on boxing gloves. Having your own bandages is like having your own socks. They will be filled with your sweat and your horrible odour. You can get by with one pair, but you\'ll be better off with 2 or 3 pairs, depending on how often you train.',
      ),
      SectionModel(
        title: 'Boxing gloves ',
        text:
            'Using gym gloves can get away with it for a while, but eventually you\'ll love your own gloves. And sometimes it\'s really annoying when you want to work out, but someone else is already using ‘your’ gloves. Or you go to the gym one day and are heartbroken to find that ‘your’ gloves are torn and the Velcro has been ripped off. At some point, you\'ll come to the realisation that it\'s better to have your own boxing gloves because they smell better, have newer padding, and are always available when you need them.\nIf you can only afford one pair, get 16-ounce training gloves. If you can afford a second pair, get 12 oz or 14 oz for those times when you need to do speed work on a bag or punching bag for stretches. (Always use 16oz for sparring.) Smaller guys, women or kids (under 55kg) can train with 14oz gloves or less, but otherwise, I highly recommend the 16oz standard.',
      ),
      SectionModel(
        title: 'A mouth guard',
        text:
            'Is a must if you\'re going to spar. I don\'t know why there are still idiots who think you can spar without a mouth guard. Possible consequences: A) You\'ll lose a tooth because the blow might land clearly on one tooth instead of hitting the entire jaw. B) You will traumatise your jaw (which will make your jaw weak for a long time) because the lower jaw moves freely and is not firmly attached to the upper jaw. Greater chance of concussion. C) You will bite your tongue. I once bit my tongue straight through. Imagine how painful it is to get a tongue piercing with your own teeth.\nAlso, don\'t use someone else\'s mouthpiece. Unless it\'s melted under your teeth, it won\'t give you maximum protection. Also, since you get blood on your mouthguard all the time, you could catch someone else\'s disease (such as hepatitis, speed, herpes, etc). The best mouth guards cost at least \$20, but at least something is better than nothing.',
      ),
    ],
  ),
  ArticleModel(
    title: 'Optional Boxing Equipment',
    iconPath: AppIcons.act7,
    sections: [
      SectionModel(
        title: '',
        text:
            'Ultimately, all boxing equipment is a ‘must have’ if you plan to box seriously and even compete. However, a beginner who is just starting to learn boxing and scouting out the environment may not need the equipment below. Do the best you can with what you have.',
      ),
      SectionModel(
        title: 'Helmet',
        text:
            'Eventually you\'ll want to have your own helmet if you\'re going to be sparring regularly. It will fit you better and will always be available, and won\'t be constantly used and soaked in other people\'s sweat. The softening material will be much better as the helmet won\'t be used by 30 people. A helmet is mandatory EVERY time you spar; don\'t spar without one.',
      ),
      SectionModel(
        title: 'Boxing Shoes',
        text:
            'Boxing shoes increase your mobility and power in the ring. This is because of their superior grip and thin material that increases your mobility. Not only will you feel better in them, but you\'ll also move much better. There is no other gear that can improve your boxing ability faster than a simple pair of boxing shoes. My favourite brands are Nike and Adidas. Everlast and Rival are okay too. Title, I don\'t really like them.',
      ),
    ],
  ),
  ArticleModel(
    title: 'Boxing Training Equipment',
    iconPath: AppIcons.act8,
    sections: [
      SectionModel(
        title: '',
        text:
            'In order from most important to least important. You probably need EVERYTHING to be a successful boxer, but if you\'re not going to perform, then it doesn\'t matter at all.',
      ),
      SectionModel(
        title: 'Hall and Coach',
        text:
            "The fastest way to learn is to learn from someone who knows what they are doing. The people and environment you surround yourself with have a big impact on your growth. Training with a coach and the best fighters will raise your skill level very quickly. Training alone or with lower level fighters will slow your progress. That being said, training in the gym and working with a trainer is best. It will be hard and scary and outside your comfort zone, but it will make you better as a fighter!",
      ),
      SectionModel(
        title: 'Partner',
        text:
            "A partner can hold your paws for you, run with you, train with you, motivate you and push you beyond your limits. Boxing, like many other endeavours, is a thousand times more fun when doing it with someone. Trying to box without a partner is like learning to play chess alone. You will invent all sorts of possibilities that don't really apply, only to lose later when you finally meet a live opponent. If you don't want to waste eternity, find yourself a partner so you can progress exponentially.",
      ),
      SectionModel(
        title: 'Boxing Bag',
        text:
            "As a beginner, you will need the bag to develop proper punching form, punching power, punching speed and punching endurance. You'll probably have a lot of fun at first because you've never had the opportunity to let your energy out in this way. Over time, you'll move on to bigger and better things, but as a beginner, the punching bag is a lot of fun.",
      ),
      SectionModel(
        title: 'Stretch Pear',
        text:
            "A cool way to develop accuracy, timing and hand speed. I highly recommend this as a supplement or even a replacement for a bag, especially for highly experienced boxers.",
      ),
      SectionModel(
        title: 'Rope',
        text:
            "For \$5, you can't find a better piece of boxing equipment to help you develop all of your boxing muscles, balance, footwork, and even striking ability. The jump rope, is a common way for boxers to warm up, train, and warm down.",
      ),
      SectionModel(
        title: 'Pneumatic weight',
        text:
            "Excellent for developing rhythm, timing, accuracy, hand speed and hand endurance. The pneumatic weight is absolutely essential for serious boxers, but not so essential for those who box for themselves. If you have access to a jump rope, that's fine.",
      ),
      SectionModel(
        title: 'Boxing ring',
        text:
            "You can spar anywhere, but a boxing ring is the best option if you want to learn how to box according to conventional boxing rules and scenarios. Having a ring helps limit your space so that neither you nor your opponent can run far out of range. It also forces you to develop long-range skills as well as close-range skills. On a more psychological level, being in the ring forces you to confront your opponent, with no way to escape.",
      ),
      SectionModel(
        title: 'Example Boxing Training',
        text:
            "The following describes the basic idea of basic boxing training. It may be too easy for natural athletes, but it may also be too difficult for others. Do what you can do and push yourself higher. If something is giving you a hard time, then you know you need to do it more. If something gives you pain, STOP. Last but not least, REST. Don't be a nerd and train until you are completely exhausted and injured. No intelligent athlete does this, only nerds (because they don't know how to be productive other than to completely exhaust themselves).",
      ),
      SectionModel(
        title: 'Boxing warm-up',
        text:
            '3 rounds - running or jump rope\n3 rounds - shadow boxing\nWarm up and move your limbs to warm up your body',
      ),
      SectionModel(
        title: 'Boxing Training',
        text:
            '3 ROUNDS - work on paws with a coach/ partner (to develop new skills)\n3 rounds - bag\n3 rounds - punching bag on stretches\n3 ROUND - more shadow boxing (to consolidate newly learnt skills and warm up for sparring)\n3 ROUND - sparring, can be for training or instructional purposes\n3 ROUND - endurance work, can be plyometric exercises, tabata exercises, resistance training, gymnastics, etc.',
      ),
      SectionModel(
        title: 'The Boxing Jam',
        text:
            '100 push-ups\n100 body lifts\n100 twists\nStretch again so that your muscles are not too damaged the next day',
      ),
      SectionModel(
        title: 'Boxing Training Tips:',
        text:
            "Ask everyone for advice. It's incredible what you'll learn when you get advice from so many different angles - there is more than one way to do something, you have to learn them all (there is no «best way»)\nEat right. This will provide you with more energy and speed up your recovery",
        imagePath: AppImages.act81,
      ),
    ],
  ),
  ArticleModel(
    title: 'Basic boxing strategy',
    iconPath: AppIcons.act9,
    sections: [
      SectionModel(
        title: 'Boxing is 90% Psychology',
        text:
            "Once it's time to compete, whether it's in the gym or at a tournament, you're going to run into confidence issues sooner or later. It's natural for people to start doubting themselves about their first big defeat. You start to wonder if boxing is even right for you. Or maybe you feel like you've reached a plateau and can't get any better. Here are some guidelines to help you deal with these psychological difficulties.",
      ),
      SectionModel(
        title: 'Boxing Styles',
        text:
            "What is the best boxing style?\nHow to fight like Mike Tyson? How to fight like Floyd Mayweather?\nWhat boxing style should you use?\nOkay, look, this is hard to explain, but I'll try my best. Here's the rub, there really is no such thing as a ‘fighting style’ or even a ‘better style’. The only style that matters is YOUR natural style. That is, doing things naturally and easily for yourself. What's more, you don't even have to think about style. Just keep improving your boxing technique, training and strategy, and over time-your ‘style’ will be the result of that. What matters is that you win, not how you look.\nAnd the best choice is whatever feels the lightest and most natural. It's probably easier for a tall guy to fight high. It's probably easier for a short guy to fight low. Mike Tyson fights the way he fights because it's easiest for him. He throws hard punches because he is already a strong dude, he doesn't need to put in extra effort to BE strong.\nMuhammad Ali can dance around the ring because he has excellent footwork. If you want to do the same, you will have to develop your footwork to the point where it becomes effortless. Otherwise, trying to be Ali when you don't have his skills and form is just a waste of time. All the best fighters you see have their distinctive style because it's the easiest way for THEM to be successful. And you have to find the EASIEST way (not the most effective way) for YOU to be successful.\nOf course, that doesn't mean your style will never change. That doesn't make sense. Your skills, physicality, and psychology will change over time, and so will your style. Your style will continue to evolve as new moves and new approaches to fighting become more natural to you. But that only happens if you focus on yourself instead of trying to copy someone else. It's good to look elsewhere for inspiration, BUT FOCUS ON YOU!",
      ),
    ],
  ),
  ArticleModel(
    title: 'Tips for Sparring',
    iconPath: AppIcons.act10,
    sections: [
      SectionModel(
        title: '',
        text:
            "It's important to gradually work your way up to full-contact sparring, especially if you're a helpless beginner. Work lightly, work slowly. If you're in pain, it means you're working too fast. If one of you is twitching, it means you're working too fast. I recommend doing a shadow fight against each other first (simulate a fight without contact), then work only on jabs before using all kinds of punches. Also, it's a good idea to start with 2 minute rounds first. If you get tired quickly, it doesn't mean you suck, it's a natural thing that happens to many fighters, especially if they're not used to the tension of fights.",
      ),
      SectionModel(
        title: 'Tips:',
        text:
            "Wear safety gear (mouth guard, helmet, etc).\nSpar with someone who will help you learn to fight better (not just beat you up).\nDon't spar with someone who is trying to do damage to you (save that for a time when you are better trained).\nYou don't owe your coach anything, don't let him put you in dangerous situations.\nKEEP YOUR HANDS UP, LOOK AT YOUR OPPONENT, BREATHE.\nDon't throw more than 3-5 punches at a time.\nYou will ALWAYS get tired. It's better to get tired from throwing punches than from defending.",
      ),
      SectionModel(
        title: 'Basic Fighting Strategy',
        text:
            "Every beginner should, at the very least, start with a basic strategy on combat. The goal is to score some points without leaving yourself completely open. You can get very far if you do it right.\nRound 1: Move around the ring and try to touch your opponent. Watch how he moves and where he is exposed. Study him and hit him without putting in too much energy. Save your energy for later rounds.\nRound 2: You need to get a feel for his rhythm of movement. Start throwing harder punches, and hit back, but don't do it mindlessly. Stay off the ropes and remember to throw punches or you'll turn into a punching bag.\nRound 3: Give it your best shot. Throw your most effective punches, as many as you can. Be aggressive, but not careless. This is the last round, so work as hard as you can. Empty your tank before the bell rings.",
      ),
      SectionModel(
        title: 'Basic Fighting Styles',
        text:
            "There are a few basic ideas on how to fight different types of opponents. This is by no means a complete guide. Ultimately, you will need to improve your stamina and technique to improve your fighting ability. As your boxing skills develop, so will your ability to deal with different types of opponents. And even then, there will always be someone who can easily overwhelm your style.\nPower puncher - use either good defence or move a lot. The goal is to get away from his punches without expending more energy than he does. You need to exhaust him so you can attack him when his punches don't do much damage anymore.\nSpeed runner - attack fast opponents the way you would attack an air bag, not a sack. This means using fast punches, not power punches. Use a lot of fast punches, and eventually you'll catch him. Once you do, you can try to get in more power punches.\nDefensive shell - throw a lot of punches and you'll get through his defence. Try to get behind him sideways or behind him before attacking, don't stand in front of him or you'll run into counter punches. Take your time, there is no rush as he doesn't throw anything.\nAggressive multi-puncher - guys like this can be a nightmare for beginners. You don't have time to think, so all you can do is punch back and hope you don't tire before he does. Work smart and aim with good punches. Get closer to him to take away his striking space or use a tight defence to block many of his punches. Be sure to hit back to at least keep the fight even or you'll turn into a punching bag.\nTall or long-handed - Go forward with high defence and punch sharp overhand right. Try to trade punches and see if you can wear him out. The goal is to get into striking distance without missing punches or wasting a lot of energy.\nLow guys or divers - if you can't get to the head, aim for the body and from there move to the head. A good idea is to aim for the chest to force him to put a block there, then move to the head or body.",
      ),
    ],
  ),
  ArticleModel(
    title: 'Beginner\'s Boxing Mistakes',
    iconPath: AppIcons.act11,
    sections: [
      SectionModel(
        title: "Beginner's Mistakes in Technique",
        text:
            "Tilting the head forward beyond the line of the knee.\nTense body and clenched fist during punches.\nRaising the feet when striking (reduces balance, thrust and power).\nClosing your eyes when defending yourself.\nHaving too big of an ego. Be sure to ask someone for advice. It's just amazing what you can learn when you get advice from so many different angles - there is more than one way to do something, you have to learn them all (there is no «best way’»).",
      ),
      SectionModel(
        title: 'Beginner\'s Mistakes in Training',
        text:
            "Not having a coach, thinking you can learn everything on your own (a fighter with a coach can learn 3 times faster than someone who trains alone).\nToo much work on the bag.\nToo much focus on strength (instead of speed, endurance, balance, accuracy, etc).\nNot enough shadow boxing.\nNot having rest days during the week.\nFeedback training (sparring, pawing) is much more useful than exercise training (shadow boxing, shell work, etc).",
      ),
      SectionModel(
        title: 'Rookie mistakes in combat',
        text:
            "Lowering the arms.\nJumping around the ring instead of using an under step.\nNot looking at your opponent (especially during exchanges).\nToo few or too many punches, the best bunches are 3-5 punches at a time.\nStretching out with punches instead of coming within your own distance.\nStretching out with punches instead of coming within your own distance.",
      ),
    ],
  ),
];
