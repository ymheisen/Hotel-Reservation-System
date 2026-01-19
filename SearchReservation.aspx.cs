using System;
using System.Data.SqlClient;

namespace MotelReservationSystem
{
    public partial class SearchReservation : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager
                         .ConnectionStrings["MotelReservationDB"].ConnectionString;

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ErrorLabel.Text = "";
            ResultPanel.Visible = false;

            if (txtLastName.Text.Trim() == "")
            {
                ErrorLabel.Text = "Please enter a last name.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT r.RoomID, g.FirstName, g.LastName, r.CheckIn, r.CheckOut
                    FROM Reservations r
                    INNER JOIN Guests g ON r.GuestID = g.GuestID
                    WHERE g.LastName = @LastName";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblRoomID.Text = reader["RoomID"].ToString();
                        lblGuestName.Text = reader["FirstName"] + " " + reader["LastName"];
                        lblCheckIn.Text = Convert.ToDateTime(reader["CheckIn"]).ToShortDateString();
                        lblCheckOut.Text = Convert.ToDateTime(reader["CheckOut"]).ToShortDateString();

                        ResultPanel.Visible = true;
                    }
                    else
                    {
                        ErrorLabel.Text = "No reservation found.";
                    }
                }
            }
        }

        // ================================
        // HOME BUTTON LOGIC
        // ================================
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx");
        }
    }
}
