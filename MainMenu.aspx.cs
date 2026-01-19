using System;

namespace MotelReservationSystem
{
    public partial class MainMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MessageSent.Style["display"] = "none";
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            // Show the thank-you message
            MessageSent.Style["display"] = "block";

            // Clear the contact form inputs
            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
        }
    }
}
