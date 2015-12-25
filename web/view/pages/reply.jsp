<!DOCTYPE html>

<html>
    <head>
        <title>Sign Up Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    </head>
    <body>
        
        <div class="container">

            <nav class="navbar ">

                <div class="navbar-header">
                    <a class="navbar-brand bg-primary" href="#">FCI CU Mail</a>
                </div>
                <div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Compose</a></li>
                        <li><a href="#">Show Archive</a></li>
                        <li><a href="#">Inbox</a></li> 
                        <li><a href="#">Edit profile</a></li> 
                        <li><a href="#">LogOut</a></li>
                    </ul>
                </div>

            </nav>


            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <form class="form-signUp">
                        <h2 class="form-signin-heading" style="color:DodgerBlue">Reply Email</h2>
                        <div>
                            <label style="color:DodgerBlue">From: </label><br>
                            <input type="text">
                        </div>
                        
                        <div>
                            <label style="color:DodgerBlue">To: </label><br>
                            <input type="text">
                        </div>
                        
                        <div>
                            <label style="color:DodgerBlue">Subject: </label><br>
                            <input type="text">
                        </div>
                        
                        <div>
                             <label style="color:DodgerBlue">Message: </label><br>
                             <textarea rows="10" cols="40"></textarea>
                        </div>
                        <br>
                        <button  type="submit">Reply</button>
                    </form>  
                </div>
                <div class="col-md-3"></div>
            </div>
            
        </div>
    </body>
</html>

