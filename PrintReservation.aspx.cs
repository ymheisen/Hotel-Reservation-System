using System;
using System.Data;
using System.Data.SqlClient;

namespace MotelReservationSystem
{
    public partial class PrintReservation : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager
                         .ConnectionStrings["MotelReservationDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            ResultPanel.Visible = false;

            if (string.IsNullOrWhiteSpace(txtSearchDate.Text))
            {
                lblError.Text = "Please select a date.";
                return;
            }

            DateTime selectedDate = Convert.ToDateTime(txtSearchDate.Text);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT r.RoomID,
                           g.FirstName,
                           g.LastName,
                           r.CheckIn,
                           r.CheckOut
                    FROM Reservations r
                    JOIN Guests g ON r.GuestID = g.GuestID
                    WHERE @Date BETWEEN r.CheckIn AND r.CheckOut";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Date", selectedDate);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Display details
                        lblRoom.Text = reader["RoomID"].ToString();
                        lblGuest.Text = reader["FirstName"] + " " + reader["LastName"];
                        lblCheckIn.Text = Convert.ToDateTime(reader["CheckIn"]).ToShortDateString();
                        lblCheckOut.Text = Convert.ToDateTime(reader["CheckOut"]).ToShortDateString();

                        ResultPanel.Visible = true;
                    }
                    else
                    {
                        lblError.Text = "No reservation found for this date.";
                    }

                    conn.Close();
                }
            }
        }
    }
}
