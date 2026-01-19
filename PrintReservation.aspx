<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintReservation.aspx.cs" Inherits="MotelReservationSystem.PrintReservation" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Print Reservation by Date</title>

    <style>
        body {
            font-family: 'Segoe UI', Arial;
            background: #eef2f3;
            margin: 0;
        }

        .header {
            background: linear-gradient(135deg, #2b6e32, #1e5120);
            padding: 25px;
            text-align: center;
            color: white;
        }

        .container {
            width: 85%;
            max-width: 900px;
            margin: 25px auto;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-top: 25px;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 18px;
        }

        .label {
            font-weight: bold;
        }

        .btn {
            padding: 10px 20px;
            background: #2b6e32;
            border-radius: 6px;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }

        .btn:hover {
            background: #1f7323;
        }

        .error {
            color: red;
            font-size: 18px;
            margin-top: 15px;
            text-align: center;
        }
    </style>

    <script>
        // PRINT PAGE FUNCTION
        function printPage() {
            window.print();
        }

        // DOWNLOAD AS PDF (PDF via browser print-to-PDF)
        function downloadPDF() {
            window.print();
        }
    </script>
</head>

<body>

<form id="form1" runat="server">

    <div class="header">
        <h1>Print Reservation by Date</h1>
    </div>

    <div class="container">

        <!-- Search Panel -->
        <div class="card">
            <h2>Select a Date</h2>

            <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>

            <label>Reservation Date:</label>
            <asp:TextBox ID="txtSearchDate" TextMode="Date" runat="server"></asp:TextBox>

            <asp:Button ID="btnSearch" runat="server" Text="Search"
                        CssClass="btn" OnClick="btnSearch_Click" />
        </div>

        <!-- Result Panel -->
        <asp:Panel ID="ResultPanel" runat="server" Visible="false" CssClass="card">

            <h2>Reservation Details</h2>

            <div class="info-row">
                <span class="label">Room Number:</span>
                <asp:Label ID="lblRoom" runat="server" />
            </div>

            <div class="info-row">
                <span class="label">Guest Name:</span>
                <asp:Label ID="lblGuest" runat="server" />
            </div>

            <div class="info-row">
                <span class="label">Check-In:</span>
                <asp:Label ID="lblCheckIn" runat="server" />
            </div>

            <div class="info-row">
                <span class="label">Check-Out:</span>
                <asp:Label ID="lblCheckOut" runat="server" />
            </div>

            <!-- PRINT & DOWNLOAD BUTTONS -->
            <br />
            <button type="button" class="btn" onclick="printPage()">Print</button>
            <button type="button" class="btn" onclick="downloadPDF()">Download PDF</button>

        </asp:Panel>

    </div>

</form>

</body>
</html>
