<%-- 
    Document   : noticias
    Created on : Apr 14, 2015, 1:20:10 AM
    Author     : vrebo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Noticias</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/estilos.css">
        <link rel="shortcut icon" type="image/x-icon" href="imagenes/favicon.ico">
    </head>
    <body>

        <div class="container">
            <header>
                <nav class="navbar navbar-default navbar-fixed-top">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav1">
                                <span class="sr-only">Menu</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a href="#" class="navbar-brand">SITVER</a>
                        </div>

                        <div class="collapse navbar-collapse" id="nav1">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="noticias.html">Noticias</a></li>
                                <li><a href="crearnoticias.html">Crear Noticias</a></li>
                                <li><a href="editarnoticias.html">Editar Noticias</a></li>


                                <form action="" class="navbar-form navbar-left" role="search">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                                            <input type="text" class="form-control" placeholder="Buscar">
                                        </div>
                                    </div>
                                </form>
                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Opciones <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li class="divider"></li>
                                        <li><a href="index.html">Cerrar sesión</a></li>
                                    </ul>
                                </li>
                            </ul>

                        </div>

                    </div>

                </nav>
            </header>

            <!-- <nav>
                    <ul class="pagination pagination-lg navbar-fixed-bottom">
                            <li class="disabled"><a href="#">&laquo;</a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&raquo;</a></li>
                    </ul>
                    
            </nav> -->
            <!-- 
                            <div class="panel panel-primary">
                                    <div class="panel-heading">Titulo de la noticia</div>
                                    <div class="panel-body">
                                            <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, dolorem numquam animi quis. Ducimus adipisci a itaque. Commodi rem beatae inventore ad, quasi officiis. Architecto quisquam quas nisi reprehenderit pariatur!</div>
                                            
                                    </div>
                            </div> -->


            <div class="container">
                <div class="row">
                    <c:forEach var="noticia" items="${listaNoticias}">
                        <div class="col-xs-12 col-sm-12 col-md-6">
                            <div class="thumbnail">
                                <img src="http://lorempixel.com/400/200/sports/1" alt="">
                                <div class="caption">
                                    <h3>${noticia.titulo}</h3>
                                    <h4>Subtítlo de la noticia</h4>
                                    <br><br>
                                    <p>${noticia.contenido}</p>
                                    <h5>${noticia.autor} ${noticia.fechaPublicacion}</h5>
                                    <button class="btn btn-primary">Editar</button>
                                    <a href="EliminarNoticia.do?id_noticia=${noticia.id}" class="btn btn-danger">Eliminar</a>

                                </div>
                            </div>

                        </div>
                    </c:forEach>
                    <div class="col-xs-12 col-sm-12 col-md-6">
                        <div class="thumbnail">
                            <img src="http://lorempixel.com/400/200/sports/1" alt="">
                            <div class="caption">
                                <h3>Título de la noticia</h3>
                                <h4>Subtítlo de la noticia</h4>
                                <br><br>
                                <p>Contenido de la noticia...
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam ullam rerum, necessitatibus deleniti enim eveniet explicabo.</p>
                                <h5>autor... y fecha de publicacion</h5>
                                <button class="btn btn-primary">Editar</button>
                                <a href="#delete" class="btn btn-danger" data-toggle="modal">Eliminar</a>
                                <div class="modal fade" id="delete">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button tyle="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="mensajeVentana modal-title">Mensaje de confirmación</h4>

                                            </div>

                                            <div class="modal-body">
                                                <p>¿Está seguro que desea eliminar esta publicación?</p>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                                <button type="button" class="btn btn-danger">Eliminar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6">
                        <div class="thumbnail">
                            <img src="http://lorempixel.com/400/200/sports/2" alt="">
                            <div class="caption">
                                <h3>Título de la noticia</h3>
                                <h4>Subtítlo de la noticia</h4>
                                <p>Contenido de la noticia...
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam ullam rerum, necessitatibus deleniti enim eveniet explicabo dolor vero unde impedit voluptas, quod quis quaerat nulla ut laudantium dignissimos, voluptatibus sunt.</p>
                                <h5>autor... y fecha de publicacion</h5>
                                <button class="btn btn-primary">Editar</button>
                                <a href="#delete" class="btn btn-danger" data-toggle="modal">Eliminar</a>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6">
                        <div class="thumbnail">

                            <div class="caption">
                                <h3>Título de la noticia</h3>
                                <h4>Subtítlo de la noticia</h4>
                                <p>Contenido de la noticia...
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam ullam rerum, necessitatibus deleniti enim eveniet explicabo dolor vero unde impedit voluptas, quod quis quaerat nulla ut laudantium dignissimos, voluptatibus sunt.</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum facere atque porro repudiandae eum in dolor ducimus illum consequuntur, nulla cumque, fugit ea rerum, amet, possimus dolore laborum eius unde?</p>
                                <h5>autor... y fecha de publicacion</h5>
                                <button class="btn btn-primary">Editar</button>
                                <a href="#delete" class="btn btn-danger" data-toggle="modal">Eliminar</a>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6">
                        <div class="thumbnail">
                            <img src="http://lorempixel.com/400/200/sports/4" alt="">
                            <div class="caption">
                                <h3>Título de la noticia</h3>
                                <h4>Subtítlo de la noticia</h4>
                                <p>Contenido de la noticia...
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam ullam rerum, necessitatibus deleniti enim eveniet explicabo dolor vero unde impedit voluptas, quod quis quaerat nulla ut laudantium dignissimos, voluptatibus sunt.</p>
                                <h5>autor... y fecha de publicacion</h5>
                                <button class="btn btn-primary">Editar</button>
                                <a href="#delete" class="btn btn-danger" data-toggle="modal">Eliminar</a>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6">
                        <div class="thumbnail">
                            <img src="http://lorempixel.com/400/200/sports/3" alt="">
                            <div class="caption">
                                <h3>Título de la noticia</h3>
                                <h4>Subtítlo de la noticia</h4>
                                <p>Contenido de la noticia...
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam ullam rerum, necessitatibus deleniti enim eveniet explicabo dolor vero unde impedit voluptas, quod quis quaerat nulla ut laudantium dignissimos, voluptatibus sunt.</p>
                                <h5>autor... y fecha de publicacion</h5>
                                <button class="btn btn-primary">Editar</button>
                                <a href="#delete" class="btn btn-danger" data-toggle="modal">Eliminar</a>
                            </div>
                        </div>

                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-6">
                        <div class="thumbnail">
                            <div class="caption">
                                <h3>Título de la noticia</h3>
                                <h4>Subtítlo de la noticia</h4>
                                <p>Contenido de la noticia...
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam ullam rerum, necessitatibus deleniti enim eveniet explicabo dolor vero unde impedit voluptas, quod quis quaerat nulla ut laudantium dignissimos, voluptatibus sunt.			Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam ullam rerum, necessitatibus deleniti enim eveniet explicabo dolor vero unde impedit voluptas, quod quis quaerat nulla ut laudantium dignissimos, voluptatibus sunt.</p>
                                <h5>autor... y fecha de publicacion</h5>
                                <button class="btn btn-primary">Editar</button>
                                <a href="#delete" class="btn btn-danger" data-toggle="modal">Eliminar</a>
                            </div>
                        </div>

                    </div>
                </div>

            </div>


        </div>


        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>	
    </body>
</html>
