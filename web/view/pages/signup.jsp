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
                       <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Sign in </a></li>
                    </ul>
                </div>

            </nav>


            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <form class="form-signUp">
                        <h2 class="form-signin-heading" style="color:DodgerBlue">Please sign up</h2>
                        <div>
                            <label style="color:DodgerBlue">UserName </label><br>
                            <input type="text" placeholder="Your UserName">
                        </div>
                        
                        <div>
                            <label style="color:DodgerBlue">Password </label> <br>
                            <input type="password" placeholder="Your Password" required>
                        </div>
                        
                        <div>
                            <label style="color:DodgerBlue">E-mail </label> <br>
                            <input type="text" placeholder="Your E-mail">
                        </div>
                        
                        <div>
                            <label style="color:DodgerBlue">Country </label> <br>
                            <input type="text" placeholder="Your Country">
                        </div>
                        
                        <div>
                            <label style="color:DodgerBlue">Phone </label> <br>
                            <input type="text" placeholder="Your phone-No">
                        </div>
                        
                        
                            <label style="color:DodgerBlue">Profile Picture</label> <br>
                            <input type="file" name="pic" accept="image/*">
                        
                        
                        
                        <br>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
                    </form>  
                </div>
                <div class="col-md-3"></div>
            </div>
            
        </div>
        
    </body>
</html>

  
