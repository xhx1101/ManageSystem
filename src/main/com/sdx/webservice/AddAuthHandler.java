package sdx.webservice;

import org.apache.commons.codec.digest.DigestUtils;

import javax.xml.namespace.QName;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPHeader;
import javax.xml.soap.SOAPMessage;
import javax.xml.ws.handler.MessageContext;
import javax.xml.ws.handler.soap.SOAPHandler;
import javax.xml.ws.handler.soap.SOAPMessageContext;
import java.util.Set;

public class AddAuthHandler implements SOAPHandler<SOAPMessageContext> {
    public Set<QName> getHeaders() {
        return null;
    }

    public boolean handleMessage(SOAPMessageContext context) {
        Boolean output = (Boolean) context.get(MessageContext.MESSAGE_OUTBOUND_PROPERTY);
        SOAPMessage message = context.getMessage();
        if (output) {
            try {
                SOAPHeader header = message.getSOAPHeader();
                if (header == null) {
                    header = message.getSOAPPart().getEnvelope().addHeader();
                }
                SOAPElement auth = header.addChildElement(new QName("http://tempuri.org/", "AuthHeader"));
                SOAPElement name = auth.addChildElement("UserName");
                name.addTextNode("hbdldx");
                SOAPElement password = auth.addChildElement("Password");
                password.addTextNode(DigestUtils.md5Hex("Hbdldx1234"));
                message.saveChanges();
            } catch (SOAPException e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    public boolean handleFault(SOAPMessageContext context) {
        return false;
    }

    public void close(MessageContext context) {

    }
}
