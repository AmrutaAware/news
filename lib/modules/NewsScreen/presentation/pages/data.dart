import 'package:flutter/foundation.dart';
import 'package:telphanews/modules/NewsScreen/presentation/pages/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category=[];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName="Business";
  categoryModel.image="asset/business.jpg";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  categoryModel.categoryName="Entertainment";
  categoryModel.image="asset/entertainment.jpg";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  categoryModel.categoryName="Health";
  categoryModel.image="asset/health.jpg";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  categoryModel.categoryName="Politics";
  categoryModel.image="asset/politics.jpg";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  categoryModel.categoryName="Sports";
  categoryModel.image="asset/sports.jpg";
  category.add(categoryModel);
  categoryModel= new CategoryModel();

  return category;
}

