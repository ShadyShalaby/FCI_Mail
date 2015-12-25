<!DOCTYPE html>

<html>
    <head>
        <title>Home Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    </head>
    <body>
        
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
                        <li><a href="../../LogoutServlet">LogOut</a></li>
                    </ul>
                </div>

            </nav>

      <div class="container-fluid">
    <div class="row">
       
        <div class="col-sm-9 col-md-10">
         
           
          
           
        </div>
    </div>
    <hr>
    <div class="row">
        
      
        <!--main-->
        <div class="col-sm-9 col-md-10">
            <!-- tabs -->
            
            <!-- tab panes -->
            <div class="tab-content">
                <div class="tab-pane fade in active" id="inbox">
                    <table class="table table-striped table-hover">
                        <tbody>
                            <!-- inbox header -->
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox" class="all" title="select all">
                                    </label>
                                </td>
                                <td>
                                    <button class="btn btn-default"><i title="delete selected" class="glyphicon glyphicon-trash"></i></button>
                                    <button class="btn btn-default"><i title="move to folder" class="glyphicon glyphicon-folder-open"></i></button>
                                </td>
                                <td></td>
                            </tr>
                            <!-- inbox item -->
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox">
                                    </label> <span class="name">Mark Otto</span></td>
                                <td><span class="subject">Nice work on the docs for lastest version</span> <small class="text-muted">- Joe, I just reviewed the last...</small></td>
                                <td><span class="badge">12:10 AM</span> <span class="pull-right glyphicon glyphicon-paperclip"></span></td>
                            </tr>
                            <!-- inbox item -->
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox">
                                    </label> <span class="name">Anil Judah</span></td>
                                <td><span class="subject">GAE Project</span> <small class="text-muted">- Can you take a second to look..</small></td>
                                <td><span class="badge badge-inverse">11:33 AM</span> <span class="pull-right glyphicon glyphicon-warning-sign text-danger"></span></td>
                            </tr>
                            <!-- inbox item -->
                            <tr class="unread">
                                <td>
                                    <label>
                                        <input type="checkbox">
                                    </label> <span class="name">Terry Lincoln</span></td>
                                <td><span class="subject">Vacation pics</span> <small class="text-muted">(this message contains images)</small></td>
                                <td><span class="badge">11:13 AM</span> <span class="pull-right"></span></td>
                            </tr>
                            <!-- inbox item -->
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox">
                                    </label> <span class="name">Mark Brown</span></td>
                                <td><span class="subject">Last call for this weekend</span> <small class="text-muted">- Hi Joe, Thanks for sending over those..</small></td>
                                <td><span class="badge">11:05 AM</span> <span class="pull-right"></span></td>
                            </tr>
                            <!-- inbox item -->
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox">
                                    </label> <span class="name">Jorge Anodonolgez</span></td>
                                <td><span class="subject">Meeting with Simco</span> <small class="text-muted">- Joe I included your contact info for the...</small></td>
                                <td><span class="badge">10:54 AM</span> <span class="pull-right glyphicon glyphicon-paperclip"></span></td>
                            </tr>
                            <!-- inbox item -->
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox">
                                    </label> <span class="name">Mark Otto</span></td>
                                <td><span class="subject">FYI: New Release</span> <small class="text-muted">this message is high priority</small></td>
                                <td><span class="badge">9:58 AM</span> <span class="pull-right"></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade in" id="profile">
                    <div class="list-group">
                        <div class="list-group-item">
                            <span class="text-center">This tab folder is empty.</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row-md-12">

                <div class="well text-right">
                    <small>Last updated: 4/14/2015: 3:02 PM</small>
                </div>

            </div>
        </div>
    </div>
</div>

    </body>
</html>
