package com.me.mps.helper;

import com.google.common.collect.Lists;
import org.apache.log4j.Logger;
import org.springframework.util.CollectionUtils;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;

/**
 * Created by Me on 2017/12/11.
 */
public class EmailHelper {

    private static Logger logger = Logger.getLogger(EmailHelper.class);

    private static String FROM = "yanyanghong_work@163.com";
    private static String PASSWORD = "WYjustforyou9496";
    private static String NOTICE_SUBJECT = "后勤管理通知";

    public static boolean sendSingleEmail(String to, String content) throws Exception {
        logger.debug("Execute Method sendSingleEmail...");

        try {
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.163.com");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.transport.protocol", "smtp");

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(FROM, PASSWORD);
                }
            });
            session.setDebug(true);

            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(FROM));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            msg.setSubject(NOTICE_SUBJECT);
            msg.setText(content);

            Transport.send(msg);

            return true;
        } catch (Exception e) {
            logger.error("Mail Error...", e);
            return false;
        }
    }

    public static boolean sendMultipleMail(List<String> toList, String content) {
        logger.debug("Execute Method sendSingleEmail...");

        try {
            if (!CollectionUtils.isEmpty(toList)) {
                Properties props = new Properties();
                props.setProperty("mail.smtp.host", "smtp.163.com");
                props.setProperty("mail.smtp.auth", "true");
                props.setProperty("mail.transport.protocol", "smtp");

                Session session = Session.getInstance(props, new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(FROM, PASSWORD);
                    }
                });
                session.setDebug(true);

                InternetAddress[] internetAddresses = packageEmail(toList);

                MimeMessage msg = new MimeMessage(session);
                msg.setFrom(new InternetAddress(FROM));
                msg.addRecipients(Message.RecipientType.TO, internetAddresses);
                msg.setSubject(NOTICE_SUBJECT);
                msg.setText(content);

                Transport.send(msg);
            }
            return true;
        } catch (Exception e) {
            logger.error("Multiple Error...", e);
            return false;
        }
    }

    private static InternetAddress[] packageEmail(List<String> emailList) throws AddressException {
        logger.debug("Execute Method packageEmail...");

        List<InternetAddress> internetAddresses = Lists.newArrayList();

        for (String email : emailList) {
            internetAddresses.add(new InternetAddress(email));
        }

        return internetAddresses.toArray(new InternetAddress[emailList.size()]);
    }

}