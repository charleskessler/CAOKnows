<!DOCTYPE html>
<head>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<h2>JQuery Change Event Example</h2>
<script type="text/javascript">
     $(document).ready(function(){
        $("#mytextarea").change(function(){
            alert("text area changed");
          });
        });
</script>
<body>

<g:field type="number" name="mytextarea" value="1"></g:field>
<g:field type="number" name="mytextarea2" value="4"></g:field>

</body>
</html>