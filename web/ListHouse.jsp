<%-- 
    Document   : ListHouse
    Created on : Sep 30, 2022, 11:44:25 PM
    Author     : Admin
--%>

<%@page import="Model.House"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="adminuser_style.css"/>
        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <!-- custom admin css file link  -->
        <link href="css/adminuser_style.css" rel="stylesheet" type="text/css"/>
        <link href="css/admin_style.css" rel="stylesheet" type="text/css"/>
        <link href="css/datatables.css" rel="stylesheet" type="text/css"/>

        <!-- Boostrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>  

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
        <script src="sweetalert2.all.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>

        <%
        List<House> list = new ArrayList<House>();
        if(request.getAttribute("HouseList") != null){
            list = (List<House>) request.getAttribute("HouseList");
        }
        %>
        <div class="header_fixed">
            <!--       <h1>Manage House</h1>
                    <form action="mainController" method="get">
                        Name : <input type="text" name="name" >
                        <input type="submit" value="search" name="action">
                    </form>-->


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
                        <div id="u1" class="fas fa-user"></div>
                    </div>

                    <div class="account-box">
                        <p>username : <span>${fullname}</span></p>
                        <a href="LogoutServlet" class="delete-btn">logout</a>

                    </div>

                </div>
            </header>
            <a href="NextAddHouseServlet">Add</a>

            <table id="table_id" >
                <!--                <form action="SearchHouseServlet" class="search-bar-container"  method="post"  >
                        <input style="height: 60px;font-size: 40px;" type="text" name="search" id="search-bar" placeholder="Search here..."">
                        <button class="fas fa-search" style="height: 60px; font-size: 40px; background-color: #fff" value="search" type="submit"></button>
                        </form>-->
                <thead>
                    <tr>
                        <th style="text-align: center" class="border-gray-200" scope="col">House_ID</th>
                        <th style="text-align: center" class="border-gray-200" scope="col">House_name</th>
                        <th style="text-align: center" class="border-gray-200" scope="col">Post_Date</th>
                        
                        <th style="text-align: center" class="border-gray-200" scope="col">Price</th>
                        <th style="text-align: center" class="border-gray-200" scope="col">Address</th>
                        <th style="text-align: center" class="border-gray-200" scope="col">Action</th>
                    </tr>
                </thead>
                <%
                    for(House h : list){
                %>
                <tr>
                    <td style="text-align: center"><a href="HouseImgServlet?id=<%=h.getHouseid() %>"><%=h.getHouseid() %></a></td>
                    <td style="text-align: center"><%=h.getHousename() %></td>
                    <td style="text-align: center"><fmt:formatDate value="<%=h.getPostdate() %>" pattern="dd-MM-yyyy"/></td>
                    
                    <td style="text-align: center"><fmt:formatNumber value="<%=h.getHouseprice() %>" pattern="$#,###"/></td>
                    <td style="">
                        <span class="address">
                            <%=h.getAddress() %>
                        </span>
                    </td>
                    
                    <td style="text-align: center">
                        <span class="action_btn">
                            <a href="NextEditHouseServlet?id=<%=h.getHouseid() %>">Update</a>
                            <a class="delete_btn" href="DeleteHouseServlet?id=<%=h.getHouseid() %>">Delete</a>
                            <a href="ListServiceServlet?id=<%=h.getHouseid() %>">View Service</a>
                            <a href="NextAddServiceServlet?id=<%=h.getHouseid() %>">Add Service</a>
                        </span>
                    </td>
                </tr>
                <%
                }
                %>
            </table>
        </div>
    </body>

    <script>
        $('.action_btn .delete_btn').on('click', function (e) {
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
        document.querySelector('#u1').onclick = () => {
            accountBox.classList.toggle('active');
            navbar.classList.remove('active');
        }
    </script>
    <script src="JS/admin_js.js" type="text/javascript"></script>
</html>