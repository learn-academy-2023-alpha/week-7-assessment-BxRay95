# ASSESSMENT 6: Interview Practice Questions

Answer the following questions.

First, without external resources. Challenge yourself to answer from memory.

Then, research the question to expand on your answer. Even if you feel you have answered the question completely on your own, there is always something more to learn. Write your researched answer in your OWN WORDS.

1. As a developer, I am creating a Rails application with a model called Cohort that has_many students, but OOPS! I forgot to add the foreign key. How can I fix this mistake? What is the name of the foreign key? Would the foreign key be on the Cohort model or the Student model?

Your answer:
So, I actually love that this is a question on here, because I am VERY familiar with this experience as I had to do it about 15 times in the last 3 days.. (the order may be a little weird without referencing my notes) You can create an add column data or whatever you want to name it, I always try to name it very specifically what I am doing so that its documented well in the migrations. when you add or modify the column in the console, you have to go into the file for it(i dont remember what its called from memory but if i was looking at an application i could find it) and change  or add the column, in this case you would be adding a foreign key, and to modify or add, it requires 3 things in this order. 1. the name of the model you are changing or adding to, in this case the foreign key would be assigned to the student model since primary keys are assigned to the main model and foreign keys are what attach them to the main model 2. what you are actually adding or changing, in this case it would be foreign_key, since that is what we are adding to the model. then the last thing is the datatype of the thing you are creating/changing. and at some point, I think its before you do all of this, you have to migrate, but it doesn't hurt to migrate before and after. I will also say this could be a slightly different process for adding, I mostly had to change so i'm not 100% on what I listed above. 
 
Researched answer:
I'm sure I was actually pretty close with this one, in the rails console you generate a migration with rails g migration add_column_name_to_model_name column_name: datatype, then you run the rails db:migrate command to add that file, then inside of your vs code you have to update the model to have the data you want like I mentioned above, for the sake of adding something new you can use whats called up or down methods, down methods revert changes that are done by the up method, so the schema would not change if you do an up method and then a down method right after. best practice would be to reverse this exactly in the order you did it in the up method. some methods are irreversible, I experienced this the other day in challenges.. 
source:  https://guides.rubyonrails.org/v3.2/migrations.html#changing-tables

2. Which RESTful routes must always be passed params? Why?

Your answer: 
I am going to list all of them so that I can try to do this from memory.

index, I dont think index needs params, because you are accessing all of the elements at once. 

new does not require params because you are just adding the form to create a new nonexistent element, new also doesnt perform the action of creating, its just the form to allow create to do the work

create also does not need params because you are providing the functionality of adding a new element. It does not exist yet so there is no need for a param. 

edit requires a param because you are accessing a specific element that you are changing. 

update also requires a param because like edit you are accessing a specific element to perform the update on, update also requires strong params because you want to make sure it is secure and you are giving it required inputs. 

delete requires params because you are deleting a specific instance, so you need to know which one you are deleting. 


Researched answer: I am really struggling to find any resources on this as far as (required) params, but I know you want to give create and update strong params for security of your app from malicious intent, this article says that path params are required, which obviously makes sense, if you are routing the controller around your app, the routes will also need to have the params to get there. query string params appear after a ? in the end point, followed by the params and values, order does not matter. Header parameters are typically used for authorizations. 
source: https://www.atatus.com/blog/rest-api-best-practices-for-parameter-and-query-string-usage/

3. Name three rails generator commands. What is created by each?

Your answer: The first 3 that come to mind for me are generate model, generate resource, and generate migration. the first one generates a model that you store in your database that you can add change or remove the elements of like we did with blog post day, generate resource was related to API specifically, so you didn't have the view file that you did with generate model. and generate migration is used to add a migration file, example being adding columns or changing columns to your pre existing model or resource, you use migration when you need to add more or change specific data within your model/resource. 

Researched answer: 5 common rails generator commands are scaffold generator which is basically just a model but it includes all of the boiler plate items. model generator which we have commonly used in the past to create our models. controller generators which are used to generate controller. migration generators are split into 2 parts, adding new columns to existing models or resources, and removing columns from existing models. 
source: https://dev.to/shahershamroukh/top-10-rails-commands-we-must-know-2pb9#:~:text=3-%20Rails%20Generator%20comm[…]nerator%20for%20Removing%20columns%20

4. Consider the Rails routes below. What is the name of the controller method that would be called by each route? What action would each of the controller methods perform?

action: "GET" location: /students

index - would essentially act as the homepage for (im going to use the blogs as the example again since its the most fresh in my memory)the blogs app, here you would see a list of ALL of the blogs created and can navigate to and from each of them 

def index
 @posts = BlogPost.all
end

action: "POST" location: /students

so the POST request would be in relation to create, create is the actual functionality and ability to create a new blog, where new would provide the form to do so. This one requires strong params so that you can keep it secure and only allow specific information to be accepted when creating a new request. you want to redirect the user back to the index page to show them that their create was a success where it will be displayed in the list with the rest, but only if it meets the conditional statement of being valid.

