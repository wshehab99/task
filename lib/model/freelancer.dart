import 'category.dart';

class FreelancerModel {
  List<Freelancer> higherRating;
  List<Freelancer> moreCompletedProjects;
  List<Category> category;

  FreelancerModel(
      {required this.higherRating,
      required this.moreCompletedProjects,
      required this.category});
}

class Freelancer {
  String image;
  String name;
  double rating;
  int completedProjects;
  Freelancer(this.name, this.rating, this.completedProjects, this.image);
}
