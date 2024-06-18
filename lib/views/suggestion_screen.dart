import 'package:flutter/material.dart';
import 'package:fundme/utils/color_constant.dart';
import 'package:fundme/utils/custom_widget/custom_app_bar.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({super.key});

  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {

  String sugg = """
    Creating a successful crowdfunding project involves a combination of thorough planning, effective communication, and strategic marketing. Here are some key suggestions to help ensure your crowdfunding campaign achieves its goals:

    Compelling Storytelling:\n
    Create a Strong Narrative: Clearly explain why your project matters. Share the inspiration behind it, the problem it solves, and the impact it will have.\n
    Engage Emotionally: Use emotional appeals to connect with potential backers. Personal stories and real-world examples can be very effective.\n
    Detailed and Transparent Project Plan:\n
    Outline Clear Goals: Define what you aim to achieve with the funding and how the money will be used.\n
    Provide a Timeline: Offer a realistic timeline for the project's completion, including key milestones.\n
    High-Quality Visuals:\n
    Create a Compelling Video: A professional-looking video can significantly boost your campaign. It should explain the project, introduce the team, and make a clear ask for support.\n
    Use Quality Images: High-resolution photos of prototypes, designs, or the team can build trust and interest.\n
    Attractive Rewards:\n
    Offer Tangible Incentives: Provide rewards that are appealing and directly related to your project. These can range from early access to products, exclusive merchandise, or personal experiences.\n
    Tiered Rewards: Create multiple reward levels to cater to different budgets, ensuring that there is something for everyone.\n
    Effective Marketing and Outreach:\n
    Build a Pre-Launch Audience: Start building an email list and social media following before launching the campaign. Engage with potential backers early and often.\n
    Leverage Social Media: Use platforms like Facebook, Twitter, Instagram, and LinkedIn to promote your campaign. Share regular updates, behind-the-scenes content, and milestones.\n
    Engage with Influencers: Partner with influencers or bloggers who can help spread the word about your campaign to a broader audience.\n
    Strong Communication and Engagement:\n
    Regular Updates: Keep backers informed with regular updates about the progress of the campaign and the project.\n
    Respond Promptly: Answer questions and respond to comments quickly to show that you are engaged and committed.\n
    Set Realistic Funding Goals:\n
    Calculate Carefully: Set a funding goal that covers your costs but is also achievable. Consider the minimum amount needed to deliver on your promises.\n
    Flexibility: If possible, offer stretch goals to incentivize further contributions once the initial goal is met.\n
    Showcase Credibility and Trustworthiness:\n
    Highlight Team Expertise: Introduce your team and emphasize their skills and experience relevant to the project.\n
    Transparency: Be open about potential risks and challenges, and explain how you plan to address them.\n
    Leverage Data and Analytics:\n
    Analyze Competitors: Study successful crowdfunding campaigns similar to yours. Understand what worked for them and how you can apply those lessons.\n
    Monitor Progress: Use analytics tools to track the performance of your campaign and adjust your strategies as needed.\n
    Network and Community Building:\n
    Utilize Existing Networks: Reach out to friends, family, and colleagues to support and share your campaign.\n
    Build a Community: Foster a sense of community among your backers by encouraging interaction and feedback.\n
    By implementing these strategies, you can enhance the visibility, credibility, and attractiveness of your crowdfunding project, thereby increasing the likelihood of achieving your funding goals.
    """;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBodyBgColor,
      appBar: const CustomAppBar(
        title: "Suggestion",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sugg, textAlign: TextAlign.left)
              ],
            ),
          ),
        ),
      ),
    );
  }
}