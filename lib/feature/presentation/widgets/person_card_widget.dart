import 'package:flutter/material.dart';
import 'package:test_project_bloc/common/app_colors.dart';
import 'package:test_project_bloc/feature/domain/entities/person_entity.dart';
import 'package:test_project_bloc/feature/presentation/widgets/person_cache_image_widget.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({Key? key, required this.person}) : super(key: key);

  final PersonEntity person;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cellBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            child: PersonCacheImage(
                imageUrl: person.image, width: 166, height: 166),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  person.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: person.status == 'Alive'
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        '${person.status} - ${person.species}',
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Last known location:',
                  style: TextStyle(color: AppColors.greyColor),
                ),
                const SizedBox(height: 4),
                Text(
                  person.location.name,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Text(
                  'Origin:',
                  style: TextStyle(
                    color: AppColors.greyColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  person.origin.name,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
