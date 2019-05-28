<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>StoryPet! | </title>

        <!-- Bootstrap -->
        <link href="./vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="./vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="./vendors/nprogress/nprogress.css" rel="stylesheet">
        <!-- Animate.css -->
        <link href="./vendors/animate.css/animate.min.css" rel="stylesheet">

        <!-- Custom Theme Style -->
        <link href="./build/css/custom.min.css" rel="stylesheet">
    </head>

    <body class="login">
        <div>
            <a class="hiddenanchor" id="signup"></a>
            <a class="hiddenanchor" id="signin"></a>

            <div class="login_wrapper">
                <div class="animate form login_form">
                    <section class="login_content">                       
                        <form action="Usuario" method="post" >
                            <h1>Iniciar Sesion</h1>
                            <div>
                                <input type="text" name="correo" class="form-control" placeholder="Correo" required="" />
                            </div>
                            <div>
                                <input type="password" name="clave" class="form-control" placeholder="Contrase�a" required="" />
                            </div>
                            <div>
                                <input class="btn btn-default submit" type="submit" name="accion" value="ingresar">
                                <a class="reset_pass" href="#">Olvidaste tu contrase�a?</a>
                            </div>

                            <div class="clearfix"></div>

                            <div class="separator">
                                <p class="change_link">New to site?
                                    <a href="#signup" class="to_register"> Crear Cuenta </a>
                                </p>

                                <div class="clearfix"></div>
                                <br />

                                <div>
                                    <h1><i class="fa fa-paw"></i> StoryPet!</h1>
                                    <p>�2019 All Rights Reserved. StoryPet! is a Bootstrap 3 template. Privacy and Terms</p>
                                </div>
                            </div>
                        </form>
                    </section>
                </div>

                <div id="register" class="animate form registration_form">
                    <section class="login_content">
                        <form action="Usuario" method="post">
                            <h1>Crear Cuenta</h1>
                            <div>
                                <input type="text" class="form-control" name="Cedula" placeholder="Cedula" required="" />
                            </div>
                            <div>
                                <input type="text" class="form-control" name="Usuario" placeholder="Usuario" required="" />
                            </div>
                            <div>
                                <input type="password" class="form-control" name="Clave" placeholder="Clave" required="" />
                            </div>
                            <div>
                                <input type="text" class="form-control" name="Nombres" placeholder="Nombres" required="" />
                            </div>
                            <div>
                                <input type="text" class="form-control" name="Apellidos" placeholder="Apellidos" required="" />
                            </div>
                            <div>
                                <input type="text" class="form-control" name="Telefono" placeholder="Telefono" required="" />
                            </div>
                            <div>
                                <input type="email" class="form-control" name="Correo" placeholder="Correo" required="" />
                            </div>                         
                            <div>
                                <a class="btn btn-default submit" type="submit" name="accion" value="Registrar">Registar</a>
                            </div>

                            <div class="clearfix"></div>

                            <div class="separator">
                                <p class="change_link">Already a member ?
                                    <a href="#signin" class="to_register"> Iniciar Sesion </a>
                                </p>

                                <div class="clearfix"></div>
                                <br />

                                <div>
                                    <h1><i class="fa fa-paw"></i> StoryPet!</h1>
                                    <p>�2016 All Rights Reserved. StoryPet! is a Bootstrap 3 template. Privacy and Terms</p>
                                </div>
                            </div>
                        </form>
                    </section>
                </div>
            </div>
        </div>

        <% if (request.getAttribute("error") != null) {%>
        ${error}
        <%} else {%>
        ${exito}
        <%}%>

        <%
            if (request.getParameter("cerrar") != null) {
                HttpSession sesion = request.getSession();
                sesion.invalidate();
                response.sendRedirect("login.jsp");
            } else {

            }
        %>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script src="js/jquery.validate.js" type="text/javascript"></script>
        <script src="js/messages_es.js.js" type="text/javascript"></script>
        <script>


            $(document).ready(function ()
            {
                $("#formulario").validate({
                    rules: {
                        Cedula: {
                            required: true,
                            number: true,
                            rangelength: [1, 10]
                        },
                        Usuario: {
                            required: true
                        },
                        Clave: {
                            required: true,
                            pasword: true,
                        },
                        Nombres: {
                            required: true
                        },
                        Apellidos: {
                            required: true
                        },
                        Telefono: {
                            required: true,
                            number: true,
                            rangelength: [7, 10]
                        },
                        Correo: {
                            required: true,
                            email: true,
                        },

                    },
                    messages: {
                        Cedula:
                                {
                                    required: "Campo obligatorio",
                                    number: "Campo n�merico",
                                    rangelength: "Debe estar entre 1 a 10 d�gitos"
                                },
                        Telefono:
                                {
                                    required: "Campo obligatorio",
                                    number: "Campo n�merico",
                                    rangelength: "Debe estar entre 7 a 10 n�meros"
                                },
                    },
                });
            });
        </script>


    </body>
</html>
