
<%@page import="Model.Account"%>
<%@page import="Model.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
            />

        <!-- custom css file link  -->
        <link rel="stylesheet" href="admincomment_style.css" />
        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <!-- custom admin css file link  -->
        <link rel="stylesheet" href="admin_style.css">
        <!-- Boostrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>  

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="sweetalert2.all.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <%
            String fullname = (String)session.getAttribute("fullname");
      Account a = new Account();
            if (request.getAttribute("account") != null) {
                a = (Account) request.getAttribute("account");
            }
        %>

        <header class="header">
            <div class="flex">

                <a href="" class="logo">Admin<span>Panel</span></a>

                <nav class="navbar">
                    <a href="DashboardServlet"><span>Home</span></a>
                    <a href="ListHouseServlet">Room</a>
                    <a href="ListBillServlet">Orders</a>
                    <a href="ListAccountServlet">Users</a>
                    <a href="ListAddService">Service</a>
                    <a href="ListCommentServlet">Messages</a>
                </nav>

                <div style="font-size: 2.5rem;" class="icons">
                    <div id="menu-btn" class="fas fa-bars"></div>
                    <div id="user-btn5" class="fas fa-user"></div>
                </div>
                <div style="font-size: 2.5rem;" class="account-box">
                    <p>username : <span>${fullname}</span></p>
                    <a href="LogoutServlet" class="delete-btn">logout</a>
                </div>   
        </header>
        <%
        List<Comment> list = new ArrayList<Comment>();
        if(request.getAttribute("Comment") != null){
            list = (List<Comment>) request.getAttribute("Comment");
        }
        %>
        <h1 class="heading">posts comments</h1>
        <%
        for(Comment c : list){
        %>
        <section class="comments">
            <p class="comment-title">post comments</p>
            <div class="box-container">
                <div class="post-title">
                    from : <span><%=c.getHouseid()%></span>
                    <a href=""></a>
                </div>
                <div class='box'>

                    <div class='user'>
                        <i class='fas fa-user'></i>
                        <div class='user-info'>
                            <span name="userid" value="<%=c.getUserid() %>"></span>
                            <div name="date"><%=c.getDate() %></div>
                            <div class="text" name="comment"><%=c.getComment() %></div>

                        </div></div>

                    <a class="inline-delete-btn" href="DeleteCommentServlet?id=<%=c.getCid()%>">Delete</a>
                </div></div>


        </section>

        <!-- custom js file link  -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="admincomment.js"></script>

        <%
                   }
        %>
    </body>

    <script>
        $('.inline-delete-btn').on('click', function (e) {
            e.preventDefault();
            var self = $(this);
            console.log(self.data('title'));
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                            )
                    location.href = self.attr('href');
                }
            })
        })
    </script>
    <script>
        document.querySelector('#user-btn5').onclick = () => {
            accountBox.classList.toggle('active');
            navbar.classList.remove('active');
        }
    </script>
    <script src="admin_script.js"></script>
</html>
