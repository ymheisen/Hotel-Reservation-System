<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="MotelReservationSystem.Confirmation" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Reservation Confirmation</title>

    <style>
        body {
            font-family: 'Segoe UI', Arial;
            background: #eef2f3;
            margin: 0;
        }

        .header {
            background: linear-gradient(135deg, #2b6e32, #1e5120);
            padding: 30px;
            text-align: center;
            color: white;
            box-shadow: 0 3px 10px rgba(0,0,0,0.2);
        }

        .header h1 { font-size: 32px; margin: 0; }

        .container {
            width: 85%;
            max-width: 900px;
            margin: 35px auto;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        h2 { color: #2b6e32; margin-bottom: 20px; }

        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 18px;
        }

        .info-label { font-weight: bold; color: #333; }

        .next-btn, .print-btn, .download-btn {
            margin-top: 18px;
            padding: 12px 28px;
            font-size: 17px;
            border-radius: 8px;
            border: none;
            color: white;
            cursor: pointer;
            transition: 0.25s;
            display: inline-block;
        }

        .next-btn { background: #2b6e32; }
        .next-btn:hover { background: #1f7323; }

        .print-btn { background: #0057b8; }
        .print-btn:hover { background: #00408a; }

        .download-btn { background: #b85b00; }
        .download-btn:hover { background: #8a4300; }

        .success-box {
            background: #d4edda;
            padding: 18px;
            border-left: 6px solid #2b6e32;
            color: #155724;
            border-radius: 8px;
            font-size: 18px;
            margin-bottom: 25px;
        }
    </style>

    <!-- PRINT SCRIPT -->
    <script>
        function printConfirmation() {
            window.print();
        }
    </script>

</head>

<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1>Reservation Confirmation</h1>
        </div>

        <div class="container">
            <div class="card">

                <div class="success-box">
                    ✔ Your reservation has been successfully created!
                </div>

                <h2>Reservation Details</h2>

                <div class="info-row"><span class="info-label">Room Number:</span> 
                    <asp:Label ID="lblRoomNumber" runat="server" /></div>

                <div class="info-row"><span class="info-label">Room Type:</span>
                    <asp:Label ID="lblRoomType" runat="server" /></div>

                <div class="info-row"><span class="info-label">Room Price:</span>
                    <asp:Label ID="lblPrice" runat="server" /></div>

                <h2>Stay Information</h2>

                <div class="info-row"><span class="info-label">Check-In:</span>
                    <asp:Label ID="lblCheckIn" runat="server" /></div>

                <div class="info-row"><span class="info-label">Check-Out:</span>
                    <asp:Label ID="lblCheckOut" runat="server" /></div>

                <h2>Guest Information</h2>

                <div class="info-row"><span class="info-label">First Name:</span>
                    <asp:Label ID="lblFirstName" runat="server" /></div>

                <div class="info-row"><span class="info-label">Last Name:</span>
                    <asp:Label ID="lblLastName" runat="server" /></div>

                <div class="info-row"><span class="info-label">Email:</span>
                    <asp:Label ID="lblEmail" runat="server" /></div>

                <div class="info-row"><span class="info-label">Address:</span>
                    <asp:Label ID="lblAddress" runat="server" /></div>

                <div class="info-row"><span class="info-label">City:</span>
                    <asp:Label ID="lblCity" runat="server" /></div>

                <div class="info-row"><span class="info-label">State:</span>
                    <asp:Label ID="lblState" runat="server" /></div>

                <!-- PRINT + DOWNLOAD BUTTONS -->
                <button type="button" class="print-btn" onclick="printConfirmation()">🖨 Print</button>

                <asp:Button ID="btnDownload" runat="server" CssClass="download-btn"
                            Text="⬇ Download" OnClick="btnDownload_Click" />

                <asp:Button ID="btnNext" runat="server" CssClass="next-btn"
                            Text="Continue" OnClick="btnNext_Click" />

            </div>
        </div>

    </form>
</body>
</html>
