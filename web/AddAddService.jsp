<%-- 
    Document   : AddAddService
    Created on : Oct 28, 2022, 7:47:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <!-- custom admin css file link  -->
        <link rel="stylesheet" href="admin_style.css">
        <!-- Boostrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>  

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="sweetalert2.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
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

                <div class="icons">
                    <div id="menu-btn" class="fas fa-bars"></div>
                    <div id="user-btn" class="fas fa-user"></div>
                </div>

                <div class="account-box">
                    <p>username : <span>${fullname}</span></p>
                    <a href="LogoutServlet" class="delete-btn">logout</a>

                </div>

            </div>
        </header>
        <section class="add-products">
            <h1 class="title">Add Additional Service</h1>

            <form action="AddAdditionalServiceServlet" method="post" >
                <h2>Additional_Service_Name</h2>
                <input
                    type="text"
                    name="addservicename"
                    class="box"
                    placeholder="Enter Service Name"
                    required=""
                    />
                <h2>Additional_Service_Desc</h2>
                <input
                    type="text"
                    name="addservicedesc"
                    class="box"
                    placeholder="Enter Service Desc"
                    required=""
                    />
                <h2>Additional_Service_Status</h2>
                <input
                    type="text"
                    name="addservicestatus"
                    class="box"
                    placeholder="Enter Service Status"
                    hidden="true"
                    />
                <h2>Additional_Service_Price</h2>
                <input
                    type="text"
                    name="addserviceprice"
                    class="box"
                    placeholder="Enter Service Price"
                    required=""
                    />
                <input class="Update-btn" type="submit" value="   Add   " name="Add Service" id="click"/>
            </form>
        </section>
    </body>
    <script>
        document.querySelector('#click').addEventListener('click', (event) => {
            event.preventDefault();
            Swal.fire({
                title: 'Do you want to Add ?',
                showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: 'Add',
                denyButtonText: `Don't Add`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    Swal.fire('Added!', '', 'success')
                    document.querySelector('form').submit();
                } else if (result.isDenied) {
                    Swal.fire('Changes are not saved', '', 'info')
                }
            })
        });
    </script>
    <script src="admin_script.js"></script>
</html>
