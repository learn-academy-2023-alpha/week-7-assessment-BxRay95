# ASSESSMENT 6: Rails Commenting Challenge

# Add comments to the Rails Blog Post Challenge
# Explain the purpose and functionality of the code directly below the 10 comment tags


# FILE: app/controller/blog_posts_controller.rb

# ---1)
class BlogPostsController < ApplicationController # BlogPostsController is the class created that is inheriting from the applicationController, which is allowing it to take and use its behaviors and functionality. Inside the application controller you can put different code functionality's such as before/after actions, helper methods and json renders or more. and this is the main source that all of the other controllers inherit from.
  def index
    # ---2)
    @posts = BlogPost.all # I am assuming index was supposed to be under line 2 as well so I'll expain it here, index represents the R in CRUD for read. it will list all of the items in that specified model, so for this example, its saying list all of the posts from the blog post model. I try to remember this from our examples last week as the 'home page' where all of your blogs were displayed and you could click on any of them to perform the other actions.Its associated HTTP verb is GET, and the index routing is get '/resources' => 'resources#index'
  end

  # ---3)
  def show # the show controller method also represents the R for read in CRUD and will list 1 item from the model rather than index showing all of them. I think of this example from when you actually click on a blog from the index it will take you to the page specific to only that blog you clicked on and display the information contained within it. It's associated HTTP verb is also get and the routing is get '/resources/:id' => 'resources#show'. This one requires the params of the ID from each specific blog so that it knows what blog you are looking at. It is taking the created Model Blogpost and finding the specific post by searching for its ID with the .find method.
    @post = BlogPost.find(params[:id])
  end

  # ---4)
  def new # The new Controller Method is somewhere in between C and R in CRUD which displays the form to the user, I try to remember this one being different from create as in this one just displays the page and and the text boxes in order to make a new form, where create actually provides the functionality and does the action of creating a new form. Its HTTP verb is GET and its route is also get '/resource/new' => 'resources#new' this one is taking the created model Blogpost and creating a new post with the built in method .new, does not require params or an id because it does not exist yet
    @post = BlogPost.new 
  end

  def create
    # ---5)
    @post = BlogPost.create(blog_post_params) # again assuming create is supposed to be in here with the method associated, this is where the actual functionality from the NEW form we created above happens, create is a little different because it requires whats called strong params, which essentially restricts the parameters that can be used when creating a new form, this basically whitelists only the specified parameters you choose to allow in the creating process. if they do not meet the params it will not create. this method represents the C in CRUD and adds new information to the database, its associated http verb is POST, and route is post '/resources' => 'resources#create'. In order to make this a little more user friendly you can make an if statement that has the functionality of saying, 'if' the post was valid, or a successful create, redirect the user to the index or assigned home page, and display the created element for them to see, you can also add an error message through validations that gives them an error and tells them why the request failed if it didnt meet the strong params.  
    if @post.valid?
      redirect_to blog_post_path(@post)
    end
  end

  def edit
    # ---6)
    @post = BlogPost.find(params[:id]) # the edit method is similar to the new method in the aspect that it does not actually perform a specific action, it instead creates a form for the user to see so that the update method can perform the create action. this one is different from new being that since the form already exists it needs a param of the ID so that it knows which one you are trying to edit, the edit request will typically be specifically on the blog post or whatever is in your database. Edit would fall in the U of the CRUD acronym for update, I think kinda like new it would also fall under Read since you arent actually performing an update action. its route is and http verbs are put/patch 'reseources/:id' => 'resources#edit' 
  end

  def update
    @post = BlogPost.find(params[:id])
    # ---7)
    @post.update(blog_post_params) # update method is similar to the create method as it actually performs the action of updating the edit form created. Like the create method, this one also requires strong params so that the user or any user cannot just put whatever they want(for security reasons mostly) this method also uses the built in method .find so that it finds the specific instance you are trying to update. and then you are doing the same thing with the if statement for the convenience of the user to see if the update was successful, if the update post request was successful, redirect the user to the blog post path so that they can see the changes made, this one does not redirect to the home page, it is a better experience if you redirect the user the show the blog you actually changed so that they see it instantly without having to click around to get back to the updated page. It falls in the U for update in the CRUD acronym and https verbs are put/patch, route being put/patch 'resources/:id' => 'resources#update' 
    if @post.valid?
      redirect_to blog_post_path(@post)
    end
  end

  def destroy
    @post = BlogPost.find(params[:id]) #the destroy method is pretty simple. it requires the param of the ID that it is trying to delete, and is responsible for deleting that instance. It does exactly what it says it is going to do, it will give the user the ability to delete that section from the model. In CRUD it is the D for delete, and HTTP verb is also, much to your surprise, delete.. and its route is delete '/resources/:id' => 'resources#destroy' you also want to give a good user experience like the other major actions, so if the post is successfuly deleted redirected them to the main path where they can see that it was deleted from the list of all of the posts. 
    if @post.destroy
      # ---8)
      redirect_to blog_posts_path
    end
  end

  # ---9)
  private  #from my understanding, private basically makes the section of code below it not accessible to the other controllers like it would typically inherit, you use this for functions or helper methods that you want to remain in this specific section. in this case we are using it for our strong params so we want the scope of our strong params to remain in the 2 methods in this file that require them, being the update and create methods. 
  def blog_post_params
    # ---10)
    params.require(:blog_post).permit(:title, :content) # this is where the strong params actually go, you are basically saying that you 'require' these params in blog post in order to have a successful request, it will 'permit' the request if it has a title and content and you can make these requests more specific in the validations section. examples of this being you cant have duplicate titles, or titles need to be so long or so short. 
  end
end


#The above section of this assessment I referenced the syllabus. 