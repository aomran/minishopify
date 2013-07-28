# Rebuilding the Depot App

"Depot" is a shopping cart app that is built as part of the Rails guide in the book "Agile Web Development with Rails". "MiniShopify" is a rebuild of the same app but with Test Driven Development (TDD) and without the use of scaffold generators.

For a visual version of the information below, have a look at my [presentation](http://www.aomran.com/depot-presentation).

## Model: Attributes
- `Product`: title, description, image_url, price, timestamps
- `LineItem`: quantity, price, product_id, cart_id, order_id, timestamps
- `Cart`: timestamps
- `Order`: name, address, email, pay_type, timestamps

Note that rails adds the attribute "id" to all Models by default. The id is incremented automatically, so the first item has the id 1, the second has the id 2, and so on.

## Controllers
All of our models have controllers: Products, LineItems, Carts, and Orders. **Store** is a controller which does not have a model, it's pretty much consolidating the data from Cart, LineItem and Product.

## Associations
- A `Product` *has_many* line_items
- A `Cart` *has_many* line_items
- A `LineItem` *belongs_to* a product, order and cart
- An `Order` *has_many* line_items (we add the line items to the order and delete the cart)

### Foreign Keys:

A **foreign key** is a column in a database table which is used to establish a link/association between two tables. The model with the **belongs_to** will have a foreign key column in its database table; the model with the **has_many** will not change.

We can generate foreign keys during the generation of a model like so:

```
$ rails generate model LineItem quantity:integer price:decimal \
product:references cart:references order:references
```


This will product the following migration:

```
class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 1
      t.decimal :price
      t.references :product, index: true
      t.references :cart, index: true
      t.references :order, index: true
      t.timestamps
    end
  end
end
```

This is equivalent to:

```
class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 1
      t.decimal :price
      t.integer :product_id, index: true
      t.integer :cart_id, index: true
      t.integer :order_id, index: true
      t.timestamps
    end
  end
end
```

The `t.references :cart, index: true` will add a column called "cart_id" to the line_items table. What's interesting is that "belongs_to" is an alias for "references", so we can do this: `t.belongs_to :cart, index: true`


### Association Methods
* What's cool is that Rails builds helpers that allow us to retrieve associated objects.

* A cart **has_many** line items, meaning the object has a collection/array of line_items. Calling `@cart.line_items` will go to the line_items database, find the ones that have the right cart_id and then return an array of them. I imagine Rails looking at the cart's `id` attribute and then just doing a `LineItems.where(cart_id: id)`.

* And conversely we can call `.cart` on a line_item (ex: `@line_item.cart`) to get the cart it is associated with. I imagine Rails looking at the line item's `cart_id` attribute and then just doing a `Cart.find(cart_id)`.


## How the App Works
* We have a list of `Products` (this resource has the usual 7 actions). Ideally only admin can view this section so some type of authorization needs to be implemented.

* Regular users start at the root of the application, there we have a `Store` with the same list of products (except without edit/create/delete links). The store controller is not complex at all, there's just one action (index) and the associated view.

### Adding Line Items to the Cart
1. User clicks on "add to cart", which will make a request to the **LineItems create** action. The product_id is sent in the params.
2. This create action will look in the session for a cart_id, if it doesn't find it then it will create a `Cart` and store its id in the session. The action will then call the method `add_product` on the cart object and pass it the product as an argument. The `add_product` method checks if a line_item with the product_id already exists. If it does then it increments the line_item's quantity. If there is no line_item then it is created.
3. At this point we have a cart and it has at least one item. The create action will redirect to the **Carts show** action.
4. The show action renders the `carts/show.html.erb` view. This view renders a partial (` render @cart `). This means go in the carts view folder and look for a partial called `_cart.html.erb` and pass it an object called `cart`.
5. The cart partial itself renders another partial with ` render cart.line_items `. This means iterate over this cart's line_items collection, name the objects `line_item` and then pass each object to the partial called `line_items/_line_item.html.erb`. So this partial is rendered X number of times, X being the number of items in the collection.
6. User will see a view which has a list of the line items. From here they can remove line items, empty the cart, or go through the checkout process.

### Emptying a Cart
1. Clicking on 'Empty Cart' will make a delete request to the **Carts destroy** action.
2. In the destroy action, we `destroy` the cart, set the `session[cart_id]` to nil
3. Then redirect to the store front.

### Removing/Decrementing Line Items from Cart
**Note**: Removing a line item is very much like emptying a cart, it's a simple delete request. For a decrement we need something more complicated.

1. Clicking on 'Remove One' will make a post request to the **LineItems decrement** action (this is a custom action).
2. In the decrement action, the LineItem is found (since the line_item's id was sent in params) and the custom method `decrement_or_destroy` is called on the line item instead of `destroy`. The `decrement_or_destroy` method is defined in the LineItem model. It checks the quantity attribute of the line item and then `decrement!(:quantity)` if the quantity is greater than 1, otherwise the usual `destroy` method is called.
3. The cart is rendered.

### Checkout
1. Now that we have a cart with some line_items, clicking on the checkout button will make a GET request to the **Orders new** action. The new action will make an empty object to be used in a form. *The action will also check if the cart is empty, if so it will redirect back to the store.*
2. A form is rendered in the `orders/new.html.erb` view. The order has a few attributes (name, shipping etc.) which are present on the form.
3. The form is submitted, going to the **Orders create** action.
4. The create action will create an order from the form's params and then will use the custom method `add_line_items_from_cart` to form the associated collection. This object is then saved to the database and we destroy the cart and remove it from the session.

The `add_line_items_from_cart` method is defined in the Order model and it takes line items from the cart and adds them to the order's line_items collection. *We set the cart_id of each item to nil, since there is a dependency created which deletes the line items once a cart is deleted.*

5. The user is redirected to the store-front with a 'Thank you for your order' message.


# Still To Do:
- users
- integration tests
- style and ajax