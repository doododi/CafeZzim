package com.cafe.gitteam1.member;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {

	public static void sendMail(String email, String subject, String message) throws Exception {
		// Mail Server 설정
		String charSet = "UTF-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "gitteam1.cafezzim";
		String hostSMTPpwd = "number1@";

		// 보내는 사람
		String fromEmail = "cafezzim@gmail.com";
		String fromName = "cafzzim";

		// email 전송
		try {
			// 객체 선언
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true); // SSL 사용(TLS가 없는 경우 SSL 사용)
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465);

			mail.setAuthentication(hostSMTPid, hostSMTPpwd);

			mail.setStartTLSEnabled(true); // TLS 사용
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(message);
			mail.send();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
