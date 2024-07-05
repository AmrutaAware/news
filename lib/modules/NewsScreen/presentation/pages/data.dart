import 'package:flutter/foundation.dart';
import 'package:telphanews/modules/NewsScreen/presentation/pages/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category=[];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName="Business";
  categoryModel.image="assets/images/business.jpg";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  categoryModel.categoryName="Entertainment";
  categoryModel.image="assets/images/entertainment.jpg";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  categoryModel.categoryName="Health";
  categoryModel.image="assets/images/health.jpg";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  categoryModel.categoryName="Politics";
  categoryModel.image="assets/images/politics.jpg";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  categoryModel.categoryName="Sports";
  categoryModel.image="assets/images/sports.jpg";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  return category;
}

