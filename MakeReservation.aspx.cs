using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace MotelReservationSystem
{
    public partial class MakeReservation : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager
                         .ConnectionStrings["MotelReservationDB"].ConnectionString;

        DataTable unavailableRooms;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Always load unavailable rooms
            LoadUnavailableRooms();

            // Always rebuild room grid
            BuildRoomGrid();
        }


        private void LoadUnavailableRooms()
        {
            unavailableRooms = new DataTable();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT RoomID FROM Reservations WHERE CheckOut >= CAST(GETDATE() AS DATE)";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.Fill(unavailableRooms);
            }
        }

        private bool IsRoomUnavailable(int roomNum)
        {
            foreach (DataRow row in unavailableRooms.Rows)
            {
                if ((int)row["RoomID"] == roomNum)
                    return true;
            }
            return false;
        }

        private void BuildRoomGrid()
        {
            RoomsPanel.Controls.Clear();

            int room = 100;
            string[] pattern = { "Q", "Q", "K", "Q", "Q", "QQ" };
            int index = 0;

            for (int i = 0; i < 42; i++)
            {
                string type = pattern[index];
                index = (index + 1) % 6;

                Button btn = new Button();
                btn.Width = 90;
                btn.Height = 55;
                btn.Text = room + " (" + type + ")";
                btn.CssClass = "room-btn";

                btn.Attributes["onclick"] = $"selectRoom(this, '{room}')";

                if (IsRoomUnavailable(room))
                {
                    btn.CssClass = "room-btn room-unavailable";
                    btn.Enabled = false;
                }

                if (HiddenSelectedRoom.Value == room.ToString())
                {
                    btn.CssClass = "room-btn room-selected";
                }

                RoomsPanel.Controls.Add(btn);
                room++;
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            ErrorLabel.Text = "";

            if (string.IsNullOrEmpty(HiddenSelectedRoom.Value))
            {
                ErrorLabel.Text = "Please select a room.";
                return;
            }

            if (txtCheckIn.Text == "" || txtCheckOut.Text == "")
            {
                ErrorLabel.Text = "Please choose check-in and check-out dates.";
                return;
            }

            if (txtFirstName.Text == "" || txtLastName.Text == "" ||
                txtEmail.Text == "" || txtAddress.Text == "" ||
                txtCity.Text == "" || txtState.Text == "")
            {
                ErrorLabel.Text = "Please fill out all fields.";
                return;
            }

            int roomId = int.Parse(HiddenSelectedRoom.Value);

            int guestId;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string insertGuest =
                    "INSERT INTO Guests (FirstName, LastName, Email, Address, City, State) " +
                    "OUTPUT INSERTED.GuestID " +
                    "VALUES (@F, @L, @E, @A, @C, @S)";

                SqlCommand cmdGuest = new SqlCommand(insertGuest, conn);
                cmdGuest.Parameters.AddWithValue("@F", txtFirstName.Text);
                cmdGuest.Parameters.AddWithValue("@L", txtLastName.Text);
                cmdGuest.Parameters.AddWithValue("@E", txtEmail.Text);
                cmdGuest.Parameters.AddWithValue("@A", txtAddress.Text);
                cmdGuest.Parameters.AddWithValue("@C", txtCity.Text);
                cmdGuest.Parameters.AddWithValue("@S", txtState.Text);

                guestId = (int)cmdGuest.ExecuteScalar();

                string insertReservation =
                    "INSERT INTO Reservations (GuestID, RoomID, CheckIn, CheckOut) " +
                    "VALUES (@GID, @RID, @CI, @CO)";

                SqlCommand cmdRes = new SqlCommand(insertReservation, conn);
                cmdRes.Parameters.AddWithValue("@GID", guestId);
                cmdRes.Parameters.AddWithValue("@RID", roomId);
                cmdRes.Parameters.AddWithValue("@CI", txtCheckIn.Text);
                cmdRes.Parameters.AddWithValue("@CO", txtCheckOut.Text);

                cmdRes.ExecuteNonQuery();
            }

            // Store in session
            Session["Room"] = roomId;
            Session["CheckIn"] = txtCheckIn.Text;
            Session["CheckOut"] = txtCheckOut.Text;

            Session["First"] = txtFirstName.Text;
            Session["Last"] = txtLastName.Text;
            Session["Email"] = txtEmail.Text;
            Session["Address"] = txtAddress.Text;
            Session["City"] = txtCity.Text;
            Session["State"] = txtState.Text;

            Response.Redirect("Confirmation.aspx");
        }
    }
}
