<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchReservation.aspx.cs" Inherits="MotelReservationSystem.SearchReservation" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Search Reservation</title>

    <style>
        body {
            font-family: 'Segoe UI', Arial;
            background: #eef2f3;
            margin: 0;
            padding: 0;
        }

        .header {
            background: linear-gradient(135deg, #2b6e32, #1e5120);
            padding: 25px;
            text-align: center;
            color: white;
        }

        .container {
            width: 85%;
            max-width: 800px;
            margin: 40px auto;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .label-input {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        .textbox {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #bbb;
        }

        .btn {
            background: #2b6e32;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            margin-top: 15px;
            font-size: 16px;
            cursor: pointer;
            transition: .25s;
        }

        .btn:hover {
            background: #1f7323;
            transform: scale(1.04);
        }

        .home-btn {
            background: #444;
            margin-left: 10px;
        }

        .error {
            color: red;
            font-size: 18px;
            margin-top: 10px;
        }

        .result-row {
            margin: 8px 0;
            font-size: 18px;
            display: flex;
            justify-content: space-between;
        }

        .result-label {
            font-weight: bold;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="header">
            <h1>Search Reservation by Last Name</h1>
        </div>

        <div class="container">

            <div class="card">
                <label class="label-input">Enter Last Name:</label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="textbox" />

                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn"
                            OnClick="btnSearch_Click" />

                <!-- HOME BUTTON -->
                <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btn home-btn"
                            OnClick="btnHome_Click" />

                <asp:Label ID="ErrorLabel" runat="server" CssClass="error" />
            </div>

            <!-- RESULTS -->
            <asp:Panel ID="ResultPanel" runat="server" Visible="false" CssClass="card">
                <h2>Reservation Found</h2>

                <div class="result-row">
                    <span class="result-label">Guest Name:</span>
                    <asp:Label ID="lblGuestName" runat="server" />
                </div>

                <div class="result-row">
                    <span class="result-label">Room Number:</span>
                    <asp:Label ID="lblRoomID" runat="server" />
                </div>

                <div class="result-row">
                    <span class="result-label">Check-In Date:</span>
                    <asp:Label ID="lblCheckIn" runat="server" />
                </div>

                <div class="result-row">
                    <span class="result-label">Check-Out Date:</span>
                    <asp:Label ID="lblCheckOut" runat="server" />
                </div>
            </asp:Panel>

        </div>

    </form>
</body>
</html>
