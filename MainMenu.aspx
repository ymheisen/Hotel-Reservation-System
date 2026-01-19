<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="MotelReservationSystem.MainMenu" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Motel Reservation System</title>

    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(to bottom, #f3f7f4, #e5ece7);
            margin: 0;
            padding: 0;
        }

        /* HEADER */
        .header {
            background: linear-gradient(135deg, #235d28, #1c4a20);
            padding: 40px 20px;
            text-align: center;
            color: white;
            box-shadow: 0 3px 18px rgba(0,0,0,0.35);
        }

        .header h1 {
            font-size: 40px;
            margin: 0;
            letter-spacing: 1px;
            text-transform: uppercase;
            font-weight: 600;
        }

        .header h2 {
            margin-top: 12px;
            font-weight: 300;
            font-size: 22px;
            opacity: 0.95;
        }

        /* MAIN CONTAINER */
        .container {
            width: 92%;
            max-width: 1200px;
            margin: 50px auto;
            animation: fadeIn 0.8s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* CARD DESIGN */
        .card {
            background: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.15);
            margin-bottom: 40px;
            transition: 0.25s;
        }

        .card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 22px rgba(0,0,0,0.22);
        }

        .card h2 {
            margin-bottom: 20px;
            font-size: 28px;
            color: #235d28;
            font-weight: 600;
        }

        /* MENU LINKS */
        .menu-link {
            display: block;
            font-size: 20px;
            padding: 16px;
            margin: 16px auto;
            width: 75%;
            background: #f2f2f2;
            border-radius: 10px;
            text-decoration: none;
            color: #222;
            transition: 0.25s;
            font-weight: 500;
            border: 1px solid #ddd;
        }

        .menu-link:hover {
            background: #235d28;
            color: white;
            transform: scale(1.05);
            border: 1px solid #1c4a20;
        }

        /* ABOUT US IMAGE */
        .about-img {
            width: 100%;
            max-height: 380px;
            object-fit: cover;
            border-radius: 14px;
            margin: 22px 0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.25);
        }

        /* CONTACT FORM */
        .contact-section input,
        .contact-section textarea {
            width: 100%;
            padding: 14px;
            margin-top: 12px;
            border: 1px solid #bbb;
            border-radius: 10px;
            font-size: 15px;
            transition: 0.2s;
        }

        .contact-section input:focus,
        .contact-section textarea:focus {
            outline: none;
            border-color: #235d28;
            box-shadow: 0 0 8px rgba(35,93,40,0.25);
        }

        .contact-btn {
            background: #235d28;
            color: white;
            border: none;
            padding: 14px 30px;
            margin-top: 20px;
            font-size: 17px;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.25s;
            width: 180px;
        }

        .contact-btn:hover {
            background: #1c4a20;
            transform: scale(1.05);
        }

        /* MESSAGE BOX */
        .msg-box {
            background: #d4edda;
            color: #155724;
            padding: 18px;
            border-radius: 10px;
            margin-bottom: 25px;
            font-size: 16px;
            display: none;
            border-left: 6px solid #235d28;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <!-- Header Section -->
        <div class="header">
            <h1>Lee Inn and Suites — Romulus, MI</h1>
            <h2>Motel Reservation System</h2>
        </div>

        <div class="container">

            <!-- MESSAGE CONFIRMATION -->
            <div id="MessageSent" class="msg-box" runat="server">
                Thank you! Your message has been sent.
            </div>

            <!-- MAIN MENU -->
            <div class="card">
                <h2>Main Menu</h2>

                <a class="menu-link" href="MakeReservation.aspx">1. Make a Reservation</a>
                <a class="menu-link" href="SearchReservation.aspx">2. Search a Reservation</a>
                <a class="menu-link" href="PrintReservation.aspx">3. Print Reservation for a Date</a>
            </div>

            <!-- ABOUT US -->
            <div class="card">
                <h2>About This Hotel</h2>

                <p>
                    Located conveniently near the Detroit Metro Airport, Lee Inn & Suites provides guests with modern comfort, 
                    exceptional hospitality, and easy access to major highways and attractions. Whether traveling for business or leisure,
                    our spacious rooms and welcoming atmosphere ensure a relaxing stay.
                </p>

                <p>
                    Our amenities include complimentary Wi-Fi, modern fitness facilities, an indoor heated pool, business meeting rooms,
                    and round-the-clock guest support. Enjoy our on-site dining options, 24/7 pantry market, and comfortable lounge spaces.
                </p>

                <!-- NEW REAL HOTEL EXTERIOR PHOTO -->
                <img class="about-img"
                     src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b"
                     alt="Hotel Exterior" />

                <p><strong>Check-in:</strong> 3:00 PM &nbsp; | &nbsp; <strong>Check-out:</strong> 12:00 PM</p>
                <p><strong>Address:</strong> 9555 Middlebelt Rd, Romulus, MI 48174</p>
                <p><strong>Phone:</strong> (734) 354-0001</p>
            </div>

            <!-- CONTACT FORM -->
            <div class="card contact-section">
                <h2>Contact Us</h2>

                <asp:TextBox ID="txtName" runat="server" placeholder="Your Name"></asp:TextBox>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Your Email"></asp:TextBox>
                <asp:TextBox ID="txtMessage" TextMode="MultiLine" Rows="5" runat="server" placeholder="Your Message"></asp:TextBox>

                <asp:Button ID="btnSend" runat="server" CssClass="contact-btn" Text="Send Message" OnClick="btnSend_Click" />
            </div>

        </div>

    </form>

</body>
</html>
