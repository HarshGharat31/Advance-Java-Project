<!DOCTYPE html>
<html>
    <head>
        <title>Update Form</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            .form-label {
                font-weight: bold;
            }
            .main {
                width: 100%;
                height: 100vh;
                background-image: radial-gradient(circle at 29% 55%, hsla(329,0%,99%,0.05) 0%, hsla(329,0%,99%,0.05) 4%,transparent 4%, transparent 44%,transparent 44%, transparent 100%),radial-gradient(circle at 85% 89%, hsla(329,0%,99%,0.05) 0%, hsla(329,0%,99%,0.05) 51%,transparent 51%, transparent 52%,transparent 52%, transparent 100%),radial-gradient(circle at 6% 90%, hsla(329,0%,99%,0.05) 0%, hsla(329,0%,99%,0.05) 53%,transparent 53%, transparent 64%,transparent 64%, transparent 100%),radial-gradient(circle at 35% 75%, hsla(329,0%,99%,0.05) 0%, hsla(329,0%,99%,0.05) 6%,transparent 6%, transparent 98%,transparent 98%, transparent 100%),radial-gradient(circle at 56% 75%, hsla(329,0%,99%,0.05) 0%, hsla(329,0%,99%,0.05) 16%,transparent 16%, transparent 23%,transparent 23%, transparent 100%),radial-gradient(circle at 42% 0%, hsla(329,0%,99%,0.05) 0%, hsla(329,0%,99%,0.05) 3%,transparent 3%, transparent 26%,transparent 26%, transparent 100%),radial-gradient(circle at 29% 28%, hsla(329,0%,99%,0.05) 0%, hsla(329,0%,99%,0.05) 51%,transparent 51%, transparent 75%,transparent 75%, transparent 100%),radial-gradient(circle at 77% 21%, hsla(329,0%,99%,0.05) 0%, hsla(329,0%,99%,0.05) 35%,transparent 35%, transparent 55%,transparent 55%, transparent 100%),radial-gradient(circle at 65% 91%, hsla(329,0%,99%,0.05) 0%, hsla(329,0%,99%,0.05) 46%,transparent 46%, transparent 76%,transparent 76%, transparent 100%),linear-gradient(45deg, rgb(83, 91, 235),rgb(76, 11, 174));
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .section {
                backdrop-filter: blur(10px);
                /*background-color: aliceblue;*/
                margin: auto;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <div class="container-fluid">
                <div class="panel ">
                    <form action="Update_Painting" method="post">
                        <div class="section col-8  shadow p-4 rounded">
                            <h2 class="text-center mb-2">Update Painting Details</h2>
                            <hr>
                            <input class="form-control" type="hidden" value="${pan_id}" name="pan_id">
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input class="form-control" type="text" value="${name}" name="name">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <input class="form-control" type="text" value="${description}" name="description">
                            </div><!-- comment -->
                            <div class="mb-3">
                                <label class="form-label">Category</label>                                
                                <input class="form-control" type="text" value="${category}" name="category">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Prices</label>
                                <input class="form-control" type="text" value="${prices}" name="prices">
                            </div><!-- < -->
                            <div class="mb-3 text-center">
                                <input class="btn btn-success" type="submit" value="Update">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
