import 'package:flutter/material.dart';

import 'item_description.dart';
import '../../settings/settings.dart';

class ScreenArguments {
  final String nameToPass;
  final int priceToPass;
  final String urlToPass;

  ScreenArguments(this.nameToPass, this.priceToPass, this.urlToPass);
}

List<String> itemName = [
  'りんご',
  'オレンジ',
  '牛乳',
  'チーズ',
  'りんご',
  'オレンジ',
  '牛乳',
  'チーズ',
  'りんご',
  'オレンジ',
  '牛乳',
  'チーズ'
];

List<int> itemPrice = [
  198,
  150,
  213,
  230,
  198,
  150,
  213,
  230,
  198,
  150,
  213,
  230
];

List<String> itemURLImage = [
  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b9e405d8-7e26-4ce3-a7d8-dd388ca2b4dc/d5ccurx-ad33b452-74bf-4d1c-acfa-da95216bbf18.png/v1/fill/w_900,h_720,q_75,strp/png_green_apple_by_paradise234-d5ccurx.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwic3ViIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl0sIm9iaiI6W1t7InBhdGgiOiIvZi9iOWU0MDVkOC03ZTI2LTRjZTMtYTdkOC1kZDM4OGNhMmI0ZGMvZDVjY3VyeC1hZDMzYjQ1Mi03NGJmLTRkMWMtYWNmYS1kYTk1MjE2YmJmMTgucG5nIiwid2lkdGgiOiI8PTkwMCIsImhlaWdodCI6Ijw9NzIwIn1dXX0.VkuQiCP8C5b0IVl6P9n07f7xHD5P3Pwzkq3eERuB94s',
  'https://pngimg.com/uploads/orange/orange_PNG800.png',
  'https://www.meijioishiigyunyu.com/images/story/chapter5-pkg.png',
  'https://purepng.com/public/uploads/large/purepng.com-cheesefood-organic-cheese-piece-block-dairy-9415246353872kvm0.png',
  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b9e405d8-7e26-4ce3-a7d8-dd388ca2b4dc/d5ccurx-ad33b452-74bf-4d1c-acfa-da95216bbf18.png/v1/fill/w_900,h_720,q_75,strp/png_green_apple_by_paradise234-d5ccurx.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwic3ViIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl0sIm9iaiI6W1t7InBhdGgiOiIvZi9iOWU0MDVkOC03ZTI2LTRjZTMtYTdkOC1kZDM4OGNhMmI0ZGMvZDVjY3VyeC1hZDMzYjQ1Mi03NGJmLTRkMWMtYWNmYS1kYTk1MjE2YmJmMTgucG5nIiwid2lkdGgiOiI8PTkwMCIsImhlaWdodCI6Ijw9NzIwIn1dXX0.VkuQiCP8C5b0IVl6P9n07f7xHD5P3Pwzkq3eERuB94s',
  'https://pngimg.com/uploads/orange/orange_PNG800.png',
  'https://www.meijioishiigyunyu.com/images/story/chapter5-pkg.png',
  'https://purepng.com/public/uploads/large/purepng.com-cheesefood-organic-cheese-piece-block-dairy-9415246353872kvm0.png',
  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b9e405d8-7e26-4ce3-a7d8-dd388ca2b4dc/d5ccurx-ad33b452-74bf-4d1c-acfa-da95216bbf18.png/v1/fill/w_900,h_720,q_75,strp/png_green_apple_by_paradise234-d5ccurx.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwic3ViIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl0sIm9iaiI6W1t7InBhdGgiOiIvZi9iOWU0MDVkOC03ZTI2LTRjZTMtYTdkOC1kZDM4OGNhMmI0ZGMvZDVjY3VyeC1hZDMzYjQ1Mi03NGJmLTRkMWMtYWNmYS1kYTk1MjE2YmJmMTgucG5nIiwid2lkdGgiOiI8PTkwMCIsImhlaWdodCI6Ijw9NzIwIn1dXX0.VkuQiCP8C5b0IVl6P9n07f7xHD5P3Pwzkq3eERuB94s',
  'https://pngimg.com/uploads/orange/orange_PNG800.png',
  'https://www.meijioishiigyunyu.com/images/story/chapter5-pkg.png',
  'https://purepng.com/public/uploads/large/purepng.com-cheesefood-organic-cheese-piece-block-dairy-9415246353872kvm0.png'
];

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
          itemCount: itemName.length,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, index) {
            return GridTile(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ItemDescription.routeName,
                      arguments: ScreenArguments(
                        itemName[index],
                        itemPrice[index],
                        itemURLImage[index],
                      ),
                    );
                  },
                  child: Image.network(itemURLImage[index])),
              footer: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        itemName[index],
                        style: TextStyle(color: MainColors.whiteColor),
                      ),
                    ),
                    color: MainColors.blackColor.withOpacity(0.7),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
