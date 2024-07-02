<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Add Anime</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>

</head>
<body>
<div class="container">
    <h1 class="pt-3 pb-3">Add new anime!</h1>

    <form:form action="/saveAnime" method="post" modelAttribute="anime">
        <div class="mb-3">
            <label for="name">Name</label>
            <form:input type="text" path="name" id="name"
                            class="form-control" required="required" />
        </div>

        <div class="mb-3">
            <label for="year">Year</label>
            <form:input type="number" path="year" id="year"
                            class="form-control" required="required" />
        </div>

        <button type="submit" value="Register" class="btn btn-success w-100" >
            Save
        </button>
    </form:form>
    <script>
        window.onload = function () {
            var msg = "${message}";
            if (msg == "Save Failure") {
                Command: toastr["error"]("Some error occurred, couldn't save Anime")
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
</div>
</body>
</html>