package com.mbs.mvc.conf;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class V1_EmailConfigure {

	public static void sendEmail(String email, String title, String text) {
		// TODO Auto-generated method stub
		String host = "smtp.naver.com";	//smtp 서버
		String subject = title;
		String fromName = "관리자";
		String from = "ruaehdehddk@naver.com";	//보내는 메일
		String to1 = email;
		String content = text;
		
		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("ruaehdehddk", "!Qazxsw2");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1); //받는 사람설정1
			msg.setSubject(subject);	//제목 설정
			msg.setSentDate(new java.util.Date());	//보내는 날짜 설정
			msg.setContent(content, "text/html;charset=euc-kr");	//내용설정(HTML 형식)
			
			Transport.send(msg); //메일보내기
		}
		catch (MessagingException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