def create
 @post = BlogPost.create(blog_post_params)
    if @post.valid?
      redirect_to blog_post_path(@post)
    end
end 

action: "GET" location: /students/new

this is a new request, which does not actually create a new request, it just pulls the form for the user to fill out and then the create request performs the action of creating the new blog in this example. new does not require params because the new request being created does not exist yet. 

def new 
    @post = BlogPost.new
end

action: "GET" location: /students/2

this is a SHOW request, and it will show the id(parameter) of 2, so it would show blog post 2 in our example, it requires a parameter because it is accessing a specific element in the model.

def show
    @post = BlogPost.find(params[:id])
end

action: "GET" location: /students/2/edit

this is an EDIT request, edit also requires a parameter of the ID of the element you are trying to change because you dont want to change every element usually, just a specific one, in this instance you would be providing the ability to edit blog post 2, again edit does not actually perform the action of changing, it just creates the form for the user to fill out. Update actually does the update action. 

def edit
    @post = BlogPost.find(params[:id])
end


action: "PATCH" location: /students/2

this is the UPDATE request which requires a param of the element you are updating, this is the actual action of the edit request, since it provided the user with the form to fill out, I think of this as the button that performs the action, you want to redirect the user to the page of the specific element they are trying to update if the update was a success via the valid condition in the method. this method also requires strong params so that you are only allowing the update to occur based on what you specify as an acceptable condition.

def update
    @post = BlogPost.find(params[:id])
    @post.update(blog_post_params)
if @post.valid?
      redirect_to blog_post_path(@post)
    end
  end

action: "DELETE" location: /students/2

this is the destroy method, it requires the parameter of the instance you wish to delete, in this case it would be deleting blog post 2, upon successful delete you want to redirect the user to the main index page so that they can see it was a successful delete and is no longer shown in the list with the rest.

def destroy 
    @post = BlogPost.find(params[:id])
    if post.destroy
        redirect_to  blog_posts_path
    end
end

5. As a developer, you are making an application to manage your to do list. Create 10 user stories that will help you get your application started. Read more about [user stories](https://www.atlassian.com/agile/project-management/user-stories).

Story 1: in order to interact with the to do list app,  as a user, I need to see a list of the to do list actions.
branch: to-do-list-index
- has a model for to do list with the following information: task and details
- has a controller for to do list
- has a controller action for index
- has a route for index
- has a view for index
- can see all to do list tasks on the landing page 

Story 2: In order to interact with the to do list app, as a user, I need to see the details of one to do list.
branch: to-do-list-show
- has a controller action for show
- has a route for show
- has a view for show
- can navigate from the list of all tasks to the view of any single given task

Story 3: in order to interact with the to do list app, as a user, i need to see a form where i can fill out information for a new to do list action.
branch: to-do-list-new
- has a controller action for new
- has a route for new
- has a view for new
- can navigate from the landing page to the view of the new page
- can see a form for task and details
- can see a submit button
- can navigate back to the new page to the landing page

Story 4: in order to interact with the to do list app, as a user, i need to create a new to do list item
branch: to-do-list-create
- has a controller action for create
- has a route for create
- can fill out a form for a new task and click on a submit button that will trigger a create action 
- can be rerouted to the landing page when a valid task is created

Story 5: in order to interact with the to do list app, as a user, i need to delete a to do list item
branch: to-do-list-delete
- has a controller action for delete
- has a route for delete
- can see a button on the show page to delete the task
- can click on the button to perform the delete action
- can be rerouted to the landing page when a task is deleted

Story 6: in order to interact with the to do list app, as a user, I can see a form where i can fill out info to edit an existing to do list item
branch: to-do-list-edit
- has a controller action for edit
- has a route for edit
- has a view for edit
- can navigate from the show page of one task to the view of the edit page
- can see a form to edit the task and details
- an see a submit button
- can navigate back from the edit page to the to do list page

Story 7: in order to interact with the to do list app, as a user, I need to be able to update an existing to do list item
branch: to-do-list-update
- has a controller action for update
- has a route for update
- can fill out a form to edit an existing task and click on a submit button that will trigger the update action
- can be rerouted to the landing page when a valid blog post is updated

Story 8: in order to interact with the to do list app, as a user, I need to ensure only valid data is entered into the database
branch: to-do-list-validations
- ensure all tasks have task names and details
- ensure all tasks are unique
- task and task details cannot be the same

Story 9: in order to interact with the to do list app, as a user, I need to ensure be able to see why my input validations are failing with an error message.
branch: to-do-list-validation-errors
- provide an error that says you need to have a task name and details on the task if not provided when creating or editing
- provide an error that says you can not have a duplicate task
- provide an error that says your task name and detail can not be the same thing.

Story 10: in order to interact with the to do list app, as a user, I need stylings for each page.
branch: to-do-list-styling
- each page of your to do list has nice looking styling

