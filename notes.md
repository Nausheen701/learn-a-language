# Create models


# Rails request/response flow?

-client side sends a request
-receiving server sends to router
-router will send to appropriate controller#action
-controller will interact with model, model with db
-retrieve data and send that to view

# What are validations?
-Makes sure we don't have bad data
-Requirements
-Conditions that need to be met before hitting database
-Database guard dogs


# Where do validations get defined?
-in the model, at the very top of the file after associations

# Native validations
-foreign key in your table
-bcrypt will add required password

# Defining validations
-go inside the model after associations
-method validates :attr, helper

# What invokes our validations
-every time we touch our database
-(lifecycle methods--the cycle our object goes through)
  .save, .update, .create, 
-(non-lifecycle methods)
  .valid?(not persisting to db), .invalid?

# How do we know what erred?
- @errors => .errors

# displaying error messages
-print on the same form page

# Rails Association and Nested Forms

what method automatically gets called when .new is invoked?
1. Set up associations between models
    -Store
        -Name
        -Location

    -Has many items

    -Items
        -name
        -name
        -description

        -Belong to a store

