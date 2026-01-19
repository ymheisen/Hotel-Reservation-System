using System;
using System.Text;

namespace MotelReservationSystem
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Room"] == null)
                {
                    Response.Redirect("MakeReservation.aspx");
                    return;
                }

                int roomNumber = Convert.ToInt32(Session["Room"]);
                lblRoomNumber.Text = roomNumber.ToString();

                // Room type pattern
                string[] pattern = { "Q", "Q", "K", "Q", "Q", "QQ" };
                int index = (roomNumber - 100) % 6;
                string roomType = pattern[index];

                double price = 0;
                if (roomType == "Q") price = 59.99;
                else if (roomType == "K") price = 79.99;
                else if (roomType == "QQ") price = 109.99;

                lblRoomType.Text = roomType;
                lblPrice.Text = "$" + price.ToString("0.00");

                lblCheckIn.Text = Session["CheckIn"].ToString();
                lblCheckOut.Text = Session["CheckOut"].ToString();

                lblFirstName.Text = Session["First"].ToString();
                lblLastName.Text = Session["Last"].ToString();
                lblEmail.Text = Session["Email"].ToString();
                lblAddress.Text = Session["Address"].ToString();
                lblCity.Text = Session["City"].ToString();
                lblState.Text = Session["State"].ToString();
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendLine("<html><body>");
            sb.AppendLine("<h2>Reservation Receipt</h2>");
            sb.AppendLine("<p><strong>Room Number:</strong> " + lblRoomNumber.Text + "</p>");
            sb.AppendLine("<p><strong>Room Type:</strong> " + lblRoomType.Text + "</p>");
            sb.AppendLine("<p><strong>Price:</strong> " + lblPrice.Text + "</p>");
            sb.AppendLine("<p><strong>Check In:</strong> " + lblCheckIn.Text + "</p>");
            sb.AppendLine("<p><strong>Check Out:</strong> " + lblCheckOut.Text + "</p>");
            sb.AppendLine("<p><strong>Guest:</strong> " + lblFirstName.Text + " " + lblLastName.Text + "</p>");
            sb.AppendLine("<p><strong>Email:</strong> " + lblEmail.Text + "</p>");
            sb.AppendLine("<p><strong>Address:</strong> " + lblAddress.Text + ", " + lblCity.Text + ", " + lblState.Text + "</p>");
            sb.AppendLine("</body></html>");

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=ReservationReceipt.html");
            Response.Write(sb.ToString());
            Response.End();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchReservation.aspx");
        }
    }
}
