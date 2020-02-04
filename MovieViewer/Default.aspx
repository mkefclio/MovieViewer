<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MovieViewer.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<head runat="server">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Movie viewer</title>
    <script>
        $(document).ready(function () {
            $.get("https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=9198fa6d9a9713bc6b03ee9582525917", function (data) {
                $(".result").html(data);
                var bgColor = "lightgray";
                $.each(data.results, function (index, item) {
                    $("<tr style='background-color:" + bgColor + "'>").append(
                        $("<td>").text(item.original_title).on("click", { img: item.poster_path, overview: item.overview, title: item.original_title }, myHandler).css('cursor', 'pointer')
                    ).appendTo("#tblMovie");

                    if (bgColor == "lightgray") { bgColor = "white"; } else { bgColor = "lightgray"; }

                });

            }).fail(function () {
                alert('At the moment the movies are not available.Please,try later!');
            });
               

            function myHandler(event) {
                var poster_path = 'http://image.tmdb.org/t/p/w185/' + event.data.img;
                $("#imgMovie").attr("src", poster_path);
                $("#overviewMovie").text(event.data.overview);
                $("#titleMovie").text(event.data.title);
            }

        });

    </script>
</head>
<body>
        <table  style="position: absolute;height:100%;width:100%; top: 0; bottom: 0; left: 0; right: 0;">
                <tr style="width: 100%;height:40px;">
                    <td colspan="2" style="border-bottom-style: solid;border-bottom-color: black;">
                        <table style="width: 100%;height:100%; padding:10px">
                                <tr>
                                    <td style="width:200px;font-size:30px">Movie viewer</td>
                                    <td style="width:auto; text-align:right"><input  placeholder="search"/></td>
                                </tr>
                        </table>
                    </td>
                </tr>
                <tr style="width: 100%;height:auto;">   
                    <td style="width:400px; border-right-style: solid;border-right-color: black;vertical-align:top">
                        <table id="tblMovie"></table>
                    </td>
                    <td style="width:auto; text-align:left;vertical-align:top">
                        <p id="titleMovie"></p>
                        <p><img id="imgMovie" style="float:left"/><span id="overviewMovie"></span></p>
                    </td>
                </tr>
            
        </table>
   
</body>
</html>
