import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/news_item.dart';
import 'app_bar_icon.dart';

class NewsDetailsAppBar extends StatelessWidget {
  final NewsItem newsItem;
  const NewsDetailsAppBar({super.key, required this.newsItem});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String formattedDate = DateFormat('kk:mm').format(DateTime
        .parse(newsItem.publishedAt!));
    return SliverAppBar(
        backgroundColor: Colors.white,
        expandedHeight: size.height * 0.5,
        leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const AppBarIcon(icon: Icons.chevron_left, iconSize: 40),
            )),
        iconTheme: const IconThemeData(color: Colors.white),
        leadingWidth: 45,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(children: [
            Positioned.fill(
                child:
                // Image.network(newsItem.imgUrl!, fit: BoxFit.cover)),
          CachedNetworkImage(
          imageUrl: newsItem.imgUrl ?? '' ,fit: BoxFit.cover
            // ?? '', // Pass an empty string if imgUrl is
            // null
            ,placeholder: (context, url) => const Center(
              child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Image.asset('assets_NewsApp/boarding1.jpg',fit: BoxFit.cover),
          ),
            ),
          Positioned(
              bottom: 50,
              left: 20,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'General',
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 16 ,
                              fontFamily: 'Metropolis thin',
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    SizedBox(
                      width: size.width * 0.9,
                      child: Text(
                        newsItem.title!,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                fontFamily: 'Metropolis extraBold'
                                ),
                        maxLines: 3,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text('${newsItem.sourceName} • $formattedDate ',
                        style: const TextStyle(
                          color: Colors.white,
                            fontSize: 15 ,
                            fontFamily: 'Metropolis thin',
                            fontWeight: FontWeight.w900
                        )),
                    const SizedBox(height: 8.0)
                  ]),
            )
          ]),
          stretchModes: const [
            StretchMode.blurBackground,
            StretchMode.zoomBackground
          ],
        ),
        pinned: true,
        collapsedHeight: size.height * 0.1,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: SizedBox(
              height: 30,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(36.0),
                  ),
                ),
              ),
            )));
  }
}
