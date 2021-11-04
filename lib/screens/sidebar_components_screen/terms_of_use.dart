import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsOfUse extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<TermsOfUse> {
  int dol1 = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Center(
          child: Text(
            "Terms of Use ",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "This website (“Site”) is operated by The Pink Lane (“The Pink Lane”, “we”, “us” and “our”). Your use of the Site is subject to the following terms and conditions.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "CONSENT:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "PLEASE READ THESE TERMS OF USE CAREFULLY BEFORE USING THIS SITE. BY USING THIS SITE, YOU AGREE TO THESE TERMS OF USE. IF YOU DO NOT ACCEPT THESE TERMS OF USE, PLEASE DO NOT USE THIS SITE.\n\nYou acknowledge that these Terms of Use are supported by reasonable and valuable consideration, the receipt and sufficiency of which are hereby acknowledged. Without limiting the generality of the foregoing, you acknowledge that such consideration includes your use of the Site and receipt of data, materials and information available at or through the Site, the possibility of our use or display of your Submissions (as defined below) and the possibility of the publicity and promotion from our use or display of your Submissions.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "ADDITIONAL TERMS:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Note that special terms apply to some services offered on the Site, such as product purchases and other features or activities. These terms are posted in connection with the applicable service. Any such terms are in addition to these Terms of Use and, in the event of a conflict, prevail over these Terms of Use.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "MODIFICATION:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "We reserve the right to modify or otherwise update these Terms of Use at any time and you agree to be bound by such modifications, updates and revisions as a user of this Site. You should visit this page from time to time to review the current terms. We may change the Site or delete Content (as defined below) or features of this Site at any time, in any way, for any or no reason at our discretion.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "COPYRIGHT:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "All information, materials, functions and other content (including Submissions as defined) provided on this Site (collectively “Content”), such as text, graphics, images, etc., is our property or the property of our licensors and is protected by Indian and international copyright laws. The collection, arrangement and assembly of all content on this Site is our exclusive property and is protected by Indian and international copyright laws. Except as stated herein or as otherwise provided in an express authorization from us, no material from the Site may be copied, reproduced, republished, uploaded, posted, transmitted or distributed in any way. Any unauthorized use of any material contained in this Site is strictly prohibited.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "TRADEMARKS:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Unless otherwise noted, the trademarks, service marks, trade dress, trade names, and logos (collectively “Trademarks”) used and displayed on this Site are our registered and unregistered Trademarks and the Trademarks of our licensors. Nothing on this Site should be construed as granting, by implication, estoppel or otherwise, any license or right to use any Trademark displayed on the Site. Our Trademarks and those of our licensors may not be used in connection with any product or service that is not ours, in any manner that is likely to cause confusion among customers, or in any manner that disparages or discredits us.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "USE OF SITE AND CONTENT:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "We grant you a limited license to access and make personal use of the Site and the Content, subject to these Terms of Use. Neither this Site nor any portion of this Site or any Content may be reproduced, duplicated, copied, sold, resold or otherwise exploited for any commercial purpose that is not expressly permitted by us in writing, We reserve the right to refuse services, and/or cancel orders at our discretion if we believe that user conduct violates applicable laws or is harmful to our interests.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "LINKING:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Links to third party websites may be provided on this Site. If so, they are provided solely as a convenience to you. If you use such links, you will leave this Site. We have not reviewed all such third party sites (if any) and do not control and are not responsible for any of these websites and their content. We do not endorse or make any representations about such websites or any information or materials found there, or any results that may be obtained from using them. If you access any third party websites linked from this Site, you do so at your own risk.Unless otherwise permitted in writing signed by an authorized representative of The Pink Lane, a website that links to this Site:\n\n•	Shall not imply, either directly or indirectly, that The Pink Lane is endorsing its products;\n\n•	Shall not use any of our Trademarks or the Trademarks of our licensors;\n\n•	Shall not contain content or material that could be construed as offensive, controversial or distasteful and should only contain content that is appropriate for all age groups;\n\n•	Shall not disparage us or our products in any way or otherwise negatively affect or harm our reputation and goodwill;\n\n•	Shall not present false or misleading information about us or The Pink Lane opportunity;\n\n•	Shall not misrepresent any relationship with us;\n\n•	Shall not replicate in any manner any content in the Site; and\n\n•	Shall not create a browser or border environment around Site material.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "SUBMISSIONS:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "For purposes of these Terms of Use, the word “Submissions” means text, messages, ideas, concepts, suggestions, artwork, photographs, drawings, videos, audiovisual works, your and/or other persons’ names, likenesses, voices, usernames, profiles, actions, appearances, performances and/or other biographical information or material, and/or other similar materials that you submit, post, upload, embed, display, communicate or otherwise distribute on or through this Site.\n\nWe are always pleased to receive your comments, suggestions, and Submissions regarding this Site, our products and services, and our opportunity. If you transmit to us, post, or upload any Submissions to or through this Site, you grant us and our affiliates a non-exclusive, royalty-free, perpetual and irrevocable right to use, reproduce, modify, adapt, publish, translate, distribute and incorporate such Submissions and the names identified on the Submissions throughout the world in any media for any and all commercial and non-commercial purposes.\n\nBy communicating a Submission to us, you represent and warrant that the Submission and your communication thereof conform to the Rules of Conduct set forth below and all other requirements of these Terms of Use and that you own or have the necessary rights, licenses, consents and permissions, without the need for any permission from or payment to any other person or entity, to exploit, and to authorize us to exploit, such Submission in all manners contemplated by these Terms of Use. You agree that you shall not post or transmit to or from this Site any unlawful, threatening, libelous, defamatory, obscene, scandalous, inflammatory, pornographic or profane material, or any other material that could give rise to any civil or criminal liability under the law. See “Rules of Conduct” below.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "ACCOUNTS:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Some services on this Site permit or require you to create an account to participate in or to secure additional benefits. You agree to provide, maintain and update true, accurate, current and complete information about yourself as prompted by our registration processes. You shall not impersonate any person or entity or misrepresent your identity or affiliation with any person or entity, including using another person’s username, password or other account information, or another person’s name, likeness, voice, image or photograph. You also agree to promptly notify us of any unauthorized use of your username, password, other account information, or any other breach of security that you become aware of involving or relating to this Site.\n\nWe may suspend or terminate your account and your ability to use the Site or any portion thereof for failure to comply with these Terms of Use or any special items related to a particular service, for infringing copyright, or for any other reason whatsoever.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "PUBLIC FORUMS AND COMMUNICATION:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "“Public Forum” means an area or feature offered as part of this Site that offers the opportunity for users to distribute Submissions for viewing by one or more Site users, including, but not limited to, a chat area, message board, instant messaging, mobile messaging, social community environment, profile page, conversation page, blog, or e-mail function.\n\nYou acknowledge that Public Forums and features offered therein are for public and not private communications, and you have no expectation of privacy with regard to any Submission to a Public Forum. We cannot guarantee the security of any information you disclose through any of these media; you make such disclosures at your own risk.\n\nYou are and shall remain solely responsible for the Submissions you distribute on or through the Site under your username or otherwise by you in any Public Forum and for the consequences of submitting and posting the same. We have no duty to monitor any Public Forum.\n\nYou should be skeptical about information provided by others, and you acknowledge that the use of any Submission posted in any Public Forum is at your own risk. We are not responsible for, and we do not endorse, the opinions, advice or recommendations posted or sent by users in any Public Forum and we specifically disclaim any and all liability in connection therewith.\n\nWe owe you no obligation, and therefore may refuse to post, deliver, remove, modify or otherwise use or take any action with respect to any Submissions that you make to the Site.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "RULES OF CONDUCT:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "The following Rules of Conduct apply to the Site. By using the Site, you agree that you will not upload, post, or otherwise distribute to the Site any Submission that:\n\n•	(a) is defamatory, abusive, harassing, threatening, or an invasion of a right of privacy of another person; (b) is bigoted, hateful, or racially or otherwise offensive; (c) is violent, vulgar, obscene, pornographic, or otherwise sexually explicit; or (d) otherwise harms or can reasonably be expected to harm any person or entity;\n\n•	is illegal or encourages or advocates illegal activity or the discussion of illegal activities with the intent to commit them, including a Submission that is, or represents an attempt to engage in, child pornography, stalking, sexual assault, fraud, trafficking in obscene or stolen material, drug dealing and/or drug use, harassment, theft, or conspiracy to commit any criminal activity;\n\n•	infringes or violates any right of a third party including: (a) copyright, patent, trademark, trade secret or other proprietary or contractual rights; (b) right of privacy (specifically, you must not distribute another person’s personal information of any kind without their express permission) or publicity; or (c) any confidentiality obligation;\n\n•	is commercial, business related or advertises or offers to sell any products services or otherwise (whether or not for profit), or solicits others (including solicitations for contributions or donations);\n\n•	contains a virus or other harmful component, or otherwise tampers with, impairs or damages the Site or any connected network, or otherwise interferes with any person or entity’s use or enjoyment of the Site; or\n\n•	(a) does not generally pertain to the designated topic or theme of the relevant Public Forum; (b) violates any specific restrictions applicable to a Public Forum, including its age restrictions and procedures; or (c) is antisocial, disruptive, or destructive, including “flaming”, “spamming”, “flooding”, “trolling”, and “griefing”, as those terms are commonly understood and used on the Internet.\n\nWe cannot and do not assure that other users are or will be complying with the foregoing Rules of Conduct or any other provisions of these Terms of Use, and, as between you and us, you hereby assume all risk of harm or injury resulting from any such lack of compliance.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "REMOVAL OF SUBMISSIONS:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "We reserve the right, but disclaim any obligation or responsibility, to (a) refuse to post or communicate or remove any Submission from the Site that violates these Terms of Use and (b) identify any user to third parties, and/or disclose to third parties any Submission or personally identifiable information when we believe in good faith that such identification or disclosure will either (i) facilitate compliance with laws, including, for example, compliance with a court order or subpoena, or (ii) help to enforce these Terms of Use and/or protect the safety or security of any person or property, including the Site. Moreover, we retain all rights to remove Submissions at any time for any reason or no reason whatsoever.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "INTERNATIONAL:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "The Site is intended for viewing and use in India. If this Site is viewed internationally, you are responsible for compliance with applicable local laws.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "PRIVACY:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "The Pink Lane respects your privacy and the privacy of other visitors to the Site. To learn about our privacy practices and policies, please see our Privacy Policy. Additionally, by using this Site, you acknowledge and agree that Internet transmissions may never completely private or secure. You understand that even though The Pink Lane takes every precaution and utilizes SSL technology, any message or information you send to the Site may be read or intercepted by others, even if there is a special notice that a particular transmission (for example, credit card information) is encrypted.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "CHILDREN:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "The Pink Lane is committed to the safety of our children. Persons under the age of 18 may not enroll as the pink lane Style Associates or register as customers. Children under the age of 18 may not purchase products through the Site. The pink lane does not solicit or knowingly collect personally identifiable information from children under the age of 18.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "DISCLAIMER OF WARRANTIES:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "ALL CONTENT INCLUDED IN OR AVAILABLE THROUGH THIS SITE (THE CONTENT) IS PROVIDED “AS IS” AND “AS AVAILABLE” AND WITHOUT WARRANTIES OF ANY KIND. TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, ACCURACY, COMPLETENESS, AVAILABILITY, SECURITY, COMPATABILITY, AND NONINFRINGEMENT. WE DO NOT WARRANT THAT THE CONTENT IS ACCURATE, ERROR-FREE, RELIABLE OR CORRECT, THAT THIS SITE WILL BE AVAILABLE AT ANY PARTICULAR TIME OR LOCATION, THAT ANY DEFECTS OR ERRORS WILL BE CORRECTED, OR THAT THE SITE OR THE SERVERS THAT MAKE SUCH CONTENT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS. THIS SITE MAY INCLUDE TECHNICAL INACCURACIES OR TYPOGRAPHICAL ERRORS. YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION. WE DO NOT WARRANT OR MAKE ANY REPRSENTAITONS REGARDING THE USE OR THE RESULTS OF THE USE OF ANY CONTENT. YOU HEREBY IRREVOCABLY WAIVE ANY CLAIM AGAINST US WITH RESPECT TO CONTENT AND ANY CONTENT YOU PROVIDE TO THIRD PARTY SITES (INCLUDING CREDIT CARD AND OTHER PERSONAL INFORMATION). WE MAY IMPROVE OR CHANGE THE PRODUCTS AND SERVICES DESCRIBED IN THIS SITE AT ANY TIME WITHOUT NOTICE. WE ASSUME NO RESPONSIBILITY FOR AND DISCLAIM ALL LIABILITY FOR ANY ERRORS OR OMISSIONS IN THIS SITE OR IN OTHER DOCUMENTS WHICH ARE REFERRED TO WITHIN OR LINKED TO THIS SITE. SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, SO THE ABOVE EXCLUSION MAY NOT APPLY TO YOU.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "LIMITATION OF LIABILITIES:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "UNDER NO CIRCUMSTANCES, INCLUDING NEGLIGENCE, SHALL WE, OUR LICENSORS OR LICENSEES, OR ANY OF THE FOREGOING ENTITIES’ RESPECTIVE RESELLERS, DISTRIBUTORS, SERVICE PROVIDERS OR SUPPLIERS, BE LIABLE TO YOU OR ANY OTHER PERSON OR ENTITY FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, PERSONAL INJURY (INCLUDING DEATH) AND PROPERTY DAMAGE OF ANY NATURE WHATSOEVER, THAT RESULT FROM (A) THE USE OF, OR THE INABILITY TO USE, THIS SITE OR CONTENT, OR (B) THE CONDUCT OR ACTIONS, WHETHER ONLINE OR OFFLINE, OF ANY OTHER USER OF THE SITE OR ANY OTHER PERSON OR ENTITY, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. IN NO EVENT SHALL OUR TOTAL LIABILITY TO YOU FOR ALL DAMAGES, LOSSES AND CAUSES OF ACTION WHETHER IN CONTRACT, TORT (INCLUDING NEGLIGENCE) OR OTHERWISE EXCEED THE AMOUNT PAID BY YOU, IF ANY, OR \$$dol1 (WHICHEVER IS LESS) FOR ACCESSING OR PARTICIPATING IN ANY ACTIVITY RELATED TO THE SITE. MOREOVER, UNDER NO CIRCUMSTANCES SHALL WE, OUR LICENSORS OR LICENSEES, OR ANY OF THE FOREGOING ENTITIES’ RESPECTIVE RESELLERS, DISTRIBUTORS, SERVICE PROVIDERS OR SUPPLIERS, BE HELD LIABLE FOR ANY DELAY OR FAILURE IN PERFORMANCE RESULTING DIRECTLY OR INDIRECTLY FROM AN ACT OF FORCE MAJEURE OR CAUSES BEYOND OUR OR THEIR REASONABLE CONTROL.\n\nWE MAY TERMINATE YOUR FURTHER ACCESS TO THE SITE OR CHANGE THE SITE OR DELETE CONTENT OR FEATURES IN ANY WAY, AT ANY TIME AND FOR ANY REASON OR NO REASON.\n\nTHE LIMITATIONS, EXCLUSIONS AND DISCLAIMERS IN THIS SECTION AND ELSEWHERE IN THESE TERMS OF USE APPLY TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "GENERAL PROVISIONS:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "We make no representations that the Content on the Site is appropriate or available for use in any particular location. Those who choose to access the Site do so on their own initiative and are responsible for compliance with all applicable laws including any applicable local laws. If any provision of these Terms of Use shall be unlawful, void or for any reason unenforceable, then that provision shall be deemed severable from these Terms of Use and shall not affect the validity and enforceability of any remaining provisions.\n\nNo waiver of any provision of these Terms of Use by us shall be deemed a further or continuing waiver of such provision or any other provision, and our failure to assert any right or provision under these Terms of Use shall not constitute a waiver of such right or provision.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "YOU AGREE THAT ANY CAUSE OF ACTION YOU MAY HAVE ARISING OUT OF OR RELATED TO THESE TERMS OF USE OR THE SITE MUST COMMENCE WITHIN ONE (1) YEAR AFTER THE CAUSE OF ACTION ACCRUES; OTHERWISE, SUCH CAUSE OF ACTION SHALL BE PERMANENTLY BARRED.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
