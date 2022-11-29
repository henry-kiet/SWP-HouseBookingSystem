<%-- 
    Document   : ListBill
    Created on : Oct 11, 2022, 9:49:23 PM
    Author     : Admin
--%>

<%@page import="Model.Bill"%>
<%@page import="Model.Account"%>
<%@page import="Dao.AccountDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        <%
        List<Bill> list = new ArrayList<Bill>();
        if(request.getAttribute("BillList") != null){
            list = (List<Bill>) request.getAttribute("BillList");
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
                        <div id="user-btn4" class="fas fa-user"></div>
                    </div>

                    <div class="account-box">
                        <p>username : <span>${fullname}</span></p>
                        <a href="LogoutServlet" class="delete-btn">logout</a>

                    </div>

                </div>
            </header>

            <table  id="table_id">
                <!--        <form action="SearchBillServlet" class="search-bar-container"  method="post">
                        <input style="height: 60px;font-size: 40px;" type="date" name="search" id="search-bar" placeholder="Search here..."">
                        <button class="fas fa-search" style="height: 60px; font-size: 40px; background-color: #fff" value="search" type="submit"></button>
                        </form>-->
                <thead>
                    <tr>
                        <th style="text-align: center" class="border-gray-200" scope="col">Bill_ID</th>
                        <th style="text-align: center" class="border-gray-200" scope="col">Date</th>
                        <th style="text-align: center" class="border-gray-200" scope="col">Total</th>
                        <th style="text-align: center" class="border-gray-200" scope="col">Status</th>
                        <th style="text-align: center" class="border-gray-200" scope="col">User_ID</th>
                        <th style="text-align: center" class="border-gray-200" scope="col">Action</th>
                    </tr>
                </thead>
                <%
                    for(Bill b : list){
                    AccountDAO adao = new AccountDAO();
                    Account a = adao.getAccountbyId(b.getUserid());
                    String fullname = a.getFullname();
                %>
                <tr>
                    <td style="text-align: center"><a href="getBillServlet?id=<%=b.getBillid() %>"><%=b.getBillid() %></a></td>
                    <td style="text-align: center"><fmt:formatDate value="<%=b.getDate() %>" pattern="dd-MM-yyyy" /></td>
                    <td style="text-align: center"><fmt:formatNumber value="<%=b.getTotal() %>" pattern="$#,###" /></td>

                    <td style="text-align: center"><c:if test="<%=b.getStatus() == 1%>" >
                            <span class="badge bg-success">Paid</span>
                        </c:if>
                        <c:if test="<%=b.getStatus() == 0%>" >
                            <span class="badge bg-light text-dark">Pending</span>
                        </c:if>
                    </td>

                    <td style="text-align: center"><%=fullname %></td>
                    <td style="text-align: center">
                        <span class="action_btn">
                            <a href="NextEditBillServlet?id=<%=b.getBillid() %>">Update</a>
                            <a class="delete_btn" href="DeleteBillServlet?id=<%=b.getBillid() %>">Delete</a>
                            <a href="NextAddBillServlet">Add</a>
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
        document.querySelector('#user-btn5').onclick = () => {
            accountBox.classList.toggle('active');
            navbar.classList.remove('active');
        }
    </script>
    <script src="JS/admin_js.js" type="text/javascript"></script>
</html>