require 'open-uri'
require 'json'

# Ingredient.destroy_all
# Utensil.destroy_all
# User.destroy_all


url = "https://raw.githubusercontent.com/ek/foodhackathon/master/canyoucookme/public/ingredient-list.json"
ingredients = JSON.parse(open(url).read)

ingredients.each do |ingredient|
  new_ingredient = Ingredient.create(name: ingredient['searchValue'])
end


Utensil.create(name: "Mixer")
Utensil.create(name: "Frying Pan")
Utensil.create(name: "Saucepan")
Utensil.create(name: "Stock Pot")
Utensil.create(name: "Sheet Pans")
Utensil.create(name: "Knives")
Utensil.create(name: "Weighing Scale")
Utensil.create(name: "Peeler")
Utensil.create(name: "Tongs")
Utensil.create(name: "Whisk")
Utensil.create(name: "Cutting BOard")
Utensil.create(name: "Colander")
Utensil.create(name: "Grater")


20.times do
  user = User.create!(
      email: Faker::Internet.email,
      username: Faker::Internet.username,
      password: "password",
      name: Faker::Name.name,
      url: Faker::Internet.url,
      bio: Faker::Marketing.buzzwords
  )


  rand(0..5).times do
    recipe = Recipe.create!(
        title: Faker::Food.dish,
        description: Faker::Food.description,
        portion: rand(1..10),
        difficulty: ["easy", "medium", "hard"].sample,
        prep_time: rand(5..120),
        bake_time: rand(0..60),
        resting_time: rand(0..60),
        diet: Recipe::DIET.sample,
        dish_type: Recipe::DISHTYPE.sample,
        cuisine: Recipe::CUISINE.sample,
        occasion: Recipe::OCCASION.sample,
        calories: rand(50..1000),
        status: "published",
        protein: rand(5..100),
        fat: rand(5..100),
        carb: rand(5..100),
        user: user
    )

    rand(1..5).times do
      RecipeUtensil.create(
          utensil: Utensil.all.sample,
          recipe: recipe,
          quantity: rand(0..3)
        )
    end
    rand(1..15).times do
      RecipeIngredient.create(
          ingredient: Ingredient.all.sample,
          recipe: recipe,
          quantity: rand(0..500),
          unit: ["gr", "ml", "unit"].sample,
        )
    end
    rand(1..10).times do
      Step.create(
          number: recipe.steps.all.size + 1,
          description: Faker::Quotes::Shakespeare.as_you_like_it_quote,
          recipe: recipe,
        )
    end
    if [true, false].sample
        review = Review.create(
            rating: rand(1..5),
            content: Faker::TvShows::BigBangTheory.quote,
            user: User.all.sample,
            recipe: recipe,
        )
    end
  end


  rand(0..5).times do
    cookbook = Cookbook.create!(
        title: Faker::Restaurant.type,
        status: ["public", "private"].sample,
        user: user
    )


    # CookbookRecipe.create(
    #       recipe: Recipe.all.sample,
    #       cookbook: cookbook,
    #     )
  end



    # CookedRecipe.create!(
    #   recipe: Recipe.all.sample,
    #   user: user
    #   )



    # Favorite.create!(
    #   recipe: Recipe.all.sample,
    #   user: user
    #   )



    # FollowedCookbook.create!(
    #   cookbook: Cookbook.all.sample,
    #   user: user
    #   )


  rand(0..10).times do
    planner = Planner.create!(
      date: Faker::Date.in_date_period(year: 2021, month: 6),
      recipe: Recipe.all.sample,
      user: user
      )
  end

  rand(0..5).times do
    ShoppingList.create!(
      title: Faker::Dessert.flavor,
      user: user
      )
  end

end


