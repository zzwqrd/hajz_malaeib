part of 'import.dart';

class UserImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 30),
      decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   colors: <Color>[
          //     Colors.deepOrange,
          //     Colors.orangeAccent,
          //   ],
          // ),
          ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/icons/user.png",
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            width: 165,
            height: 165,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                border: Border.all(
                  color: const Color(0xFF6e262c),
                  width: 3,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                child: Image.asset(
                  "assets/icons/avatar.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(
              height: 10), // Adding some space between the image and the text
          const Text(
            "اسم المستخدم",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(
              height: 10), // Adding some space between the text and the button
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.orangeAccent,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "تعديل معلوماتي",
                        style: TextStyle(
                          color: Color(0xFF681d21),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.pencilAlt,
                          color: Color(0xFF681d21),
                          size: 16,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 2), // Space between icon and line
                          height: 1.5,
                          width: 18,
                          color: const Color(0xFF681d21),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
