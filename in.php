<!DOCTYPE html>
<html lang="de" xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <head>
        <title>Datenbank Krankenhaus</title>
    </head>
    <body>

    <style>
        
        body{
        background-image: url('https://www.hellwegeranzeiger.de/wp-content/uploads/2021/09/630_0900_1902688_Christliches_Klinikum_Unna_Mitte_Aussen.jpg');
        background-repeat: no-repeat;
        color: black;
        height: 500px;
        background-position: center;
		background-size: cover;
		position: relative;
        height: 100vh;
        }
        
        th, td {
        border-bottom: 1px solid #ddd;
        }   

        tr:nth-child(even) {background-color: #4093b2;}

        .center {
			  text-align: center;
		    }

         table.center {
         margin-left: auto; 
         margin-right: auto;
        }

        /* Mini reset, no margins, paddings or bullets */
        .menu,
        .submenu {
        margin: 0;
        padding: 0;
        list-style: none;
        }

        /* haubt layer */
        .menu {			
        margin: 50px auto;
        width: 800px;
        width: -moz-fit-content;
        width: -webkit-fit-content;
        width: fit-content;	
        }

        .menu > li {
        background: #454545;
        float: left;
        position: relative;
        transform: skewX(25deg);
        }

        .menu a {
        display: block;
        color: #FFF;
        text-transform: uppercase;
        text-decoration: none;
        font-family: Arial, Helvetica;
        font-size: 14px;
        }		

        .menu li:hover {
        background:#777777;
        }		

        .menu > li > a {
        transform: skewX(-25deg);
        padding: 1em 2em;
        }

        /* dropdown menu */
        .submenu {
        position: absolute;
        width: 200px;
        left: 50%; margin-left: -100px;
        transform: skewX(-25deg);
        transform-origin: left top;
        }

        .submenu li {
        background-color: #454545;
        position: relative;
        overflow: hidden;		
        }						

        .submenu > li > a {
        padding: 1em 2em;			
        }

        .submenu > li::after {
        content: '';
        position: absolute;
        top: -125%;
        height: 100%;
        width: 100%;					
        }		

        /* schrift submenu gerade machen */
        .submenu > li:nth-child(odd){
        transform: skewX(-25deg) translateX(0);
        }

        .submenu > li:nth-child(odd) > a {
        transform: skewX(25deg);
        }

        .submenu > li:nth-child(odd)::after {
        right: -50%;
        transform: skewX(-25deg) rotate(3deg);
        }				

        /* Even stuff */
        .submenu > li:nth-child(even){
        transform: skewX(25deg) translateX(0);
        }

        .submenu > li:nth-child(even) > a {
        transform: skewX(-25deg);
        }

        .submenu > li:nth-child(even)::after {
        left: -50%;
        transform: skewX(25deg) rotate(3deg);
        }

        /* zeigen vom dropdownmenu */
        .submenu,
        .submenu li {
        opacity: 0;
        visibility: hidden;			
        }

        .submenu li {
        transition: .2s ease transform;
        }

        .menu > li:hover .submenu,
        .menu > li:hover .submenu li {
        opacity: 1;
        visibility: visible;
        }		

        .menu > li:hover .submenu li:nth-child(even){
        transform: skewX(25deg) translateX(15px);			
        }

        .menu > li:hover .submenu li:nth-child(odd){
        transform: skewX(-25deg) translateX(-15px);			
        }





                
    </style>


        <form>
 
        <ul class="menu">
        <li><a href="http://localhost/in.php?tabelle=medikamente">Medikamente</a></li>
        <li><a href="http://localhost/in.php?tabelle=patient">Patient</a></li>
        <li><a href="http://localhost/in.php?tabelle=doc">Doc</a></li>
        <li><a href="http://localhost/in.php?tabelle=pfleger">Pfleger</a></li>
        <li><a href="http://localhost/in.php?tabelle=raum">Raum</a></li>

        <li>
            <a href="">Relationship Tabellen</a>
            <ul class="submenu">
            <li><a href="http://localhost/in.php?tabelle=r_arbeitet_mit">r_arbeitet_mit</a></li>
            <li><a href="http://localhost/in.php?tabelle=r_hat_ein">r_hat_ein</a></li>
            <li><a href="http://localhost/in.php?tabelle=r_liegt_in">r_liegt_in</a></li>
            <li><a href="http://localhost/in.php?tabelle=r_nimmt">r_nimmt</a></li>
            <li><a href="http://localhost/in.php?tabelle=r_pflegt_ein">r_pflegt_ein</a></li>
            </ul>			
        </li>
        </ul>
        </form>

            

    <div><br /><br /><br /><br /><br /></div>

    <?php
    
        $con=mysqli_connect("localhost","root","","krankenhaus");
        // Check connection
        if (mysqli_connect_errno())
        {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
        }

        $selected = $_GET["tabelle"];

        try{
        $result = mysqli_query($con,"SELECT * FROM $selected");

        echo "<table class='center', table style='background-color:#53bee5';>";

        $i = 0;
        while($row = $result->fetch_assoc())
        {
            if ($i == 0) {
            $i++;
            echo "<tr>";
            foreach ($row as $key => $value) {
                echo "<th>" . $key . "</th>";
            }
            echo "</tr>";
            }
            echo "<tr>";
            foreach ($row as $value) {
            echo "<td>" . $value . "</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
        } catch(Exception $e) {}

        mysqli_close($con);
    
    ?>
    
    </body>
</html>