import 'package:get/get.dart';

class LocalString extends Translations {
  Map<String, Map<String, String>> get keys => {
        'en_US': {'dashboard': 'Dashboard', 'subone': "Order Management",'subtwo': "Inventory Management",'subthree': "Menu Management",'subfive': "Reporting",'subfour': "Change language",'subsix': "Logout"},//eng
        'hi_IN': {'dashboard': 'डैशबोर्ड', 'subone': "प्रबंधन को आदेश दें",'subtwo': "सूची प्रबंधन",'subthree': "मेनू प्रबंधन",'subfive': "रिपोर्टिंग",'subfour': "भाषा बदलें",'subsix': "लॉग आउट"},//hindi
        'Tm_IN': {'dashboard': 'டாஷ்போர்டு', 'subone': "ஒழுங்கு மேலாண்மை",'subtwo': "சரக்கு மேலாண்மை",'subthree': "மெனு மேலாண்மை",'subfive': "அறிக்கையிடல்",'subfour': "மொழியை மாற்றவும்",'subsix': "வெளியேறு"}//tamil
      };
}


