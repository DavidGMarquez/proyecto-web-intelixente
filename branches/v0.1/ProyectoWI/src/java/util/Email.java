/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author Vanesa
 */
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author Nessa
 */
public class Email {

    public void enviaMail(String correoDestino, String mensaje, String asunto) {
        String correoOrigen = "tiendadawa@gmail.com";
        String contrasinal = "tiendadawa1";
        //String[] asCorreoDestino= {correoDestino}; //aquí poner dirección

        Properties props = new Properties();
        //smtp
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        // TLS si está disponible
        props.setProperty("mail.smtp.starttls.enable", "true");
        // Puerto de gmail para envio de correos
        props.setProperty("mail.smtp.port", "587");
        // Nombre del usuario
        props.setProperty("mail.smtp.user", correoOrigen);
        // Si requiere o no usuario y password para conectarse.
        props.setProperty("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        //session.setDebug(true);

        MimeMessage message = new MimeMessage(session);
        try {
            // Quien envia el correo
            message.setFrom(new InternetAddress(correoOrigen));

            // A quien va dirigido
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(correoDestino));
            message.setSubject(asunto);
            message.setText(mensaje);

            //envio el mensaje
            Transport t = session.getTransport("smtp");
            t.connect(correoOrigen, contrasinal);
            t.sendMessage(message, message.getAllRecipients());
            t.close();
        } catch (AddressException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
