<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakeReservation.aspx.cs" Inherits="MotelReservationSystem.MakeReservation" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Make a Reservation</title>

    <style>
        body {
            font-family: Segoe UI, Arial;
            background: #eef2f3;
            margin: 0;
        }

        .container {
            width: 85%;
            max-width: 1100px;
            margin: 30px auto;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #2b6e32;
        }

        /* ROOM GRID */
        .room-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 12px;
            margin-bottom: 30px;
        }

        .room-btn {
            padding: 15px;
            background: #3f8cff;
            color: white;
            border-radius: 6px;
            border: none;
            font-size: 15px;
            cursor: pointer;
            transition: 0.2s;
        }

        .room-btn:hover {
            background: #1f6cdc;
        }

        .room-unavailable {
            background: #cccccc;
            cursor: not-allowed;
        }

        .room-selected {
            background: #2b6e32 !important;
        }

        /* FORM */
        .form-box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.15);
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            border-radius: 6px;
            border: 1px solid #bbb;
        }

        .submit-btn {
            margin-top: 20px;
            padding: 14px 30px;
            font-size: 17px;
            border-radius: 6px;
            border: none;
            color: white;
            background: #2b6e32;
            cursor: pointer;
        }
    </style>

    <!-- JAVASCRIPT FOR ROOM HIGHLIGHTING -->
    <script>
        function selectRoom(btn, roomNumber) {

            // Remove highlight from all room buttons
            document.querySelectorAll(".room-btn").forEach(b => {
                b.classList.remove("room-selected");
            });

            // Highlight clicked button
            btn.classList.add("room-selected");

            // Store selected room in hidden field
            document.getElementById("<%= HiddenSelectedRoom.ClientID %>").value = roomNumber;
        }
    </script>

</head>

<body>
    <form id="form1" runat="server">
        <div class="container">

            <h1>Select a Room</h1>

            <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" />

            <!-- Hidden field to store selected room -->
            <asp:HiddenField ID="HiddenSelectedRoom" runat="server" />

            <!-- ROOM GRID -->
            <asp:Panel ID="RoomsPanel" CssClass="room-grid" runat="server"></asp:Panel>

            <!-- USER FORM -->
            <div class="form-box">

                <h2>Guest Information</h2>

                <label>Check-In Date</label>
                <asp:TextBox ID="txtCheckIn" TextMode="Date" runat="server" />

                <label>Check-Out Date</label>
                <asp:TextBox ID="txtCheckOut" TextMode="Date" runat="server" />

                <label>First Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" />

                <label>Last Name</label>
                <asp:TextBox ID="txtLastName" runat="server" />

                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" />

                <label>Address</label>
                <asp:TextBox ID="txtAddress" runat="server" />

                <label>City</label>
                <asp:TextBox ID="txtCity" runat="server" />

                <label>State</label>
                <asp:TextBox ID="txtState" runat="server" />

                <asp:Button ID="btnNext" runat="server" Text="Next"
                            CssClass="submit-btn"
                            OnClick="btnNext_Click" />

            </div>
        </div>
    </form>
</body>
</html>
