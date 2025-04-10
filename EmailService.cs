using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;

namespace Railway_Reservation_New
{
    public static class EmailService
    {
        public static void SendEmail(string toEmail, string subject, string body)
        {
            var fromAddress = new MailAddress("timepasssed123@gmail.com", "Railway Reservation System");
            var toAddress = new MailAddress(toEmail);
            const string fromPassword = "zsqf gaes huyq pgca"; // Use App Password if Gmail with 2FA

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",     // Use smtp.office365.com if Outlook
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword),
                Timeout = 20000
            };

            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                smtp.Send(message);
            }
        }
    }
}