<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>View Anime</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>

    <style>
        a{
            color: white;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="p-3">Anime List</h1>

    <form:form>
        <table class="table table-bordered">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Year</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <c:forEach var="anime" items="${animeList}">
                <tr>
                    <td>${anime.id}</td>
                    <td>${anime.name}</td>
                    <td>${anime.year}</td>
                    <td>
                        <button type="button" class="btn btn-success">
                            <a href="/editAnime/${anime.id}">
                                Edit
                            </a>
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger">
                            <a href="/deleteAnime/${anime.id}">
                                Delete
                            </a>
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form:form>

        <a href="/addAnime">
            <button type="button" class="btn btn-primary w-100">Add New Anime</button>
        </a>

    <script>
        window.onload = function () {
            var msg = "${message}";
            if (msg == "Save Success") {
                Command: toastr["success"] ("Anime Added successfully!!")
            }else if (msg == "Edit Success") {
                Command: toastr["success"] ("Anime updated successfully!!")
            }else if (msg == "Delete Success") {
                Command: toastr["success"] ("Anime deleted successfully!!")
            } else if (msg == "Delete Failure") {
                Command: toastr["error"] ("Some error occurred, couldn't delete Anime")
            }
            toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
            }
        }
    </script>
</body>
</html>