using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
namespace Flashdrive.Datos
{
    public class Mail
    {
        string remitente, password;
        public Mail(string from, string pass)
        {
            remitente = from;
            password = pass;
        }
        public string SendMail(string to, string asunto, string message)
        {
            string info = String.Empty;
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(remitente);
            msg.To.Add(new MailAddress(to));
            msg.Subject = asunto;
            msg.Body = message;
            SmtpClient MailClient = new SmtpClient();
            MailClient.Host = "smtp.live.com";
            MailClient.Port = 587;
            MailClient.EnableSsl = false;
            MailClient.UseDefaultCredentials = false;
            MailClient.Credentials = new NetworkCredential(remitente, password);
            MailClient.EnableSsl = true;
            try
            {
                MailClient.Send(msg);
                info = "Correo enviado";
            }
            catch (Exception ex)
            {
                info = "No se pudo enviar el Correo" + ex;
            }
            return info;
        }
    }
}