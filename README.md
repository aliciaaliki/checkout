# Checkout

In my implementation my focus was to make sure that the code is flexible so new promotions could be added later and updated each time the code is running. For that reason, I decided to include the promotions initialisers in a folder with a clear name for each. By initialising the promotions, their values can easily be updated in each session so a different percentage of discount can be added in a session for example.

Similar with the products instead of hardcoding them, I have created a class to initialise them with as many products as we need.

Checkout class has the main responsibility to manage the basket and call the promotions. Some validations and error messages have been added in Product and Promotions classes to make it easier to identify any mistakes made when creating them.

All the classes have been tested using TDD.

## Usage

Use the following to add items in the basket and calculate the total.

promotions = [
  Promotions::ProductMultibuyPrice.new('001', 2, 9.25, 8.5),
  Promotions::TotalDiscount.new(60, 0.10)
]

co = Checkout.new(promotions)

lavender_heart = Product.new('001', 'Lavender heart', 9.25)
personalised_cufflinks = Product.new('002', 'Personalised cufflinks', 45)
kids_t_shirt = Product.new('003', 'Kids T-shirt', 19.95)

co.scan(lavender_heart)
co.scan(personalised_cufflinks)
co.scan(kids_t_shirt)

co.total
co.empty_basket

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
